#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "eval.h"
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

char* concat(char* dest, char* src) {
    int dest_len = strlen(dest);
    int src_len  = strlen(src);
    char* new    = malloc(dest_len + src_len + 1);

    int i = 0;
    for (; i < dest_len; i++) new[i] = dest[i];
    for (int j = 0; i < dest_len + src_len; i++, j++) new[i] = src[j];
    new[dest_len + src_len] = '\0';

    return new;
}

void PROC() {
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

    parse();
    char* code5;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbolcpy(&code5);
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            quotecpy(&code5);
            break;
        case SYMBOL: {
            symbolcpy(&code5);
            entry = lookup(env, code5);
            if (entry == NULL) error("Undefined symbol: '%s'", code5);
            strcpy(code5, entry->value.stringValue);
            break;
        }
    }

    char* code1 = "item [keys] [";
    char* code2 = concat(code1, keys);
    char* code3 =
        "] iter [k] keys [parse 2 copy-token 2 item-in 1 k _] free keys ";
    char* code4 = concat(code2, code3);
    Value val;
    val.stringValue = concat(code4, code5);
    upsert(env, "_", val);
    printf("%s\n", val.stringValue);

    free(keys);
    free(code2);
    free(code4);
}

void ITEM_IN() {
    Entry* entry;

    long in = 0;
    parse();
    switch (token_type) {
        char* s;
        case INTEGER:
            in = atol(token + start);
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

void ITER() {
    char*  symbol;
    Entry* entry;
    parse();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbolcpy(&symbol);
            error("Cannot assign number: '%s'", symbol);
            break;
        case QUOTE:
            quotecpy(&symbol);
            break;
        case SYMBOL: {
            symbolcpy(&symbol);
            entry = lookup(env, symbol);
            if (entry == NULL) error("Undefined symbol: '%s'", symbol);
            strcpy(symbol, entry->value.stringValue);
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

    parse();
    char* s;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case QUOTE:
            quotecpy(&s);
            break;
        case SYMBOL: {
            symbolcpy(&s);
            Entry* entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol: '%s'", s);
            s = entry->value.stringValue;
            break;
        }
    }
    long ret = start;

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

        push_scope(s);

        val.stringValue = key;
        upsert(env, symbol, val);

        parse();
        while (token == s) {
            eval();
            parse();
        }
        end = ret;
    }

    free(symbol);
}

void PARSE() {
    char *    s, *inner_token;
    long      inner_size, inner_start, inner_end;
    Entry*    entry;
    TokenType inner_token_type;

    long in = 0;
    parse();
    switch (token_type) {
        char* s;
        case INTEGER:
            in = atol(token + start);
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

    Dictionary* env_target = env;
    for (int i = in; i != 0; i--) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", in);
    }

    entry = lookup(env_target, "token");
    if (entry == NULL) error("Undefined symbol: '%s'", "token");
    inner_token = entry->value.stringValue;
    entry       = lookup(env_target, "start");
    if (entry == NULL) error("Undefined symbol: '%s'", "start");
    inner_start = entry->value.intValue;
    entry       = lookup(env_target, "end");
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
    upsert(env_target, "token", val);
    val.intValue = inner_start;
    upsert(env_target, "start", val);
    val.intValue = inner_end;
    upsert(env_target, "end", val);
}

void COPY_TOKEN() {
    char * s, *inner_token;
    long   inner_start, inner_end;
    Entry* entry;

    long in = 0;
    parse();
    switch (token_type) {
        char* s;
        case INTEGER:
            in = atol(token + start);
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

    Dictionary* env_target = env;
    for (int i = in; i != 0; i--) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", in);
    }

    entry = lookup(env_target, "token");
    if (entry == NULL) error("Undefined symbol: '%s'", "token");
    inner_token = entry->value.stringValue;
    entry       = lookup(env_target, "start");
    if (entry == NULL) error("Undefined symbol: '%s'", "start");
    inner_start = entry->value.intValue;
    entry       = lookup(env_target, "end");
    if (entry == NULL) error("Undefined symbol: '%s'", "end");
    inner_end = entry->value.intValue;

    s = malloc((inner_end - inner_start) + 1);
    strncpy(s, inner_token + inner_start, inner_end - inner_start);
    s[inner_end - inner_start] = '\0';

    Value val;
    val.stringValue = s;
    upsert(env, "_", val);
}
