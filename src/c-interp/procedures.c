#include <ctype.h>
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
            for (int i = 0; s[i] != '\0'; i++) {
                if (s[i] == '%') {
                    i++;
                    parse();
                    switch (s[i]) {
                        case '%':
                            printf("%%");
                            break;
                        case 'i':
                        case 'f':
                        case 's': {
                            char* t;
                            symbolcpy(&t);
                            if (token_type != SYMBOL)
                                error("Not a symbol: '%s'", t);
                            Entry* entry = lookup(env, t);
                            if (entry == NULL)
                                error("Undefined symbol: '%s'", entry->key);

                            if (s[i] == 'i')
                                printf("%ld", entry->value.intValue);
                            else if (s[i] == 'f')
                                printf("%f", entry->value.floatValue);
                            else if (s[i] == 's')
                                printf("%s", entry->value.stringValue);
                            break;
                        }
                        default:
                            if (token_type == QUOTE)
                                printlen(token + start + 1, len() - 2);
                            else
                                printlen(token + start, len());
                            putchar(s[i]);
                    }
                } else
                    putchar(s[i]);
            }
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
    char*  keys;
    Value  val;
    Entry* entry;

    parse();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbolcpy(&keys);
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            quotecpy(&keys);
            break;
        case SYMBOL: {
            symbolcpy(&keys);
            entry = lookup(env, keys);
            if (entry == NULL) error("Undefined symbol: '%s'", entry->key);
            strcpy(keys, entry->value.stringValue);
            break;
        }
    }

    long keys_len = strlen(keys);
    for (int i = 0; i < keys_len; i++) {
        if (isspace(keys[i])) continue;

        int l = 0;
        for (; !isspace(keys[i]) && keys[i] != '\0'; i++, l++)
            ;
        char* key = malloc(l + 1);
        strncpy(key, keys + i - l, l);
        key[i] = '\0';

        parse();
        switch (token_type) {
            case INTEGER:
            case FLOAT:
                if (token_type == INTEGER) {
                    val.intValue = atoi(token + start);
                    upsert(env, key, val);
                } else {
                    val.floatValue = atof(token + start);
                    upsert(env, key, val);
                }
                break;
            case QUOTE:
                quotecpy(&val.stringValue);
                upsert(env, key, val);
                break;
            case SYMBOL: {
                char* s;
                symbolcpy(&s);
                entry = lookup(env, s);
                if (entry == NULL) error("Undefined symbol: '%s'", entry->key);
                val.pointerValue = entry->value.procedureValue;
                upsert(env, s, val);
                break;
            }
        }
    }
}

void FREE() {
    parse();
    char* s;
    symbolcpy(&s);
    if (token_type != SYMBOL) error("Not a symbol: '%s'", s);
    Entry* entry = lookup(env, s);
    if (entry == NULL) error("Undefined symbol: '%s'", s);
    free(entry->value.stringValue);
}

void DO() {
    parse();
    char* s;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case QUOTE:
            quotecpy(&s);
            push_scope(s);
            break;
        case SYMBOL: {
            symbolcpy(&s);
            Entry* entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol: '%s'", s);
            push_scope(entry->value.stringValue);
            break;
        }
    }
}
