#ifndef ENV_H
#define ENV_H

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 100

typedef void (*proc)(void);

typedef union {
    long   intValue;
    double floatValue;
    void*  pointerValue;
    char*  stringValue;
    proc   procedureValue;
} Value;

typedef struct Entry {
    char*         key;
    Value         value;
    bool          is_procedure;
    struct Entry* next;
} Entry;

typedef struct Dictionary {
    Entry*             table[TABLE_SIZE];
    struct Dictionary* next; // Pointer to the next dictionary (for the stack)
} Dictionary;

unsigned int hash(const char* key);
Entry*       lookup(Dictionary* dict, const char* key);
void upsert(Dictionary* dict, const char* key, Value value, bool is_procedure);
void delete(Dictionary* dict, const char* key);
Dictionary* create_dictionary();
void        free_dictionary(Dictionary* dict);
void        push_scope(char* code);
void        pop_scope();

#endif
