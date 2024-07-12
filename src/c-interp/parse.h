#ifndef PARSE_H
#define PARSE_H

typedef enum {
    INTEGER,
    FLOAT,
    QUOTE,
    SYMBOL,
} TokenType;

void parse(
    char*      inner_token,
    long*      inner_start,
    long*      inner_end,
    long       inner_size,
    TokenType* inner_token_type
);

#endif
