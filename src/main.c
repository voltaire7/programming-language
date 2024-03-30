#include <stdio.h>

#include "reading.c"

// hex: d2800840d2800030d4001001d65f03c0
// bin: 110100101000000000001000010000001101001010000000000000000011000011010100000000000001000000000001
int main(int argc, char** argv) {
    switch (argc) {
        case 1:
            repl();
            break;
        case 2:
            printf("file");
            break;
        default:
            return 1;
    }
}
