#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

// Chmod if public write.
void chmod_if_public_write(char* path);

int main (int argc, char* argv[]) {
    // loop through given files.
    for (int i=1; i<argc; i++) {
        chmod_if_public_write(argv[i]);
    }
}

void chmod_if_public_write(char* path) {
    struct stat s; 
    // somehow check if the file at path is publically writeable.
    int status = stat(path, &s);
    if (status != 0) {
        // stat call failed
        perror(path);
        return;
    }

    // we first now need to check is it publically writeable
    if (s.st_mode & S_IWOTH) {
        printf("modifying");
        // now we need to actually change the mode to turn off public write
        // ie set 'other write' bit to 0
        mode_t new_mode = s.st_mode & ~S_IWOTH;

        // now actually write our change.
        status = chmod(path, new_mode);
        if (status != 0) {
            // chmod call failed
            perror("chmod");
            return;
        }
    } else {

        printf("not modifying");
    }
}