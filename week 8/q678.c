#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[]) {
    if (argc < 3) {
        printf("invalid number of arguments\n");
        exit(1);
    }

    FILE* fp_read = fopen(argv[1], "r");
    if (fp_read == NULL) {
        // failed to open the file.
        perror(argv[1]);
        exit(1); // stops the whole program.
        return 1; // same as above line (only in main function)
    }
    
    int ch = getc(fp_read); // read a single character from the file.
    while (ch != EOF && ch != '\n') {
        printf("%c", ch);
        ch = getc(fp_read);
    }
    
    printf("\n");
    fclose(fp_read);
    
    FILE* fp_write = fopen(argv[2], "w"); // write to a file
    ch = getc(stdin);
    while (ch != EOF && ch != '\n') {
        // write to the file
        fprintf(fp_write, "%c", ch);
        ch = getc(stdin);
    }
    fclose(fp_write);
    
    FILE* fp_append = fopen(argv[2], "a"); // write to a file
    ch = getc(stdin);
    while (ch != EOF && ch != '\n') {
        // write to the file
        fprintf(fp_append, "%c", ch);
        ch = getc(stdin);
    }
    fclose(fp_append);
    return 0;
}