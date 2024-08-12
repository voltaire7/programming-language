#include "procedures.h"

#include <ctype.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ttycom.h>

#include "env.h"
#include "eval.h"
#include "scan-token.h"
#include "util.h"

extern char* token;
extern long  size;

extern long start;
extern long end;

extern Dictionary* env;

extern int   stack_arr[];
extern void* stack;

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
            s       = quotecpy();
            bool fr = 1;
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
                                printf("%e", entry->value.doubleValue);
                            else if (s[i] == 'f')
                                printf("%f", entry->value.doubleValue);
                            else if (s[i] == 'g')
                                printf("%g", entry->value.doubleValue);
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
            if (fr) free(s);
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
        case SYMBOL: {
            char* temp = symbolcpy();
            push_scope(lookup_or_error(env, temp)->value.stringValue);
            free(temp);
            break;
        }
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
            char*  temp  = symbolcpy();
            Entry* entry = lookup_or_error(env, temp);
            strcpy(keys, entry->value.stringValue);
            free(temp);
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
            char* temp  = symbolcpy();
            char* temp2 = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
            keys = malloc(sizeof(temp2));
            strcpy(keys, temp2);
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
                char*  temp = symbolcpy();
                Entry* entry;
                entry = lookup_or_error(env, temp);
                free(temp);
                val  = (Value) entry->value.pointerValue;
                type = entry->type;
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
            char* temp = symbolcpy();
            s          = lookup_or_error(env, temp)->value.stringValue;
            free(temp);
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
        upsert(env, "decrement-layer?", (Value) 0, NEITHER);
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
            val = (Value) (val.doubleValue op atof(token + start)); \
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
            val = (Value) fmod(val.doubleValue, atof(token + start));
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
            val = (Value) (val.doubleValue op atof(token + start)); \
            break; \
        case CHAR: \
            val = (Value) ((long) val.charValue op parse_char(token + start)); \
            break; \
        case QUOTE: \
            error("Invalid operand: '%s'", symbolcpy()); \
        case SYMBOL: { \
            char* temp = symbolcpy(); \
            val        = (Value) (val.doubleValue op lookup_or_error(env, temp) \
                               ->value.doubleValue); \
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
            val = (Value) fmod(val.doubleValue, atof(token + start));
            break;
        case CHAR:
            val = (Value) ((long) val.charValue % parse_char(token + start));
            break;
        case QUOTE:
            error("Invalid operand: '%s'", symbolcpy());
        case SYMBOL: {
            char* temp = symbolcpy();
            val        = (Value) fmod(
                val.doubleValue,
                lookup_or_error(env, temp)->value.doubleValue

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
            val.longValue = val.doubleValue op atof(token + start); \
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

#undef BOOLEAN

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
    upsert(get_env(0), name, (Value) end, NEITHER);
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
            free(s);
            break;
        }
    }

    Dictionary* env_target = env;
    for (int i = layer; i; i--) {
        if (!env_target->next) error("The scope does not exist: %i\n", layer);
        env_target = env_target->next;
    }

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

    Dictionary* env_target = env;
    for (int i = layer; i; i--) {
        if (!env_target->next) error("The scope does not exist: %i\n", layer);
        env_target = env_target->next;
    }

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
            Entry* entry =
                lookup_or_error(env->next ? env->next : env, val.stringValue);
            upsert(env, "_", (Value) entry->value.procedureValue, entry->type);
            return;
        }
    }
    free(symbol);
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

#define BIT_OPERATORS(op) \
    Value val = lookup_or_error(env, "_")->value; \
    scan_token_default(); \
    switch (token_type) { \
        case INTEGER: \
            val.longValue = (val.longValue op atol(token + start)); \
            break; \
        case FLOAT: \
            val.longValue = \
                (val.longValue op((Value) atof(token + start)).longValue); \
            break; \
        case CHAR: \
            val.longValue = val.charValue op parse_char(token + start); \
            break; \
        case QUOTE: \
            error("Invalid operand: '%s'", symbolcpy()); \
        case SYMBOL: { \
            char* temp = symbolcpy(); \
            val.longValue = \
                (val.longValue op lookup_or_error(env, temp)->value.longValue \
                ); \
            free(temp); \
        } \
    } \
    upsert(get_env(0), "_", val, NEITHER);

void BIT_AND() {
    BIT_OPERATORS(&)
}

void BIT_OR() {
    BIT_OPERATORS(|)
}

void BIT_XOR() {
    BIT_OPERATORS(^)
}

void BIT_NOT() {
    long val = ~lookup_or_error(env, "_")->value.longValue;
    upsert(get_env(0), "_", (Value) val, NEITHER);
}

void BIT_SHIFTL() {
    BIT_OPERATORS(<<)
}

void BIT_SHIFTR() {
    BIT_OPERATORS(>>)
}

void EXEC() {
    scan_token_default();
    char base;
    switch (token_type) {
        case INTEGER:
            base = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Can only accept integers or symbols to intergers: '%s'",
                symbolcpy()
            );
        case SYMBOL: {
            char* temp = symbolcpy();
            base       = lookup_or_error(env, temp)->value.charValue;
            free(temp);
            break;
        }
    }

    if (base != 2 && base != 16) error("Unsupported base: '%i'", base);

    scan_token_default();
    Value val;
    int   size;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
            error(
                "Can only accept quotes or symbols to quotes: '%s'",
                symbolcpy()
            );
        case QUOTE:
            val.stringValue = quotecpy();
            from_str(val.stringValue, &size, base, 'E');
            break;
        case SYMBOL: {
            char* temp = symbolcpy();
            val.stringValue =
                strdup(lookup_or_error(env, temp)->value.stringValue);
            free(temp);
            from_str(val.stringValue, &size, base, 'E');
            break;
        }
    }

    execute(val.pointerValue, size);
}

void DEBUG_PROC() {
    scan_token_default();
    int* proc;
    switch (token_type) {
        case INTEGER:
        case FLOAT:
        case CHAR:
        case QUOTE:
            error("Can only debug a symbol to a procedure: '%s'", symbolcpy());
        case SYMBOL: {
            char* temp = symbolcpy();
            proc       = lookup_or_error(env, temp)->value.pointerValue;
            break;
        }
    }

    do {
        printf("%lx: %x\n", (long) proc, *proc);
    } while (*proc++ != 0xd65f03c0);
}

void REDUCE() {}
#define PUSH_T(type, val) \
    *((type*) stack) = val; \
    stack += sizeof(type)

void PUSH() {
    scan_token_default();
    int argc;
    switch (token_type) {
        case INTEGER:
            argc = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error("Invalid argument count: '%s'", symbolcpy());
        case SYMBOL: {
            char* temp = symbolcpy();
            argc       = lookup_or_error(env, temp)->value.longValue;
            free(temp);
            break;
        }
    }
    int movz = 0b11010010100000000000000000000000;
    int movk = 0b11110010100000000000000000000000;

    PUSH_T(int, movz + (argc << 5));
    PUSH_T(
        int,
        movz + (((long) push_count >> 0 & 0xFFFF) << 5) + 1 + (0 << 21)
    );
    PUSH_T(
        int,
        movk + (((long) push_count >> 16 & 0xFFFF) << 5) + 1 + (1 << 21)
    );
    PUSH_T(
        int,
        movk + (((long) push_count >> 32 & 0xFFFF) << 5) + 1 + (2 << 21)
    );

    PUSH_T(int, 0xd10043ff); // sub sp, sp, 16
    PUSH_T(int, 0xa9007bfd); // stp x29, x30, [sp]
    PUSH_T(int, 0xd63f0020); // blr x1
    PUSH_T(int, 0xa9407bfd); // ldp x29, x30, [sp]
    PUSH_T(int, 0x910043ff); // add sp, sp, 16
}

void POP() {}

void PROC2() {
    void* old = stack;
    scan_token_default();
    scan_token_default();
    char* code      = quotecpy();
    char* old_token = token;

    save_state();
    push_scope(code);
    upsert(env, "decrement-layer?", (Value) 0, NEITHER);

    scan_token_default();
    while (token != old_token) {
        eval();
        scan_token_default();
    }
    free(code);

    int  size = stack - old + sizeof(int);
    int* ptr = mmap(NULL, size, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (ptr == MAP_FAILED) perror("mmap");

    memcpy(ptr, old, size);
    ptr[(size - 1) / sizeof(int)] = 0xd65f03c0;

    if (mprotect(ptr, size, PROT_EXEC) == -1) perror("mprotect");

    stack = old;
    upsert(env, "_", (Value) (void*) ptr, PROCEDURE);
    eval();
}

void MOVZ() {
    scan_token_default();
    int reg;
    switch (token_type) {
        case INTEGER:
            reg = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Invalid register value, only integer or symbol to integer: "
                "'%s'",
                symbolcpy()
            );
        case SYMBOL: {
            char* temp = symbolcpy();
            reg        = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (reg > 31 || reg < 0)
        error("Invalid register value, has to be between 0 and 31: '%i'", reg);

    scan_token_default();
    int  imm;
    int  shift       = 0;
    bool should_eval = false;
    switch (token_type) {
        case INTEGER:
            imm = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
            error(
                "Invalid immediate value, only integer, list of 2 integers, or "
                "symbol to those: '%s'",
                symbolcpy()
            );
        case QUOTE: {
            char* shift_scope = quotecpy();
            save_state();
            push_scope(shift_scope);
            upsert(env, "decrement-layer?", (Value) 0, NEITHER);
            should_eval = true;

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    imm = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid immediate value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    imm        = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    shift = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid immediate value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    shift      = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token == shift_scope) error("Too many arguments.");
            free(shift_scope);
            break;
        not_enough:
            error("Not enough arguments.");
        }
        case SYMBOL: {
            char* temp = symbolcpy();
            imm        = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (imm > 65535 || imm < 0)
        error(
            "Invalid immediate value, has to be between 0 and 65535: '%i'",
            imm
        );
    if (shift > 3 || shift < 0)
        error("Invalid shift value, has to be between 0 and 3: '%i'", shift);

    int inst = 0b11010010100000000000000000000000;
    inst += reg;
    inst += imm << 5;
    inst += shift << 21;
    PUSH_T(int, inst);
    if (should_eval) eval();
}

void MOVK() {
    scan_token_default();
    int reg;
    switch (token_type) {
        case INTEGER:
            reg = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Invalid register value, only integer or symbol to integer: "
                "'%s'",
                symbolcpy()
            );
        case SYMBOL: {
            char* temp = symbolcpy();
            reg        = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (reg > 31 || reg < 0)
        error("Invalid register value, has to be between 0 and 31: '%i'", reg);

    scan_token_default();
    int  imm;
    int  shift       = 0;
    bool should_eval = false;
    switch (token_type) {
        case INTEGER:
            imm = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
            error(
                "Invalid immediate value, only integer, list of 2 integers, or "
                "symbol to those: '%s'",
                symbolcpy()
            );
        case QUOTE: {
            char* shift_scope = quotecpy();
            save_state();
            push_scope(shift_scope);
            upsert(env, "decrement-layer?", (Value) 0, NEITHER);
            should_eval = true;

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    imm = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid immediate value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    imm        = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    shift = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid immediate value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    shift      = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token == shift_scope) error("Too many arguments.");
            free(shift_scope);
            break;
        not_enough:
            error("Not enough arguments.");
        }
        case SYMBOL: {
            char* temp = symbolcpy();
            imm        = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (imm > 65535 || imm < 0)
        error(
            "Invalid immediate value, has to be between 0 and 65535: '%i'",
            imm
        );
    if (shift > 3 || shift < 0)
        error("Invalid shift value, has to be between 0 and 3: '%i'", shift);

    int inst = 0b11110010100000000000000000000000;
    inst += reg;
    inst += imm << 5;
    inst += shift << 21;
    PUSH_T(int, inst);
    if (should_eval) eval();
}

void SVC() {
    scan_token_default();
    int imm = atoi(token + start);
    if (imm > 65535 || imm < 0)
        error(
            "Invalid immediate value, has to be between 0 and 65535: '%i'",
            imm
        );

    int inst = 0b11010100000000000000000000000001;
    inst += imm << 5;
    PUSH_T(int, inst);
}

void LDR() {
    scan_token_default();
    int dest;
    switch (token_type) {
        case INTEGER:
            dest = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
        case QUOTE:
            error(
                "Invalid register value, only integer or symbol to integer: "
                "'%s'",
                symbolcpy()
            );
        case SYMBOL: {
            char* temp = symbolcpy();
            dest       = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (dest > 31 || dest < 0)
        error("Invalid register value, has to be between 0 and 31: '%i'", dest);

    scan_token_default();
    int  src;
    int  offset      = 0;
    bool should_eval = false;
    switch (token_type) {
        case INTEGER:
            src = atoi(token + start);
            break;
        case FLOAT:
        case CHAR:
            error(
                "Invalid register value, only integer, list of 2 integers, or "
                "symbol to those: '%s'",
                symbolcpy()
            );
        case QUOTE: {
            char* shift_scope = quotecpy();
            save_state();
            push_scope(shift_scope);
            upsert(env, "decrement-layer?", (Value) 0, NEITHER);
            should_eval = true;

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    src = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid register value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    src        = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token != shift_scope) goto not_enough;
            switch (token_type) {
                case INTEGER:
                    offset = atoi(token + start);
                    break;
                case FLOAT:
                case CHAR:
                case QUOTE:
                    error(
                        "Invalid offset value, only integer or symbol to "
                        "integer: '%s'",
                        symbolcpy()
                    );
                case SYMBOL: {
                    char* temp = symbolcpy();
                    offset     = lookup_or_error(env, temp)->value.intValue;
                    free(temp);
                    break;
                }
            }

            scan_token_default();
            if (token == shift_scope) error("Too many arguments.");
            free(shift_scope);
            break;
        not_enough:
            error("Not enough arguments.");
        }
        case SYMBOL: {
            char* temp = symbolcpy();
            src        = lookup_or_error(env, temp)->value.intValue;
            free(temp);
            break;
        }
    }
    if (src > 31 || src < 0)
        error(
            "Invalid register value, only integer or symbol to integer: "
            "'%s'",
            src
        );

    int inst = 0b11111001010000000000000000000000;
    inst += dest;
    inst += src << 5;
    inst += offset << 10;
    PUSH_T(int, inst);
    if (should_eval) eval();
}
