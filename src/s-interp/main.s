.global _main
.align 2

_main:
    // open
    adr x0,  str
    mov x1,  2
    mov x16, 5
    svc 0
    mov x9, x0

    // read
    adrp x1, _buf@PAGE
    add x1,  x1, _buf@PAGEOFF
    mov x8,  x1
    mov x2,  4096
    mov x16, 3
    svc 0

    // write
    mov x2,  x0
    mov x0,  1
    mov x1,  x8
    mov x16, 4
    svc 0

    // close
    mov x0,  x9
    mov x16, 6
    svc 0

    // exit
    mov x16, 1
    svc 0

str:      .ascii  "src/examples/temp.txt"
str_len = . - str

.globl _buf
.zerofill __DATA, __common, _buf, 4096, 0


