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
    Value val;
    while (isspace(token[end])) {
        end++;
    }

    if (end >= size) {
        exit(0);
    }

    int offset = end;
    if (isdigit(token[end])) {
        end++;
        while (isdigit((token[end]))) end++;
        if (token[end] == '.')
            while (isdigit(token[++end]))
                ;

        if (isspace(token[end]) || token[end] == '\0') {
            printlen(token + offset, end - offset);
        } else
            goto symbol;

    } else if (token[end] == '[') {
        end++;
        int layer = 0;
        do {
            if (token[end] == '[') layer++;
            if (token[end] == ']') layer--;
            end++;
        } while (token[end] != ']' || layer != 0);
        printlen(token + offset + 1, end - offset - 1);
    } else {
        end++;
    symbol:
        while (!isspace(token[end]) && token[end] != '0') {
            end++;
        }
        char* dest = malloc(end - offset);
        strncpy(dest, token + offset, end - offset);
        dest[end - offset] = '\0';

        Entry* result = lookup(env, dest);
        if (result != NULL)
            if (result->type == INT_TYPE)
                printf("%d", result->value.intValue);
            else
                printf("%.2f", result->value.floatValue);
        else {
            fprintf(
                stderr,
                "[\033[1;31mERROR\033[0m] Undefined symbol: '%s'\n",
                dest
            );
            exit(1);
        }
    }
}

void PRINTF() {
    Value val;
    while (isspace(token[end])) {
        end++;
    }

    if (end >= size) {
        exit(0);
    }

    int offset = end;
    if (isdigit(token[end])) {
        end++;
        while (isdigit((token[end]))) end++;
        if (token[end] == '.')
            while (isdigit(token[++end]))
                ;

        if (isspace(token[end]) || token[end] == '\0') {
            printlen(token + offset, end - offset);
        } else
            goto symbol;

    } else if (token[end] == '[') {
        end++;
        int layer = 0;
        do {
            if (token[end] == '[') layer++;
            if (token[end] == ']') layer--;
            end++;
        } while (token[end] != ']' || layer != 0);
        printlen(token + offset + 1, end - offset - 1);
    } else {
        end++;
    symbol:
        while (!isspace(token[end]) && token[end] != '0') {
            end++;
        }
        char* dest = malloc(end - offset);
        strncpy(dest, token + offset, end - offset);
        dest[end - offset] = '\0';

        Entry* result = lookup(env, dest);
        if (result != NULL)
            printf("%s", result->value.stringValue);
        else {
            fprintf(
                stderr,
                "[\033[1;31mERROR\033[0m] Undefined symbol: '%s'\n",
                dest
            );
            exit(1);
        }
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
            if (key != NULL) {
                if (token_type == INTEGER) {
                    val.intValue = atoi(token + start);
                    upsert(env, key, INT_TYPE, val);
                } else {
                    val.floatValue = atof(token + start);
                    upsert(env, key, FLOAT_TYPE, val);
                }
                return;
            }
            fprintf(stderr, "[\033[1;31mERROR\033[0m] Cannot assign number: '");
            eprintlen(token + start, end - start);
            fprintf(stderr, "'\n");
            exit(1);
            break;
        case QUOTE:
            if (key == NULL) {
                quotecpy(&key);
                goto label;
            }
            quotecpy(&val.stringValue);
            upsert(env, key, STRING_TYPE, val);
            break;
        case SYMBOL:
            symbolcpy(&key);
            Entry* entry = lookup(env, key);
            if (entry != NULL) {
                strcpy(key, entry->value.stringValue);
                goto label;
            } else {
                fprintf(
                    stderr,
                    "[\033[1;31mERROR\033[0m] Undefined symbol: '%s'\n",
                    entry->key
                );
                exit(1);
            }
            break;
    }
}
