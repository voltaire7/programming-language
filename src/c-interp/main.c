#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

int size;

void error(char *msg, ...) {
    va_list args;
    va_start(args, msg);
    fprintf(stderr, msg, args);
    exit(1);
}

char *read_file(char *filename) {
    FILE *file = fopen(filename, "r");
    if (!file) error("File not found.\n");

    fseek(file, 0, SEEK_END);
    size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *code = malloc(size + 1);
    fread(code, size, 1, file);
    code[size] = 0;

    return code;
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    char *code = read_file(argv[1]);
    printf("%s", code);
}
