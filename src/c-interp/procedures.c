#include "procedures.h"

#include <ctype.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "env.h"
#include "eval.h"
#include "scan-token.h"
#include "util.h"

extern char* token;
extern long  size;

extern long start;
extern long end;

extern Dictionary* env;

extern TokenType token_type;

long layer_offset = 0;

void PRINT() {
    char* s;
    scan_token_default();

    switch (token_type) {
        case INTEGER:
        case FLOAT:
            printlen(token + start, end - start);
            break;
        case CHAR:
            putchar(parse_char());
            break;
        case QUOTE:
            s = quotecpy();
        quote:
            process_str(s);
            for (int i = 0; s[i] != '\0'; i++) {
                if (s[i] == '%') {
                    i++;
                    switch (s[i]) {
                        case '%':
                            putchar('%');
                            break;
                        case 'c':
                        case 'e':
                        case 'f':
                        case 'g':
                        case 'i':
                        case 'p':
                        case 's':
                        case 'x': {
                            scan_token_default();
                            char* t = symbolcpy();
                            if (token_type != SYMBOL)
                                error("Not a symbol: '%s'", t);
                            Entry* entry = lookup_or_error(env, t);

                            if (s[i] == 'c')
                                printf("%c", entry->value.charValue);
                            else if (s[i] == 'e')
                                printf("%e", entry->value.floatValue);
                            else if (s[i] == 'f')
                                printf("%f", entry->value.floatValue);
                            else if (s[i] == 'g')
                                printf("%g", entry->value.floatValue);
                            else if (s[i] == 'i')
                                printf("%ld", entry->value.intValue);
                            else if (s[i] == 'p')
                                printf("%p", (void*) entry->value.intValue);
                            else if (s[i] == 's')
                                printf("%s", entry->value.stringValue);
                            else if (s[i] == 'x')
                                printf("%lx", entry->value.intValue);
                            break;
                        }
                        case 'r':
                            scan_token_default();
                            if (token_type == QUOTE)
                                printlen(token + start + 1, (end - start) - 2);
                            else
                                printlen(token + start, end - start);
                            break;
                        default:
                            error("Unknown format specifier '%%%c'", s[i]);
                    }
                } else
                    putchar(s[i]);
            }
            free(s);
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            s          = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            goto quote;
        }
    }
}

void FREE() {
    scan_token_default();
    char* s = symbolcpy();
    if (token_type != SYMBOL) error("Not a symbol: '%s'", s);
    free(lookup_or_error(env, s)->value.stringValue);
    free(s);
}

void DO() {
    char* s;
    scan_token_default();
    save_state();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case CHAR:
            break;
        case QUOTE:
            push_scope(quotecpy());
            break;
        case SYMBOL:
            push_scope(lookup_or_error(env, symbolcpy())->value.stringValue);
            break;
    }
    upsert(env, "decrement-layer?", (Value) 0l, NEITHER);
}

void DO_HERE() {
    layer_offset++;
    DO();
    upsert(env, "decrement-layer?", (Value) 1l, NEITHER);
}

void PROC() {
    char*  keys;
    Entry* entry;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case CHAR:
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

    scan_token_default();
    char* code_block;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            code_block = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case CHAR:
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
        "] iter [k] keys ["
        "scan-token 2 copy-token 2 parse _ item-in 1 k _"
        "] free keys "
    );
    concat(&full_code, code_block);
    upsert(get_env(0), "_", (Value) full_code, STRING);

    free(keys);
    free(code_block);
}

void ITEM_IN() {
    long layer = 0;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
            layer = atol(token + start);
            break;
        case CHAR:
        case FLOAT:
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
            break;
        case SYMBOL: {
            char* s = symbolcpy();
            layer   = lookup_or_error(env, s)->value.intValue;
            free(s);
            break;
        }
    }

    char* keys;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            keys = symbolcpy();
            error("Can only assign quotes or symbols to quotes: '%s'", keys);
            break;
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            keys       = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            break;
        }
    }

    Dictionary* env_target = get_env(layer);

    Value val;
    long  keys_len = strlen(keys);
    for (int i = 0; i < keys_len; i++) {
        if (isspace(keys[i])) continue;

        int l = 0;
        for (; !isspace(keys[i]) && keys[i] != '\0'; i++, l++);
        char* key = malloc(l + 1);
        strncpy(key, keys + i - l, l);
        key[l] = '\0';

        scan_token_default();
        PointerType type = NEITHER;
        switch (token_type) {
            case INTEGER:
            case FLOAT:
                if (token_type == INTEGER) {
                    val = (Value) atol(token + start);
                } else {
                    val = (Value) atof(token + start);
                }
                break;
            case CHAR:
                val = (Value) parse_char();
                break;
            case QUOTE:
                val = (Value) quotecpy();
                break;
            case SYMBOL: {
                Entry* entry;
                entry = lookup_or_error(env, symbolcpy());
                val   = (Value) entry->value.pointerValue;
                type  = entry->type;
                break;
            }
        }
        upsert(env_target, key, val, type);
    }

    free(keys);
}

void ITER() {
    char* symbol;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            symbol = symbolcpy();
            error("Cannot assign number: '%s'", symbol);
            break;
        case CHAR:
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
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case CHAR:
            break;
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            keys       = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            break;
        }
    }

    scan_token_default();
    char* s;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot evaluate a number.");
            break;
        case CHAR:
            break;
        case QUOTE:
            s = quotecpy();
            break;
        case SYMBOL: {
            s = lookup_or_error(env, symbolcpy())->value.stringValue;
            break;
        }
    }

    long ret = start;
    long len = strlen(keys);
    for (int i = 0; i < len; i++) {
        if (isspace(keys[i])) continue;

        int l = 0;
        for (; !isspace(keys[i]) && keys[i] != '\0'; i++, l++);
        char* key = malloc(l + 1);
        strncpy(key, keys + i - l, l);
        key[l] = '\0';

        save_state();
        push_scope(s);
        upsert(env, symbol, (Value) key, NEITHER);
        scan_token_default();
        while (token == s) {
            eval();
            scan_token_default();
        }
        end = ret;
    }

    free(symbol);
}

void IF() {
    bool cond = lookup_or_error(env, "_")->value.intValue;
    if (cond) {
        char* old = token;
        DO_HERE();
    } else {
        scan_token_default();
        DO_HERE();
    }
}

void ADD() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val = (Value) (val.intValue + atol(token + start));
            else
                val = (Value) (val.floatValue + atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '+' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) (val.intValue
                           + lookup_or_error(env, symbolcpy())->value.intValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void SUB() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val = (Value) (val.intValue - atol(token + start));
            else
                val = (Value) (val.floatValue - atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '-' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) (val.intValue
                           - lookup_or_error(env, symbolcpy())->value.intValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void MUL() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue * atol(token + start));
            } else {
                val = (Value) (val.floatValue * atof(token + start));
            }
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '*' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) (val.intValue
                           * lookup_or_error(env, symbolcpy())->value.intValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void DIV() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue / atol(token + start));
            } else
                val = (Value) (val.floatValue / atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '/' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) (val.intValue
                           / lookup_or_error(env, symbolcpy())->value.intValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void MODULO() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue % atol(token + start));
            } else
                val = (Value) fmod(val.floatValue, atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '%%' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) (val.intValue
                           % lookup_or_error(env, symbolcpy())->value.intValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void ADD_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val = (Value) (val.intValue + atol(token + start));
            else
                val = (Value) (val.floatValue + atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '+f' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val =
                (Value) (val.floatValue
                         + lookup_or_error(env, symbolcpy())->value.floatValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void SUB_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val = (Value) (val.intValue - atol(token + start));
            else
                val = (Value) (val.floatValue - atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '-f' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val =
                (Value) (val.floatValue
                         - lookup_or_error(env, symbolcpy())->value.floatValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void MUL_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue * atol(token + start));
            } else {
                val = (Value) (val.floatValue * atof(token + start));
            }
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '*f' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val =
                (Value) (val.floatValue
                         * lookup_or_error(env, symbolcpy())->value.floatValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void DIV_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue / atol(token + start));
            } else
                val = (Value) (val.floatValue / atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '/f' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val =
                (Value) (val.floatValue
                         / lookup_or_error(env, symbolcpy())->value.floatValue);
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void MODULO_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER) {
                val = (Value) (val.intValue % atol(token + start));
            } else
                val = (Value) fmod(val.floatValue, atof(token + start));
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '%%f' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val = (Value) fmod(
                val.floatValue,
                lookup_or_error(env, symbolcpy())->value.floatValue
            );
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void EQUAL() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue == atol(token + start);
            else
                val.intValue = val.floatValue == atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '==' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                == lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void NOT_EQUAL() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue != atol(token + start);
            else
                val.intValue = val.floatValue != atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '!=' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                != lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void GREATER() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue > atol(token + start);
            else
                val.intValue = val.floatValue > atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '>' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                > lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void SMALLER() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue < atol(token + start);
            else
                val.intValue = val.floatValue < atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '<' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                < lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void GREATER_EQUAL() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue >= atol(token + start);
            else
                val.intValue = val.floatValue >= atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '>=' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                >= lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void SMALLER_EQUAL() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue <= atol(token + start);
            else
                val.intValue = val.floatValue <= atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '<=' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                <= lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void OR() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue || atol(token + start);
            else
                val.intValue = val.floatValue || atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '||' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                || lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void AND() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            if (token_type == INTEGER)
                val.intValue = val.intValue && atol(token + start);
            else
                val.intValue = val.floatValue && atof(token + start);
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot '&&' string literals: '%s'", quotecpy());
            break;
        case SYMBOL:
            val.intValue = val.intValue
                && lookup_or_error(env, symbolcpy())->value.intValue;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void NOT() {
    long val = !lookup_or_error(env, "_")->value.intValue;
    upsert(get_env(0), "_", (Value) val, NEITHER);
}

void LABEL() {
    scan_token_default();
    char* name;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot create with number: '%s'", symbolcpy());
            break;
        case SYMBOL:
            name = lookup_or_error(env, symbolcpy())->value.stringValue;
            break;
        case CHAR:
            break;
        case QUOTE:
            name = quotecpy();
            break;
    }
    upsert(get_env(0 - layer_offset), name, (Value) end, NEITHER);
}

void GOTO() {
    scan_token_default();
    char* name;
    switch (token_type) {
        case INTEGER: {
            end = atol(token + start);
            break;
        }
        case FLOAT:
            error("Cannot goto with float: '%s'", symbolcpy());
            break;
        case CHAR:
            break;
        case QUOTE:
            error("Cannot goto using quote: '%s'", symbolcpy());
            break;
        case SYMBOL: {
            Entry* entry;
            for (; !(entry = lookup_here(env, symbolcpy())); pop_scope())
                if (lookup_or_error(env, "decrement-layer?")->value.intValue)
                    layer_offset--;
            recover_state();
            end = entry->value.intValue;
            break;
        }
    }
}

void DELETE() {
    scan_token_default();
    char* name;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Cannot delete a number: '%s'", symbolcpy());
            break;
        case CHAR:
            break;
        case QUOTE:
            name = quotecpy();
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            name       = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            break;
        }
    }
    delete (env, name);
    free(name);
}

void SCAN_TOKEN() {
    long layer = 0;
    scan_token_default();
    switch (token_type) {
        char* s;
        case INTEGER:
            layer = atol(token + start);
            break;
        case FLOAT:
        case CHAR:
            break;
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
            break;
        case SYMBOL: {
            s     = symbolcpy();
            layer = lookup_or_error(env, s)->value.intValue;
            break;
        }
    }

    Dictionary* env_target = get_env(layer - layer_offset);

    char* inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    long  inner_start = lookup_or_error(env_target, "start")->value.intValue;
    long  inner_end   = lookup_or_error(env_target, "end")->value.intValue;

    long      inner_size = strlen(inner_token);
    TokenType inner_token_type;

    scan_token(
        inner_token,
        &inner_start,
        &inner_end,
        inner_size,
        &inner_token_type
    );

    upsert(env_target, "token", (Value) inner_token, NEITHER);
    upsert(env_target, "start", (Value) inner_start, NEITHER);
    upsert(env_target, "end", (Value) inner_end, NEITHER);
    upsert(env_target, "token-type", (Value) inner_token_type, NEITHER);
}

void COPY_TOKEN() {
    char *    s, *inner_token;
    long      inner_start, inner_end;
    TokenType inner_token_type;

    long layer = 0;
    scan_token_default();
    switch (token_type) {
        char* s;
        case INTEGER:
            layer = atol(token + start);
            break;
        case FLOAT:
        case CHAR:
            break;
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
            break;
        case SYMBOL: {
            layer = lookup_or_error(env, symbolcpy())->value.intValue;
            break;
        }
    }

    Dictionary* env_target = get_env(layer - layer_offset);

    inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    inner_start = lookup_or_error(env_target, "start")->value.intValue;
    inner_end   = lookup_or_error(env_target, "end")->value.intValue;

    Value val;
    val.stringValue = malloc((inner_end - inner_start) + 1);
    strncpy(
        val.stringValue,
        inner_token + inner_start,
        inner_end - inner_start
    );
    val.stringValue[inner_end - inner_start] = '\0';
    upsert(env, "_", val, NEITHER);
}

void PARSE() {
    scan_token_default();
    char* symbol = symbolcpy();
    Value val;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            break;
        case QUOTE:
            error("Procedure 'parse' only accepts symbols: '%s'", symbol);
            break;
        case SYMBOL:
            val.stringValue = lookup_or_error(env, symbol)->value.stringValue;
            break;
    }
    free(symbol);

    TokenType type = type_of(val.stringValue);
    switch (type) {
        case INTEGER:
        case FLOAT:
            if (type == INTEGER)
                val = (Value) atol(val.stringValue);
            else
                val = (Value) atof(val.stringValue);
            break;
        case CHAR:
            break;
        case QUOTE: {
            int len = strlen(val.stringValue);
            for (int i = 0, j = 1; i < len - 2; i++, j++)
                val.stringValue[i] = val.stringValue[j];
            val.stringValue[len - 2] = '\0';
            break;
        }
        case SYMBOL: {
            Entry* entry = lookup_or_error(env, val.stringValue);
            upsert(env, "_", (Value) entry->value.procedureValue, entry->type);
            return;
        }
    }
    upsert(env, "_", val, NEITHER);
}

void MACRO() {
    char*  keys;
    Entry* entry;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            keys = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case CHAR:
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

    scan_token_default();
    char* code_block;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            code_block = symbolcpy();
            error("Cannot assign number: '%s'", keys);
            break;
        case CHAR:
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
        "] iter [k] keys ["
        "scan-token 2 copy-token 2 item-in 1 k _"
        "] free keys "
    );
    concat(&full_code, code_block);
    upsert(get_env(0), "_", (Value) full_code, STRING);

    free(keys);
    free(code_block);
}

void SYSCALL() {
    scan_token_default();
    Value x16;
    char* temp;
    switch (token_type) {
        case INTEGER:
            temp = symbolcpy();
            x16  = (Value) atol(temp);
            free(temp);
            break;
        case FLOAT:
            temp = symbolcpy();
            x16  = (Value) atof(temp);
            free(temp);
            break;
        case CHAR:
            break;
        case QUOTE:
            x16 = (Value) quotecpy();
            break;
        case SYMBOL: {
            temp = symbolcpy();
            x16  = lookup_or_error(env, temp)->value;
            free(temp);
            break;
        }
    }

    scan_token_default();
    char* args;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
            error("Invalid arguments for syscall.");
            break;
        case CHAR:
            break;
        case QUOTE:
            args = quotecpy();
            break;
        case SYMBOL: {
            temp = symbolcpy();
            args = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            break;
        }
    }

    save_state();
    push_scope(args);
    upsert(env, "decrement-layer?", (Value) 0l, NEITHER);

    Value x[8] = {0};
    for (int i = 0; end < size; i++) {
        scan_token_default();
        if (i > 5)
            error("The maximum number of arguments (8) has been exceeded.");
        switch (token_type) {
            case INTEGER:
                temp = symbolcpy();
                x[i] = (Value) atol(temp);
                free(temp);
                break;
            case FLOAT:
                temp = symbolcpy();
                x[i] = (Value) atof(temp);
                free(temp);
                break;
            case CHAR:
                break;
            case QUOTE:
                x[i] = (Value) quotecpy();
                break;
            case SYMBOL: {
                temp = symbolcpy();
                x[i] = lookup_or_error(env, temp)->value;
                free(temp);
                break;
            }
        }
    }

    long ret = syscall(
        x16.intValue,
        x[0].intValue,
        x[1].intValue,
        x[2].intValue,
        x[3].intValue,
        x[4].intValue,
        x[5].intValue
    );
    upsert(env, "_", (Value) ret, NEITHER);
}
