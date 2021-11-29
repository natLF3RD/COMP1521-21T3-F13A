#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <spawn.h>
#include <string.h>
#include <stdlib.h>

// This varies somewhat depending on your system.
#define C_COMPILER "/usr/bin/gcc"       // my local version
// #define C_COMPILER "/usr/local/bin/dcc" // uni system location for dcc

void compile(char* path);

int main (int argc, char* argv[]) {
    for (int i=1; i<argc; i++) {
        compile(argv[i]);
    }

    return 0;
}

char *get_executable_name(char* path) {
    // get a copy of path.
    char* exec_path = strdup(path);

    // now find the . character path
    char* pos = strchr(exec_path, '.');
    if (pos == NULL || *(pos+1) != 'c' || *(pos+2) != '\0') {
        fprintf(stderr, "not a valid c file: %s", exec_path);
        exit(1);
    }

    *pos = '\0';
    return exec_path;
}

void compile(char* path) {
    char * exec_path = get_executable_name(path);
    // spawning the process
    pid_t pid;
    char* args[] = {C_COMPILER, path, "-o", exec_path, NULL};
    printf("%s %s -o %s\n", C_COMPILER, path, exec_path);

    extern char **environ;
    if (posix_spawn(&pid, C_COMPILER, NULL, NULL, args, environ) != 0) {
        // then something failed.
        fprintf(stderr, "spawning dcc failed for %s\n", path);
        return;
    }
    
    int exit_status;
    if (waitpid(pid, &exit_status, 0) == -1) {
        // again something with wait pid failed this time.
        fprintf(stderr, "waitpid failed for %s\n", path);
        return;
    }

    // check our process ran successfully
    if (exit_status != 0) {
        fprintf(stderr, "return with code %d for %s\n", exit_status, path);
        return;
    }

}
