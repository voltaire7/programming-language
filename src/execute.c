#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/_types/_size_t.h>
#include <sys/mman.h>

// debug: d2800840d2800030d4001001d65f03c0
void execute(unsigned int* code, size_t size) {
    int (*addr)() = NULL;
    addr = mmap(NULL, size, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (addr == MAP_FAILED) {
        perror("mmap");
    }
    memcpy(addr, code, size);
    if (mprotect(addr, size, PROT_EXEC) == -1) {
        perror("mprotect");
    }

    addr();

    free(code);
    munmap(addr, size);
}
