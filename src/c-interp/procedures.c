#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "util.h"

extern char*  token;
extern size_t size;
extern size_t end;

extern Dictionary* env;

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
    Value val;
    char* key = NULL;
start:
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
            fprintf(stderr, "[\033[1;31mERROR\033[0m] Cannot assign number: '");
            eprintlen(token + offset, end - offset);
            fprintf(stderr, "'\n");
            exit(1);
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
        if (key == NULL) {
            key = malloc(end - offset);
            strncpy(key, token + offset + 1, end - offset - 1);
            key[end - offset - 1] = '\0';
            end++;
            goto start;
        }
        val.stringValue = malloc(end - offset);
        strncpy(val.stringValue, token + offset + 1, end - offset - 1);
        val.stringValue[end - offset - 1] = '\0';
        end++;
        upsert(env, key, STRING_TYPE, val);
    } else {
        end++;
    symbol:
        while (!isspace(token[end]) && token[end] != '0') {
            end++;
        }
        char* dest = malloc(end - offset);
        strncpy(dest, token + offset, end - offset);
        dest[end - offset] = '\0';

        Entry* entry    = lookup(env, dest);
        val.stringValue = "test";
        if (entry != NULL)
            upsert(env, entry->key, STRING_TYPE, val);
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
