#include <stdio.h>
#include <stdlib.h>

#include "eval.c"
#include "setup.c"
#include "util.h"

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    readFileContent(argv[1]);
    setup();
    eval();

    free(fileContent);
    return 0;
}
