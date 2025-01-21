#ifndef ENV_H
#define ENV_H

#define STACK_SIZE 1000
#define ENV_SIZE 100

#define TYPES (char *[]){ "NUMBER", "STRING", "SYMBOL" }

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

typedef struct Variable {
    char *key;
    void *value;
    bool is_intrinsic;
    struct Variable *next;
} Variable;

typedef struct Environment {
    Variable *var[ENV_SIZE];
    struct Environment *next;
} Environment;

#endif
