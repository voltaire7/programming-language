#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void remove_whitespace(char* str) {
    int i, j = 0;
    for (i = 0; str[i] != '\0'; i++) {
        if (str[i] == '0' || str[i] == '1') {
            str[j++] = str[i];
        }
    }
    str[j] = '\0';
}

int reverse(int x) {
    int ans = 0;
    while (x != 0) {
        int digit = x % 10;
        if (ans > INT_MAX / 10 || ans < INT_MIN / 10) {
            return 0;
        }
        ans = (ans * 10) + digit;
        x /= 10;
    }
    return ans;
}

int str_to_n(char* bin) {
    remove_whitespace(bin);
    int length = strlen(bin);
    if (length % 32 != 0) {
        printf(
            "Error: Binary string length must be even after ignoring "
            "whitespace.\n"
        );
        return -1;
    }
    unsigned long num = strtoul(bin, NULL, 2);
    return num;
    // return reverse(num);
}
