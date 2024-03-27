#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

// Run code with 200d80d2300080d2011000d4 as argument to test
int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <hex_string>\n", argv[0]);
        return 1;
    }

    // Get the hexadecimal string from command-line argument
    const char *hexString = argv[1];
    size_t hexLength = strlen(hexString);

    // Determine the actual length of the hex string without whitespace
    size_t actualHexLength = 0;
    for (size_t i = 0; i < hexLength; ++i) {
        if (hexString[i] != ' ') { // Ignore whitespace
            ++actualHexLength;
        }
    }

    if (actualHexLength % 2 != 0) {
        printf("Error: Hexadecimal string length must be even after ignoring whitespace.\n");
        return 1;
    }

    // Convert hexadecimal string to byte array
    size_t codeSize = actualHexLength / 2;
    unsigned char *code = malloc(codeSize);
    if (code == NULL) {
        perror("malloc");
        return 1;
    }

    size_t j = 0; // Index for the actual hex string without whitespace
    for (size_t i = 0; i < hexLength; i += 2) {
        while (hexString[j] == ' ') {
            j += 1; // Skip whitespace
        }
        sscanf(&hexString[j], "%2hhx", &code[i / 2]);
        j += 2;
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
    if (mprotect(addr, codeSize, PROT_EXEC) == -1) {
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
