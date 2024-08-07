.global _syscall
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
