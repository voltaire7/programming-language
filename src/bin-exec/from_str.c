#include "from_str.h"

#include <math.h>
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

unsigned int* from_str(char* str, size_t* size, int base, char endian) {
    switch (base) {
        case 2:
            remove_non_bin(str);
            break;
        case 16:
            remove_non_hex(str);
            break;
        default:
            printf("Error: Unsupported 'base %d'\n", base);
            exit(1);
    }

    if (endian == 'e') {
        reverse_string(str);
    } else if (endian != 'E') {
        printf(
            "Error: Please specify either little-endian 'e' or big-endian 'E'. "
            "'%c' is not a valid option.\n",
            endian
        );
        exit(1);
    }

    // reverse_string(bin);
    int length = strlen(str);
    int digit_count = ceil(log(pow(2, 32) - 1) / log(base));
    if (length % digit_count != 0 || length == 0) {
        printf("Error: This interpreter only accepts 32 bit instructions.\n");
        return NULL;
    }

    *size = length / digit_count * 4 + 4;
    unsigned int* code = malloc(*size);
    int i = 0;
    for (; i < length / digit_count; i += 1) {
        char hexSubstring[digit_count + 1];
        strncpy(hexSubstring, &str[i * digit_count], digit_count);
        hexSubstring[digit_count] = '\0';

        code[i] = (unsigned int) strtoul(hexSubstring, NULL, base);
    }
    code[i] = 0xd65f03c0;
    return code;
}
