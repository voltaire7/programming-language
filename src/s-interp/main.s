.global _main
.align 2

_main:
    mov    x0, #1
    adr    x1, str
    mov    x2, str_len
    mov    x16, #4
    svc    #0

    mov     x0, #0
    mov     x16, #1
    svc     #0

str:      .ascii  "Hello, ARM64!\n"
str_len = . - str
