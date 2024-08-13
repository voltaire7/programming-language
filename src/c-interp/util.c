#include <ctype.h>
#include <math.h>
#include <regex.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#include "env.h"
#include "scan-token.h"

char* token = NULL;
long  size  = 0;

long start = 0;
long end   = 0;

extern Dictionary* env;

extern long  layer_offset;
extern char* filename;

extern TokenType token_type;

extern int   stack_arr[];
extern void* stack;

#define WHITE "\033[0m"
#define RED   "\033[1;31m"
#define BLUE  "\033[1;34m"

void print_line(int line) {
    int i = 0;
    while (line - 1 && token[i])
        if (token[i++] == '\n') line--;
    while (token[i] != '\n' && token[i]) {
        if (i == start)
            fprintf(stderr, RED);
        else if (i == end)
            fprintf(stderr, WHITE);
        putc(token[i++], stderr);
    }
    putc('\n', stderr);
}

void error(char* msg, ...) {
    int line_count  = 1;
    int line_offset = 1;
    while (env->next) {
        recover_state();
        pop_scope();
    }
    for (int i = 0; i < start; i++, line_offset++)
        if (token[i] == '\n') {
            line_count++;
            line_offset = 0;
        };

    va_list args;
    va_start(args, msg);
    fprintf(stderr, "[" RED "ERROR" WHITE "] ");
    vfprintf(stderr, msg, args);
    fprintf(stderr, "\n");
    va_end(args);

    for (int n = line_count * 100; n; n /= 10) putc(' ', stderr);
    fprintf(stderr, BLUE "|\n %d | " WHITE, line_count);
    print_line(line_count);
    for (int n = line_count * 100; n; n /= 10) putc(' ', stderr);
    fprintf(stderr, BLUE "|\n" WHITE);
    fprintf(stderr, "%s:%d:%d\n", filename, line_count, line_offset);

    exit(1);
}

void readFileContent(const char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL)
        fprintf(
            stderr,
            "[" RED "ERROR" WHITE "] Failed to open the file: '%s'\n",
            filename
        );

    fseek(filePointer, 0, SEEK_END);
    size = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    token = malloc(size + 1);
    if (token == NULL) {
        fclose(filePointer);
        error("Failed to allocate memory.");
    }

    fread(token, 1, size, filePointer);
    token[size] = '\0';

    fclose(filePointer);
}

void printlen(char* str, const int len) {
    for (char* max = str + len; str != max; str++) putchar(*str);
}

char* quotecpy() {
    char* dest = malloc((end - start - 2) + 1);
    strncpy(dest, token + start + 1, end - start - 2);
    (dest)[end - start - 2] = '\0';
    return dest;
}

char* symbolcpy() {
    char* dest = malloc((end - start) + 1);
    strncpy(dest, token + start, end - start);
    (dest)[end - start] = '\0';
    return dest;
}

void process_str(char* s) {
    int i = 0, j = 0;
    for (; s[i] != '\0'; i++, j++) {
        if (s[i] == '\\') {
            i++;
            switch (s[i]) {
                case '\\':
                    s[j] = '\\';
                    break;
                case 'n':
                    s[j] = '\n';
                    break;
                case 't':
                    s[j] = '\t';
                    break;
                case '[':
                    s[j] = '[';
                    break;
                case ']':
                    s[j] = ']';
                    break;
                default:
                    error("Unknown escape sequence: '\\%c'", s[i]);
            }
        } else
            s[j] = s[i];
    }
    s[j] = '\0';
}

void concat(char** dest, const char* src) {
    size_t new_size = strlen(*dest) + strlen(src) + 1;
    char*  new_str  = (char*) realloc(*dest, new_size);
    if (new_str == NULL) error("Failed to realloc string.");
    *dest = new_str;
    strcat(*dest, src);
}

Dictionary* get_env(int layer) {
    Dictionary* env_target = env;

    int i = layer;

    Entry* entry = lookup_here(env_target, "decrement-layer?");
    if (entry == NULL) error("'decrement-layer?' is undefined.");
    if (entry->value.intValue) i++;

    if (i) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", layer);
        i--;
    }

    for (; i != 0; i--) {
        entry = lookup_here(env_target, "decrement-layer?");
        if (entry == NULL) error("'decrement-layer?' is undefined.");
        if (entry->value.intValue) i++;

        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", layer);
    }

    entry = lookup_here(env_target, "decrement-layer?");
    if (entry == NULL) error("'decrement-layer?' is undefined.");
    if (entry->value.intValue) i++;

    while (i--) {
        env_target = env_target->next;
        if (env_target == NULL) error("Non existent scope: %d", layer);

        entry = lookup_here(env_target, "decrement-layer?");
        if (entry == NULL) error("'decrement-layer?' is undefined.");
        if (entry->value.intValue) i++;
    }

    return env_target;
}

TokenType type_of(char* symbol) {
    int len = strlen(symbol);
    if (len == 0) error("Empty symbol");

    int  i    = 0;
    bool cond = (symbol[i] == '.' || symbol[i] == '-') && isdigit(symbol[i + 1])
        || isdigit(symbol[i]);
    if (cond) {
        TokenType type;
        type = INTEGER;
        if (symbol[i] != '.') i++;
        while (isdigit((symbol[i]))) i++;

        if (symbol[i] == '.') {
            while (isdigit(symbol[++i]));
            type = FLOAT;
        }

        if (!isspace(symbol[i]) && symbol[i] != '\0') return SYMBOL;
        return type;
    } else if (symbol[i] == '\'')
        return CHAR;
    else if (symbol[i] == '[')
        return QUOTE;
    else
        return SYMBOL;
}

long syscall(long x16, long x0, long x1, long x2, long x3, long x4, long x5) {
    long ret;
    asm volatile(
        "mov x0, %1\n"
        "mov x1, %2\n"
        "mov x2, %3\n"
        "mov x3, %4\n"
        "mov x4, %5\n"
        "mov x5, %6\n"

        "mov x16, %7\n"
        "svc #0\n"
        "mov %0, x0\n"

        : "=r"(ret)
        : "r"(x0),
          "r"(x1),
          "r"(x2),
          "r"(x3),
          "r"(x4),
          "r"(x5),

          "r"(x16)
    );
    return ret;
}

char parse_char(char* c) {
    if (c[1] == '\\') switch (c[2]) {
            case 'a':
                return '\a';
            case 'b':
                return '\b';
            case 'f':
                return '\f';
            case 'n':
                return '\n';
            case 'r':
                return '\r';
            case 't':
                return '\t';
            case 'v':
                return '\v';
            case '\\':
                return '\\';
            case '\'':
                return '\'';
            case '0':
                return '\0';
            default:
                error("Unknown character: '%s'", c[1]);
        };
    return c[1];
}

int count_layers() {
    int         count = 0;
    Dictionary* temp  = env;
    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}

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
    int start  = 0;
    int end    = length - 1;

    while (start < end) {
        char temp  = str[start];
        str[start] = str[end];
        str[end]   = temp;

        start++;
        end--;
    }
}

void from_str(char* str, int* size, int base, char endian) {
    switch (base) {
        case 2:
            remove_non_bin(str);
            break;
        case 16:
            remove_non_hex(str);
            break;
        default:
            error("Unsupported base: '%d'\n", base);
    }

    if (endian == 'e') {
        reverse_string(str);
    } else if (endian != 'E')
        error(
            "Endian ('e' for little or 'E' for big) not specified: '%c'",
            endian
        );

    int length      = strlen(str);
    int digit_count = ceil(log(pow(2, 32) - 1) / log(base));
    if (length % digit_count != 0 || length == 0)
        error(
            "Digit count to base mismatch: (length) %i %% (digits per "
            "instructions) %i = %i",
            length,
            digit_count,
            length % digit_count
        );
    *size = length / digit_count * 4 + 4;

    unsigned* code = (unsigned*) str;

    int i = 0;
    for (; i < length / digit_count; i++) {
        char hex_substring[digit_count + 1];
        strncpy(hex_substring, &str[i * digit_count], digit_count);
        hex_substring[digit_count] = '\0';

        code[i] = (unsigned) strtoul(hex_substring, NULL, base);
    }
    code[i] = 0xd65f03c0; // ret
}

void execute(unsigned* code, size_t size) {
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

#define PUSH_T(type, val) \
    *((type*) stack) = val; \
    stack += sizeof(type)

long push_count(int argc) {
    int* old = stack;
    while (argc--) {
        scan_token_default();
        switch (token_type) {
            case INTEGER:
                PUSH_T(long, atoi(token + start));
                break;
            case FLOAT:
                PUSH_T(double, atof(token + start));
                break;
            case CHAR:
                PUSH_T(long, parse_char(token + start));
                break;
            case QUOTE:
                PUSH_T(char*, quotecpy());
                break;
            case SYMBOL: {
                char* temp = symbolcpy();
                PUSH_T(long, lookup_or_error(env, temp)->value.longValue);
                free(temp);
                break;
            }
        }
    }
    return (long) old;
}

void pop(void* old) {
    stack = old;
}
