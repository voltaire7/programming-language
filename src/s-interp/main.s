.global _main
.align 2

// generic syscall procedure
_syscall:
    // syscall number
    ldr x16, [sp]

    // syscall args
    ldr x0, [sp, 8 ]
    ldr x1, [sp, 16]
    ldr x2, [sp, 24]
    ldr x3, [sp, 32]
    ldr x4, [sp, 40]
    ldr x5, [sp, 48]

    // do syscall
    svc 0

    // pop stack
    add sp, sp, 64
ret

// entry point of the application
_main:
    // write
    mov x0,  1
    adr x1,  str
    mov x2,  str_len
    mov x16, 4
    svc 0

    // prepare syscall
    sub sp, sp, 64
    mov x0, 1
    str x0, [sp]
    mov x0, 55
    str x0, [sp, 8]

    // call syscall
    bl _syscall

    // exit
    mov x0,  0
    mov x16, 1
    svc 0

// data
str:      .asciz  "example.txt\n"
str_len = . - str


