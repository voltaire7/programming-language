#include "env.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

extern char*  token;
extern size_t size;

extern size_t start;
extern size_t end;

extern Dictionary* env;

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

void upsert(Dictionary* dict, const char* key, Value value) {
    unsigned int slot = hash(key);

    Entry* entry = dict->table[slot];
    if (entry == NULL) {
        dict->table[slot]        = (Entry*) malloc(sizeof(Entry));
        dict->table[slot]->key   = strdup(key);
        dict->table[slot]->value = value;
        dict->table[slot]->next  = NULL;
    } else {
        Entry* prev;
        while (entry != NULL) {
            if (strcmp(entry->key, key) == 0) {
                entry->value = value;
                return;
            }
            prev  = entry;
            entry = entry->next;
        }
        entry        = (Entry*) malloc(sizeof(Entry));
        entry->key   = strdup(key);
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
            free(temp);
        }
    }
    free(dict);
}

void push_scope(char* code) {
    Value val;
    val.stringValue = token;
    upsert(env, "token", val);
    val.intValue = start;
    upsert(env, "start", val);
    val.intValue = end;
    upsert(env, "end", val);

    Dictionary* new_dict = create_dictionary();
    new_dict->next       = env;
    env                  = new_dict;

    token = code;
    size  = strlen(code);
    start = end = -1;
}

void pop_scope() {
    if (env == NULL) return;

    Dictionary* temp = env;
    env              = env->next;

    Entry* entry;

    entry = lookup(env, "token");
    if (entry == NULL) error("Undefined symbol: 'token'");
    token = entry->value.stringValue;
    size  = strlen(token);

    entry = lookup(env, "end");
    if (entry == NULL) error("Undefined symbol: 'end'");
    end = entry->value.intValue;

    free_dictionary(temp);
}
