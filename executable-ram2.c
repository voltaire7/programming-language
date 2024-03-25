#include <stdio.h>
#include <string.h>
#include <sys/_types/_u_int64_t.h>
#include <sys/mman.h>

int main() {
    // Machine code for a simple function that adds two numbers
    char code[] = {
        0x20, 0x0d, 0x80, 0xd2, // mov x0, #0x69
        0x30, 0x00, 0x80, 0xd2, // mov x16, #1
        0x01, 0x10, 0x00, 0xd4, // svc #0x80
    };

    int (*addr)() = NULL;

    // Allocate executable buffer
    addr = mmap(NULL, sizeof(code), PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1,
                0);

    if (addr == MAP_FAILED) {
        perror("mmap");
        return 1; // Return with an error if mmap fails
    }

    printf("Test0\n");
    // Copy code to buffer
    memcpy(addr, code, sizeof(code));
    printf("Test1\n");

    // Modify the protection to allow execution
    if (mprotect(addr, sizeof(code), PROT_EXEC) == -1) {
        perror("mprotect");
        return 1;
    }

    // Run code
    addr();

    // Unmap memory
    munmap(addr, sizeof(code));

    return 0;
}
