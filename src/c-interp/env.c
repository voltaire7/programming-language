#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TABLE_SIZE 100

typedef enum { INT_TYPE, FLOAT_TYPE, POINTER_TYPE, STRING_TYPE } ValueType;

typedef union {
    int   intValue;
    float floatValue;
    void* pointerValue;
    char* stringValue;
} Value;

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

unsigned int hash(const char* key) {
    unsigned long int value   = 0;
    unsigned int      i       = 0;
    unsigned int      key_len = strlen(key);

    for (; i < key_len; ++i) {
        value = value * 37 + key[i];
    }
    return value % TABLE_SIZE;
}

Entry* lookup(Dictionary* dict, const char* key) {
    while (dict != NULL) {
        unsigned int slot  = hash(key);
        Entry*       entry = dict->table[slot];

        while (entry != NULL) {
            if (strcmp(entry->key, key) == 0) {
                return entry;
            }
            entry = entry->next;
        }
        dict = dict->next; // Move to the next scope
    }
    return NULL;
}

void upsert(Dictionary* dict, const char* key, ValueType type, Value value) {
    unsigned int slot = hash(key);

    Entry* entry = dict->table[slot];
    if (entry == NULL) {
        dict->table[slot]        = (Entry*) malloc(sizeof(Entry));
        dict->table[slot]->key   = strdup(key);
        dict->table[slot]->type  = type;
        dict->table[slot]->value = value;
        dict->table[slot]->next  = NULL;
    } else {
        Entry* prev;
        while (entry != NULL) {
            if (strcmp(entry->key, key) == 0) {
                entry->type  = type;
                entry->value = value;
                return;
            }
            prev  = entry;
            entry = entry->next;
        }
        entry        = (Entry*) malloc(sizeof(Entry));
        entry->key   = strdup(key);
        entry->type  = type;
        entry->value = value;
        entry->next  = NULL;
        prev->next   = entry;
    }
}

void delete(Dictionary* dict, const char* key) {
    if (dict == NULL) return;

    unsigned int slot  = hash(key);
    Entry*       entry = dict->table[slot];
    Entry*       prev  = NULL;

    while (entry != NULL) {
        if (strcmp(entry->key, key) == 0) {
            if (prev == NULL) {
                dict->table[slot] = entry->next;
            } else {
                prev->next = entry->next;
            }

            free(entry->key);
            if (entry->type == STRING_TYPE) {
                free(entry->value.stringValue);
            }
            free(entry);
            return;
        }
        prev  = entry;
        entry = entry->next;
    }
}

Dictionary* create_dictionary() {
    Dictionary* dict = (Dictionary*) malloc(sizeof(Dictionary));
    for (int i = 0; i < TABLE_SIZE; i++) {
        dict->table[i] = NULL;
    }
    dict->next = NULL;
    return dict;
}

void free_dictionary(Dictionary* dict) {
    for (int i = 0; i < TABLE_SIZE; i++) {
        Entry* entry = dict->table[i];
        while (entry != NULL) {
            Entry* temp = entry;
            entry       = entry->next;
            free(temp->key);
            if (temp->type == STRING_TYPE) {
                free(temp->value.stringValue);
            }
            free(temp);
        }
    }
    free(dict);
}

void push_scope(Dictionary** head) {
    Dictionary* new_dict = create_dictionary();
    new_dict->next       = *head;
    *head                = new_dict;
}

void pop_scope(Dictionary** head) {
    if (*head == NULL) return;

    Dictionary* temp = *head;
    *head            = (*head)->next;

    free_dictionary(temp);
}

// int main() {
//     Dictionary* env = create_dictionary();
//
//     push_scope(&env); // Enter a new scope
//
//     Value intValue;
//     intValue.intValue = 42;
//     upsert(env, "x", INT_TYPE, intValue);
//
//     Value floatValue;
//     floatValue.floatValue = 3.14;
//     upsert(env, "y", FLOAT_TYPE, floatValue);
//
//     Entry* e = lookup(env, "x");
//     if (e) printf("x: %d\n", e->value.intValue);
//
//     e = lookup(env, "y");
//     if (e) printf("y: %f\n", e->value.floatValue);
//
//     // Modify "x" in the current scope
//     intValue.intValue = 99;
//     upsert(env, "x", INT_TYPE, intValue);
//
//     e = lookup(env, "x");
//     if (e) printf("x after modification: %d\n", e->value.intValue);
//
//     // Try to modify a non-existent key "z" in the current scope (should do nothing)
//     intValue.intValue = 123;
//     upsert(env, "z", INT_TYPE, intValue);
//
//     e = lookup(env, "z");
//     if (e) {
//         printf("z: %d\n", e->value.intValue);
//     } else {
//         printf("z does not exist in the current scope.\n");
//     }
//
//     pop_scope(&env); // Exit the current scope
//
//     free_dictionary(env);
//
//     return 0;
// }
