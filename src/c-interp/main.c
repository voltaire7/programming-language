#include <stdio.h>
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

    upsert(&program, "print", PRINT, true);
    upsert(&program, "print\\n", PRINTLN, true);
    upsert(&program, "format", FORMAT, true);
    upsert(&program, "let", LET, true);
    upsert(&program, "set", SET, true);
    upsert(&program, "debug-stack", DEBUG_STACK, true);
    upsert(&program, "unquote", UNQUOTE, true);
    upsert(&program, "halt", HALT, true);
    upsert(&program, "exit", EXIT, true);
    upsert(&program, "do", DO, true);
    upsert(&program, "reduce", REDUCE, true);
    upsert(&program, "reverse", REVERSE, true);
    upsert(&program, "debug", DEBUG, true);
    upsert(&program, "+", ADD, true);
    upsert(&program, "-", SUB, true);
    upsert(&program, "*", MUL, true);
    upsert(&program, "/", DIV, true);
    upsert(&program, ".", DUP, true);
    upsert(&program, "\\n", "[\\n]", false);
    upsert(&program, "args", ARGS, true);
    upsert(&program, "length", LENGTH, true);
    upsert(&program, "swap", SWAP, true);
    upsert(&program, "...", NOT_IMPLEMENTED, true);
    upsert(&program, "if", IF, true);

    interpret(&program);
    debug_stack();
}
