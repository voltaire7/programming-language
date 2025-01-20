#ifndef SCAN_TOKEN_H
#define SCAN_TOKEN_H

typedef enum {
    INTEGER,
    FLOAT,
    CHAR,
    QUOTE,
    SYMBOL,
} TokenType;

void scan_token(
    char*      token,
    long*      start,
    long*      end,
    long       size,
    TokenType* token_type
);

void scan_token_default();

#endif
