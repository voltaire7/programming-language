#ifndef ENV_H
#define ENV_H

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "scan-token.h"

#define TABLE_SIZE 100

typedef enum {
    PROCEDURE,
    STRING,
    NEITHER,
} PointerType;

typedef union {
    long   intValue;
    double floatValue;
    void*  pointerValue;
    char*  stringValue;
    void (*procedureValue)();
    TokenType token_type;
} Value;

typedef struct Entry {
    char*         key;
    Value         value;
    PointerType   type;
    struct Entry* next;
} Entry;

typedef struct Dictionary {
    Entry*             table[TABLE_SIZE];
    struct Dictionary* next; // Pointer to the next dictionary (for the stack)
} Dictionary;

unsigned int hash(const char* key);
Entry*       lookup(Dictionary* dict, const char* key);
Entry*       lookup_or_error(Dictionary* dict, const char* key);
void upsert(Dictionary* dict, const char* key, Value value, PointerType type);
void delete(Dictionary* dict, const char* key);
Dictionary* create_dictionary();
void        free_dictionary(Dictionary* dict);

void save_state();
void update_code(char* code);
void push_scope(char* code);
void recover_state();
void pop_scope();

#endif
