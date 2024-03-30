#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/_types/_size_t.h>

void remove_non_bin(char* str) {
    int i, j = 0;
    for (i = 0; str[i] != '\0'; i++) {
        if (str[i] == '0' || str[i] == '1') {
            str[j++] = str[i];
        }
    }
    str[j] = '\0';
}

void remove_non_hex(char* str) {
    int i, j = 0;
    for (i = 0; str[i] != '\0'; i++) {
        if ((str[i] >= '0' && str[i] <= '9') || (str[i] >= 'a' && str[i] <= 'f')
            || (str[i] >= 'A' && str[i] <= 'F')) {
            str[j++] = str[i];
        }
    }
    str[j] = '\0';
}

void reverse_string(char* str) {
    int length = strlen(str);
    int start = 0;
    int end = length - 1;

    while (start < end) {
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;

        start++;
        end--;
    }
}

unsigned int* from_bin(char* bin) {
    remove_non_bin(bin);
    // reverse_string(bin);
    int length = strlen(bin);
    if (length % 32 != 0 || length == 0) {
        printf("Error: This interpreter only accepts 32 bit instructions.\n");
        return NULL;
    }
    unsigned int var = strtoul(bin, NULL, 2);
    return NULL;
}

unsigned int* from_hex(char* hex, size_t* size) {
    remove_non_hex(hex);
    int length = strlen(hex);
    // reverse_string(bin);
    if (length % 8 != 0 || length == 0) {
        printf("Error: This interpreter only accepts 32 bit instructions.\n");
        return NULL;
    }

    *size = length / 2;
    printf("length: %zu\n", *size);
    unsigned int* code = malloc(*size);
    int i = 0;
    for (; i < length / 8; i += 1) {
        char hexSubstring[9];
        strncpy(hexSubstring, &hex[i * 8], 8);
        hexSubstring[8] = '\0';

        code[i] = (unsigned int) strtoul(hexSubstring, NULL, 16);
    }
    code[i + 1] = 0xd65f03c0;
    return code;
}
