#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"

char* token = NULL;
long  size  = 0;

long start = 0;
long end   = 0;

extern Dictionary* env;

extern long layer_offset;

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

char* quotecpy() {
    char* dest = malloc((end - start - 2) + 1);
    strncpy(dest, token + start + 1, end - start - 2);
    (dest)[end - start - 2] = '\0';
    return dest;
}

char* symbolcpy() {
    char* dest = malloc((end - start) + 1);
    strncpy(dest, token + start, end - start);
    (dest)[end - start] = '\0';
    return dest;
}

void process_str(char* s) {
    int i = 0, j = 0;
    for (; s[i] != '\0'; i++, j++) {
        if (s[i] == '\\') {
            i++;
            switch (s[i]) {
                case '\\':
                    s[j] = '\\';
                    break;
                case 'n':
                    s[j] = '\n';
                    break;
                case '[':
                    s[j] = '[';
                    break;
                case ']':
                    s[j] = ']';
                    break;
                default:
                    error("Unknown escape sequence: '\\%c'", s[i]);
            }
        } else
            s[j] = s[i];
    }
    s[j] = '\0';
}

void concat(char** dest, const char* src) {
    size_t new_size = strlen(*dest) + strlen(src) + 1;
    char*  new_str  = (char*) realloc(*dest, new_size);
    if (new_str == NULL) error("Failed to realloc string.");
    *dest = new_str;
    strcat(*dest, src);
}

Dictionary* get_env(int layer) {
    Dictionary* env_target = env;
    for (int i = layer + layer_offset; i != 0; i--) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", layer);
    }
    return env_target;
}
