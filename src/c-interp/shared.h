#ifndef SHARED_H
#define SHARED_H

#include <stdbool.h>

#define WHITE "\033[0m"
#define RED   "\033[1;31m"
#define BLUE  "\033[1;34m"

#define STACK_SIZE 1000
#define ENV_SIZE 100

#define TYPES (char *[]){ "NUMBER", "STRING", "SYMBOL" }

typedef char * Token;

typedef struct Variable {
    char *key;
    void *value;
    bool is_intrinsic;
    struct Variable *next;
} Variable;

typedef struct Program {
    char *code;
    int size;
    int position;
    Variable *env[ENV_SIZE];
    struct Program *next;
} Program;

typedef enum Type {
    NUMBER,
    STRING,
    SYMBOL,
} Type;

#endif
