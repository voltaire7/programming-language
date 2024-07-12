#include <stdio.h>

#include "eval.c"
#include "parse.h"
#include "setup.c"
#include "util.h"

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("[\033[1;31mERROR\033[0m] Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    readFileContent(argv[1]);
    setup();
    for (;;) {
        parse();
        eval();
    }

    return 0;
}
