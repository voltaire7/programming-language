#ifndef SCAN_TOKEN_H
#define SCAN_TOKEN_H

typedef enum {
    INTEGER,
    FLOAT,
    QUOTE,
    SYMBOL,
} TokenType;

void scan_token(
    char*      inner_token,
    long*      inner_start,
    long*      inner_end,
    long       inner_size,
    TokenType* inner_token_type
);

void scan_token_default();

#endif
