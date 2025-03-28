#include <string.h>

#include "env.h"
#include "intrinsics.c"

void setup(Program *program) {
    upsert(program, strdup("print"), PRINT, true);
    upsert(program, strdup("format"), FORMAT, true);
    upsert(program, strdup("let"), LET, true);
    upsert(program, strdup("set"), SET, true);
    upsert(program, strdup("debug-stack"), DEBUG_STACK, true);
    upsert(program, strdup("unquote"), UNQUOTE, true);
    upsert(program, strdup("halt"), HALT, true);
    upsert(program, strdup("exit"), EXIT, true);
    upsert(program, strdup("do"), DO, true);
    upsert(program, strdup("reduce"), REDUCE, true);
    upsert(program, strdup("reverse"), REVERSE, true);
    upsert(program, strdup("debug"), DEBUG, true);
    upsert(program, strdup("+"), ADD, true);
    upsert(program, strdup("-"), SUB, true);
    upsert(program, strdup("*"), MUL, true);
    upsert(program, strdup("/"), DIV, true);
    upsert(program, strdup("%"), MOD, true);
    upsert(program, strdup("."), DUP, true);
    upsert(program, strdup("args"), ARGS, true);
    upsert(program, strdup("length"), LENGTH, true);
    upsert(program, strdup("swap"), SWAP, true);
    upsert(program, strdup("..."), NOT_IMPLEMENTED, true);
    upsert(program, strdup("if"), IF, true);
    upsert(program, strdup("for"), FOR, true);
    upsert(program, strdup("while"), WHILE, true);
    upsert(program, strdup("loop"), LOOP, true);
    upsert(program, strdup("as"), AS, true);
    upsert(program, strdup("rename"), RENAME, true);
    upsert(program, strdup("="), EQUAL, true);
    upsert(program, strdup("<"), LESS, true);
    upsert(program, strdup(">"), MORE, true);
    upsert(program, strdup("<="), LESS_OR_EQUAL, true);
    upsert(program, strdup(">="), MORE_OR_EQUAL, true);
    upsert(program, strdup("drop"), DROP, true);
    upsert(program, strdup("to"), TO, true);
    upsert(program, strdup("of"), OF, true);
    upsert(program, strdup("&&"), AND, true);
    upsert(program, strdup("||"), OR, true);
    upsert(program, strdup("!"), NOT, true);
    upsert(program, strdup("&"), BIT_AND, true);
    upsert(program, strdup("|"), BIT_OR, true);
    upsert(program, strdup("^"), BIT_XOR, true);
    upsert(program, strdup("~"), BIT_NOT, true);
    upsert(program, strdup("<<"), BIT_SHIFT_LEFT, true);
    upsert(program, strdup(">>"), BIT_SHIFT_RIGHT, true);
    upsert(program, strdup("load"), LOAD, true);
    upsert(program, strdup(".."), RANGE, true);
    upsert(program, strdup("delete"), DELETE, true);
}
