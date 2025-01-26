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
    upsert("print\\n", PRINTLN, true);
    upsert("format", FORMAT, true);
    upsert("let", LET, true);
    upsert("debug-stack", DEBUG_STACK, true);
    upsert("unquote", UNQUOTE, true);
    upsert("halt", HALT, true);
    upsert("exit", EXIT, true);
    upsert("hello", "[test\\n]", false);

    interpret(&program);
    debug_stack();
}
