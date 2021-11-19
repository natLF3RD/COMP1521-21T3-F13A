// Write a C program, print_diary.c, which prints the contents of the
// file $HOME/.diary to stdout.
// The lecture example getstatus.c shows how to get the value of an 
// environment variable.
// 
// snprintf is a convenient function for constructing the pathname of the
// diary file.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    // Get the pathname
    // get the home, path?
    char* home_path = getenv("HOME");
    
    // somehow get the format $HOME/.diary
    char* diary = "/.diary";
    int new_size = strlen(home_path) + strlen(diary) + 1;
    char diary_pathname[new_size];
    snprintf(diary_pathname, new_size, "%s%s", home_path, diary);
    
    // open the file -> remember previous tutlabs
    FILE* fp = fopen(diary_pathname, "r"); 
    if (fp == NULL) {
        perror(diary_pathname);
        return 1;
    }
    
    // print the contents to stdout.
    int ch;
    while ((ch = fgetc(fp)) != EOF) {
        fputc(ch, stdout);
    }
    fclose(fp);
    
    return 0;
}