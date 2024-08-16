#ifndef DEFINES_H
#define DEFINES_H

#define PUSH_T(type, val) \
    *((type*) stack) = val; \
    stack += sizeof(type)

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

#define ARITHMETIC_F(op) \
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

#endif
