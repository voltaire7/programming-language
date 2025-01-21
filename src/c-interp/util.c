#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "shared.h"

extern char *stack[STACK_SIZE];
extern int stack_index;

void error(char *msg, ...) {
    va_list args;
    va_start(args, msg);
    vfprintf(stderr, msg, args);
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

bool is_number(Token token) {
    if (isdigit(*token)) {
        while (isdigit(*token++));
        if (*(token-1) == '.') while (isdigit(*token++));
    } else if (*token == '.' && isdigit(*++token)) while (isdigit(*token++));
    else return false;
    return !*token;
}

Type get_type(Token token) {
    if (*token == '[' || *token == '"') return STRING;
    if (is_number(token)) return NUMBER;
    return SYMBOL;
}

void debug_stack() {
    for (int i = 0; i < stack_index; i++) {
        printf("%i = %s\n", i, stack[i]);
    }
}

Token get_token(Program *program) {
    while (program->position < program->size && isspace(program->code[program->position])) program->position++;
    int end = program->position + 1;

    if (program->code[program->position] == '[') {
        int layer = 1;
        for (;;) {
            if (++end > program->size) error("Non terminating quote.\n");
            else if (program->code[end-1] == '[' && program->code[end-2] != '\\') layer++;
            else if (program->code[end-1] == ']' && program->code[end-2] != '\\') layer--;
            if (layer < 1) break;
        }
    } else if (program->code[program->position] == '"') {
        for (;;) {
            if (++end > program->size) error("Non terminating quote.\n");
            if (program->code[end-1] == '"' && program->code[end-2] != '\\') break;
        }
    } else {
        while (end < program->size && !isspace(program->code[end])) end++;
    }
    int size = end - program->position;
    // printf("size: %i\n", size);

    if (size == 0) return NULL;

    Token token = malloc(size + 1);
    strncpy(token, program->code + program->position, size);
    token[size] = 0;
    program->position = end + 1;

    return token;
}
