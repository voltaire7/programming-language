#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "util.h"

extern char*  fileContent;
extern size_t contentSize;
extern size_t token_end;

extern Dictionary* env;

void PRINT() {
    Value val;
    while (isspace(fileContent[token_end])) {
        token_end++;
    }

    if (token_end >= contentSize) {
        exit(0);
    }

    int offset = token_end;
    if (isdigit(fileContent[token_end])) {
        token_end++;
        while (isdigit((fileContent[token_end]))) token_end++;
        if (fileContent[token_end] == '.')
            while (isdigit(fileContent[++token_end]))
                ;

        if (isspace(fileContent[token_end]) || fileContent[token_end] == '\0') {
            printlen(fileContent + offset, token_end - offset);
        } else
            goto symbol;

    } else if (fileContent[token_end] == '[') {
        token_end++;
        int layer = 0;
        do {
            if (fileContent[token_end] == '[') layer++;
            if (fileContent[token_end] == ']') layer--;
            token_end++;
        } while (fileContent[token_end] != ']' || layer != 0);
        printlen(fileContent + offset + 1, token_end - offset - 1);
    } else {
        token_end++;
    symbol:
        while (!isspace(fileContent[token_end]) && fileContent[token_end] != '0'
        ) {
            token_end++;
        }
        char* dest = malloc(token_end - offset);
        strncpy(dest, fileContent + offset, token_end - offset);
        dest[token_end - offset] = '\0';

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
    while (isspace(fileContent[token_end])) {
        token_end++;
    }

    if (token_end >= contentSize) {
        exit(0);
    }

    int offset = token_end;
    if (isdigit(fileContent[token_end])) {
        token_end++;
        while (isdigit((fileContent[token_end]))) token_end++;
        if (fileContent[token_end] == '.')
            while (isdigit(fileContent[++token_end]))
                ;

        if (isspace(fileContent[token_end]) || fileContent[token_end] == '\0') {
            printlen(fileContent + offset, token_end - offset);
        } else
            goto symbol;

    } else if (fileContent[token_end] == '[') {
        token_end++;
        int layer = 0;
        do {
            if (fileContent[token_end] == '[') layer++;
            if (fileContent[token_end] == ']') layer--;
            token_end++;
        } while (fileContent[token_end] != ']' || layer != 0);
        printlen(fileContent + offset + 1, token_end - offset - 1);
    } else {
        token_end++;
    symbol:
        while (!isspace(fileContent[token_end]) && fileContent[token_end] != '0'
        ) {
            token_end++;
        }
        char* dest = malloc(token_end - offset);
        strncpy(dest, fileContent + offset, token_end - offset);
        dest[token_end - offset] = '\0';

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
    while (isspace(fileContent[token_end])) {
        token_end++;
    }

    if (token_end >= contentSize) {
        exit(0);
    }

    int offset = token_end;
    if (isdigit(fileContent[token_end])) {
        token_end++;
        while (isdigit((fileContent[token_end]))) token_end++;
        if (fileContent[token_end] == '.')
            while (isdigit(fileContent[++token_end]))
                ;

        if (isspace(fileContent[token_end]) || fileContent[token_end] == '\0') {
            fprintf(stderr, "[\033[1;31mERROR\033[0m] Cannot assign number: '");
            eprintlen(fileContent + offset, token_end - offset);
            fprintf(stderr, "'\n");
            exit(1);
        } else
            goto symbol;

    } else if (fileContent[token_end] == '[') {
        token_end++;
        int layer = 0;
        do {
            if (fileContent[token_end] == '[') layer++;
            if (fileContent[token_end] == ']') layer--;
            token_end++;
        } while (fileContent[token_end] != ']' || layer != 0);
        if (key == NULL) {
            key = malloc(token_end - offset);
            strncpy(key, fileContent + offset + 1, token_end - offset - 1);
            key[token_end - offset - 1] = '\0';
            token_end++;
            goto start;
        }
        val.stringValue = malloc(token_end - offset);
        strncpy(
            val.stringValue,
            fileContent + offset + 1,
            token_end - offset - 1
        );
        val.stringValue[token_end - offset - 1] = '\0';
        token_end++;
        upsert(env, key, STRING_TYPE, val);
    } else {
        token_end++;
    symbol:
        while (!isspace(fileContent[token_end]) && fileContent[token_end] != '0'
        ) {
            token_end++;
        }
        char* dest = malloc(token_end - offset);
        strncpy(dest, fileContent + offset, token_end - offset);
        dest[token_end - offset] = '\0';

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
