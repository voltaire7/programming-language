#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char*  fileContent = NULL;
size_t contentSize = 0;
size_t position    = 0;

void readFileContent(const char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Failed to open the file.\n");
        exit(1);
    }

    fseek(filePointer, 0, SEEK_END);
    contentSize = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    fileContent = malloc(contentSize + 1);
    if (fileContent == NULL) {
        printf("Failed to allocate memory.\n");
        fclose(filePointer);
        exit(1);
    }

    fread(fileContent, 1, contentSize, filePointer);
    fileContent[contentSize] = '\0';

    fclose(filePointer);
}

void printlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) putchar(*str);
}

void eprintlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) fputc(*str, stderr);
}
