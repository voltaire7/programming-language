#include "env.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
