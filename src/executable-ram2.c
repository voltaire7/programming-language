// #include <limits.h>
#include <stdio.h>

// int reverse(int x) {
//     int ans = 0;
//     while (x != 0) {
//         int digit = x % 10;
//         if (ans > INT_MAX / 10 || ans < INT_MIN / 10) {
//             return 0;
//         }
//         ans = (ans * 10) + digit;
//         x /= 10;
//     }
//     return ans;
// }
//
// // Assumes little endian
// void printBits(size_t const size, void const *const ptr) {
//     unsigned char *b = (unsigned char *)ptr;
//     unsigned char byte;
//     int i, j;
//
//     for (i = size - 1; i >= 0; i--) {
//         for (j = 7; j >= 0; j--) {
//             byte = (b[i] >> j) & 1;
//             printf("%u", byte);
//         }
//     }
//     puts("");
// }
//
// int main(int argc, char *argv[]) {
//     int i = 23;
//     unsigned int ui = UINT_MAX;
//     float f = 23.45f;
//     printBits(sizeof(i), &i);
//     int i2 = reverse(23);
//     printBits(sizeof(i2), &i2);
//     printBits(sizeof(ui), &ui);
//     printBits(sizeof(f), &f);
//     return 0;
// }

// int main() { char *string = "40 08 80 d2 30 00 80 d2 01 10 00 d4"; }

// 40 08 80 d2
// 30 00 80 d2
// 01 10 00 d4

#include <math.h>
#include <string.h>

int binaryToDecimal(char* binaryString) {
    int length = strlen(binaryString);
    int decimal = 0;

    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += pow(2, length - i - 1);
        } else if (binaryString[i] != '0') {
            printf("Invalid binary string\n");
            return -1; // indicating an error
        }
    }

    return decimal;
}

int main2() {
    char binaryString[32]; // Assuming a maximum length of 32 bits
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    int decimal = binaryToDecimal(binaryString);

    if (decimal != -1)
        printf("Decimal equivalent: %d\n", decimal);

    return 0;
}
