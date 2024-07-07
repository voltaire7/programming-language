#ifndef PARSE_H
#define PARSE_H

typedef enum {
    INTEGER,
    FLOAT,
    QUOTE,
    SYMBOL,
} TokenType;

void parse();

#endif
