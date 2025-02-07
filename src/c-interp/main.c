#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <libgen.h>

#include "shared.h"
#include "util.h"
#include "eval.h"
#include "setup.c"

char *stack[STACK_SIZE] = {};
int stack_index = 0;

int main(int argc, char** argv) {
    if (argc < 2) error("The interpreter currently only supports a single source file argument.");

    Program program = read_file(argv[1]);

    setup(&program);

    interpret(&program);
    debug_stack();
}
