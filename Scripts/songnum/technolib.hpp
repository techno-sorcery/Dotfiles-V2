/*
    Copyright (C) Hayden Buscher, 2024
    Sola Deo gloria

    Desc: A library for making UNIX commandline parsing and interaction easier
*/

#ifndef TECHNOLIB_CMD
#define TECHNOLIB_CMD

#include <string>
#include <vector>

#include <unistd.h>
#include <sys/wait.h>

namespace techno {
    
    // Forks and execs a command, then appends outputted lines to vector
    int execlp_out(std::vector<std::string> *lines, std::string args, ...) {
        int pipe_fd[2];

        // Create pipe and fork
        pipe(pipe_fd);
        pid_t child_pid = fork();


        switch (child_pid) {

            case -1: // Error
                return(1);

            case 0: // Child
                close(pipe_fd[0]); // Close read end of pipe
                dup2(pipe_fd[1], STDOUT_FILENO); // Redirect STDOUT to pipe

                execlp("find", "find", ".", "-type", "d", NULL);

            default: // Parent
                std::string line = "";
                char buff;

                close(pipe_fd[1]); // Close write end of pipe

                // Read from pipe
                while (read(pipe_fd[0], &buff, 1) > 0) {
                    
                    // Build string
                    if (buff != '\n') line.push_back(buff);

                    // New line
                    else {
                        std::cout << line << "\n";

                        // Append to vector and clear string
                        (*lines).push_back(line);
                        line = "";
                    }
                }

                close(pipe_fd[0]);
                
                // Wait and return exec exit status
                int status;
                wait(&status);
                return status;
        }
    }
}

#endif
