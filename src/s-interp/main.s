.global _main
.align 2

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
str:      .asciz  "src/examples/temp.txt\n"
str_len = . - str


