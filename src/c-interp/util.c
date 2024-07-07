#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char*  token = NULL;
size_t size  = 0;

size_t start = 0;
size_t end   = 0;

void readFileContent(const char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Failed to open the file.\n");
        exit(1);
    }

    fseek(filePointer, 0, SEEK_END);
    size = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    token = malloc(size + 1);
    if (token == NULL) {
        printf("Failed to allocate memory.\n");
        fclose(filePointer);
        exit(1);
    }

    fread(token, 1, size, filePointer);
    token[size] = '\0';

    fclose(filePointer);
}

void printlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) putchar(*str);
}

void eprintlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) fputc(*str, stderr);
}

void quotecpy(char** dest) {
    *dest = malloc((end - start - 2) + 1);
    strncpy(*dest, token + start + 1, end - start - 2);
    (*dest)[end - start] = '\0';
}

void symbolcpy(char** dest) {
    *dest = malloc(end - start + 1);
    strncpy(*dest, token + start, end - start);
    (*dest)[end - start] = '\0';
}
