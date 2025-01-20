#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct Program {
    char *code;
    int size;
    int position;
} Program;

void error(char *msg, ...) {
    va_list args;
    va_start(args, msg);
    fprintf(stderr, msg, args);
    exit(1);
}

Program read_file(char *filename) {
    Program program = {};

    FILE *file = fopen(filename, "r");
    if (!file) error("File not found.\n");

    fseek(file, 0, SEEK_END);
    program.size = ftell(file);
    fseek(file, 0, SEEK_SET);

    program.code = malloc(program.size + 1);
    fread(program.code, program.size, 1, file);
    program.code[program.size] = 0;

    return program;
}

char *get_token(Program *program) {
    while (program->position < program->size && isspace(program->code[program->position])) program->position++;
    int end = program->position + 1;

    if (program->code[program->position] == '[') {
        int layer = 1;
        for (;;) {
            if (++end > program->size) error("Non terminating quote.");
            if (program->code[end-1] == '[' && program->code[end-2] != '\\') layer++;
            if (program->code[end-1] == ']' && program->code[end-2] != '\\') layer--;
            if (layer <= 0) break;
        }
    } else if (program->code[program->position] == '"') {
        for (;;) {
            if (++end > program->size) error("Non terminating quote.");
            if (program->code[end-1] == '"' && program->code[end-2] != '\\') break;
        }
    } else {
        while (end < program->size && !isspace(program->code[end])) end++;
    }
    int size = end - program->position;
    // printf("size: %i\n", size);

    if (size == 0) return NULL;

    char *token = malloc(size + 1);
    strncpy(token, program->code + program->position, size);
    token[size] = 0;
    program->position = end + 1;

    return token;
}

void interpret(Program program) {
    for (int i = 0; program.position < program.size; i++) {
        char *token = get_token(&program);
        if (!token) return;
        printf("[%s]\n", token);
    }
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    Program program = read_file(argv[1]);
    // printf("%s", program.code);
    interpret(program);
}
