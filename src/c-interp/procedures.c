#include "procedures.h"

#include <ctype.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
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
            putchar(parse_char(token + start));
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
                                printf("%ld", entry->value.longValue);
                            else if (s[i] == 'p')
                                printf("%p", (void*) entry->value.longValue);
                            else if (s[i] == 's')
                                printf("%s", entry->value.stringValue);
                            else if (s[i] == 'x')
                                printf("%lx", entry->value.longValue);
                            break;
                        }
                        case 'r':
                            scan_token_default();
                            printlen(token + start, end - start);
                            break;
                        case 'q':
                            scan_token_default();
                            printlen(token + start + 1, (end - start) - 2);
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
        case CHAR:
            error("Can only evaluate quote or symbol to quote.");
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
        case CHAR:
            keys = symbolcpy();
            error("Can only assign quote or symbol to quotes.");
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
        case CHAR:
            code_block = symbolcpy();
            error("Invalid procedure body: '%s'", code_block);
        case QUOTE:
            code_block = quotecpy();
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            code_block = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
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
        case SYMBOL: {
            char* s = symbolcpy();
            layer   = lookup_or_error(env, s)->value.longValue;
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
            error(
                "Can only assign quotes or symbols to quotes: '%s'",
                symbolcpy()
            );
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
                val.longValue = (long) parse_char(token + start);
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
        case CHAR:
            error(
                "Can only assign quote or symbol to quote: '%s'",
                symbolcpy()
            );
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
        case CHAR:
            error(
                "Can only iterate over quote or symbol to quote: '%s'",
                symbolcpy()
            );
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
        case CHAR:
            error("Can only evaluate quote or symbol to quote.");
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
    bool cond = lookup_or_error(env, "_")->value.longValue;
    if (cond) {
        char* old = token;
        DO_HERE();
    } else {
        scan_token_default();
        DO_HERE();
    }
}

#define ARITHMETIC(op) \
    Value val = lookup_or_error(env, "_")->value; \
    scan_token_default(); \
    switch (token_type) { \
        case INTEGER: \
            val = (Value) (val.longValue op atol(token + start)); \
            break; \
        case FLOAT: \
            val = (Value) (val.floatValue op atof(token + start)); \
            break; \
        case CHAR: \
            val = (Value) ((long) val.charValue op parse_char(token + start)); \
            break; \
        case QUOTE: \
            error("Invalid operand: '%s'", symbolcpy()); \
        case SYMBOL: { \
            char* temp = symbolcpy(); \
            val        = (Value) (val.longValue op lookup_or_error(env, temp) \
                               ->value.longValue); \
            free(temp); \
        } \
    } \
    upsert(get_env(0), "_", val, NEITHER);

void ADD() {
    ARITHMETIC(+)
}

void SUB() {
    ARITHMETIC(-)
}

void MUL() {
    ARITHMETIC(*)
}

void DIV() {
    ARITHMETIC(/)
}

#undef ARITHMETIC

void MODULO() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
            val = (Value) (val.longValue % atol(token + start));
            break;
        case FLOAT:
            val = (Value) fmod(val.floatValue, atof(token + start));
            break;
        case CHAR:
            val = (Value) ((long) val.charValue % parse_char(token + start));
            break;
        case QUOTE:
            error("Invalid operand: '%s'", symbolcpy());
        case SYMBOL: {
            char* temp = symbolcpy();
            val        = (Value) (val.longValue
                           % lookup_or_error(env, temp)->value.longValue);
            free(temp);
        }
    }
    upsert(get_env(0), "_", val, NEITHER);
}

#define ARITHMETIC(op) \
    Value val = lookup_or_error(env, "_")->value; \
    scan_token_default(); \
    switch (token_type) { \
        case INTEGER: \
            val = (Value) (val.longValue op atol(token + start)); \
            break; \
        case FLOAT: \
            val = (Value) (val.floatValue op atof(token + start)); \
            break; \
        case CHAR: \
            val = (Value) ((long) val.charValue op parse_char(token + start)); \
            break; \
        case QUOTE: \
            error("Invalid operand: '%s'", symbolcpy()); \
        case SYMBOL: { \
            char* temp = symbolcpy(); \
            val        = (Value) (val.floatValue op lookup_or_error(env, temp) \
                               ->value.floatValue); \
            free(temp); \
        } \
    } \
\
    upsert(get_env(0), "_", val, NEITHER);

void ADD_FLOAT() {
    ARITHMETIC(+)
}

void SUB_FLOAT() {
    ARITHMETIC(-)
}

void MUL_FLOAT() {
    ARITHMETIC(*)
}

void DIV_FLOAT() {
    ARITHMETIC(/)
}

#undef ARITHMETIC

void MODULO_FLOAT() {
    Value val = lookup_or_error(env, "_")->value;
    scan_token_default();
    switch (token_type) {
        case INTEGER:
            val = (Value) (val.longValue % atol(token + start));
            break;
        case FLOAT:
            val = (Value) fmod(val.floatValue, atof(token + start));
            break;
        case CHAR:
            val = (Value) ((long) val.charValue % parse_char(token + start));
            break;
        case QUOTE:
            error("Invalid operand: '%s'", symbolcpy());
        case SYMBOL: {
            char* temp = symbolcpy();
            val        = (Value) fmod(
                val.floatValue,
                lookup_or_error(env, temp)->value.floatValue

            );
            free(temp);
        }
    }
    upsert(get_env(0), "_", val, NEITHER);
}

#define BOOLEAN(op) \
    Value val = lookup_or_error(env, "_")->value; \
    scan_token_default(); \
    switch (token_type) { \
        case INTEGER: \
            val.longValue = val.longValue op atol(token + start); \
            break; \
        case FLOAT: \
            val.longValue = val.floatValue op atof(token + start); \
            break; \
        case CHAR: \
            val.longValue = val.charValue op parse_char(token + start); \
            break; \
        case QUOTE: \
            error("Invalid operand: '%s'", symbolcpy()); \
        case SYMBOL: \
            val.longValue = val.longValue op lookup_or_error(env, symbolcpy()) \
                                ->value.longValue; \
    } \
    upsert(get_env(0), "_", val, NEITHER);

void EQUAL() {
    BOOLEAN(==)
}

void NOT_EQUAL() {
    BOOLEAN(!=)
}

void GREATER() {
    BOOLEAN(>)
}

void SMALLER() {
    BOOLEAN(<)
}

void GREATER_EQUAL() {
    BOOLEAN(>=)
}

void SMALLER_EQUAL() {
    BOOLEAN(<=)
}

void OR() {
    BOOLEAN(||)
}

void AND() {
    BOOLEAN(&&)
}

void NOT() {
    long val = !lookup_or_error(env, "_")->value.longValue;
    upsert(get_env(0), "_", (Value) val, NEITHER);
}

void LABEL() {
    scan_token_default();
    char* name;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            error(
                "Can only assign to quote or symbol to quote: '%s'",
                symbolcpy()
            );
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
        case CHAR:
        case QUOTE:
            error(
                "Can only goto with integer or symbol to integer: '%s'",
                symbolcpy()
            );
        case SYMBOL: {
            Entry* entry;
            char*  label = symbolcpy();
            for (; !(entry = lookup_here(env, label)); pop_scope())
                if (lookup_or_error(env, "decrement-layer?")->value.longValue)
                    layer_offset--;
            free(label);
            recover_state();
            end = entry->value.longValue;
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
        case CHAR:
            error(
                "Can only delete variable using quote or symbol to quote: '%s'",
                symbolcpy()
            );
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
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
        case SYMBOL: {
            s     = symbolcpy();
            layer = lookup_or_error(env, s)->value.longValue;
            break;
        }
    }

    Dictionary* env_target = get_env(layer - layer_offset);

    char* inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    long  inner_start = lookup_or_error(env_target, "start")->value.longValue;
    long  inner_end   = lookup_or_error(env_target, "end")->value.longValue;

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
        case QUOTE:
            error("Can only accept integers or symbols to integers.");
        case SYMBOL: {
            layer = lookup_or_error(env, symbolcpy())->value.longValue;
            break;
        }
    }

    Dictionary* env_target = get_env(layer - layer_offset);

    inner_token = lookup_or_error(env_target, "token")->value.stringValue;
    inner_start = lookup_or_error(env_target, "start")->value.longValue;
    inner_end   = lookup_or_error(env_target, "end")->value.longValue;

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
        case QUOTE:
            error("Can only accept symbols to string: '%s'", symbol);
        case SYMBOL:
            val.stringValue = lookup_or_error(env, symbol)->value.stringValue;
            break;
    }
    free(symbol);

    TokenType type = type_of(val.stringValue);
    switch (type) {
        case INTEGER:
            val = (Value) atol(val.stringValue);
            break;
        case FLOAT:
            val = (Value) atof(val.stringValue);
            break;
        case CHAR:
            val = (Value) parse_char(val.stringValue);
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
        case CHAR:
            keys = symbolcpy();
            error("Can only assign quote or symbol to quote: '%s'", keys);
        case QUOTE:
            keys = quotecpy();
            break;
        case SYMBOL: {
            keys         = symbolcpy();
            Entry* entry = lookup_or_error(env, keys);
            free(keys);
            keys = entry->value.stringValue;
            break;
        }
    }

    scan_token_default();
    char* code_block;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            code_block = symbolcpy();
            error("Invalid macro body: '%s'", code_block);
        case QUOTE:
            code_block = quotecpy();
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            code_block = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
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
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Can only accept integer or symbol to integer: '%s'",
                symbolcpy()
            );
        case SYMBOL: {
            temp = symbolcpy();
            x16  = lookup_or_error(env, temp)->value;
            break;
        }
    }
    free(temp);

    scan_token_default();
    char* args;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            error("Invalid arguments for syscall.");
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
                temp = symbolcpy();
                x[i] = (Value) parse_char(temp);
                free(temp);
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
        x16.longValue,
        x[0].longValue,
        x[1].longValue,
        x[2].longValue,
        x[3].longValue,
        x[4].longValue,
        x[5].longValue
    );
    upsert(env->next, "_", (Value) ret, NEITHER);
}

void GET() {
    scan_token_default();
    char* temp;
    char  bytes;
    switch (token_type) {
        case INTEGER:
            temp  = symbolcpy();
            bytes = atol(temp);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Can only accept integer or symbol to integer: '%s'",
                symbolcpy()
            );
        case SYMBOL:
            temp  = symbolcpy();
            bytes = lookup_or_error(env, temp)->value.longValue;
            break;
    }
    free(temp);

    if (bytes - 1 && bytes - 2 && bytes - 4 && bytes - 8)
        error("Invalid byte count, has to be a power of 2, max 8: '%i'", bytes);

    scan_token_default();
    Value val;
    switch (token_type) {
        void* ptr;
        case INTEGER:
            temp = symbolcpy();
            ptr  = (void*) atol(temp);
        int_label:
            switch (bytes) {
                case 1:
                    val.longValue = *((char*) ptr);
                    break;
                case 2:
                    val.longValue = *((short*) ptr);
                    break;
                case 4:
                    val.longValue = *((int*) ptr);
                    break;
                case 8:
                    val.longValue = *((long*) ptr);
                    break;
            }
            free(temp);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error("Can only get from a pointer: '%s'", symbolcpy());
        case SYMBOL:
            temp = symbolcpy();
            ptr  = (void*) lookup_or_error(env, temp)->value.longValue;
            goto int_label;
    }
    upsert(get_env(0), "_", val, NEITHER);
}

void SET() {
    scan_token_default();
    char* temp;
    char  bytes;
    switch (token_type) {
        case INTEGER:
            temp  = symbolcpy();
            bytes = atol(temp);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Can only accept integer or symbol to integer: '%s'",
                symbolcpy()
            );
        case SYMBOL:
            temp  = symbolcpy();
            bytes = lookup_or_error(env, temp)->value.longValue;
            break;
    }
    free(temp);

    if (bytes - 1 && bytes - 2 && bytes - 4 && bytes - 8)
        error("Invalid byte count, has to be a power of 2, max 8: '%i'", bytes);

    scan_token_default();
    void* ptr;
    switch (token_type) {
        case INTEGER:
            temp = symbolcpy();
            ptr  = (void*) atol(temp);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error("Can only set a pointer: '%s'", symbolcpy());
        case SYMBOL:
            temp = symbolcpy();
            ptr  = (void*) lookup_or_error(env, temp)->value.longValue;
    }
    free(temp);

    scan_token_default();
    switch (token_type) {
        long n;
        case INTEGER: {
            n = atol(token + start);
        int_label:
            switch (bytes) {
                case 1:
                    *((char*) ptr) = n;
                    break;
                case 2:
                    *((short*) ptr) = n;
                    break;
                case 4:
                    *((int*) ptr) = n;
                    break;
                case 8:
                    *((long*) ptr) = n;
                    break;
            }
            break;
        }
        case FLOAT:
            switch (bytes) {
                double n = atof(token + start);
                case 4:
                    *((float*) ptr) = n;
                    break;
                case 8:
                    *((double*) ptr) = n;
                    break;
                default:
                    error(
                        "Can only set 4 and 8 bytes for a float: '%i\n",
                        bytes
                    );
            }
            break;
        case CHAR: {
            char c = parse_char(token + start);
            switch (bytes) {
                case 1:
                    *((char*) ptr) = c;
                    break;
                case 2:
                    *((short*) ptr) = c;
                    break;
                case 4:
                    *((int*) ptr) = c;
                    break;
                case 8:
                    *((long*) ptr) = c;
                    break;
            }
            break;
        }
        case QUOTE:
            error("Can only set a pointer with a scalar: '%s'", symbolcpy());
        case SYMBOL:
            temp = symbolcpy();
            n    = lookup_or_error(env, temp)->value.longValue;
            free(temp);
            goto int_label;
    }
}
