#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "eval.h"
#include "parse.h"
#include "util.h"

extern char* token;
extern long  size;

extern long start;
extern long end;

extern Dictionary* env;

extern TokenType token_type;

void PRINT() {
    char* s;
    parse(token, &start, &end, size, &token_type);

    switch (token_type) {
        case INTEGER:
        case FLOAT:
            s = symbolcpy();
            printf("%s", s);
            break;
        case QUOTE:
            s = quotecpy();
        quote:
            process_str(s);
            for (int i = 0; s[i] != '\0'; i++) {
                if (s[i] == '%') {
                    i++;
                    parse(token, &start, &end, size, &token_type);
                    switch (s[i]) {
                        case '%':
                            printf("%%");
                            break;
                        case 'i':
                        case 'f':
                        case 's': {
                            char* t;
                            t = symbolcpy();
                            if (token_type != SYMBOL)
                                error("Not a symbol: '%s'", t);
                            Entry* entry = lookup_or_error(env, t);

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
                                printlen(token + start + 1, (end - start) - 2);
                            else
                                printlen(token + start, end - start);
                            putchar(s[i]);
                    }
                } else
                    putchar(s[i]);
            }
            break;
        case SYMBOL:
            s = symbolcpy();
            s = lookup_or_error(env, s)->value.stringValue;
            goto quote;
            break;
    }
}

void FREE() {
    parse(token, &start, &end, size, &token_type);
    char* s;
    s = symbolcpy();
    if (token_type != SYMBOL) error("Not a symbol: '%s'", s);
    free(lookup_or_error(env, s)->value.stringValue);
}

void DO() {
    char* s;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case QUOTE:
            s = quotecpy();
            push_scope(s);
            break;
        case SYMBOL: {
            s = symbolcpy();
            push_scope(lookup_or_error(env, s)->value.stringValue);
            break;
        }
    }
}

void PROC() {
    char*  keys;
    Entry* entry;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            keys = symbolcpy();
            strcpy(keys, lookup_or_error(env, keys)->value.stringValue);
            break;
        }
    }

    parse(token, &start, &end, size, &token_type);
    char* code_block;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            code_block = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            code_block = quotecpy();
            break;
        case SYMBOL: {
            code_block = symbolcpy();
            strcpy(
                code_block,
                lookup_or_error(env, code_block)->value.stringValue
            );
            break;
        }
    }

    char* full_code = malloc(1);
    full_code[0]    = '\0';
    concat(&full_code, "item-in 0 [keys] [");
    concat(&full_code, keys);
    concat(
        &full_code,
        "] iter [k] keys [parse 2 copy-token 2 item-in 1 k _] free keys "
    );
    concat(&full_code, code_block);
    Value val;
    val.stringValue = full_code;
    upsert(env, "_", val, false);

    free(keys);
    free(code_block);
}

void ITEM_IN() {
    Entry* entry;

    long in = 0;
    parse(token, &start, &end, size, &token_type);
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
            s  = symbolcpy();
            in = lookup_or_error(env, s)->value.intValue;
            break;
        }
    }

    char* keys;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            keys = symbolcpy();
            strcpy(keys, lookup_or_error(env, keys)->value.stringValue);
            break;
        }
    }

    Dictionary* env_target = get_env(in);

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

        parse(token, &start, &end, size, &token_type);
        bool is_procedure = false;
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
                val.stringValue = quotecpy();
                break;
            case SYMBOL: {
                char* s          = symbolcpy();
                entry            = lookup_or_error(env, s);
                val.pointerValue = entry->value.pointerValue;
                is_procedure     = entry->is_procedure;
                break;
            }
        }
        upsert(env_target, key, val, is_procedure);
    }

    free(keys);
}

void ITER() {
    char*  symbol;
    Entry* entry;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbol = symbolcpy();
            error("Cannot assign number: '%s'", symbol);
            break;
        case QUOTE:
            symbol = quotecpy();
            break;
        case SYMBOL: {
            symbol = symbolcpy();
            strcpy(symbol, lookup_or_error(env, symbol)->value.stringValue);
            break;
        }
    }

    char* keys;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            keys = symbolcpy();
            strcpy(keys, lookup_or_error(env, keys)->value.stringValue);
            break;
        }
    }

    parse(token, &start, &end, size, &token_type);
    char* s;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case QUOTE:
            s = quotecpy();
            break;
        case SYMBOL: {
            s = symbolcpy();
            s = lookup_or_error(env, s)->value.stringValue;
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
        upsert(env, symbol, val, false);

        parse(token, &start, &end, size, &token_type);
        while (token == s) {
            eval();
            parse(token, &start, &end, size, &token_type);
        }
        end = ret;
    }

    free(symbol);
}

void PARSE() {
    long layer = 0;
    parse(token, &start, &end, size, &token_type);
    switch (token_type) {
        char* s;
        case INTEGER:
            layer = atol(token + start);
            break;
        case FLOAT:
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
            break;
        case SYMBOL: {
            s     = symbolcpy();
            layer = lookup_or_error(env, s)->value.intValue;
            break;
        }
    }

    Dictionary* env_target = get_env(layer);

    char* inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    long  inner_start = lookup_or_error(env_target, "start")->value.intValue;
    long  inner_end   = lookup_or_error(env_target, "end")->value.intValue;

    long      inner_size = strlen(inner_token);
    TokenType inner_token_type;

    parse(inner_token, &inner_start, &inner_end, inner_size, &inner_token_type);

    Value val;
    val.stringValue = inner_token;
    upsert(env_target, "token", val, false);
    val.intValue = inner_start;
    upsert(env_target, "start", val, false);
    val.intValue = inner_end;
    upsert(env_target, "end", val, false);
    val.intValue = inner_token_type;
    upsert(env_target, "token-type", val, false);
}

void COPY_TOKEN() {
    char *    s, *inner_token;
    long      inner_start, inner_end;
    Entry*    entry;
    TokenType inner_token_type;

    long in = 0;
    parse(token, &start, &end, size, &token_type);
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
            s     = symbolcpy();
            entry = lookup(env, s);
            if (entry == NULL) error("Undefined symbol: '%s'", s);
            in = lookup_or_error(env, s)->value.intValue;
            break;
        }
    }

    Dictionary* env_target = get_env(in);

    inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    inner_start = lookup_or_error(env_target, "start")->value.intValue;
    inner_end   = lookup_or_error(env_target, "end")->value.intValue;
    inner_token_type =
        lookup_or_error(env_target, "token-type")->value.intValue;

    Value val;
    switch (inner_token_type) {
        case INTEGER:
        case FLOAT:
            if (inner_token_type == INTEGER)
                val.intValue = atol(inner_token + inner_start);
            else
                val.floatValue = atof(inner_token + inner_start);
            break;
        case QUOTE:
            val.stringValue = malloc((inner_end - inner_start - 2) + 1);
            strncpy(
                val.stringValue,
                inner_token + inner_start + 1,
                inner_end - inner_start - 2
            );
            val.stringValue[inner_end - inner_start - 2] = '\0';
            break;
        case SYMBOL: {
            char* s;
            s = malloc((inner_end - inner_start) + 1);
            strncpy(s, inner_token + inner_start, inner_end - inner_start);
            s[inner_end - inner_start] = '\0';

            val.pointerValue = lookup_or_error(env, s)->value.procedureValue;
            upsert(env, "_", val, entry->is_procedure);
            return;
        }
    }
    upsert(env, "_", val, false);
}
