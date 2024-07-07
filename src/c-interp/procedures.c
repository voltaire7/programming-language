#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "parse.h"
#include "util.h"

extern char*  token;
extern size_t size;

extern size_t start;
extern size_t end;

extern Dictionary* env;

extern TokenType token_type;

void PRINT() {
    char* s;
    parse();

    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbolcpy(&s);
            printf("%s", s);
            break;
        case QUOTE:
            quotecpy(&s);
        quote:
            process_str(s);
            printf("%s", s);
            break;
        case SYMBOL:
            symbolcpy(&s);
            Entry* entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol: '%s'", s);
            s = entry->value.stringValue;
            goto quote;
            break;
    }
}

void ITEM() {
    char* key = NULL;
    Value val;
label:
    parse();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (key == NULL) {
                symbolcpy(&key);
                error("Cannot assign number: '%s'", key);
            }
            if (token_type == INTEGER) {
                val.intValue = atoi(token + start);
                upsert(env, key, INT_TYPE, val);
            } else {
                val.floatValue = atof(token + start);
                upsert(env, key, FLOAT_TYPE, val);
            }
            return;
        case QUOTE:
            if (key == NULL) {
                quotecpy(&key);
                goto label;
            }
            quotecpy(&val.stringValue);
            upsert(env, key, STRING_TYPE, val);
            return;
        case SYMBOL: {
            Entry* entry;
            if (key == NULL) {
                symbolcpy(&key);
                entry = lookup(env, key);
                if (entry == NULL) error("Undefined symbol: '%s'", entry->key);
                strcpy(key, entry->value.stringValue);
                goto label;
            } else {
                char* s;
                symbolcpy(&s);
                entry = lookup(env, s);
                if (entry == NULL) error("Undefined symbol: '%s'", entry->key);
                val.pointerValue = entry->value.procedureValue;
                upsert(env, key, PROCEDURE_TYPE, val);
                return;
            }
        }
    }
}
