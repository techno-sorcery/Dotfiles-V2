#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

#define MAX_ARGS 8      // Max number of cmd args

struct widget {
    int update;
    int signal;
    char *args[MAX_ARGS];
} typedef Widget;

#include "config.h"

static int widget_size = sizeof(widgets) / sizeof(widgets[0]);


// Closed forked process
void close_proc(int sig) {
    printf("yippie.");
}


// Run widget proc
void run_proc(int id) {
    while(1) {
        
        // Fork and check
        pid_t mypid = fork();

        // Error
        if (mypid == -1) {
            perror("fork() failed");
            exit(EXIT_FAILURE);

        // Child
        } else if (mypid == 0) {

            // Exec cmd and check
            if (execvp(widgets[id].args[0], widgets[id].args) == -1) {
                perror("execvp() failed");
                exit(EXIT_FAILURE);
            }
        }

        sleep(widgets[id].update);
    }
}


// Create widget procs
void create_proc() {
    for(int i = 0; i < widget_size; i++){
        
        // Fork and check
        pid_t mypid = fork();

        // Error
        if (mypid == -1) {
            perror("fork() failed");
            exit(EXIT_FAILURE);

        // Child
        } else if (mypid == 0) {
            run_proc(i);
        }
    }
}


int main() {

    // Bind SIGINT and check
    /* if (signal(SIGINT, close_proc)) { */
    /*     perror("signal() failed"); */
    /*     exit(EXIT_FAILURE); */
    /* } */

    create_proc();   

    while (1) {
        if (waitpid(-1, NULL, WNOHANG) == -1) {
            perror("waitpid() failed");
            exit(EXIT_FAILURE);
        }
    }

    return 0;
}
