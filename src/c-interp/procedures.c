#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "parse.h"
#include "util.h"

extern char*  token;
extern size_t size;
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
            fprintf(stderr, "[\033[1;31mERROR\033[0m] Cannot assign number: '");
            eprintlen(token + offset, end - offset);
            fprintf(stderr, "'\n");
    parse();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            exit(1);
            break;
        case QUOTE:
            break;
        case SYMBOL:
            break;
        default:
            break;
    }
}
