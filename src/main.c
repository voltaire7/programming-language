#include <stdio.h>

#include "reading.c"

int main(int argc, char **argv) {
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
