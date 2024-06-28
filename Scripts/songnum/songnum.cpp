#include <iostream>
#include <string>
#include <regex>
#include <vector>

#include <unistd.h>
#include <sys/wait.h>

#include "technolib.hpp"


// Search directories
void search() {
    /* int pipe_fd[2]; */

    /* // Create pipe and fork */
    /* pipe(pipe_fd); */
    /* pid_t child_pid = fork(); */

    /* switch (child_pid) { */

    /*     case -1: // Error */
    /*         perror("fork() failed"); */
    /*         exit(EXIT_FAILURE); */

    /*     case 0: // Child */
    /*         close(pipe_fd[0]); // Close read end of pipe */
    /*         dup2(pipe_fd[1], STDOUT_FILENO); // Redirect STDOUT to pipe */

    /*         execlp("find", "find", ".", "-type", "d", NULL); */

    /*     default: // Parent */
    /*         std::string line = ""; */
    /*         char buff; */

    /*         close(pipe_fd[1]); // Close write end of pipe */

    /*         // Read from pipe */
    /*         while (read(pipe_fd[0], &buff, 1) > 0) { */
                
    /*             // Build string */
    /*             if (buff != \n) line.push_back(buff); */

    /*             // New line */
    /*             else { */
                    
    /*             } */
    /*         } */
    /* } */

    std::vector<std::string> lines;
    techno::execlp_out(&lines, "find", "find", ".", "-type", "d", NULL);
}

int main(int argc, char *argv[]) {

    // Check if path provided
    if (argc != 2) {
        std::cout << "Incorrect number of arguments.\n";
        exit(EXIT_FAILURE);
    }

    // Set and check path
    if (chdir(argv[1]) == -1) {
        std::cout << "Incorrect path.\n";
        exit(EXIT_FAILURE);
    }

}
