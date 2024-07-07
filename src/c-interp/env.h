#ifndef ENV_H
#define ENV_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 100

typedef void (*proc)(void);

typedef union {
    int   intValue;
    float floatValue;
    void* pointerValue;
    char* stringValue;
    proc  procedureValue;
} Value;

typedef enum {
    INT_TYPE,
    FLOAT_TYPE,
    POINTER_TYPE,
    STRING_TYPE,
    PROCEDURE_TYPE,
} ValueType;

typedef struct Entry {
    char*         key;
    ValueType     type;
    Value         value;
    struct Entry* next;
} Entry;

typedef struct Dictionary {
    Entry*             table[TABLE_SIZE];
    struct Dictionary* next; // Pointer to the next dictionary (for the stack)
} Dictionary;

unsigned int hash(const char* key);
Entry*       lookup(Dictionary* dict, const char* key);
void upsert(Dictionary* dict, const char* key, ValueType type, Value value);
void delete(Dictionary* dict, const char* key);
Dictionary* create_dictionary();
void        free_dictionary(Dictionary* dict);
void        push_scope(Dictionary** head);
void        pop_scope(Dictionary** head);

#endif
