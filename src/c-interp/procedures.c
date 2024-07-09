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
                                error("Undefined symbol: '%s'", t);

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
            if (entry == NULL) error("Undefined symbol: '%s'", keys);
            strcpy(keys, entry->value.stringValue);
            break;
        }
    }

    Value val;
    long  keys_len = strlen(keys);
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
                if (entry == NULL) error("Undefined symbol: '%s'", s);
                val.pointerValue = entry->value.procedureValue;
                upsert(env, key, val);
                break;
            }
        }
    }

    free(keys);
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

void PROC() {}

void ITEM_IN() {
    Entry* entry;

    long in = 0;
    parse();
    switch (token_type) {
        char* s;
        case INTEGER:
            symbolcpy(&s);
            in = atol(s);
            break;
        case FLOAT:
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
            break;
        case SYMBOL: {
            symbolcpy(&s);
            entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol: '%s'", s);
            in = entry->value.intValue;
            break;
        }
    }

    char* keys;
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
            if (entry == NULL) error("Undefined symbol: '%s'", keys);
            strcpy(keys, entry->value.stringValue);
            break;
        }
    }

    Dictionary* env_target = env;
    for (int i = in; i != 0; i--) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", in);
    }

    Value val;
    long  keys_len = strlen(keys);
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
                } else {
                    val.floatValue = atof(token + start);
                }
                break;
            case QUOTE:
                quotecpy(&val.stringValue);
                break;
            case SYMBOL: {
                char* s;
                symbolcpy(&s);
                entry = lookup(env, s);
                if (entry == NULL) error("Undefined symbol: '%s'", s);
                val.pointerValue = entry->value.procedureValue;
                break;
            }
        }
        upsert(env_target, key, val);
    }

    free(keys);
}

void ITER() {}

void PARSE() {
    char *    s, *inner_token;
    long      inner_size, inner_start, inner_end;
    Entry*    entry;
    TokenType inner_token_type;

    entry = lookup(env->next, "token");
    if (entry == NULL) error("Undefined symbol: '%s'", "token");
    inner_token = entry->value.stringValue;
    entry       = lookup(env->next, "start");
    if (entry == NULL) error("Undefined symbol: '%s'", "start");
    inner_start = entry->value.intValue;
    entry       = lookup(env->next, "end");
    if (entry == NULL) error("Undefined symbol: '%s'", "end");
    inner_end = entry->value.intValue;

    inner_size = strlen(inner_token);

parse:
    while (isspace(inner_token[inner_end])) {
        inner_end++;
    }

    if (inner_end >= inner_size && env->next == NULL)
        exit(0);
    else if (inner_end >= inner_size && env->next != NULL) {
        pop_scope();
        goto parse;
    }

    inner_start = inner_end;
    if (inner_token[inner_end] == '-' || isdigit(inner_token[inner_end])) {
        inner_token_type = INTEGER;
        inner_end++;
        while (isdigit((inner_token[inner_end]))) inner_end++;
        if (inner_token[inner_end] == '.') {
            while (isdigit(inner_token[++inner_end]))
                ;
            inner_token_type = FLOAT;
        }
        if (!isspace(inner_token[inner_end]) && inner_token[inner_end] != '\0')
            goto symbol;
    } else if (inner_token[inner_end] == '[') {
        inner_token_type = QUOTE;
        int layer        = 1;
        do {
            inner_end++;
            if (inner_token[inner_end] == '\0')
                error(
                    "Non-terminating quote : '%s'",
                    inner_token + inner_start
                );
            if (inner_token[inner_end] == '[')
                layer++;
            else if (inner_token[inner_end] == ']' && inner_token[inner_end - 1] != '\\')
                layer--;
        } while (inner_token[inner_end] != ']' || layer != 0);
        inner_end++;
    } else {
        inner_end++;
    symbol:
        while (!isspace(inner_token[inner_end]) && inner_token[inner_end] != '0'
        )
            inner_end++;
        inner_token_type = SYMBOL;
    }
    Value val;
    val.stringValue = inner_token;
    upsert(env->next, "token", val);
    val.intValue = inner_start;
    upsert(env->next, "start", val);
    val.intValue = inner_end;
    upsert(env->next, "end", val);
}

void COPY_TOKEN() {
    char * s, *inner_token;
    long   inner_start, inner_end;
    Entry* entry;

    entry = lookup(env, "token");
    if (entry == NULL) error("Undefined symbol: '%s'", "token");
    inner_token = entry->value.stringValue;
    entry       = lookup(env, "start");
    if (entry == NULL) error("Undefined symbol: '%s'", "start");
    inner_start = entry->value.intValue;
    entry       = lookup(env, "end");
    if (entry == NULL) error("Undefined symbol: '%s'", "end");
    inner_end = entry->value.intValue;

    s = malloc((inner_end - inner_start) + 1);
    strncpy(s, inner_token + inner_start, inner_end - inner_start);
    s[inner_end - inner_start] = '\0';

    Value val;
    val.stringValue = s;
    upsert(env->next, "_", val);
}
