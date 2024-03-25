#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <hex_string>\n", argv[0]);
        return 1;
    }

    // Get the hexadecimal string from command-line argument
    const char *hexString = argv[1];
    size_t hexLength = strlen(hexString);
    if (hexLength % 2 != 0) {
        printf("Error: Hexadecimal string length must be even.\n");
        return 1;
    }
    
    // Convert hexadecimal string to byte array
    size_t codeSize = hexLength / 2;
    unsigned char *code = malloc(codeSize);
    if (code == NULL) {
        perror("malloc");
        return 1;
    }
    for (size_t i = 0; i < hexLength; i += 2) {
        sscanf(&hexString[i], "%2hhx", &code[i / 2]);
    }

    int (*addr)() = NULL;

    // Allocate executable buffer
    addr = mmap(NULL, codeSize, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (addr == MAP_FAILED) {
        perror("mmap");
        return 1;
    }

    // Copy code to buffer
    memcpy(addr, code, codeSize);

    // Modify the protection to allow execution
    if (mprotect(addr, sizeof(code), PROT_EXEC) == -1) {
        perror("mprotect");
        return 1;
    }

    // Run code
    addr();

    // Free allocated memory
    free(code);

    // Unmap memory
    munmap(addr, codeSize);

    return 0;
}
