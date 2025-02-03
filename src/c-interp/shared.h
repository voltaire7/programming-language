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
typedef struct Program Program;

typedef struct Variable {
    char *key;
    void *value;
    bool is_intrinsic;
    struct Variable *next;
    Program *program;
} Variable;

typedef Variable *Environment[ENV_SIZE];

struct Program {
    char *code;
    int size;
    int position;
    Environment env;
    struct Program *scope_static;
    struct Program *scope_dynamic;
};

typedef enum Type {
    NUMBER,
    STRING,
    SYMBOL,
} Type;

#endif
