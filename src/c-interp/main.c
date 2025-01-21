#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shared.h"
#include "util.h"
#include "env.h"
#include "eval.h"

#include "intrinsics.c"

char *stack[STACK_SIZE] = {};
int stack_index = 0;

int main(int argc, char** argv) {
    if (argc < 2) error("The interpreter currently only supports a single source file argument.");

    Program program = read_file(argv[1]);
    
    upsert("print", PRINT, true);
    upsert("format", FORMAT, true);
    upsert("hello", "[test]", false);
    // upsert("hello", "print \"test \n\" hello", false);

    interpret(&program);
    debug_stack();
}
