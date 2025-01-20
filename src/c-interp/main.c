#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define STACK_SIZE 1000

typedef char * Token;

typedef struct Program {
    char *code;
    int size;
    int position;
} Program;

typedef enum Type {
    NUMBER,
    STRING,
    SYMBOL,
} Type;

const char *TYPES[] = { "NUMBER", "STRING", "SYMBOL" };

char *stack[STACK_SIZE] = {};
int stack_index = 0;

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

void eval(Program program, Token token) {
}

void debug_stack() {
    for (int i = 0; i < stack_index; i++) {
        printf("%i = %s\n", i, stack[i]);
    }
}

void interpret(Program program) {
    for (int i = 0; program.position < program.size; i++) {
        Token token = get_token(&program);
        if (!token) break;
        // printf("%s == %s\n", token, TYPES[get_type(token)]);

        Type type = get_type(token);
        switch (type) {
            case NUMBER:
            case STRING:
                stack[stack_index++] = token;
                break;
            case SYMBOL:
                free(token);
                break;
        }
    }
    debug_stack();
}

int main(int argc, char** argv) {
    if (argc < 2) error("Repl not implemented yet.\n");

    Program program = read_file(argv[1]);
    // printf("%s", program.code);
    interpret(program);
}
