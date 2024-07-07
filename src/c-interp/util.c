#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char*  token = NULL;
size_t size  = 0;

size_t start = 0;
size_t end   = 0;

void error(char* msg, ...) {
    va_list args;
    va_start(args, msg);
    fprintf(stderr, "[\033[1;31mERROR\033[0m] ");
    vfprintf(stderr, msg, args);
    fprintf(stderr, "\n");
    va_end(args);
    exit(1);
}

void readFileContent(const char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL) error("Failed to open the file: '%s'", filename);

    fseek(filePointer, 0, SEEK_END);
    size = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    token = malloc(size + 1);
    if (token == NULL) {
        fclose(filePointer);
        error("Failed to allocate memory.");
    }

    fread(token, 1, size, filePointer);
    token[size] = '\0';

    fclose(filePointer);
}

void printlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) putchar(*str);
}

void quotecpy(char** dest) {
    *dest = malloc((end - start - 2) + 1);
    strncpy(*dest, token + start + 1, end - start - 2);
    (*dest)[end - start] = '\0';
}

void symbolcpy(char** dest) {
    *dest = malloc((end - start) + 1);
    strncpy(*dest, token + start, end - start);
    (*dest)[end - start] = '\0';
}

void process_str(char* s) {
    // Unknown escape sequence: '\w'
    int i = 0, j = 0;
    for (; s[i] != '\0'; i++, j++) {
        if (s[i] == '\\') {
            i++;
            switch (s[i]) {
                case 'n':
                    s[j] = '\n';
                    break;
                default:
                    error("Unknown escape sequence: '\\%c'", s[i]);
            }
        }
    }
    s[j] = '\0';
}
