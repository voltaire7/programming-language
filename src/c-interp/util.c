#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"

extern char *stack[STACK_SIZE];
extern int stack_index;

void error(char *msg, ...) {
    va_list args;
    va_start(args, msg);
    fprintf(stderr, "[" RED "ERROR" WHITE "] ");
    vfprintf(stderr, msg, args);
    fprintf(stderr, "\n");
    exit(1);
}

Program read_file(char *filename) {
    Program program = {};

    FILE *file = fopen(filename, "r");
    if (!file) error("File not found: '%s'", filename);

    fseek(file, 0, SEEK_END);
    program.size = ftell(file);
    fseek(file, 0, SEEK_SET);

    program.code = malloc(program.size + 1);
    fread(program.code, program.size, 1, file);
    program.code[program.size] = 0;

    return program;
}

bool is_number(Token token) {
    if (*token == '-') token++;
    if (isdigit(*token)) {
        while (isdigit(*token++));
        if (*(token-1) == '.') while (isdigit(*token++));
    } else if (*token == '.' && isdigit(*++token)) while (isdigit(*token++));
    else return false;
    return !*(token-1);
}

Type get_type(Token token) {
    if (*token == '[' || *token == '"') return STRING;
    if (is_number(token)) return NUMBER;
    return SYMBOL;
}

void debug_stack() {
    for (int i = 0; i < stack_index; i++) {
        printf("%i = %s\n", i, stack[i]);
        // printf("%s == %s\n", stack[i], TYPES[get_type(stack[i])]);
    }
}

bool issyntax(char c) {
    return c == ',' || c == ';' || c == '(' || c == ')';
}

Token get_token(Program *program) {
    while (program->position < program->size && (isspace(program->code[program->position]) || issyntax(program->code[program->position]))) program->position++;
    if (program->code[program->position] == '#') {
        while (program->code[program->position] != '\n') program->position++;
    }
    int end = program->position;

    if (program->code[program->position] == '[') {
        int layer = 1;
        for (;;) {
            if (++end > program->size) error("Non terminating quote.");
            else if (program->code[end] == '[' && program->code[end-1] != '\\') layer++;
            else if (program->code[end] == ']' && program->code[end-1] != '\\') layer--;
            if (layer < 1) break;
        }
        end++;
    } else if (program->code[program->position] == '"') {
        for (;;) {
            if (++end > program->size) error("Non terminating quote.");
            if (program->code[end] == '"' && program->code[end-1] != '\\') break;
        }
        end++;
    } else {
        while (end < program->size && !isspace(program->code[end]) && !issyntax(program->code[end]) && program->code[end] != '#') end++;
    }
    int size = end - program->position;

    if (size == 0) return NULL;

    Token token = malloc(size + 1);
    strncpy(token, program->code + program->position, size + 1);
    token[size] = 0;
    program->position = end;

    return token;
}

char *pop() {
    if (!stack_index) error("Stack is empty.");
    return stack[--stack_index];
}

void push(char *value) {
    if (stack_index >= STACK_SIZE) error("Stack has overflowed.");
    stack[stack_index++] = value;
}

Token unquote(Token token) {
    Type type = get_type(token);
    switch (type) {
        case STRING: {
            int size = strlen(token) - 2;
            for (int i = 0; i < size; i++) token[i] = token[i+1];
            token[size] = 0;
        } break;
        case NUMBER:
        case SYMBOL:
            break;
    }
    return token;
}

char *ftoa(double num) {
    char temp[50];

    snprintf(temp, sizeof(temp), "%g", num);
    size_t len = strlen(temp) + 1;
    char *result = malloc(len);
    snprintf(result, len, "%s", temp);

    return result;
}

void reverse_stack(int count) {
    for (int i = 1, j = count; i <= count / 2; i++, j--) {
        char *temp = stack[stack_index - i];
        stack[stack_index - i] = stack[stack_index - j];
        stack[stack_index - j] = temp;
    }
}

int length(Token token) {
    token++;
    while (*token && isspace(*token)) token++;
    if (!*token || *token == ']') return 0;
    while (*token && !isspace(*token)) token++;
    if (!*token && *(token-1) != ']') return 0;
    return 1 + length(token);
}

Token range(double min, double max) {
    int size = 1;
    Token acc = malloc(size+1);
    for (; min <= max; min++) {
        Token token = ftoa(min);
        int token_size = strlen(token);
        size += token_size + 1;
        Token new = malloc(size+1);
        new[size - token_size - 2] = ' ';
        strncpy(new, acc, size - token_size - 2);
        strncpy(new + 1 + size - token_size - 2, token, token_size);
        free(token), free(acc);
        acc = new;
    }
    if (size == 1) acc = realloc(acc, ++size + 1);
    acc[0] = '[';
    acc[size-1] = ']';
    acc[size] = 0;
    return acc;
}

Token append(Token left, Token right) {
    int size_left = strlen(left), size_right = strlen(right);
    Token new = malloc(size_left + size_right + 4);

    strncpy(new + 1, left, size_left);
    strncpy(new + 2 + size_left, right, size_right);

    new[0] = '[';
    new[size_left + 1] = ' ';
    new[size_left + 2 + size_right] = ']';
    new[size_left + 3 + size_right] = 0;

    return new;
}
