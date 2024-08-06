	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 5
	.file	1 "/Users/voltaire/code/hobby/programming-language" "src/c-interp/eval.c"
	.file	2 "/Users/voltaire/code/hobby/programming-language" "src/c-interp/setup.c"
	.file	3 "/Users/voltaire/code/hobby/programming-language" "src/c-interp/main.c"
	.file	4 "/Users/voltaire/code/hobby/programming-language" "src/c-interp/env.h"
	.file	5 "/Users/voltaire/code/hobby/programming-language" "src/c-interp/scan-token.h"
	.globl	_eval                           ; -- Begin function eval
	.p2align	2
_eval:                                  ; @eval
Lfunc_begin0:
	.loc	1 18 0                          ; src/c-interp/eval.c:18:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #288
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
Ltmp0:
	.loc	1 20 13 prologue_end            ; src/c-interp/eval.c:20:13
	adrp	x8, _token_type@GOTPAGE
	ldr	x8, [x8, _token_type@GOTPAGEOFF]
	ldr	w8, [x8]
	stur	w8, [x29, #-52]                 ; 4-byte Folded Spill
	.loc	1 20 5 is_stmt 0                ; src/c-interp/eval.c:20:5
	cbz	w8, LBB0_5
	b	LBB0_1
LBB0_1:
	.loc	1 0 5                           ; src/c-interp/eval.c:0:5
	ldur	w8, [x29, #-52]                 ; 4-byte Folded Reload
	.loc	1 20 5                          ; src/c-interp/eval.c:20:5
	subs	w8, w8, #1
	b.eq	LBB0_12
	b	LBB0_2
LBB0_2:
	.loc	1 0 5                           ; src/c-interp/eval.c:0:5
	ldur	w8, [x29, #-52]                 ; 4-byte Folded Reload
	.loc	1 20 5                          ; src/c-interp/eval.c:20:5
	subs	w8, w8, #2
	b.eq	LBB0_19
	b	LBB0_3
LBB0_3:
	.loc	1 0 5                           ; src/c-interp/eval.c:0:5
	ldur	w8, [x29, #-52]                 ; 4-byte Folded Reload
	.loc	1 20 5                          ; src/c-interp/eval.c:20:5
	subs	w8, w8, #3
	b.eq	LBB0_26
	b	LBB0_4
LBB0_4:
	.loc	1 0 5                           ; src/c-interp/eval.c:0:5
	ldur	w8, [x29, #-52]                 ; 4-byte Folded Reload
	.loc	1 20 5                          ; src/c-interp/eval.c:20:5
	subs	w8, w8, #4
	b.eq	LBB0_27
	b	LBB0_61
LBB0_5:
Ltmp1:
	.loc	1 22 34 is_stmt 1               ; src/c-interp/eval.c:22:34
	adrp	x8, _token@GOTPAGE
	ldr	x8, [x8, _token@GOTPAGEOFF]
	ldr	x8, [x8]
	.loc	1 22 42 is_stmt 0               ; src/c-interp/eval.c:22:42
	adrp	x9, _start@GOTPAGE
	ldr	x9, [x9, _start@GOTPAGEOFF]
	ldr	x11, [x9]
	.loc	1 22 40                         ; src/c-interp/eval.c:22:40
	add	x9, x8, x11
	stur	x9, [x29, #-80]                 ; 8-byte Folded Spill
	mov	x10, #1                         ; =0x1
	smulh	x9, x10, x11
	mul	x11, x10, x11
	subs	x9, x9, x11, asr #63
	cset	w9, ne
	stur	w9, [x29, #-68]                 ; 4-byte Folded Spill
	add	x10, x8, x11
	stur	x10, [x29, #-64]                ; 8-byte Folded Spill
	subs	x9, x10, x8
	cset	w9, hs
	subs	x10, x10, x8
	cset	w10, lo
	subs	x11, x11, #0
	csel	w9, w9, w10, ge
	stur	w9, [x29, #-56]                 ; 4-byte Folded Spill
	cbz	x8, LBB0_10
	b	LBB0_6
LBB0_6:
	.loc	1 0 40                          ; src/c-interp/eval.c:0:40
	ldur	x8, [x29, #-64]                 ; 8-byte Folded Reload
	.loc	1 22 40                         ; src/c-interp/eval.c:22:40
	cbz	x8, LBB0_10
	b	LBB0_7
LBB0_7:
	.loc	1 0 40                          ; src/c-interp/eval.c:0:40
	ldur	w8, [x29, #-56]                 ; 4-byte Folded Reload
	.loc	1 22 40                         ; src/c-interp/eval.c:22:40
	tbz	w8, #0, LBB0_10
	b	LBB0_8
LBB0_8:
	.loc	1 0 40                          ; src/c-interp/eval.c:0:40
	ldur	w8, [x29, #-68]                 ; 4-byte Folded Reload
	mov	w9, #1                          ; =0x1
	.loc	1 22 40                         ; src/c-interp/eval.c:22:40
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.eq	LBB0_10
	b	LBB0_9
LBB0_9:
	.loc	1 0 40                          ; src/c-interp/eval.c:0:40
	mov	w8, #0                          ; =0x0
	mov	w9, #1                          ; =0x1
	.loc	1 22 40                         ; src/c-interp/eval.c:22:40
	and	w8, w8, #0x1
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.ne	LBB0_11
	b	LBB0_10
LBB0_10:
	brk	#0x5513
LBB0_11:
	.loc	1 0 40                          ; src/c-interp/eval.c:0:40
	ldur	x0, [x29, #-80]                 ; 8-byte Folded Reload
	.loc	1 22 29                         ; src/c-interp/eval.c:22:29
	bl	_atoi
                                        ; implicit-def: $x8
	mov	x8, x0
	sxtw	x8, w8
	.loc	1 22 27                         ; src/c-interp/eval.c:22:27
	stur	x8, [x29, #-24]
	.loc	1 23 20 is_stmt 1               ; src/c-interp/eval.c:23:20
	mov	w0, #0                          ; =0x0
	bl	_get_env
	.loc	1 23 13 is_stmt 0               ; src/c-interp/eval.c:23:13
	ldur	x2, [x29, #-24]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w3, #2                          ; =0x2
	bl	_upsert
	.loc	1 24 13 is_stmt 1               ; src/c-interp/eval.c:24:13
	b	LBB0_61
LBB0_12:
	.loc	1 26 35                         ; src/c-interp/eval.c:26:35
	adrp	x8, _token@GOTPAGE
	ldr	x8, [x8, _token@GOTPAGEOFF]
	ldr	x8, [x8]
	.loc	1 26 43 is_stmt 0               ; src/c-interp/eval.c:26:43
	adrp	x9, _start@GOTPAGE
	ldr	x9, [x9, _start@GOTPAGEOFF]
	ldr	x11, [x9]
	.loc	1 26 41                         ; src/c-interp/eval.c:26:41
	add	x9, x8, x11
	stur	x9, [x29, #-112]                ; 8-byte Folded Spill
	mov	x10, #1                         ; =0x1
	smulh	x9, x10, x11
	mul	x11, x10, x11
	subs	x9, x9, x11, asr #63
	cset	w9, ne
	stur	w9, [x29, #-100]                ; 4-byte Folded Spill
	add	x10, x8, x11
	stur	x10, [x29, #-96]                ; 8-byte Folded Spill
	subs	x9, x10, x8
	cset	w9, hs
	subs	x10, x10, x8
	cset	w10, lo
	subs	x11, x11, #0
	csel	w9, w9, w10, ge
	stur	w9, [x29, #-84]                 ; 4-byte Folded Spill
	cbz	x8, LBB0_17
	b	LBB0_13
LBB0_13:
	.loc	1 0 41                          ; src/c-interp/eval.c:0:41
	ldur	x8, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	1 26 41                         ; src/c-interp/eval.c:26:41
	cbz	x8, LBB0_17
	b	LBB0_14
LBB0_14:
	.loc	1 0 41                          ; src/c-interp/eval.c:0:41
	ldur	w8, [x29, #-84]                 ; 4-byte Folded Reload
	.loc	1 26 41                         ; src/c-interp/eval.c:26:41
	tbz	w8, #0, LBB0_17
	b	LBB0_15
LBB0_15:
	.loc	1 0 41                          ; src/c-interp/eval.c:0:41
	ldur	w8, [x29, #-100]                ; 4-byte Folded Reload
	mov	w9, #1                          ; =0x1
	.loc	1 26 41                         ; src/c-interp/eval.c:26:41
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.eq	LBB0_17
	b	LBB0_16
LBB0_16:
	.loc	1 0 41                          ; src/c-interp/eval.c:0:41
	mov	w8, #0                          ; =0x0
	mov	w9, #1                          ; =0x1
	.loc	1 26 41                         ; src/c-interp/eval.c:26:41
	and	w8, w8, #0x1
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.ne	LBB0_18
	b	LBB0_17
LBB0_17:
	brk	#0x5513
LBB0_18:
	.loc	1 0 41                          ; src/c-interp/eval.c:0:41
	ldur	x0, [x29, #-112]                ; 8-byte Folded Reload
	.loc	1 26 30                         ; src/c-interp/eval.c:26:30
	bl	_atof
	.loc	1 26 28                         ; src/c-interp/eval.c:26:28
	stur	d0, [x29, #-24]
	.loc	1 27 20 is_stmt 1               ; src/c-interp/eval.c:27:20
	mov	w0, #0                          ; =0x0
	bl	_get_env
	.loc	1 27 13 is_stmt 0               ; src/c-interp/eval.c:27:13
	ldur	x2, [x29, #-24]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w3, #2                          ; =0x2
	bl	_upsert
	.loc	1 28 13 is_stmt 1               ; src/c-interp/eval.c:28:13
	b	LBB0_61
LBB0_19:
	.loc	1 30 20                         ; src/c-interp/eval.c:30:20
	mov	w0, #0                          ; =0x0
	bl	_get_env
	str	x0, [sp, #120]                  ; 8-byte Folded Spill
	.loc	1 30 56 is_stmt 0               ; src/c-interp/eval.c:30:56
	adrp	x8, _token@GOTPAGE
	ldr	x8, [x8, _token@GOTPAGEOFF]
	ldr	x8, [x8]
	.loc	1 30 64                         ; src/c-interp/eval.c:30:64
	adrp	x9, _start@GOTPAGE
	ldr	x9, [x9, _start@GOTPAGEOFF]
	ldr	x11, [x9]
	.loc	1 30 62                         ; src/c-interp/eval.c:30:62
	add	x9, x8, x11
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	mov	x10, #1                         ; =0x1
	smulh	x9, x10, x11
	mul	x11, x10, x11
	subs	x9, x9, x11, asr #63
	cset	w9, ne
	stur	w9, [x29, #-132]                ; 4-byte Folded Spill
	add	x10, x8, x11
	stur	x10, [x29, #-128]               ; 8-byte Folded Spill
	subs	x9, x10, x8
	cset	w9, hs
	subs	x10, x10, x8
	cset	w10, lo
	subs	x11, x11, #0
	csel	w9, w9, w10, ge
	stur	w9, [x29, #-116]                ; 4-byte Folded Spill
	cbz	x8, LBB0_24
	b	LBB0_20
LBB0_20:
	.loc	1 0 62                          ; src/c-interp/eval.c:0:62
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	.loc	1 30 62                         ; src/c-interp/eval.c:30:62
	cbz	x8, LBB0_24
	b	LBB0_21
LBB0_21:
	.loc	1 0 62                          ; src/c-interp/eval.c:0:62
	ldur	w8, [x29, #-116]                ; 4-byte Folded Reload
	.loc	1 30 62                         ; src/c-interp/eval.c:30:62
	tbz	w8, #0, LBB0_24
	b	LBB0_22
LBB0_22:
	.loc	1 0 62                          ; src/c-interp/eval.c:0:62
	ldur	w8, [x29, #-132]                ; 4-byte Folded Reload
	mov	w9, #1                          ; =0x1
	.loc	1 30 62                         ; src/c-interp/eval.c:30:62
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.eq	LBB0_24
	b	LBB0_23
LBB0_23:
	.loc	1 0 62                          ; src/c-interp/eval.c:0:62
	mov	w8, #0                          ; =0x0
	mov	w9, #1                          ; =0x1
	.loc	1 30 62                         ; src/c-interp/eval.c:30:62
	and	w8, w8, #0x1
	and	w9, w9, #0x1
	subs	w8, w8, w9
	b.ne	LBB0_25
	b	LBB0_24
LBB0_24:
	brk	#0x5513
LBB0_25:
	.loc	1 0 62                          ; src/c-interp/eval.c:0:62
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	1 30 45                         ; src/c-interp/eval.c:30:45
	bl	_parse_char
	mov	x8, x0
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	1 30 37                         ; src/c-interp/eval.c:30:37
	sturb	w8, [x29, #-32]
	.loc	1 30 13                         ; src/c-interp/eval.c:30:13
	ldur	x2, [x29, #-32]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w3, #2                          ; =0x2
	bl	_upsert
	.loc	1 31 13 is_stmt 1               ; src/c-interp/eval.c:31:13
	b	LBB0_61
LBB0_26:
	.loc	1 33 13                         ; src/c-interp/eval.c:33:13
	b	LBB0_61
LBB0_27:
Ltmp2:
	.loc	1 35 28                         ; src/c-interp/eval.c:35:28
	bl	_symbolcpy
	.loc	1 35 20 is_stmt 0               ; src/c-interp/eval.c:35:20
	stur	x0, [x29, #-40]
	.loc	1 36 44 is_stmt 1               ; src/c-interp/eval.c:36:44
	adrp	x8, _env@PAGE
	ldr	x0, [x8, _env@PAGEOFF]
	.loc	1 36 49 is_stmt 0               ; src/c-interp/eval.c:36:49
	ldur	x1, [x29, #-40]
	.loc	1 36 28                         ; src/c-interp/eval.c:36:28
	bl	_lookup_or_error
	.loc	1 36 20                         ; src/c-interp/eval.c:36:20
	stur	x0, [x29, #-48]
	.loc	1 37 18 is_stmt 1               ; src/c-interp/eval.c:37:18
	ldur	x0, [x29, #-40]
	.loc	1 37 13 is_stmt 0               ; src/c-interp/eval.c:37:13
	bl	_free
Ltmp3:
	.loc	1 38 17 is_stmt 1               ; src/c-interp/eval.c:38:17
	ldur	x8, [x29, #-48]
	str	x8, [sp, #104]                  ; 8-byte Folded Spill
	.loc	1 38 24 is_stmt 0               ; src/c-interp/eval.c:38:24
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	cbz	x8, LBB0_29
	b	LBB0_28
LBB0_28:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	.loc	1 38 24                         ; src/c-interp/eval.c:38:24
	cbz	x8, LBB0_30
	b	LBB0_29
LBB0_29:
	brk	#0x5516
LBB0_30:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	.loc	1 38 24                         ; src/c-interp/eval.c:38:24
	add	x8, x8, #16
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_32
	b	LBB0_31
LBB0_31:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	1 38 24                         ; src/c-interp/eval.c:38:24
	cbz	x8, LBB0_33
	b	LBB0_32
LBB0_32:
	brk	#0x5516
LBB0_33:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	.loc	1 38 24                         ; src/c-interp/eval.c:38:24
	ldr	w8, [x8, #16]
Ltmp4:
	.loc	1 38 17                         ; src/c-interp/eval.c:38:17
	cbnz	w8, LBB0_44
	b	LBB0_34
LBB0_34:
Ltmp5:
	.loc	1 39 17 is_stmt 1               ; src/c-interp/eval.c:39:17
	ldur	x8, [x29, #-48]
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	.loc	1 39 24 is_stmt 0               ; src/c-interp/eval.c:39:24
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_36
	b	LBB0_35
LBB0_35:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	1 39 24                         ; src/c-interp/eval.c:39:24
	cbz	x8, LBB0_37
	b	LBB0_36
LBB0_36:
	brk	#0x5516
LBB0_37:
	.loc	1 0 24                          ; src/c-interp/eval.c:0:24
	ldr	x8, [sp, #80]                   ; 8-byte Folded Reload
	.loc	1 39 24                         ; src/c-interp/eval.c:39:24
	add	x8, x8, #8
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	.loc	1 39 30                         ; src/c-interp/eval.c:39:30
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_39
	b	LBB0_38
LBB0_38:
	.loc	1 0 30                          ; src/c-interp/eval.c:0:30
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	.loc	1 39 30                         ; src/c-interp/eval.c:39:30
	cbz	x8, LBB0_40
	b	LBB0_39
LBB0_39:
	brk	#0x5516
LBB0_40:
	.loc	1 0 30                          ; src/c-interp/eval.c:0:30
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	.loc	1 39 30                         ; src/c-interp/eval.c:39:30
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_42
	b	LBB0_41
LBB0_41:
	.loc	1 0 30                          ; src/c-interp/eval.c:0:30
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	.loc	1 39 30                         ; src/c-interp/eval.c:39:30
	cbz	x8, LBB0_43
	b	LBB0_42
LBB0_42:
	brk	#0x5516
LBB0_43:
	.loc	1 0 30                          ; src/c-interp/eval.c:0:30
	ldr	x8, [sp, #80]                   ; 8-byte Folded Reload
	.loc	1 39 30                         ; src/c-interp/eval.c:39:30
	ldr	x8, [x8, #8]
	.loc	1 39 17                         ; src/c-interp/eval.c:39:17
	blr	x8
	b	LBB0_60
LBB0_44:
Ltmp6:
	.loc	1 40 22 is_stmt 1               ; src/c-interp/eval.c:40:22
	ldur	x8, [x29, #-48]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	.loc	1 40 29 is_stmt 0               ; src/c-interp/eval.c:40:29
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_46
	b	LBB0_45
LBB0_45:
	.loc	1 0 29                          ; src/c-interp/eval.c:0:29
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	1 40 29                         ; src/c-interp/eval.c:40:29
	cbz	x8, LBB0_47
	b	LBB0_46
LBB0_46:
	brk	#0x5516
LBB0_47:
	.loc	1 0 29                          ; src/c-interp/eval.c:0:29
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	.loc	1 40 29                         ; src/c-interp/eval.c:40:29
	add	x8, x8, #16
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_49
	b	LBB0_48
LBB0_48:
	.loc	1 0 29                          ; src/c-interp/eval.c:0:29
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	.loc	1 40 29                         ; src/c-interp/eval.c:40:29
	cbz	x8, LBB0_50
	b	LBB0_49
LBB0_49:
	brk	#0x5516
LBB0_50:
	.loc	1 0 29                          ; src/c-interp/eval.c:0:29
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	.loc	1 40 29                         ; src/c-interp/eval.c:40:29
	ldr	w8, [x8, #16]
Ltmp7:
	.loc	1 40 22                         ; src/c-interp/eval.c:40:22
	subs	w8, w8, #1
	b.ne	LBB0_52
	b	LBB0_51
LBB0_51:
Ltmp8:
	.loc	1 41 23 is_stmt 1               ; src/c-interp/eval.c:41:23
	adrp	x8, _start@GOTPAGE
	ldr	x8, [x8, _start@GOTPAGEOFF]
	ldr	x8, [x8]
	.loc	1 41 21 is_stmt 0               ; src/c-interp/eval.c:41:21
	adrp	x9, _end@GOTPAGE
	ldr	x9, [x9, _end@GOTPAGEOFF]
	str	x8, [x9]
	.loc	1 42 17 is_stmt 1               ; src/c-interp/eval.c:42:17
	bl	_DO
	.loc	1 43 13                         ; src/c-interp/eval.c:43:13
	b	LBB0_59
Ltmp9:
LBB0_52:
	.loc	1 44 57                         ; src/c-interp/eval.c:44:57
	ldur	x8, [x29, #-48]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	.loc	1 44 64 is_stmt 0               ; src/c-interp/eval.c:44:64
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	cbz	x8, LBB0_54
	b	LBB0_53
LBB0_53:
	.loc	1 0 64                          ; src/c-interp/eval.c:0:64
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	1 44 64                         ; src/c-interp/eval.c:44:64
	cbz	x8, LBB0_55
	b	LBB0_54
LBB0_54:
	brk	#0x5516
LBB0_55:
	.loc	1 0 64                          ; src/c-interp/eval.c:0:64
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	.loc	1 44 64                         ; src/c-interp/eval.c:44:64
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	cbz	x8, LBB0_57
	b	LBB0_56
LBB0_56:
	.loc	1 0 64                          ; src/c-interp/eval.c:0:64
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	1 44 64                         ; src/c-interp/eval.c:44:64
	cbz	x8, LBB0_58
	b	LBB0_57
LBB0_57:
	brk	#0x5516
LBB0_58:
	.loc	1 0 64                          ; src/c-interp/eval.c:0:64
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	.loc	1 44 64                         ; src/c-interp/eval.c:44:64
	ldr	x8, [x8]
	.loc	1 44 17                         ; src/c-interp/eval.c:44:17
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_error
	b	LBB0_59
Ltmp10:
LBB0_59:
	.loc	1 0 17                          ; src/c-interp/eval.c:0:17
	b	LBB0_60
LBB0_60:
	.loc	1 45 13 is_stmt 1               ; src/c-interp/eval.c:45:13
	b	LBB0_61
Ltmp11:
LBB0_61:
	.loc	1 48 1 epilogue_begin           ; src/c-interp/eval.c:48:1
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #288
	ret
Ltmp12:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.globl	_setup                          ; -- Begin function setup
	.p2align	2
_setup:                                 ; @setup
Lfunc_begin1:
	.loc	2 8 0                           ; src/c-interp/setup.c:8:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #432
	stp	x28, x27, [sp, #400]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #416]            ; 16-byte Folded Spill
	add	x29, sp, #416
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
Ltmp13:
	.loc	2 9 11 prologue_end             ; src/c-interp/setup.c:9:11
	bl	_create_dictionary
	adrp	x8, _env@PAGE
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	.loc	2 9 9 is_stmt 0                 ; src/c-interp/setup.c:9:9
	str	x0, [x8, _env@PAGEOFF]
	.loc	2 10 12 is_stmt 1               ; src/c-interp/setup.c:10:12
	ldr	x0, [x8, _env@PAGEOFF]
	mov	w8, #0                          ; =0x0
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	.loc	2 10 37 is_stmt 0               ; src/c-interp/setup.c:10:37
	stur	wzr, [x29, #-24]
	.loc	2 10 5                          ; src/c-interp/setup.c:10:5
	ldur	x2, [x29, #-24]
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w3, #2                          ; =0x2
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 12 5 is_stmt 1                ; src/c-interp/setup.c:12:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _PRINT@GOTPAGE
	ldr	x8, [x8, _PRINT@GOTPAGEOFF]
	stur	x8, [x29, #-32]
	ldur	x2, [x29, #-32]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 13 5                          ; src/c-interp/setup.c:13:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _FREE@GOTPAGE
	ldr	x8, [x8, _FREE@GOTPAGEOFF]
	stur	x8, [x29, #-40]
	ldur	x2, [x29, #-40]
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 14 5                          ; src/c-interp/setup.c:14:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DO@GOTPAGE
	ldr	x8, [x8, _DO@GOTPAGEOFF]
	stur	x8, [x29, #-48]
	ldur	x2, [x29, #-48]
	adrp	x1, l_.str.5@PAGE
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 15 5                          ; src/c-interp/setup.c:15:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DO_HERE@GOTPAGE
	ldr	x8, [x8, _DO_HERE@GOTPAGEOFF]
	stur	x8, [x29, #-56]
	ldur	x2, [x29, #-56]
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 16 5                          ; src/c-interp/setup.c:16:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _PROC@GOTPAGE
	ldr	x8, [x8, _PROC@GOTPAGEOFF]
	stur	x8, [x29, #-64]
	ldur	x2, [x29, #-64]
	adrp	x1, l_.str.7@PAGE
	add	x1, x1, l_.str.7@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 17 5                          ; src/c-interp/setup.c:17:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _ITEM_IN@GOTPAGE
	ldr	x8, [x8, _ITEM_IN@GOTPAGEOFF]
	stur	x8, [x29, #-72]
	ldur	x2, [x29, #-72]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 18 5                          ; src/c-interp/setup.c:18:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _ITER@GOTPAGE
	ldr	x8, [x8, _ITER@GOTPAGEOFF]
	stur	x8, [x29, #-80]
	ldur	x2, [x29, #-80]
	adrp	x1, l_.str.9@PAGE
	add	x1, x1, l_.str.9@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 20 5                          ; src/c-interp/setup.c:20:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _IF@GOTPAGE
	ldr	x8, [x8, _IF@GOTPAGEOFF]
	stur	x8, [x29, #-88]
	ldur	x2, [x29, #-88]
	adrp	x1, l_.str.10@PAGE
	add	x1, x1, l_.str.10@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 22 5                          ; src/c-interp/setup.c:22:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _ADD@GOTPAGE
	ldr	x8, [x8, _ADD@GOTPAGEOFF]
	stur	x8, [x29, #-96]
	ldur	x2, [x29, #-96]
	adrp	x1, l_.str.11@PAGE
	add	x1, x1, l_.str.11@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 23 5                          ; src/c-interp/setup.c:23:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SUB@GOTPAGE
	ldr	x8, [x8, _SUB@GOTPAGEOFF]
	stur	x8, [x29, #-104]
	ldur	x2, [x29, #-104]
	adrp	x1, l_.str.12@PAGE
	add	x1, x1, l_.str.12@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 24 5                          ; src/c-interp/setup.c:24:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _MUL@GOTPAGE
	ldr	x8, [x8, _MUL@GOTPAGEOFF]
	stur	x8, [x29, #-112]
	ldur	x2, [x29, #-112]
	adrp	x1, l_.str.13@PAGE
	add	x1, x1, l_.str.13@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 25 5                          ; src/c-interp/setup.c:25:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DIV@GOTPAGE
	ldr	x8, [x8, _DIV@GOTPAGEOFF]
	stur	x8, [x29, #-120]
	ldur	x2, [x29, #-120]
	adrp	x1, l_.str.14@PAGE
	add	x1, x1, l_.str.14@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 26 5                          ; src/c-interp/setup.c:26:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _MODULO@GOTPAGE
	ldr	x8, [x8, _MODULO@GOTPAGEOFF]
	stur	x8, [x29, #-128]
	ldur	x2, [x29, #-128]
	adrp	x1, l_.str.15@PAGE
	add	x1, x1, l_.str.15@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 28 5                          ; src/c-interp/setup.c:28:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _ADD_FLOAT@GOTPAGE
	ldr	x8, [x8, _ADD_FLOAT@GOTPAGEOFF]
	stur	x8, [x29, #-136]
	ldur	x2, [x29, #-136]
	adrp	x1, l_.str.16@PAGE
	add	x1, x1, l_.str.16@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 29 5                          ; src/c-interp/setup.c:29:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SUB_FLOAT@GOTPAGE
	ldr	x8, [x8, _SUB_FLOAT@GOTPAGEOFF]
	stur	x8, [x29, #-144]
	ldur	x2, [x29, #-144]
	adrp	x1, l_.str.17@PAGE
	add	x1, x1, l_.str.17@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 30 5                          ; src/c-interp/setup.c:30:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _MUL_FLOAT@GOTPAGE
	ldr	x8, [x8, _MUL_FLOAT@GOTPAGEOFF]
	stur	x8, [x29, #-152]
	ldur	x2, [x29, #-152]
	adrp	x1, l_.str.18@PAGE
	add	x1, x1, l_.str.18@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 31 5                          ; src/c-interp/setup.c:31:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DIV_FLOAT@GOTPAGE
	ldr	x8, [x8, _DIV_FLOAT@GOTPAGEOFF]
	stur	x8, [x29, #-160]
	ldur	x2, [x29, #-160]
	adrp	x1, l_.str.19@PAGE
	add	x1, x1, l_.str.19@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 32 5                          ; src/c-interp/setup.c:32:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _MODULO_FLOAT@GOTPAGE
	ldr	x8, [x8, _MODULO_FLOAT@GOTPAGEOFF]
	stur	x8, [x29, #-168]
	ldur	x2, [x29, #-168]
	adrp	x1, l_.str.20@PAGE
	add	x1, x1, l_.str.20@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 34 5                          ; src/c-interp/setup.c:34:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _EQUAL@GOTPAGE
	ldr	x8, [x8, _EQUAL@GOTPAGEOFF]
	stur	x8, [x29, #-176]
	ldur	x2, [x29, #-176]
	adrp	x1, l_.str.21@PAGE
	add	x1, x1, l_.str.21@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 35 5                          ; src/c-interp/setup.c:35:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _NOT_EQUAL@GOTPAGE
	ldr	x8, [x8, _NOT_EQUAL@GOTPAGEOFF]
	stur	x8, [x29, #-184]
	ldur	x2, [x29, #-184]
	adrp	x1, l_.str.22@PAGE
	add	x1, x1, l_.str.22@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 36 5                          ; src/c-interp/setup.c:36:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _GREATER@GOTPAGE
	ldr	x8, [x8, _GREATER@GOTPAGEOFF]
	stur	x8, [x29, #-192]
	ldur	x2, [x29, #-192]
	adrp	x1, l_.str.23@PAGE
	add	x1, x1, l_.str.23@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 37 5                          ; src/c-interp/setup.c:37:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SMALLER@GOTPAGE
	ldr	x8, [x8, _SMALLER@GOTPAGEOFF]
	stur	x8, [x29, #-200]
	ldur	x2, [x29, #-200]
	adrp	x1, l_.str.24@PAGE
	add	x1, x1, l_.str.24@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 38 5                          ; src/c-interp/setup.c:38:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _GREATER_EQUAL@GOTPAGE
	ldr	x8, [x8, _GREATER_EQUAL@GOTPAGEOFF]
	str	x8, [sp, #208]
	ldr	x2, [sp, #208]
	adrp	x1, l_.str.25@PAGE
	add	x1, x1, l_.str.25@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 39 5                          ; src/c-interp/setup.c:39:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SMALLER_EQUAL@GOTPAGE
	ldr	x8, [x8, _SMALLER_EQUAL@GOTPAGEOFF]
	str	x8, [sp, #200]
	ldr	x2, [sp, #200]
	adrp	x1, l_.str.26@PAGE
	add	x1, x1, l_.str.26@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 40 5                          ; src/c-interp/setup.c:40:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _OR@GOTPAGE
	ldr	x8, [x8, _OR@GOTPAGEOFF]
	str	x8, [sp, #192]
	ldr	x2, [sp, #192]
	adrp	x1, l_.str.27@PAGE
	add	x1, x1, l_.str.27@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 41 5                          ; src/c-interp/setup.c:41:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _AND@GOTPAGE
	ldr	x8, [x8, _AND@GOTPAGEOFF]
	str	x8, [sp, #184]
	ldr	x2, [sp, #184]
	adrp	x1, l_.str.28@PAGE
	add	x1, x1, l_.str.28@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 42 5                          ; src/c-interp/setup.c:42:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _NOT@GOTPAGE
	ldr	x8, [x8, _NOT@GOTPAGEOFF]
	str	x8, [sp, #176]
	ldr	x2, [sp, #176]
	adrp	x1, l_.str.29@PAGE
	add	x1, x1, l_.str.29@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 44 5                          ; src/c-interp/setup.c:44:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _LABEL@GOTPAGE
	ldr	x8, [x8, _LABEL@GOTPAGEOFF]
	str	x8, [sp, #168]
	ldr	x2, [sp, #168]
	adrp	x1, l_.str.30@PAGE
	add	x1, x1, l_.str.30@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 45 5                          ; src/c-interp/setup.c:45:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _GOTO@GOTPAGE
	ldr	x8, [x8, _GOTO@GOTPAGEOFF]
	str	x8, [sp, #160]
	ldr	x2, [sp, #160]
	adrp	x1, l_.str.31@PAGE
	add	x1, x1, l_.str.31@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 47 5                          ; src/c-interp/setup.c:47:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DELETE@GOTPAGE
	ldr	x8, [x8, _DELETE@GOTPAGEOFF]
	str	x8, [sp, #152]
	ldr	x2, [sp, #152]
	adrp	x1, l_.str.32@PAGE
	add	x1, x1, l_.str.32@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 48 5                          ; src/c-interp/setup.c:48:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SCAN_TOKEN@GOTPAGE
	ldr	x8, [x8, _SCAN_TOKEN@GOTPAGEOFF]
	str	x8, [sp, #144]
	ldr	x2, [sp, #144]
	adrp	x1, l_.str.33@PAGE
	add	x1, x1, l_.str.33@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 49 5                          ; src/c-interp/setup.c:49:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _COPY_TOKEN@GOTPAGE
	ldr	x8, [x8, _COPY_TOKEN@GOTPAGEOFF]
	str	x8, [sp, #136]
	ldr	x2, [sp, #136]
	adrp	x1, l_.str.34@PAGE
	add	x1, x1, l_.str.34@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 50 5                          ; src/c-interp/setup.c:50:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _PARSE@GOTPAGE
	ldr	x8, [x8, _PARSE@GOTPAGEOFF]
	str	x8, [sp, #128]
	ldr	x2, [sp, #128]
	adrp	x1, l_.str.35@PAGE
	add	x1, x1, l_.str.35@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 52 5                          ; src/c-interp/setup.c:52:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _MACRO@GOTPAGE
	ldr	x8, [x8, _MACRO@GOTPAGEOFF]
	str	x8, [sp, #120]
	ldr	x2, [sp, #120]
	adrp	x1, l_.str.36@PAGE
	add	x1, x1, l_.str.36@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 53 5                          ; src/c-interp/setup.c:53:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SYSCALL@GOTPAGE
	ldr	x8, [x8, _SYSCALL@GOTPAGEOFF]
	str	x8, [sp, #112]
	ldr	x2, [sp, #112]
	adrp	x1, l_.str.37@PAGE
	add	x1, x1, l_.str.37@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 55 5                          ; src/c-interp/setup.c:55:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _GET@GOTPAGE
	ldr	x8, [x8, _GET@GOTPAGEOFF]
	str	x8, [sp, #104]
	ldr	x2, [sp, #104]
	adrp	x1, l_.str.38@PAGE
	add	x1, x1, l_.str.38@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 56 5                          ; src/c-interp/setup.c:56:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _SET@GOTPAGE
	ldr	x8, [x8, _SET@GOTPAGEOFF]
	str	x8, [sp, #96]
	ldr	x2, [sp, #96]
	adrp	x1, l_.str.39@PAGE
	add	x1, x1, l_.str.39@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 58 5                          ; src/c-interp/setup.c:58:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_AND@GOTPAGE
	ldr	x8, [x8, _BIT_AND@GOTPAGEOFF]
	str	x8, [sp, #88]
	ldr	x2, [sp, #88]
	adrp	x1, l_.str.40@PAGE
	add	x1, x1, l_.str.40@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 59 5                          ; src/c-interp/setup.c:59:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_OR@GOTPAGE
	ldr	x8, [x8, _BIT_OR@GOTPAGEOFF]
	str	x8, [sp, #80]
	ldr	x2, [sp, #80]
	adrp	x1, l_.str.41@PAGE
	add	x1, x1, l_.str.41@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 60 5                          ; src/c-interp/setup.c:60:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_XOR@GOTPAGE
	ldr	x8, [x8, _BIT_XOR@GOTPAGEOFF]
	str	x8, [sp, #72]
	ldr	x2, [sp, #72]
	adrp	x1, l_.str.42@PAGE
	add	x1, x1, l_.str.42@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 61 5                          ; src/c-interp/setup.c:61:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_NOT@GOTPAGE
	ldr	x8, [x8, _BIT_NOT@GOTPAGEOFF]
	str	x8, [sp, #64]
	ldr	x2, [sp, #64]
	adrp	x1, l_.str.43@PAGE
	add	x1, x1, l_.str.43@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 62 5                          ; src/c-interp/setup.c:62:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_SHIFTL@GOTPAGE
	ldr	x8, [x8, _BIT_SHIFTL@GOTPAGEOFF]
	str	x8, [sp, #56]
	ldr	x2, [sp, #56]
	adrp	x1, l_.str.44@PAGE
	add	x1, x1, l_.str.44@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 63 5                          ; src/c-interp/setup.c:63:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _BIT_SHIFTR@GOTPAGE
	ldr	x8, [x8, _BIT_SHIFTR@GOTPAGEOFF]
	str	x8, [sp, #48]
	ldr	x2, [sp, #48]
	adrp	x1, l_.str.45@PAGE
	add	x1, x1, l_.str.45@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 65 5                          ; src/c-interp/setup.c:65:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _EXEC@GOTPAGE
	ldr	x8, [x8, _EXEC@GOTPAGEOFF]
	str	x8, [sp, #40]
	ldr	x2, [sp, #40]
	adrp	x1, l_.str.46@PAGE
	add	x1, x1, l_.str.46@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 66 5                          ; src/c-interp/setup.c:66:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _DEBUG_PROC@GOTPAGE
	ldr	x8, [x8, _DEBUG_PROC@GOTPAGEOFF]
	str	x8, [sp, #32]
	ldr	x2, [sp, #32]
	adrp	x1, l_.str.47@PAGE
	add	x1, x1, l_.str.47@PAGEOFF
	bl	_upsert
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	w3, [sp, #20]                   ; 4-byte Folded Reload
	.loc	2 67 5                          ; src/c-interp/setup.c:67:5
	ldr	x0, [x8, _env@PAGEOFF]
	adrp	x8, _REDUCE@GOTPAGE
	ldr	x8, [x8, _REDUCE@GOTPAGEOFF]
	str	x8, [sp, #24]
	ldr	x2, [sp, #24]
	adrp	x1, l_.str.48@PAGE
	add	x1, x1, l_.str.48@PAGEOFF
	bl	_upsert
	.loc	2 68 1 epilogue_begin           ; src/c-interp/setup.c:68:1
	ldp	x29, x30, [sp, #416]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #400]            ; 16-byte Folded Reload
	add	sp, sp, #432
	ret
Ltmp14:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin2:
	.loc	3 10 0                          ; src/c-interp/main.c:10:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp15:
	.loc	3 11 9 prologue_end             ; src/c-interp/main.c:11:9
	ldur	w8, [x29, #-8]
Ltmp16:
	.loc	3 11 9 is_stmt 0                ; src/c-interp/main.c:11:9
	subs	w8, w8, #2
	b.ge	LBB2_10
	b	LBB2_1
LBB2_1:
Ltmp17:
	.loc	3 12 67 is_stmt 1               ; src/c-interp/main.c:12:67
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-40]                 ; 8-byte Folded Spill
	mov	x11, x8
	add	x10, x8, #0
	stur	x10, [x29, #-32]                ; 8-byte Folded Spill
	subs	x9, x10, x11
	cset	w9, hs
	subs	x10, x10, x11
	cset	w10, lo
	mov	w11, #1                         ; =0x1
	and	w11, w11, #0x1
	ands	w11, w11, #0x1
	csel	w9, w9, w10, ne
	stur	w9, [x29, #-20]                 ; 4-byte Folded Spill
	cbz	x8, LBB2_5
	b	LBB2_2
LBB2_2:
	.loc	3 0 67 is_stmt 0                ; src/c-interp/main.c:0:67
	ldur	x8, [x29, #-32]                 ; 8-byte Folded Reload
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	cbz	x8, LBB2_5
	b	LBB2_3
LBB2_3:
	.loc	3 0 67                          ; src/c-interp/main.c:0:67
	ldur	w8, [x29, #-20]                 ; 4-byte Folded Reload
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	tbz	w8, #0, LBB2_5
	b	LBB2_4
LBB2_4:
	.loc	3 0 67                          ; src/c-interp/main.c:0:67
	mov	w8, #1                          ; =0x1
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	tbnz	w8, #0, LBB2_6
	b	LBB2_5
LBB2_5:
	brk	#0x5513
LBB2_6:
	.loc	3 0 67                          ; src/c-interp/main.c:0:67
	ldur	x8, [x29, #-40]                 ; 8-byte Folded Reload
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	mov	x9, x8
	and	x9, x9, #0x7
	stur	x9, [x29, #-48]                 ; 8-byte Folded Spill
	cbz	x8, LBB2_8
	b	LBB2_7
LBB2_7:
	.loc	3 0 67                          ; src/c-interp/main.c:0:67
	ldur	x8, [x29, #-48]                 ; 8-byte Folded Reload
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	cbz	x8, LBB2_9
	b	LBB2_8
LBB2_8:
	brk	#0x5516
LBB2_9:
	.loc	3 0 67                          ; src/c-interp/main.c:0:67
	ldur	x8, [x29, #-40]                 ; 8-byte Folded Reload
	.loc	3 12 67                         ; src/c-interp/main.c:12:67
	ldr	x8, [x8]
	.loc	3 12 9                          ; src/c-interp/main.c:12:9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.49@PAGE
	add	x0, x0, l_.str.49@PAGEOFF
	bl	_printf
	.loc	3 13 9 is_stmt 1                ; src/c-interp/main.c:13:9
	mov	w0, #1                          ; =0x1
	.loc	3 13 9 epilogue_begin is_stmt 0 ; src/c-interp/main.c:13:9
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
Ltmp18:
LBB2_10:
	.loc	3 15 16 is_stmt 1               ; src/c-interp/main.c:15:16
	ldur	x8, [x29, #-16]
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	add	x9, x8, #8
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	mov	x11, x8
	add	x10, x8, #8
	stur	x10, [x29, #-64]                ; 8-byte Folded Spill
	subs	x9, x10, x11
	cset	w9, hs
	subs	x10, x10, x11
	cset	w10, lo
	mov	w11, #1                         ; =0x1
	and	w11, w11, #0x1
	ands	w11, w11, #0x1
	csel	w9, w9, w10, ne
	stur	w9, [x29, #-52]                 ; 4-byte Folded Spill
	cbz	x8, LBB2_14
	b	LBB2_11
LBB2_11:
	.loc	3 0 16 is_stmt 0                ; src/c-interp/main.c:0:16
	ldur	x8, [x29, #-64]                 ; 8-byte Folded Reload
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	cbz	x8, LBB2_14
	b	LBB2_12
LBB2_12:
	.loc	3 0 16                          ; src/c-interp/main.c:0:16
	ldur	w8, [x29, #-52]                 ; 4-byte Folded Reload
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	tbz	w8, #0, LBB2_14
	b	LBB2_13
LBB2_13:
	.loc	3 0 16                          ; src/c-interp/main.c:0:16
	mov	w8, #1                          ; =0x1
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	tbnz	w8, #0, LBB2_15
	b	LBB2_14
LBB2_14:
	brk	#0x5513
LBB2_15:
	.loc	3 0 16                          ; src/c-interp/main.c:0:16
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	cbz	x8, LBB2_17
	b	LBB2_16
LBB2_16:
	.loc	3 0 16                          ; src/c-interp/main.c:0:16
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	cbz	x8, LBB2_18
	b	LBB2_17
LBB2_17:
	brk	#0x5516
LBB2_18:
	.loc	3 0 16                          ; src/c-interp/main.c:0:16
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	.loc	3 15 16                         ; src/c-interp/main.c:15:16
	ldr	x8, [x8, #8]
	.loc	3 15 14                         ; src/c-interp/main.c:15:14
	adrp	x9, _filename@PAGE
	str	x8, [x9, _filename@PAGEOFF]
	.loc	3 17 21 is_stmt 1               ; src/c-interp/main.c:17:21
	ldur	x8, [x29, #-16]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x8, #8
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	mov	x11, x8
	add	x10, x8, #8
	str	x10, [sp, #40]                  ; 8-byte Folded Spill
	subs	x9, x10, x11
	cset	w9, hs
	subs	x10, x10, x11
	cset	w10, lo
	mov	w11, #1                         ; =0x1
	and	w11, w11, #0x1
	ands	w11, w11, #0x1
	csel	w9, w9, w10, ne
	str	w9, [sp, #52]                   ; 4-byte Folded Spill
	cbz	x8, LBB2_22
	b	LBB2_19
LBB2_19:
	.loc	3 0 21 is_stmt 0                ; src/c-interp/main.c:0:21
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	cbz	x8, LBB2_22
	b	LBB2_20
LBB2_20:
	.loc	3 0 21                          ; src/c-interp/main.c:0:21
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	tbz	w8, #0, LBB2_22
	b	LBB2_21
LBB2_21:
	.loc	3 0 21                          ; src/c-interp/main.c:0:21
	mov	w8, #1                          ; =0x1
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	tbnz	w8, #0, LBB2_23
	b	LBB2_22
LBB2_22:
	brk	#0x5513
LBB2_23:
	.loc	3 0 21                          ; src/c-interp/main.c:0:21
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	mov	x9, x8
	and	x9, x9, #0x7
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x8, LBB2_25
	b	LBB2_24
LBB2_24:
	.loc	3 0 21                          ; src/c-interp/main.c:0:21
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	cbz	x8, LBB2_26
	b	LBB2_25
LBB2_25:
	brk	#0x5516
LBB2_26:
	.loc	3 0 21                          ; src/c-interp/main.c:0:21
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	3 17 21                         ; src/c-interp/main.c:17:21
	ldr	x0, [x8, #8]
	.loc	3 17 5                          ; src/c-interp/main.c:17:5
	bl	_readFileContent
	.loc	3 18 5 is_stmt 1                ; src/c-interp/main.c:18:5
	bl	_setup
	.loc	3 19 5                          ; src/c-interp/main.c:19:5
	b	LBB2_27
LBB2_27:                                ; =>This Inner Loop Header: Depth=1
Ltmp19:
	.loc	3 20 9                          ; src/c-interp/main.c:20:9
	bl	_scan_token_default
	.loc	3 21 9                          ; src/c-interp/main.c:21:9
	bl	_eval
Ltmp20:
	.loc	3 19 5                          ; src/c-interp/main.c:19:5
	b	LBB2_27
Ltmp21:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.src:                                 ; @.src
	.asciz	"src/c-interp/eval.c"

l_.str:                                 ; @.str
	.asciz	"_"

	.globl	_env                            ; @env
.zerofill __DATA,__common,_env,8,3
	.section	__TEXT,__const
	.p2align	4, 0x0                          ; @0
l___unnamed_1:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'Entry' (aka 'struct Entry')"
	.space	1

	.p2align	4, 0x0                          ; @1
l___unnamed_2:
	.short	0                               ; 0x0
	.short	10                              ; 0xa
	.asciz	"'PointerType'"

	.p2align	3, 0x0                          ; @2
l___unnamed_3:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'Value'"

	.p2align	4, 0x0                          ; @3
l___unnamed_4:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'void (*)()'"
	.space	1

	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"Cannot evaluate symbol: '%s'\n"

	.section	__TEXT,__const
	.p2align	3, 0x0                          ; @4
l___unnamed_5:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'char *'"
	.space	1

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"decrement-layer?"

l_.str.3:                               ; @.str.3
	.asciz	"print"

l_.str.4:                               ; @.str.4
	.asciz	"free"

l_.str.5:                               ; @.str.5
	.asciz	"do"

l_.str.6:                               ; @.str.6
	.asciz	"do-here"

l_.str.7:                               ; @.str.7
	.asciz	"proc"

l_.str.8:                               ; @.str.8
	.asciz	"item-in"

l_.str.9:                               ; @.str.9
	.asciz	"iter"

l_.str.10:                              ; @.str.10
	.asciz	"?"

l_.str.11:                              ; @.str.11
	.asciz	"+"

l_.str.12:                              ; @.str.12
	.asciz	"-"

l_.str.13:                              ; @.str.13
	.asciz	"*"

l_.str.14:                              ; @.str.14
	.asciz	"/"

l_.str.15:                              ; @.str.15
	.asciz	"%"

l_.str.16:                              ; @.str.16
	.asciz	"+f"

l_.str.17:                              ; @.str.17
	.asciz	"-f"

l_.str.18:                              ; @.str.18
	.asciz	"*f"

l_.str.19:                              ; @.str.19
	.asciz	"/f"

l_.str.20:                              ; @.str.20
	.asciz	"%f"

l_.str.21:                              ; @.str.21
	.asciz	"=="

l_.str.22:                              ; @.str.22
	.asciz	"!="

l_.str.23:                              ; @.str.23
	.asciz	">"

l_.str.24:                              ; @.str.24
	.asciz	"<"

l_.str.25:                              ; @.str.25
	.asciz	">="

l_.str.26:                              ; @.str.26
	.asciz	"<="

l_.str.27:                              ; @.str.27
	.asciz	"||"

l_.str.28:                              ; @.str.28
	.asciz	"&&"

l_.str.29:                              ; @.str.29
	.asciz	"!"

l_.str.30:                              ; @.str.30
	.asciz	"label"

l_.str.31:                              ; @.str.31
	.asciz	"goto"

l_.str.32:                              ; @.str.32
	.asciz	"delete"

l_.str.33:                              ; @.str.33
	.asciz	"scan-token"

l_.str.34:                              ; @.str.34
	.asciz	"copy-token"

l_.str.35:                              ; @.str.35
	.asciz	"parse"

l_.str.36:                              ; @.str.36
	.asciz	"macro"

l_.str.37:                              ; @.str.37
	.asciz	"syscall"

l_.str.38:                              ; @.str.38
	.asciz	"get"

l_.str.39:                              ; @.str.39
	.asciz	"set"

l_.str.40:                              ; @.str.40
	.asciz	"&"

l_.str.41:                              ; @.str.41
	.asciz	"|"

l_.str.42:                              ; @.str.42
	.asciz	"^"

l_.str.43:                              ; @.str.43
	.asciz	"~"

l_.str.44:                              ; @.str.44
	.asciz	"<<"

l_.str.45:                              ; @.str.45
	.asciz	">>"

l_.str.46:                              ; @.str.46
	.asciz	"exec"

l_.str.47:                              ; @.str.47
	.asciz	"debug-proc"

l_.str.48:                              ; @.str.48
	.asciz	"reduce"

l_.str.49:                              ; @.str.49
	.asciz	"[\033[1;31mERROR\033[0m] Usage: %s <filename>\n"

l_.src.50:                              ; @.src.50
	.asciz	"src/c-interp/main.c"

	.globl	_filename                       ; @filename
.zerofill __DATA,__common,_filename,8,3
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	14                              ; DW_FORM_strp
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\202|"                         ; DW_AT_LLVM_sysroot
	.byte	14                              ; DW_FORM_strp
	.ascii	"\357\177"                      ; DW_AT_APPLE_sdk
	.byte	14                              ; DW_FORM_strp
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	14                              ; DW_FORM_strp
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	23                              ; DW_TAG_union_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	24                              ; DW_TAG_unspecified_parameters
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	4                               ; DW_TAG_enumeration_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	40                              ; DW_TAG_enumerator
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	28                              ; DW_AT_const_value
	.byte	15                              ; DW_FORM_udata
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	4                               ; DWARF version number
.set Lset1, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset1
	.byte	8                               ; Address Size (in bytes)
	.byte	1                               ; Abbrev [1] 0xb:0x66b DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	29                              ; DW_AT_language
	.long	30                              ; DW_AT_name
	.long	50                              ; DW_AT_LLVM_sysroot
	.long	104                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	117                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end2-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str
	.byte	3                               ; Abbrev [3] 0x43:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x48:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	2                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x4f:0x7 DW_TAG_base_type
	.long	165                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x56:0x7 DW_TAG_base_type
	.long	170                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	2                               ; Abbrev [2] 0x5d:0x11 DW_TAG_variable
	.long	110                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.1
	.byte	3                               ; Abbrev [3] 0x6e:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x73:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	30                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x7a:0x11 DW_TAG_variable
	.long	139                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.2
	.byte	3                               ; Abbrev [3] 0x8b:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x90:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	17                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x97:0x11 DW_TAG_variable
	.long	168                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.3
	.byte	3                               ; Abbrev [3] 0xa8:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xad:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	6                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xb4:0x11 DW_TAG_variable
	.long	197                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.4
	.byte	3                               ; Abbrev [3] 0xc5:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xca:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	5                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xd1:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.5
	.byte	3                               ; Abbrev [3] 0xe2:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0xe7:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	3                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0xee:0x11 DW_TAG_variable
	.long	255                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.6
	.byte	3                               ; Abbrev [3] 0xff:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x104:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	8                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x10b:0x11 DW_TAG_variable
	.long	197                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.7
	.byte	2                               ; Abbrev [2] 0x11c:0x11 DW_TAG_variable
	.long	255                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	17                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.8
	.byte	2                               ; Abbrev [2] 0x12d:0x11 DW_TAG_variable
	.long	197                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	18                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.9
	.byte	2                               ; Abbrev [2] 0x13e:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.10
	.byte	2                               ; Abbrev [2] 0x14f:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.11
	.byte	2                               ; Abbrev [2] 0x160:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.12
	.byte	2                               ; Abbrev [2] 0x171:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.13
	.byte	2                               ; Abbrev [2] 0x182:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	25                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.14
	.byte	2                               ; Abbrev [2] 0x193:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.15
	.byte	2                               ; Abbrev [2] 0x1a4:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.16
	.byte	2                               ; Abbrev [2] 0x1b5:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.17
	.byte	2                               ; Abbrev [2] 0x1c6:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.18
	.byte	2                               ; Abbrev [2] 0x1d7:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.19
	.byte	2                               ; Abbrev [2] 0x1e8:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.20
	.byte	2                               ; Abbrev [2] 0x1f9:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.21
	.byte	2                               ; Abbrev [2] 0x20a:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	35                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.22
	.byte	2                               ; Abbrev [2] 0x21b:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.23
	.byte	2                               ; Abbrev [2] 0x22c:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.24
	.byte	2                               ; Abbrev [2] 0x23d:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.25
	.byte	2                               ; Abbrev [2] 0x24e:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	39                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.26
	.byte	2                               ; Abbrev [2] 0x25f:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.27
	.byte	2                               ; Abbrev [2] 0x270:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.28
	.byte	2                               ; Abbrev [2] 0x281:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.29
	.byte	2                               ; Abbrev [2] 0x292:0x11 DW_TAG_variable
	.long	168                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.30
	.byte	2                               ; Abbrev [2] 0x2a3:0x11 DW_TAG_variable
	.long	197                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.31
	.byte	2                               ; Abbrev [2] 0x2b4:0x11 DW_TAG_variable
	.long	709                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.32
	.byte	3                               ; Abbrev [3] 0x2c5:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2ca:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x2d1:0x11 DW_TAG_variable
	.long	738                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.33
	.byte	3                               ; Abbrev [3] 0x2e2:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2e7:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	11                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x2ee:0x11 DW_TAG_variable
	.long	738                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.34
	.byte	2                               ; Abbrev [2] 0x2ff:0x11 DW_TAG_variable
	.long	168                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.35
	.byte	2                               ; Abbrev [2] 0x310:0x11 DW_TAG_variable
	.long	168                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.36
	.byte	2                               ; Abbrev [2] 0x321:0x11 DW_TAG_variable
	.long	255                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.37
	.byte	2                               ; Abbrev [2] 0x332:0x11 DW_TAG_variable
	.long	835                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	55                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.38
	.byte	3                               ; Abbrev [3] 0x343:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x348:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	4                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x34f:0x11 DW_TAG_variable
	.long	835                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.39
	.byte	2                               ; Abbrev [2] 0x360:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	58                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.40
	.byte	2                               ; Abbrev [2] 0x371:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.41
	.byte	2                               ; Abbrev [2] 0x382:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.42
	.byte	2                               ; Abbrev [2] 0x393:0x11 DW_TAG_variable
	.long	67                              ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.43
	.byte	2                               ; Abbrev [2] 0x3a4:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.44
	.byte	2                               ; Abbrev [2] 0x3b5:0x11 DW_TAG_variable
	.long	226                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	63                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.45
	.byte	2                               ; Abbrev [2] 0x3c6:0x11 DW_TAG_variable
	.long	197                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.46
	.byte	2                               ; Abbrev [2] 0x3d7:0x11 DW_TAG_variable
	.long	738                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.47
	.byte	2                               ; Abbrev [2] 0x3e8:0x11 DW_TAG_variable
	.long	709                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	67                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.48
	.byte	2                               ; Abbrev [2] 0x3f9:0x11 DW_TAG_variable
	.long	1034                            ; DW_AT_type
	.byte	3                               ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	l_.str.49
	.byte	3                               ; Abbrev [3] 0x40a:0xc DW_TAG_array_type
	.long	79                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x40f:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	41                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x416:0x15 DW_TAG_variable
	.long	190                             ; DW_AT_name
	.long	1067                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	2                               ; DW_AT_decl_file
	.byte	6                               ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	_env
	.byte	8                               ; Abbrev [8] 0x42b:0x5 DW_TAG_pointer_type
	.long	1072                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x430:0xb DW_TAG_typedef
	.long	1083                            ; DW_AT_type
	.long	194                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.byte	10                              ; Abbrev [10] 0x43b:0x23 DW_TAG_structure_type
	.long	194                             ; DW_AT_name
	.short	808                             ; DW_AT_byte_size
	.byte	4                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x444:0xc DW_TAG_member
	.long	205                             ; DW_AT_name
	.long	1118                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	39                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	12                              ; Abbrev [12] 0x450:0xd DW_TAG_member
	.long	454                             ; DW_AT_name
	.long	1469                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
	.short	800                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x45e:0xc DW_TAG_array_type
	.long	1130                            ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x463:0x6 DW_TAG_subrange_type
	.long	86                              ; DW_AT_type
	.byte	100                             ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x46a:0x5 DW_TAG_pointer_type
	.long	1135                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x46f:0xb DW_TAG_typedef
	.long	1146                            ; DW_AT_type
	.long	211                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x47a:0x39 DW_TAG_structure_type
	.long	211                             ; DW_AT_name
	.byte	32                              ; DW_AT_byte_size
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x482:0xc DW_TAG_member
	.long	217                             ; DW_AT_name
	.long	1203                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x48e:0xc DW_TAG_member
	.long	221                             ; DW_AT_name
	.long	1208                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	33                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x49a:0xc DW_TAG_member
	.long	412                             ; DW_AT_name
	.long	1426                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x4a6:0xc DW_TAG_member
	.long	454                             ; DW_AT_name
	.long	1464                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	35                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x4b3:0x5 DW_TAG_pointer_type
	.long	79                              ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x4b8:0xb DW_TAG_typedef
	.long	1219                            ; DW_AT_type
	.long	227                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x4c3:0x71 DW_TAG_union_type
	.byte	8                               ; DW_AT_byte_size
	.byte	4                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x4c7:0xc DW_TAG_member
	.long	233                             ; DW_AT_name
	.long	79                              ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x4d3:0xc DW_TAG_member
	.long	243                             ; DW_AT_name
	.long	1332                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x4df:0xc DW_TAG_member
	.long	260                             ; DW_AT_name
	.long	1339                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x4eb:0xc DW_TAG_member
	.long	273                             ; DW_AT_name
	.long	1346                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x4f7:0xc DW_TAG_member
	.long	288                             ; DW_AT_name
	.long	1353                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x503:0xc DW_TAG_member
	.long	306                             ; DW_AT_name
	.long	1360                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	25                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x50f:0xc DW_TAG_member
	.long	319                             ; DW_AT_name
	.long	1203                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x51b:0xc DW_TAG_member
	.long	331                             ; DW_AT_name
	.long	1361                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	11                              ; Abbrev [11] 0x527:0xc DW_TAG_member
	.long	346                             ; DW_AT_name
	.long	1369                            ; DW_AT_type
	.byte	4                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x534:0x7 DW_TAG_base_type
	.long	254                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x53b:0x7 DW_TAG_base_type
	.long	269                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x542:0x7 DW_TAG_base_type
	.long	283                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x549:0x7 DW_TAG_base_type
	.long	299                             ; DW_AT_name
	.byte	4                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	15                              ; Abbrev [15] 0x550:0x1 DW_TAG_pointer_type
	.byte	8                               ; Abbrev [8] 0x551:0x5 DW_TAG_pointer_type
	.long	1366                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x556:0x3 DW_TAG_subroutine_type
	.byte	17                              ; Abbrev [17] 0x557:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x559:0xb DW_TAG_typedef
	.long	1380                            ; DW_AT_type
	.long	357                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x564:0x27 DW_TAG_enumeration_type
	.long	1419                            ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	5                               ; DW_AT_decl_file
	.byte	4                               ; DW_AT_decl_line
	.byte	19                              ; Abbrev [19] 0x56c:0x6 DW_TAG_enumerator
	.long	380                             ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x572:0x6 DW_TAG_enumerator
	.long	388                             ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x578:0x6 DW_TAG_enumerator
	.long	394                             ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x57e:0x6 DW_TAG_enumerator
	.long	399                             ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x584:0x6 DW_TAG_enumerator
	.long	405                             ; DW_AT_name
	.byte	4                               ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x58b:0x7 DW_TAG_base_type
	.long	367                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0x592:0xb DW_TAG_typedef
	.long	1437                            ; DW_AT_type
	.long	417                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	17                              ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x59d:0x1b DW_TAG_enumeration_type
	.long	1419                            ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	4                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	19                              ; Abbrev [19] 0x5a5:0x6 DW_TAG_enumerator
	.long	429                             ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x5ab:0x6 DW_TAG_enumerator
	.long	439                             ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	19                              ; Abbrev [19] 0x5b1:0x6 DW_TAG_enumerator
	.long	446                             ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x5b8:0x5 DW_TAG_pointer_type
	.long	1146                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x5bd:0x5 DW_TAG_pointer_type
	.long	1083                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x5c2:0x15 DW_TAG_variable
	.long	459                             ; DW_AT_name
	.long	1203                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	3                               ; DW_AT_decl_file
	.byte	8                               ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	_filename
	.byte	20                              ; Abbrev [20] 0x5d7:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset4
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	468                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	18                              ; DW_AT_decl_line
                                        ; DW_AT_external
	.byte	21                              ; Abbrev [21] 0x5ec:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	484                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.long	1208                            ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x5fa:0x2a DW_TAG_lexical_block
	.quad	Ltmp2                           ; DW_AT_low_pc
.set Lset5, Ltmp11-Ltmp2                ; DW_AT_high_pc
	.long	Lset5
	.byte	21                              ; Abbrev [21] 0x607:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	488                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	35                              ; DW_AT_decl_line
	.long	1203                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x615:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.long	493                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.long	1130                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x625:0x15 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset6, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset6
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	473                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	8                               ; DW_AT_decl_line
                                        ; DW_AT_external
	.byte	24                              ; Abbrev [24] 0x63a:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset7, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset7
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	479                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1339                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	25                              ; Abbrev [25] 0x653:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	499                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.long	1339                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x661:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	504                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.long	1648                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x670:0x5 DW_TAG_pointer_type
	.long	1203                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Homebrew clang version 18.1.6" ; string offset=0
	.asciz	"src/c-interp/main.c"           ; string offset=30
	.asciz	"/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk" ; string offset=50
	.asciz	"MacOSX14.sdk"                  ; string offset=104
	.asciz	"/Users/voltaire/code/hobby/programming-language" ; string offset=117
	.asciz	"char"                          ; string offset=165
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=170
	.asciz	"env"                           ; string offset=190
	.asciz	"Dictionary"                    ; string offset=194
	.asciz	"table"                         ; string offset=205
	.asciz	"Entry"                         ; string offset=211
	.asciz	"key"                           ; string offset=217
	.asciz	"value"                         ; string offset=221
	.asciz	"Value"                         ; string offset=227
	.asciz	"charValue"                     ; string offset=233
	.asciz	"shortValue"                    ; string offset=243
	.asciz	"short"                         ; string offset=254
	.asciz	"intValue"                      ; string offset=260
	.asciz	"int"                           ; string offset=269
	.asciz	"longValue"                     ; string offset=273
	.asciz	"long"                          ; string offset=283
	.asciz	"floatValue"                    ; string offset=288
	.asciz	"double"                        ; string offset=299
	.asciz	"pointerValue"                  ; string offset=306
	.asciz	"stringValue"                   ; string offset=319
	.asciz	"procedureValue"                ; string offset=331
	.asciz	"token_type"                    ; string offset=346
	.asciz	"TokenType"                     ; string offset=357
	.asciz	"unsigned int"                  ; string offset=367
	.asciz	"INTEGER"                       ; string offset=380
	.asciz	"FLOAT"                         ; string offset=388
	.asciz	"CHAR"                          ; string offset=394
	.asciz	"QUOTE"                         ; string offset=399
	.asciz	"SYMBOL"                        ; string offset=405
	.asciz	"type"                          ; string offset=412
	.asciz	"PointerType"                   ; string offset=417
	.asciz	"PROCEDURE"                     ; string offset=429
	.asciz	"STRING"                        ; string offset=439
	.asciz	"NEITHER"                       ; string offset=446
	.asciz	"next"                          ; string offset=454
	.asciz	"filename"                      ; string offset=459
	.asciz	"eval"                          ; string offset=468
	.asciz	"setup"                         ; string offset=473
	.asciz	"main"                          ; string offset=479
	.asciz	"val"                           ; string offset=484
	.asciz	"temp"                          ; string offset=488
	.asciz	"entry"                         ; string offset=493
	.asciz	"argc"                          ; string offset=499
	.asciz	"argv"                          ; string offset=504
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	5                               ; Header Bucket Count
	.long	5                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.long	0                               ; Bucket 1
	.long	-1                              ; Bucket 2
	.long	2                               ; Bucket 3
	.long	4                               ; Bucket 4
	.long	870306406                       ; Hash in Bucket 1
	.long	2090499946                      ; Hash in Bucket 1
	.long	274293078                       ; Hash in Bucket 3
	.long	2090235053                      ; Hash in Bucket 3
	.long	193490734                       ; Hash in Bucket 4
.set Lset8, LNames1-Lnames_begin        ; Offset in Bucket 1
	.long	Lset8
.set Lset9, LNames4-Lnames_begin        ; Offset in Bucket 1
	.long	Lset9
.set Lset10, LNames3-Lnames_begin       ; Offset in Bucket 3
	.long	Lset10
.set Lset11, LNames2-Lnames_begin       ; Offset in Bucket 3
	.long	Lset11
.set Lset12, LNames0-Lnames_begin       ; Offset in Bucket 4
	.long	Lset12
LNames1:
	.long	459                             ; filename
	.long	1                               ; Num DIEs
	.long	1474
	.long	0
LNames4:
	.long	479                             ; main
	.long	1                               ; Num DIEs
	.long	1594
	.long	0
LNames3:
	.long	473                             ; setup
	.long	1                               ; Num DIEs
	.long	1573
	.long	0
LNames2:
	.long	468                             ; eval
	.long	1                               ; Num DIEs
	.long	1495
	.long	0
LNames0:
	.long	190                             ; env
	.long	1                               ; Num DIEs
	.long	1046
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	0                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	0                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	12                              ; Header Bucket Count
	.long	12                              ; Header Hash Count
	.long	20                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	3                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.short	3                               ; DW_ATOM_die_tag
	.short	5                               ; DW_FORM_data2
	.short	4                               ; DW_ATOM_type_flags
	.short	11                              ; DW_FORM_data1
	.long	-1                              ; Bucket 0
	.long	0                               ; Bucket 1
	.long	-1                              ; Bucket 2
	.long	1                               ; Bucket 3
	.long	2                               ; Bucket 4
	.long	4                               ; Bucket 5
	.long	-1                              ; Bucket 6
	.long	5                               ; Bucket 7
	.long	6                               ; Bucket 8
	.long	8                               ; Bucket 9
	.long	9                               ; Bucket 10
	.long	10                              ; Bucket 11
	.long	274395349                       ; Hash in Bucket 1
	.long	220064055                       ; Hash in Bucket 3
	.long	2038875496                      ; Hash in Bucket 4
	.long	-113419488                      ; Hash in Bucket 4
	.long	-1304652851                     ; Hash in Bucket 5
	.long	1264838491                      ; Hash in Bucket 7
	.long	193495088                       ; Hash in Bucket 8
	.long	-1146879608                     ; Hash in Bucket 8
	.long	2090479413                      ; Hash in Bucket 9
	.long	239748898                       ; Hash in Bucket 10
	.long	2090147939                      ; Hash in Bucket 11
	.long	-594775205                      ; Hash in Bucket 11
.set Lset13, Ltypes5-Ltypes_begin       ; Offset in Bucket 1
	.long	Lset13
.set Lset14, Ltypes3-Ltypes_begin       ; Offset in Bucket 3
	.long	Lset14
.set Lset15, Ltypes11-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset15
.set Lset16, Ltypes8-Ltypes_begin       ; Offset in Bucket 4
	.long	Lset16
.set Lset17, Ltypes10-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset17
.set Lset18, Ltypes2-Ltypes_begin       ; Offset in Bucket 7
	.long	Lset18
.set Lset19, Ltypes6-Ltypes_begin       ; Offset in Bucket 8
	.long	Lset19
.set Lset20, Ltypes9-Ltypes_begin       ; Offset in Bucket 8
	.long	Lset20
.set Lset21, Ltypes7-Ltypes_begin       ; Offset in Bucket 9
	.long	Lset21
.set Lset22, Ltypes4-Ltypes_begin       ; Offset in Bucket 10
	.long	Lset22
.set Lset23, Ltypes0-Ltypes_begin       ; Offset in Bucket 11
	.long	Lset23
.set Lset24, Ltypes1-Ltypes_begin       ; Offset in Bucket 11
	.long	Lset24
Ltypes5:
	.long	254                             ; short
	.long	1                               ; Num DIEs
	.long	1332
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	211                             ; Entry
	.long	2                               ; Num DIEs
	.long	1135
	.short	22
	.byte	0
	.long	1146
	.short	19
	.byte	0
	.long	0
Ltypes11:
	.long	417                             ; PointerType
	.long	1                               ; Num DIEs
	.long	1426
	.short	22
	.byte	0
	.long	0
Ltypes8:
	.long	299                             ; double
	.long	1                               ; Num DIEs
	.long	1353
	.short	36
	.byte	0
	.long	0
Ltypes10:
	.long	367                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	1419
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	194                             ; Dictionary
	.long	2                               ; Num DIEs
	.long	1072
	.short	22
	.byte	0
	.long	1083
	.short	19
	.byte	0
	.long	0
Ltypes6:
	.long	269                             ; int
	.long	1                               ; Num DIEs
	.long	1339
	.short	36
	.byte	0
	.long	0
Ltypes9:
	.long	357                             ; TokenType
	.long	1                               ; Num DIEs
	.long	1369
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	283                             ; long
	.long	1                               ; Num DIEs
	.long	1346
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	227                             ; Value
	.long	1                               ; Num DIEs
	.long	1208
	.short	22
	.byte	0
	.long	0
Ltypes0:
	.long	165                             ; char
	.long	1                               ; Num DIEs
	.long	79
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	170                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	86
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
