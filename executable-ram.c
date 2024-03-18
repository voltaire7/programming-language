#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

// Define the bytes representing the assembly code to print "Hello, World!"
// unsigned char code[] = {
//     0x00, 0x00, 0x80, 0xd2, // mov x0, #0
//     0x01, 0x00, 0x00, 0x91, // mov x1, #1
//     0x0d, 0x00, 0x40, 0xd2, // mov x13, #13
//     0x00, 0x02, 0x00, 0x94, // bl _write
//     0x00, 0x00, 0x80, 0xd2, // mov x0, #0
//     0x00, 0x00, 0x00, 0xd4, // svc #0
// };
//
// int (*func)(void) = (int (*)(void))0x12345678;
// int x = func();

unsigned int code[] = {
    0x00000000
};

// Function pointer type for the shellcode
typedef void (*ShellcodeFunc)();

int main() {
    // Allocate memory with mmap for the shellcode
    void *mem = mmap(NULL, sizeof(code), PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
    if (mem == MAP_FAILED) {
        perror("Failed to allocate memory");
        exit(EXIT_FAILURE);
    }

    // Copy the shellcode into the allocated memory
    memcpy(mem, code, sizeof(code));

    // Change memory protection to allow execution
    if (mprotect(mem, sizeof(code), PROT_READ | PROT_EXEC) == -1) {
        perror("Failed to change memory protection");
        exit(EXIT_FAILURE);
    }

    // Cast the memory address to a function pointer
    ShellcodeFunc func = (ShellcodeFunc)mem;

    // Call the function
    func();

    // Cleanup: Unmap the allocated memory
    if (munmap(mem, sizeof(code)) == -1) {
        perror("Failed to unmap memory");
        exit(EXIT_FAILURE);
    }

    return 0;
}

