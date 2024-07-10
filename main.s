
a.out:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000874 <_eval>:
100000874: d10103ff    	sub	sp, sp, #64
100000878: a9037bfd    	stp	x29, x30, [sp, #48]
10000087c: 9100c3fd    	add	x29, sp, #48
100000880: 90000048    	adrp	x8, 0x100008000 <_eval+0x2c>
100000884: 91000108    	add	x8, x8, #0
100000888: f90007e8    	str	x8, [sp, #8]
10000088c: 90000048    	adrp	x8, 0x100008000 <_eval+0x38>
100000890: 9100a108    	add	x8, x8, #40
100000894: b9400108    	ldr	w8, [x8]
100000898: 71000108    	subs	w8, w8, #0
10000089c: f9000be8    	str	x8, [sp, #16]
1000008a0: f1000d08    	subs	x8, x8, #3
1000008a4: 1a9f97e8    	cset	w8, hi
1000008a8: 37000848    	tbnz	w8, #0, 0x1000009b0 <_eval+0x13c>
1000008ac: f9400beb    	ldr	x11, [sp, #16]
1000008b0: 9000000a    	adrp	x10, 0x100000000 <_eval+0x3c>
1000008b4: 9126f14a    	add	x10, x10, #2492
1000008b8: 10000008    	adr	x8, #0
1000008bc: b8ab7949    	ldrsw	x9, [x10, x11, lsl #2]
1000008c0: 8b090108    	add	x8, x8, x9
1000008c4: d61f0100    	br	x8
1000008c8: 90000048    	adrp	x8, 0x100008000 <_eval+0x74>
1000008cc: 91002108    	add	x8, x8, #8
1000008d0: f9400108    	ldr	x8, [x8]
1000008d4: 90000049    	adrp	x9, 0x100008000 <_eval+0x80>
1000008d8: 91006129    	add	x9, x9, #24
1000008dc: f9400129    	ldr	x9, [x9]
1000008e0: 8b090100    	add	x0, x8, x9
1000008e4: 94000cdc    	bl	0x100003c54 <_vfprintf+0x100003c54>
1000008e8: f94007e8    	ldr	x8, [sp, #8]
1000008ec: aa0003e9    	mov	x9, x0
1000008f0: 93407d29    	sxtw	x9, w9
1000008f4: f81f83a9    	stur	x9, [x29, #-8]
1000008f8: f9400100    	ldr	x0, [x8]
1000008fc: f85f83a2    	ldur	x2, [x29, #-8]
100000900: f0000001    	adrp	x1, 0x100003000 <_eval+0x98>
100000904: 9134e021    	add	x1, x1, #3384
100000908: 9400024f    	bl	0x100001244 <_upsert>
10000090c: 14000029    	b	0x1000009b0 <_eval+0x13c>
100000910: 90000048    	adrp	x8, 0x100008000 <_eval+0xbc>
100000914: 91002108    	add	x8, x8, #8
100000918: f9400108    	ldr	x8, [x8]
10000091c: 90000049    	adrp	x9, 0x100008000 <_eval+0xc8>
100000920: 91006129    	add	x9, x9, #24
100000924: f9400129    	ldr	x9, [x9]
100000928: 8b090100    	add	x0, x8, x9
10000092c: 94000cc7    	bl	0x100003c48 <_vfprintf+0x100003c48>
100000930: f94007e8    	ldr	x8, [sp, #8]
100000934: fc1f83a0    	stur	d0, [x29, #-8]
100000938: f9400100    	ldr	x0, [x8]
10000093c: f85f83a2    	ldur	x2, [x29, #-8]
100000940: f0000001    	adrp	x1, 0x100003000 <_eval+0xd8>
100000944: 9134e021    	add	x1, x1, #3384
100000948: 9400023f    	bl	0x100001244 <_upsert>
10000094c: 14000019    	b	0x1000009b0 <_eval+0x13c>
100000950: 14000018    	b	0x1000009b0 <_eval+0x13c>
100000954: d10043a0    	sub	x0, x29, #16
100000958: 9400013f    	bl	0x100000e54 <_symbolcpy>
10000095c: f94007e8    	ldr	x8, [sp, #8]
100000960: f9400100    	ldr	x0, [x8]
100000964: f85f03a1    	ldur	x1, [x29, #-16]
100000968: 94000206    	bl	0x100001180 <_lookup>
10000096c: f9000fe0    	str	x0, [sp, #24]
100000970: f9400fe8    	ldr	x8, [sp, #24]
100000974: f1000108    	subs	x8, x8, #0
100000978: 1a9f07e8    	cset	w8, ne
10000097c: 37000128    	tbnz	w8, #0, 0x1000009a0 <_eval+0x12c>
100000980: 14000001    	b	0x100000984 <_eval+0x110>
100000984: f85f03a8    	ldur	x8, [x29, #-16]
100000988: 910003e9    	mov	x9, sp
10000098c: f9000128    	str	x8, [x9]
100000990: f0000000    	adrp	x0, 0x100003000 <_eval+0x128>
100000994: 9134e800    	add	x0, x0, #3386
100000998: 94000087    	bl	0x100000bb4 <_error>
10000099c: 14000001    	b	0x1000009a0 <_eval+0x12c>
1000009a0: f9400fe8    	ldr	x8, [sp, #24]
1000009a4: f9400508    	ldr	x8, [x8, #8]
1000009a8: d63f0100    	blr	x8
1000009ac: 14000001    	b	0x1000009b0 <_eval+0x13c>
1000009b0: a9437bfd    	ldp	x29, x30, [sp, #48]
1000009b4: 910103ff    	add	sp, sp, #64
1000009b8: d65f03c0    	ret
1000009bc: 00000010    	udf	#16
1000009c0: 00000058    	udf	#88
1000009c4: 00000098    	udf	#152
1000009c8: 0000009c    	udf	#156

00000001000009cc <_setup>:
1000009cc: d10083ff    	sub	sp, sp, #32
1000009d0: a9017bfd    	stp	x29, x30, [sp, #16]
1000009d4: 910043fd    	add	x29, sp, #16
1000009d8: 90000048    	adrp	x8, 0x100008000 <_setup+0x2c>
1000009dc: 91000108    	add	x8, x8, #0
1000009e0: f90003e8    	str	x8, [sp]
1000009e4: 940002aa    	bl	0x10000148c <_create_dictionary>
1000009e8: f94003e8    	ldr	x8, [sp]
1000009ec: f9000100    	str	x0, [x8]
1000009f0: b0000009    	adrp	x9, 0x100001000 <_setup+0x28>
1000009f4: 911eb129    	add	x9, x9, #1964
1000009f8: f90007e9    	str	x9, [sp, #8]
1000009fc: f9400100    	ldr	x0, [x8]
100000a00: f94007e2    	ldr	x2, [sp, #8]
100000a04: f0000001    	adrp	x1, 0x100003000 <_setup+0x44>
100000a08: 91354821    	add	x1, x1, #3410
100000a0c: 9400020e    	bl	0x100001244 <_upsert>
100000a10: f94003e8    	ldr	x8, [sp]
100000a14: b0000009    	adrp	x9, 0x100001000 <_setup+0x4c>
100000a18: 912e2129    	add	x9, x9, #2952
100000a1c: f90007e9    	str	x9, [sp, #8]
100000a20: f9400100    	ldr	x0, [x8]
100000a24: f94007e2    	ldr	x2, [sp, #8]
100000a28: f0000001    	adrp	x1, 0x100003000 <_setup+0x68>
100000a2c: 91356021    	add	x1, x1, #3416
100000a30: 94000205    	bl	0x100001244 <_upsert>
100000a34: f94003e8    	ldr	x8, [sp]
100000a38: b0000009    	adrp	x9, 0x100001000 <_setup+0x70>
100000a3c: 913d0129    	add	x9, x9, #3904
100000a40: f90007e9    	str	x9, [sp, #8]
100000a44: f9400100    	ldr	x0, [x8]
100000a48: f94007e2    	ldr	x2, [sp, #8]
100000a4c: f0000001    	adrp	x1, 0x100003000 <_setup+0x8c>
100000a50: 91357421    	add	x1, x1, #3421
100000a54: 940001fc    	bl	0x100001244 <_upsert>
100000a58: f94003e8    	ldr	x8, [sp]
100000a5c: b0000009    	adrp	x9, 0x100001000 <_setup+0x94>
100000a60: 913fc129    	add	x9, x9, #4080
100000a64: f90007e9    	str	x9, [sp, #8]
100000a68: f9400100    	ldr	x0, [x8]
100000a6c: f94007e2    	ldr	x2, [sp, #8]
100000a70: f0000001    	adrp	x1, 0x100003000 <_setup+0xb0>
100000a74: 91358821    	add	x1, x1, #3426
100000a78: 940001f3    	bl	0x100001244 <_upsert>
100000a7c: f94003e8    	ldr	x8, [sp]
100000a80: d0000009    	adrp	x9, 0x100002000 <_setup+0xbc>
100000a84: 91085129    	add	x9, x9, #532
100000a88: f90007e9    	str	x9, [sp, #8]
100000a8c: f9400100    	ldr	x0, [x8]
100000a90: f94007e2    	ldr	x2, [sp, #8]
100000a94: f0000001    	adrp	x1, 0x100003000 <_setup+0xd4>
100000a98: 91359421    	add	x1, x1, #3429
100000a9c: 940001ea    	bl	0x100001244 <_upsert>
100000aa0: f94003e8    	ldr	x8, [sp]
100000aa4: d0000009    	adrp	x9, 0x100002000 <_setup+0xe0>
100000aa8: 9111e129    	add	x9, x9, #1144
100000aac: f90007e9    	str	x9, [sp, #8]
100000ab0: f9400100    	ldr	x0, [x8]
100000ab4: f94007e2    	ldr	x2, [sp, #8]
100000ab8: f0000001    	adrp	x1, 0x100003000 <_setup+0xf8>
100000abc: 9135a821    	add	x1, x1, #3434
100000ac0: 940001e1    	bl	0x100001244 <_upsert>
100000ac4: f94003e8    	ldr	x8, [sp]
100000ac8: d0000009    	adrp	x9, 0x100002000 <_setup+0x104>
100000acc: 91254129    	add	x9, x9, #2384
100000ad0: f90007e9    	str	x9, [sp, #8]
100000ad4: f9400100    	ldr	x0, [x8]
100000ad8: f94007e2    	ldr	x2, [sp, #8]
100000adc: f0000001    	adrp	x1, 0x100003000 <_setup+0x11c>
100000ae0: 9135c821    	add	x1, x1, #3442
100000ae4: 940001d8    	bl	0x100001244 <_upsert>
100000ae8: f94003e8    	ldr	x8, [sp]
100000aec: d0000009    	adrp	x9, 0x100002000 <_setup+0x128>
100000af0: 9136b129    	add	x9, x9, #3500
100000af4: f90007e9    	str	x9, [sp, #8]
100000af8: f9400100    	ldr	x0, [x8]
100000afc: f94007e2    	ldr	x2, [sp, #8]
100000b00: f0000001    	adrp	x1, 0x100003000 <_setup+0x140>
100000b04: 9135dc21    	add	x1, x1, #3447
100000b08: 940001cf    	bl	0x100001244 <_upsert>
100000b0c: f94003e8    	ldr	x8, [sp]
100000b10: f0000009    	adrp	x9, 0x100003000 <_setup+0x150>
100000b14: 9110a129    	add	x9, x9, #1064
100000b18: f90007e9    	str	x9, [sp, #8]
100000b1c: f9400100    	ldr	x0, [x8]
100000b20: f94007e2    	ldr	x2, [sp, #8]
100000b24: f0000001    	adrp	x1, 0x100003000 <_setup+0x164>
100000b28: 9135f421    	add	x1, x1, #3453
100000b2c: 940001c6    	bl	0x100001244 <_upsert>
100000b30: a9417bfd    	ldp	x29, x30, [sp, #16]
100000b34: 910083ff    	add	sp, sp, #32
100000b38: d65f03c0    	ret

0000000100000b3c <_main>:
100000b3c: d100c3ff    	sub	sp, sp, #48
100000b40: a9027bfd    	stp	x29, x30, [sp, #32]
100000b44: 910083fd    	add	x29, sp, #32
100000b48: b81fc3bf    	stur	wzr, [x29, #-4]
100000b4c: b81f83a0    	stur	w0, [x29, #-8]
100000b50: f9000be1    	str	x1, [sp, #16]
100000b54: b85f83a8    	ldur	w8, [x29, #-8]
100000b58: 71000908    	subs	w8, w8, #2
100000b5c: 1a9fb7e8    	cset	w8, ge
100000b60: 370001a8    	tbnz	w8, #0, 0x100000b94 <_main+0x58>
100000b64: 14000001    	b	0x100000b68 <_main+0x2c>
100000b68: f9400be8    	ldr	x8, [sp, #16]
100000b6c: f9400108    	ldr	x8, [x8]
100000b70: 910003e9    	mov	x9, sp
100000b74: f9000128    	str	x8, [x9]
100000b78: f0000000    	adrp	x0, 0x100003000 <_main+0x48>
100000b7c: 91362000    	add	x0, x0, #3464
100000b80: 94000c5c    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
100000b84: 52800020    	mov	w0, #1
100000b88: a9427bfd    	ldp	x29, x30, [sp, #32]
100000b8c: 9100c3ff    	add	sp, sp, #48
100000b90: d65f03c0    	ret
100000b94: f9400be8    	ldr	x8, [sp, #16]
100000b98: f9400500    	ldr	x0, [x8, #8]
100000b9c: 94000020    	bl	0x100000c1c <_readFileContent>
100000ba0: 97ffff8b    	bl	0x1000009cc <_setup>
100000ba4: 14000001    	b	0x100000ba8 <_main+0x6c>
100000ba8: 94000ade    	bl	0x100003720 <_parse>
100000bac: 97ffff32    	bl	0x100000874 <_eval>
100000bb0: 17fffffe    	b	0x100000ba8 <_main+0x6c>

0000000100000bb4 <_error>:
100000bb4: d100c3ff    	sub	sp, sp, #48
100000bb8: a9027bfd    	stp	x29, x30, [sp, #32]
100000bbc: 910083fd    	add	x29, sp, #32
100000bc0: 90000028    	adrp	x8, 0x100004000 <_error+0x1c>
100000bc4: f9400108    	ldr	x8, [x8]
100000bc8: f90007e8    	str	x8, [sp, #8]
100000bcc: f81f83a0    	stur	x0, [x29, #-8]
100000bd0: 910043ea    	add	x10, sp, #16
100000bd4: 910043a9    	add	x9, x29, #16
100000bd8: f9000149    	str	x9, [x10]
100000bdc: f9400100    	ldr	x0, [x8]
100000be0: f0000001    	adrp	x1, 0x100003000 <_error+0x38>
100000be4: 9136c421    	add	x1, x1, #3505
100000be8: 94000c2a    	bl	0x100003c90 <_vfprintf+0x100003c90>
100000bec: f94007e8    	ldr	x8, [sp, #8]
100000bf0: f9400100    	ldr	x0, [x8]
100000bf4: f85f83a1    	ldur	x1, [x29, #-8]
100000bf8: f9400be2    	ldr	x2, [sp, #16]
100000bfc: 94000c4c    	bl	0x100003d2c <_vfprintf+0x100003d2c>
100000c00: f94007e8    	ldr	x8, [sp, #8]
100000c04: f9400100    	ldr	x0, [x8]
100000c08: f0000001    	adrp	x1, 0x100003000 <_error+0x60>
100000c0c: 91371421    	add	x1, x1, #3525
100000c10: 94000c20    	bl	0x100003c90 <_vfprintf+0x100003c90>
100000c14: 52800020    	mov	w0, #1
100000c18: 94000c15    	bl	0x100003c6c <_vfprintf+0x100003c6c>

0000000100000c1c <_readFileContent>:
100000c1c: d10143ff    	sub	sp, sp, #80
100000c20: a9047bfd    	stp	x29, x30, [sp, #64]
100000c24: 910103fd    	add	x29, sp, #64
100000c28: f81f83a0    	stur	x0, [x29, #-8]
100000c2c: f85f83a0    	ldur	x0, [x29, #-8]
100000c30: f0000001    	adrp	x1, 0x100003000 <_readFileContent+0x20>
100000c34: 91371c21    	add	x1, x1, #3527
100000c38: 94000c13    	bl	0x100003c84 <_vfprintf+0x100003c84>
100000c3c: f81f03a0    	stur	x0, [x29, #-16]
100000c40: f85f03a8    	ldur	x8, [x29, #-16]
100000c44: f1000108    	subs	x8, x8, #0
100000c48: 1a9f07e8    	cset	w8, ne
100000c4c: 37000128    	tbnz	w8, #0, 0x100000c70 <_readFileContent+0x54>
100000c50: 14000001    	b	0x100000c54 <_readFileContent+0x38>
100000c54: f85f83a8    	ldur	x8, [x29, #-8]
100000c58: 910003e9    	mov	x9, sp
100000c5c: f9000128    	str	x8, [x9]
100000c60: f0000000    	adrp	x0, 0x100003000 <_readFileContent+0x50>
100000c64: 91372400    	add	x0, x0, #3529
100000c68: 97ffffd3    	bl	0x100000bb4 <_error>
100000c6c: 14000001    	b	0x100000c70 <_readFileContent+0x54>
100000c70: f85f03a0    	ldur	x0, [x29, #-16]
100000c74: d2800001    	mov	x1, #0
100000c78: f90013e1    	str	x1, [sp, #32]
100000c7c: 52800042    	mov	w2, #2
100000c80: 94000c0d    	bl	0x100003cb4 <_vfprintf+0x100003cb4>
100000c84: f85f03a0    	ldur	x0, [x29, #-16]
100000c88: 94000c0e    	bl	0x100003cc0 <_vfprintf+0x100003cc0>
100000c8c: f94013e1    	ldr	x1, [sp, #32]
100000c90: 90000048    	adrp	x8, 0x100008000 <_readFileContent+0x94>
100000c94: f81e83a8    	stur	x8, [x29, #-24]
100000c98: f9000900    	str	x0, [x8, #16]
100000c9c: f85f03a0    	ldur	x0, [x29, #-16]
100000ca0: 52800002    	mov	w2, #0
100000ca4: 94000c04    	bl	0x100003cb4 <_vfprintf+0x100003cb4>
100000ca8: f85e83a8    	ldur	x8, [x29, #-24]
100000cac: f9400908    	ldr	x8, [x8, #16]
100000cb0: 91000500    	add	x0, x8, #1
100000cb4: 94000c0c    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100000cb8: 90000048    	adrp	x8, 0x100008000 <_readFileContent+0xbc>
100000cbc: f9000500    	str	x0, [x8, #8]
100000cc0: f9400508    	ldr	x8, [x8, #8]
100000cc4: f1000108    	subs	x8, x8, #0
100000cc8: 1a9f07e8    	cset	w8, ne
100000ccc: 37000108    	tbnz	w8, #0, 0x100000cec <_readFileContent+0xd0>
100000cd0: 14000001    	b	0x100000cd4 <_readFileContent+0xb8>
100000cd4: f85f03a0    	ldur	x0, [x29, #-16]
100000cd8: 94000be8    	bl	0x100003c78 <_vfprintf+0x100003c78>
100000cdc: f0000000    	adrp	x0, 0x100003000 <_readFileContent+0xcc>
100000ce0: 91379c00    	add	x0, x0, #3559
100000ce4: 97ffffb4    	bl	0x100000bb4 <_error>
100000ce8: 14000001    	b	0x100000cec <_readFileContent+0xd0>
100000cec: 90000048    	adrp	x8, 0x100008000 <_readFileContent+0xf0>
100000cf0: f9000be8    	str	x8, [sp, #16]
100000cf4: f9400500    	ldr	x0, [x8, #8]
100000cf8: 90000048    	adrp	x8, 0x100008000 <_readFileContent+0xfc>
100000cfc: f9000fe8    	str	x8, [sp, #24]
100000d00: f9400902    	ldr	x2, [x8, #16]
100000d04: f85f03a3    	ldur	x3, [x29, #-16]
100000d08: d2800021    	mov	x1, #1
100000d0c: 94000be4    	bl	0x100003c9c <_vfprintf+0x100003c9c>
100000d10: f9400be8    	ldr	x8, [sp, #16]
100000d14: f9400fe9    	ldr	x9, [sp, #24]
100000d18: f9400508    	ldr	x8, [x8, #8]
100000d1c: f9400929    	ldr	x9, [x9, #16]
100000d20: 8b090108    	add	x8, x8, x9
100000d24: 3900011f    	strb	wzr, [x8]
100000d28: f85f03a0    	ldur	x0, [x29, #-16]
100000d2c: 94000bd3    	bl	0x100003c78 <_vfprintf+0x100003c78>
100000d30: a9447bfd    	ldp	x29, x30, [sp, #64]
100000d34: 910143ff    	add	sp, sp, #80
100000d38: d65f03c0    	ret

0000000100000d3c <_printlen>:
100000d3c: d100c3ff    	sub	sp, sp, #48
100000d40: a9027bfd    	stp	x29, x30, [sp, #32]
100000d44: 910083fd    	add	x29, sp, #32
100000d48: f81f83a0    	stur	x0, [x29, #-8]
100000d4c: b81f43a1    	stur	w1, [x29, #-12]
100000d50: f85f83a8    	ldur	x8, [x29, #-8]
100000d54: b89f43a9    	ldursw	x9, [x29, #-12]
100000d58: 8b090108    	add	x8, x8, x9
100000d5c: f90007e8    	str	x8, [sp, #8]
100000d60: 14000001    	b	0x100000d64 <_printlen+0x28>
100000d64: f85f83a8    	ldur	x8, [x29, #-8]
100000d68: f94007e9    	ldr	x9, [sp, #8]
100000d6c: eb090108    	subs	x8, x8, x9
100000d70: 1a9f17e8    	cset	w8, eq
100000d74: 37000148    	tbnz	w8, #0, 0x100000d9c <_printlen+0x60>
100000d78: 14000001    	b	0x100000d7c <_printlen+0x40>
100000d7c: f85f83a8    	ldur	x8, [x29, #-8]
100000d80: 39c00100    	ldrsb	w0, [x8]
100000d84: 94000bde    	bl	0x100003cfc <_vfprintf+0x100003cfc>
100000d88: 14000001    	b	0x100000d8c <_printlen+0x50>
100000d8c: f85f83a8    	ldur	x8, [x29, #-8]
100000d90: 91000508    	add	x8, x8, #1
100000d94: f81f83a8    	stur	x8, [x29, #-8]
100000d98: 17fffff3    	b	0x100000d64 <_printlen+0x28>
100000d9c: a9427bfd    	ldp	x29, x30, [sp, #32]
100000da0: 9100c3ff    	add	sp, sp, #48
100000da4: d65f03c0    	ret

0000000100000da8 <_quotecpy>:
100000da8: d100c3ff    	sub	sp, sp, #48
100000dac: a9027bfd    	stp	x29, x30, [sp, #32]
100000db0: 910083fd    	add	x29, sp, #32
100000db4: f81f83a0    	stur	x0, [x29, #-8]
100000db8: 90000048    	adrp	x8, 0x100008000 <_quotecpy+0x30>
100000dbc: f90007e8    	str	x8, [sp, #8]
100000dc0: f9401108    	ldr	x8, [x8, #32]
100000dc4: 90000049    	adrp	x9, 0x100008000 <_quotecpy+0x3c>
100000dc8: f9000be9    	str	x9, [sp, #16]
100000dcc: f9400d29    	ldr	x9, [x9, #24]
100000dd0: eb090108    	subs	x8, x8, x9
100000dd4: f1000908    	subs	x8, x8, #2
100000dd8: 91000500    	add	x0, x8, #1
100000ddc: 94000bc2    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100000de0: f94007e9    	ldr	x9, [sp, #8]
100000de4: f9400bea    	ldr	x10, [sp, #16]
100000de8: f85f83a8    	ldur	x8, [x29, #-8]
100000dec: f9000100    	str	x0, [x8]
100000df0: f85f83a8    	ldur	x8, [x29, #-8]
100000df4: f9400100    	ldr	x0, [x8]
100000df8: 90000048    	adrp	x8, 0x100008000 <_quotecpy+0x70>
100000dfc: f9400508    	ldr	x8, [x8, #8]
100000e00: f9400d4b    	ldr	x11, [x10, #24]
100000e04: 8b0b0108    	add	x8, x8, x11
100000e08: f9401129    	ldr	x9, [x9, #32]
100000e0c: f9400d4a    	ldr	x10, [x10, #24]
100000e10: eb0a0129    	subs	x9, x9, x10
100000e14: f1000922    	subs	x2, x9, #2
100000e18: 91000501    	add	x1, x8, #1
100000e1c: 92800003    	mov	x3, #-1
100000e20: 94000b87    	bl	0x100003c3c <_vfprintf+0x100003c3c>
100000e24: f94007e9    	ldr	x9, [sp, #8]
100000e28: f9400bea    	ldr	x10, [sp, #16]
100000e2c: f85f83a8    	ldur	x8, [x29, #-8]
100000e30: f9400108    	ldr	x8, [x8]
100000e34: f9401129    	ldr	x9, [x9, #32]
100000e38: f9400d4a    	ldr	x10, [x10, #24]
100000e3c: eb0a0129    	subs	x9, x9, x10
100000e40: 8b090108    	add	x8, x8, x9
100000e44: 3900011f    	strb	wzr, [x8]
100000e48: a9427bfd    	ldp	x29, x30, [sp, #32]
100000e4c: 9100c3ff    	add	sp, sp, #48
100000e50: d65f03c0    	ret

0000000100000e54 <_symbolcpy>:
100000e54: d100c3ff    	sub	sp, sp, #48
100000e58: a9027bfd    	stp	x29, x30, [sp, #32]
100000e5c: 910083fd    	add	x29, sp, #32
100000e60: f81f83a0    	stur	x0, [x29, #-8]
100000e64: 90000048    	adrp	x8, 0x100008000 <_symbolcpy+0x30>
100000e68: f90007e8    	str	x8, [sp, #8]
100000e6c: f9401108    	ldr	x8, [x8, #32]
100000e70: 90000049    	adrp	x9, 0x100008000 <_symbolcpy+0x3c>
100000e74: f9000be9    	str	x9, [sp, #16]
100000e78: f9400d29    	ldr	x9, [x9, #24]
100000e7c: eb090108    	subs	x8, x8, x9
100000e80: 91000500    	add	x0, x8, #1
100000e84: 94000b98    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100000e88: f94007ea    	ldr	x10, [sp, #8]
100000e8c: f9400beb    	ldr	x11, [sp, #16]
100000e90: f85f83a8    	ldur	x8, [x29, #-8]
100000e94: f9000100    	str	x0, [x8]
100000e98: f85f83a8    	ldur	x8, [x29, #-8]
100000e9c: f9400100    	ldr	x0, [x8]
100000ea0: 90000048    	adrp	x8, 0x100008000 <_symbolcpy+0x6c>
100000ea4: f9400508    	ldr	x8, [x8, #8]
100000ea8: f9400d69    	ldr	x9, [x11, #24]
100000eac: f940114a    	ldr	x10, [x10, #32]
100000eb0: f9400d6b    	ldr	x11, [x11, #24]
100000eb4: eb0b0142    	subs	x2, x10, x11
100000eb8: 8b090101    	add	x1, x8, x9
100000ebc: 92800003    	mov	x3, #-1
100000ec0: 94000b5f    	bl	0x100003c3c <_vfprintf+0x100003c3c>
100000ec4: f94007e9    	ldr	x9, [sp, #8]
100000ec8: f9400bea    	ldr	x10, [sp, #16]
100000ecc: f85f83a8    	ldur	x8, [x29, #-8]
100000ed0: f9400108    	ldr	x8, [x8]
100000ed4: f9401129    	ldr	x9, [x9, #32]
100000ed8: f9400d4a    	ldr	x10, [x10, #24]
100000edc: eb0a0129    	subs	x9, x9, x10
100000ee0: 8b090108    	add	x8, x8, x9
100000ee4: 3900011f    	strb	wzr, [x8]
100000ee8: a9427bfd    	ldp	x29, x30, [sp, #32]
100000eec: 9100c3ff    	add	sp, sp, #48
100000ef0: d65f03c0    	ret

0000000100000ef4 <_process_str>:
100000ef4: d100c3ff    	sub	sp, sp, #48
100000ef8: a9027bfd    	stp	x29, x30, [sp, #32]
100000efc: 910083fd    	add	x29, sp, #32
100000f00: f81f83a0    	stur	x0, [x29, #-8]
100000f04: b81f43bf    	stur	wzr, [x29, #-12]
100000f08: b90013ff    	str	wzr, [sp, #16]
100000f0c: 14000001    	b	0x100000f10 <_process_str+0x1c>
100000f10: f85f83a8    	ldur	x8, [x29, #-8]
100000f14: b89f43a9    	ldursw	x9, [x29, #-12]
100000f18: 38e96908    	ldrsb	w8, [x8, x9]
100000f1c: 71000108    	subs	w8, w8, #0
100000f20: 1a9f17e8    	cset	w8, eq
100000f24: 370009e8    	tbnz	w8, #0, 0x100001060 <_process_str+0x16c>
100000f28: 14000001    	b	0x100000f2c <_process_str+0x38>
100000f2c: f85f83a8    	ldur	x8, [x29, #-8]
100000f30: b89f43a9    	ldursw	x9, [x29, #-12]
100000f34: 38e96908    	ldrsb	w8, [x8, x9]
100000f38: 71017108    	subs	w8, w8, #92
100000f3c: 1a9f07e8    	cset	w8, ne
100000f40: 370006e8    	tbnz	w8, #0, 0x10000101c <_process_str+0x128>
100000f44: 14000001    	b	0x100000f48 <_process_str+0x54>
100000f48: b85f43a8    	ldur	w8, [x29, #-12]
100000f4c: 11000508    	add	w8, w8, #1
100000f50: b81f43a8    	stur	w8, [x29, #-12]
100000f54: f85f83a8    	ldur	x8, [x29, #-8]
100000f58: b89f43a9    	ldursw	x9, [x29, #-12]
100000f5c: 38e96908    	ldrsb	w8, [x8, x9]
100000f60: 71016d08    	subs	w8, w8, #91
100000f64: f90007e8    	str	x8, [sp, #8]
100000f68: f1004d08    	subs	x8, x8, #19
100000f6c: 1a9f97e8    	cset	w8, hi
100000f70: 37000408    	tbnz	w8, #0, 0x100000ff0 <_process_str+0xfc>
100000f74: f94007eb    	ldr	x11, [sp, #8]
100000f78: b000000a    	adrp	x10, 0x100001000 <_process_str+0x88>
100000f7c: 9101f14a    	add	x10, x10, #124
100000f80: 10000008    	adr	x8, #0
100000f84: b8ab7949    	ldrsw	x9, [x10, x11, lsl #2]
100000f88: 8b090108    	add	x8, x8, x9
100000f8c: d61f0100    	br	x8
100000f90: f85f83a8    	ldur	x8, [x29, #-8]
100000f94: b98013e9    	ldrsw	x9, [sp, #16]
100000f98: 8b090109    	add	x9, x8, x9
100000f9c: 52800b88    	mov	w8, #92
100000fa0: 39000128    	strb	w8, [x9]
100000fa4: 1400001d    	b	0x100001018 <_process_str+0x124>
100000fa8: f85f83a8    	ldur	x8, [x29, #-8]
100000fac: b98013e9    	ldrsw	x9, [sp, #16]
100000fb0: 8b090109    	add	x9, x8, x9
100000fb4: 52800148    	mov	w8, #10
100000fb8: 39000128    	strb	w8, [x9]
100000fbc: 14000017    	b	0x100001018 <_process_str+0x124>
100000fc0: f85f83a8    	ldur	x8, [x29, #-8]
100000fc4: b98013e9    	ldrsw	x9, [sp, #16]
100000fc8: 8b090109    	add	x9, x8, x9
100000fcc: 52800b68    	mov	w8, #91
100000fd0: 39000128    	strb	w8, [x9]
100000fd4: 14000011    	b	0x100001018 <_process_str+0x124>
100000fd8: f85f83a8    	ldur	x8, [x29, #-8]
100000fdc: b98013e9    	ldrsw	x9, [sp, #16]
100000fe0: 8b090109    	add	x9, x8, x9
100000fe4: 52800ba8    	mov	w8, #93
100000fe8: 39000128    	strb	w8, [x9]
100000fec: 1400000b    	b	0x100001018 <_process_str+0x124>
100000ff0: f85f83a8    	ldur	x8, [x29, #-8]
100000ff4: b89f43a9    	ldursw	x9, [x29, #-12]
100000ff8: 38e9690a    	ldrsb	w10, [x8, x9]
100000ffc: 910003e9    	mov	x9, sp
100001000: aa0a03e8    	mov	x8, x10
100001004: f9000128    	str	x8, [x9]
100001008: d0000000    	adrp	x0, 0x100003000 <_process_str+0x11c>
10000100c: 91380800    	add	x0, x0, #3586
100001010: 97fffee9    	bl	0x100000bb4 <_error>
100001014: 14000001    	b	0x100001018 <_process_str+0x124>
100001018: 1400000a    	b	0x100001040 <_process_str+0x14c>
10000101c: f85f83a8    	ldur	x8, [x29, #-8]
100001020: b89f43a9    	ldursw	x9, [x29, #-12]
100001024: 8b090108    	add	x8, x8, x9
100001028: 39400108    	ldrb	w8, [x8]
10000102c: f85f83a9    	ldur	x9, [x29, #-8]
100001030: b98013ea    	ldrsw	x10, [sp, #16]
100001034: 8b0a0129    	add	x9, x9, x10
100001038: 39000128    	strb	w8, [x9]
10000103c: 14000001    	b	0x100001040 <_process_str+0x14c>
100001040: 14000001    	b	0x100001044 <_process_str+0x150>
100001044: b85f43a8    	ldur	w8, [x29, #-12]
100001048: 11000508    	add	w8, w8, #1
10000104c: b81f43a8    	stur	w8, [x29, #-12]
100001050: b94013e8    	ldr	w8, [sp, #16]
100001054: 11000508    	add	w8, w8, #1
100001058: b90013e8    	str	w8, [sp, #16]
10000105c: 17ffffad    	b	0x100000f10 <_process_str+0x1c>
100001060: f85f83a8    	ldur	x8, [x29, #-8]
100001064: b98013e9    	ldrsw	x9, [sp, #16]
100001068: 8b090108    	add	x8, x8, x9
10000106c: 3900011f    	strb	wzr, [x8]
100001070: a9427bfd    	ldp	x29, x30, [sp, #32]
100001074: 9100c3ff    	add	sp, sp, #48
100001078: d65f03c0    	ret
10000107c: 00000040    	udf	#64
100001080: 00000010    	udf	#16
100001084: 00000058    	udf	#88
100001088: 00000070    	udf	#112
10000108c: 00000070    	udf	#112
100001090: 00000070    	udf	#112
100001094: 00000070    	udf	#112
100001098: 00000070    	udf	#112
10000109c: 00000070    	udf	#112
1000010a0: 00000070    	udf	#112
1000010a4: 00000070    	udf	#112
1000010a8: 00000070    	udf	#112
1000010ac: 00000070    	udf	#112
1000010b0: 00000070    	udf	#112
1000010b4: 00000070    	udf	#112
1000010b8: 00000070    	udf	#112
1000010bc: 00000070    	udf	#112
1000010c0: 00000070    	udf	#112
1000010c4: 00000070    	udf	#112
1000010c8: 00000028    	udf	#40

00000001000010cc <_len>:
1000010cc: f0000028    	adrp	x8, 0x100008000 <_hash+0x4>
1000010d0: f9401108    	ldr	x8, [x8, #32]
1000010d4: f0000029    	adrp	x9, 0x100008000 <_hash+0xc>
1000010d8: f9400d29    	ldr	x9, [x9, #24]
1000010dc: eb090100    	subs	x0, x8, x9
1000010e0: d65f03c0    	ret

00000001000010e4 <_hash>:
1000010e4: d100c3ff    	sub	sp, sp, #48
1000010e8: a9027bfd    	stp	x29, x30, [sp, #32]
1000010ec: 910083fd    	add	x29, sp, #32
1000010f0: f81f83a0    	stur	x0, [x29, #-8]
1000010f4: f9000bff    	str	xzr, [sp, #16]
1000010f8: b9000fff    	str	wzr, [sp, #12]
1000010fc: f85f83a0    	ldur	x0, [x29, #-8]
100001100: 94000b08    	bl	0x100003d20 <_vfprintf+0x100003d20>
100001104: aa0003e8    	mov	x8, x0
100001108: b9000be8    	str	w8, [sp, #8]
10000110c: 14000001    	b	0x100001110 <_hash+0x2c>
100001110: b9400fe8    	ldr	w8, [sp, #12]
100001114: b9400be9    	ldr	w9, [sp, #8]
100001118: 6b090108    	subs	w8, w8, w9
10000111c: 1a9f37e8    	cset	w8, hs
100001120: 370001e8    	tbnz	w8, #0, 0x10000115c <_hash+0x78>
100001124: 14000001    	b	0x100001128 <_hash+0x44>
100001128: f9400be8    	ldr	x8, [sp, #16]
10000112c: d28004a9    	mov	x9, #37
100001130: 9b097d08    	mul	x8, x8, x9
100001134: f85f83a9    	ldur	x9, [x29, #-8]
100001138: b9400fea    	ldr	w10, [sp, #12]
10000113c: 38aa6929    	ldrsb	x9, [x9, x10]
100001140: 8b090108    	add	x8, x8, x9
100001144: f9000be8    	str	x8, [sp, #16]
100001148: 14000001    	b	0x10000114c <_hash+0x68>
10000114c: b9400fe8    	ldr	w8, [sp, #12]
100001150: 11000508    	add	w8, w8, #1
100001154: b9000fe8    	str	w8, [sp, #12]
100001158: 17ffffee    	b	0x100001110 <_hash+0x2c>
10000115c: f9400be8    	ldr	x8, [sp, #16]
100001160: d2800c8a    	mov	x10, #100
100001164: 9aca0909    	udiv	x9, x8, x10
100001168: 9b0a7d29    	mul	x9, x9, x10
10000116c: eb090108    	subs	x8, x8, x9
100001170: aa0803e0    	mov	x0, x8
100001174: a9427bfd    	ldp	x29, x30, [sp, #32]
100001178: 9100c3ff    	add	sp, sp, #48
10000117c: d65f03c0    	ret

0000000100001180 <_lookup>:
100001180: d10103ff    	sub	sp, sp, #64
100001184: a9037bfd    	stp	x29, x30, [sp, #48]
100001188: 9100c3fd    	add	x29, sp, #48
10000118c: f81f03a0    	stur	x0, [x29, #-16]
100001190: f9000fe1    	str	x1, [sp, #24]
100001194: 14000001    	b	0x100001198 <_lookup+0x18>
100001198: f85f03a8    	ldur	x8, [x29, #-16]
10000119c: f1000108    	subs	x8, x8, #0
1000011a0: 1a9f17e8    	cset	w8, eq
1000011a4: 37000448    	tbnz	w8, #0, 0x10000122c <_lookup+0xac>
1000011a8: 14000001    	b	0x1000011ac <_lookup+0x2c>
1000011ac: f9400fe0    	ldr	x0, [sp, #24]
1000011b0: 97ffffcd    	bl	0x1000010e4 <_hash>
1000011b4: b90017e0    	str	w0, [sp, #20]
1000011b8: f85f03a8    	ldur	x8, [x29, #-16]
1000011bc: b94017e9    	ldr	w9, [sp, #20]
1000011c0: f8697908    	ldr	x8, [x8, x9, lsl #3]
1000011c4: f90007e8    	str	x8, [sp, #8]
1000011c8: 14000001    	b	0x1000011cc <_lookup+0x4c>
1000011cc: f94007e8    	ldr	x8, [sp, #8]
1000011d0: f1000108    	subs	x8, x8, #0
1000011d4: 1a9f17e8    	cset	w8, eq
1000011d8: 37000228    	tbnz	w8, #0, 0x10000121c <_lookup+0x9c>
1000011dc: 14000001    	b	0x1000011e0 <_lookup+0x60>
1000011e0: f94007e8    	ldr	x8, [sp, #8]
1000011e4: f9400100    	ldr	x0, [x8]
1000011e8: f9400fe1    	ldr	x1, [sp, #24]
1000011ec: 94000ac7    	bl	0x100003d08 <_vfprintf+0x100003d08>
1000011f0: 71000008    	subs	w8, w0, #0
1000011f4: 1a9f07e8    	cset	w8, ne
1000011f8: 370000a8    	tbnz	w8, #0, 0x10000120c <_lookup+0x8c>
1000011fc: 14000001    	b	0x100001200 <_lookup+0x80>
100001200: f94007e8    	ldr	x8, [sp, #8]
100001204: f81f83a8    	stur	x8, [x29, #-8]
100001208: 1400000b    	b	0x100001234 <_lookup+0xb4>
10000120c: f94007e8    	ldr	x8, [sp, #8]
100001210: f9400908    	ldr	x8, [x8, #16]
100001214: f90007e8    	str	x8, [sp, #8]
100001218: 17ffffed    	b	0x1000011cc <_lookup+0x4c>
10000121c: f85f03a8    	ldur	x8, [x29, #-16]
100001220: f9419108    	ldr	x8, [x8, #800]
100001224: f81f03a8    	stur	x8, [x29, #-16]
100001228: 17ffffdc    	b	0x100001198 <_lookup+0x18>
10000122c: f81f83bf    	stur	xzr, [x29, #-8]
100001230: 14000001    	b	0x100001234 <_lookup+0xb4>
100001234: f85f83a0    	ldur	x0, [x29, #-8]
100001238: a9437bfd    	ldp	x29, x30, [sp, #48]
10000123c: 910103ff    	add	sp, sp, #64
100001240: d65f03c0    	ret

0000000100001244 <_upsert>:
100001244: d10103ff    	sub	sp, sp, #64
100001248: a9037bfd    	stp	x29, x30, [sp, #48]
10000124c: 9100c3fd    	add	x29, sp, #48
100001250: f81f83a2    	stur	x2, [x29, #-8]
100001254: f81f03a0    	stur	x0, [x29, #-16]
100001258: f9000fe1    	str	x1, [sp, #24]
10000125c: f9400fe0    	ldr	x0, [sp, #24]
100001260: 97ffffa1    	bl	0x1000010e4 <_hash>
100001264: b90017e0    	str	w0, [sp, #20]
100001268: f85f03a8    	ldur	x8, [x29, #-16]
10000126c: b94017e9    	ldr	w9, [sp, #20]
100001270: f8697908    	ldr	x8, [x8, x9, lsl #3]
100001274: f90007e8    	str	x8, [sp, #8]
100001278: f94007e8    	ldr	x8, [sp, #8]
10000127c: f1000108    	subs	x8, x8, #0
100001280: 1a9f07e8    	cset	w8, ne
100001284: 370002e8    	tbnz	w8, #0, 0x1000012e0 <_upsert+0x9c>
100001288: 14000001    	b	0x10000128c <_upsert+0x48>
10000128c: d2800300    	mov	x0, #24
100001290: 94000a95    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100001294: f85f03a8    	ldur	x8, [x29, #-16]
100001298: b94017e9    	ldr	w9, [sp, #20]
10000129c: f8297900    	str	x0, [x8, x9, lsl #3]
1000012a0: f9400fe0    	ldr	x0, [sp, #24]
1000012a4: 94000a9c    	bl	0x100003d14 <_vfprintf+0x100003d14>
1000012a8: f85f03a8    	ldur	x8, [x29, #-16]
1000012ac: b94017e9    	ldr	w9, [sp, #20]
1000012b0: f8697908    	ldr	x8, [x8, x9, lsl #3]
1000012b4: f9000100    	str	x0, [x8]
1000012b8: f85f03a8    	ldur	x8, [x29, #-16]
1000012bc: b94017e9    	ldr	w9, [sp, #20]
1000012c0: f8697909    	ldr	x9, [x8, x9, lsl #3]
1000012c4: f85f83a8    	ldur	x8, [x29, #-8]
1000012c8: f9000528    	str	x8, [x9, #8]
1000012cc: f85f03a8    	ldur	x8, [x29, #-16]
1000012d0: b94017e9    	ldr	w9, [sp, #20]
1000012d4: f8697908    	ldr	x8, [x8, x9, lsl #3]
1000012d8: f900091f    	str	xzr, [x8, #16]
1000012dc: 14000029    	b	0x100001380 <_upsert+0x13c>
1000012e0: 14000001    	b	0x1000012e4 <_upsert+0xa0>
1000012e4: f94007e8    	ldr	x8, [sp, #8]
1000012e8: f1000108    	subs	x8, x8, #0
1000012ec: 1a9f17e8    	cset	w8, eq
1000012f0: 37000288    	tbnz	w8, #0, 0x100001340 <_upsert+0xfc>
1000012f4: 14000001    	b	0x1000012f8 <_upsert+0xb4>
1000012f8: f94007e8    	ldr	x8, [sp, #8]
1000012fc: f9400100    	ldr	x0, [x8]
100001300: f9400fe1    	ldr	x1, [sp, #24]
100001304: 94000a81    	bl	0x100003d08 <_vfprintf+0x100003d08>
100001308: 71000008    	subs	w8, w0, #0
10000130c: 1a9f07e8    	cset	w8, ne
100001310: 370000c8    	tbnz	w8, #0, 0x100001328 <_upsert+0xe4>
100001314: 14000001    	b	0x100001318 <_upsert+0xd4>
100001318: f94007e9    	ldr	x9, [sp, #8]
10000131c: f85f83a8    	ldur	x8, [x29, #-8]
100001320: f9000528    	str	x8, [x9, #8]
100001324: 14000017    	b	0x100001380 <_upsert+0x13c>
100001328: f94007e8    	ldr	x8, [sp, #8]
10000132c: f90003e8    	str	x8, [sp]
100001330: f94007e8    	ldr	x8, [sp, #8]
100001334: f9400908    	ldr	x8, [x8, #16]
100001338: f90007e8    	str	x8, [sp, #8]
10000133c: 17ffffea    	b	0x1000012e4 <_upsert+0xa0>
100001340: d2800300    	mov	x0, #24
100001344: 94000a68    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100001348: f90007e0    	str	x0, [sp, #8]
10000134c: f9400fe0    	ldr	x0, [sp, #24]
100001350: 94000a71    	bl	0x100003d14 <_vfprintf+0x100003d14>
100001354: f94007e8    	ldr	x8, [sp, #8]
100001358: f9000100    	str	x0, [x8]
10000135c: f94007e9    	ldr	x9, [sp, #8]
100001360: f85f83a8    	ldur	x8, [x29, #-8]
100001364: f9000528    	str	x8, [x9, #8]
100001368: f94007e8    	ldr	x8, [sp, #8]
10000136c: f900091f    	str	xzr, [x8, #16]
100001370: f94007e8    	ldr	x8, [sp, #8]
100001374: f94003e9    	ldr	x9, [sp]
100001378: f9000928    	str	x8, [x9, #16]
10000137c: 14000001    	b	0x100001380 <_upsert+0x13c>
100001380: a9437bfd    	ldp	x29, x30, [sp, #48]
100001384: 910103ff    	add	sp, sp, #64
100001388: d65f03c0    	ret

000000010000138c <_delete>:
10000138c: d10103ff    	sub	sp, sp, #64
100001390: a9037bfd    	stp	x29, x30, [sp, #48]
100001394: 9100c3fd    	add	x29, sp, #48
100001398: f81f83a0    	stur	x0, [x29, #-8]
10000139c: f81f03a1    	stur	x1, [x29, #-16]
1000013a0: f85f83a8    	ldur	x8, [x29, #-8]
1000013a4: f1000108    	subs	x8, x8, #0
1000013a8: 1a9f07e8    	cset	w8, ne
1000013ac: 37000068    	tbnz	w8, #0, 0x1000013b8 <_delete+0x2c>
1000013b0: 14000001    	b	0x1000013b4 <_delete+0x28>
1000013b4: 14000033    	b	0x100001480 <_delete+0xf4>
1000013b8: f85f03a0    	ldur	x0, [x29, #-16]
1000013bc: 97ffff4a    	bl	0x1000010e4 <_hash>
1000013c0: b81ec3a0    	stur	w0, [x29, #-20]
1000013c4: f85f83a8    	ldur	x8, [x29, #-8]
1000013c8: b85ec3a9    	ldur	w9, [x29, #-20]
1000013cc: f8697908    	ldr	x8, [x8, x9, lsl #3]
1000013d0: f9000be8    	str	x8, [sp, #16]
1000013d4: f90007ff    	str	xzr, [sp, #8]
1000013d8: 14000001    	b	0x1000013dc <_delete+0x50>
1000013dc: f9400be8    	ldr	x8, [sp, #16]
1000013e0: f1000108    	subs	x8, x8, #0
1000013e4: 1a9f17e8    	cset	w8, eq
1000013e8: 370004c8    	tbnz	w8, #0, 0x100001480 <_delete+0xf4>
1000013ec: 14000001    	b	0x1000013f0 <_delete+0x64>
1000013f0: f9400be8    	ldr	x8, [sp, #16]
1000013f4: f9400100    	ldr	x0, [x8]
1000013f8: f85f03a1    	ldur	x1, [x29, #-16]
1000013fc: 94000a43    	bl	0x100003d08 <_vfprintf+0x100003d08>
100001400: 71000008    	subs	w8, w0, #0
100001404: 1a9f07e8    	cset	w8, ne
100001408: 37000308    	tbnz	w8, #0, 0x100001468 <_delete+0xdc>
10000140c: 14000001    	b	0x100001410 <_delete+0x84>
100001410: f94007e8    	ldr	x8, [sp, #8]
100001414: f1000108    	subs	x8, x8, #0
100001418: 1a9f07e8    	cset	w8, ne
10000141c: 37000108    	tbnz	w8, #0, 0x10000143c <_delete+0xb0>
100001420: 14000001    	b	0x100001424 <_delete+0x98>
100001424: f9400be8    	ldr	x8, [sp, #16]
100001428: f9400908    	ldr	x8, [x8, #16]
10000142c: f85f83a9    	ldur	x9, [x29, #-8]
100001430: b85ec3aa    	ldur	w10, [x29, #-20]
100001434: f82a7928    	str	x8, [x9, x10, lsl #3]
100001438: 14000006    	b	0x100001450 <_delete+0xc4>
10000143c: f9400be8    	ldr	x8, [sp, #16]
100001440: f9400908    	ldr	x8, [x8, #16]
100001444: f94007e9    	ldr	x9, [sp, #8]
100001448: f9000928    	str	x8, [x9, #16]
10000144c: 14000001    	b	0x100001450 <_delete+0xc4>
100001450: f9400be8    	ldr	x8, [sp, #16]
100001454: f9400100    	ldr	x0, [x8]
100001458: 94000a14    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
10000145c: f9400be0    	ldr	x0, [sp, #16]
100001460: 94000a12    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001464: 14000007    	b	0x100001480 <_delete+0xf4>
100001468: f9400be8    	ldr	x8, [sp, #16]
10000146c: f90007e8    	str	x8, [sp, #8]
100001470: f9400be8    	ldr	x8, [sp, #16]
100001474: f9400908    	ldr	x8, [x8, #16]
100001478: f9000be8    	str	x8, [sp, #16]
10000147c: 17ffffd8    	b	0x1000013dc <_delete+0x50>
100001480: a9437bfd    	ldp	x29, x30, [sp, #48]
100001484: 910103ff    	add	sp, sp, #64
100001488: d65f03c0    	ret

000000010000148c <_create_dictionary>:
10000148c: d10083ff    	sub	sp, sp, #32
100001490: a9017bfd    	stp	x29, x30, [sp, #16]
100001494: 910043fd    	add	x29, sp, #16
100001498: d2806500    	mov	x0, #808
10000149c: 94000a12    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
1000014a0: f90007e0    	str	x0, [sp, #8]
1000014a4: b90007ff    	str	wzr, [sp, #4]
1000014a8: 14000001    	b	0x1000014ac <_create_dictionary+0x20>
1000014ac: b94007e8    	ldr	w8, [sp, #4]
1000014b0: 71019108    	subs	w8, w8, #100
1000014b4: 1a9fb7e8    	cset	w8, ge
1000014b8: 37000168    	tbnz	w8, #0, 0x1000014e4 <_create_dictionary+0x58>
1000014bc: 14000001    	b	0x1000014c0 <_create_dictionary+0x34>
1000014c0: f94007e9    	ldr	x9, [sp, #8]
1000014c4: b98007ea    	ldrsw	x10, [sp, #4]
1000014c8: d2800008    	mov	x8, #0
1000014cc: f82a7928    	str	x8, [x9, x10, lsl #3]
1000014d0: 14000001    	b	0x1000014d4 <_create_dictionary+0x48>
1000014d4: b94007e8    	ldr	w8, [sp, #4]
1000014d8: 11000508    	add	w8, w8, #1
1000014dc: b90007e8    	str	w8, [sp, #4]
1000014e0: 17fffff3    	b	0x1000014ac <_create_dictionary+0x20>
1000014e4: f94007e8    	ldr	x8, [sp, #8]
1000014e8: f901911f    	str	xzr, [x8, #800]
1000014ec: f94007e0    	ldr	x0, [sp, #8]
1000014f0: a9417bfd    	ldp	x29, x30, [sp, #16]
1000014f4: 910083ff    	add	sp, sp, #32
1000014f8: d65f03c0    	ret

00000001000014fc <_free_dictionary>:
1000014fc: d100c3ff    	sub	sp, sp, #48
100001500: a9027bfd    	stp	x29, x30, [sp, #32]
100001504: 910083fd    	add	x29, sp, #32
100001508: f81f83a0    	stur	x0, [x29, #-8]
10000150c: b81f43bf    	stur	wzr, [x29, #-12]
100001510: 14000001    	b	0x100001514 <_free_dictionary+0x18>
100001514: b85f43a8    	ldur	w8, [x29, #-12]
100001518: 71019108    	subs	w8, w8, #100
10000151c: 1a9fb7e8    	cset	w8, ge
100001520: 37000388    	tbnz	w8, #0, 0x100001590 <_free_dictionary+0x94>
100001524: 14000001    	b	0x100001528 <_free_dictionary+0x2c>
100001528: f85f83a8    	ldur	x8, [x29, #-8]
10000152c: b89f43a9    	ldursw	x9, [x29, #-12]
100001530: f8697908    	ldr	x8, [x8, x9, lsl #3]
100001534: f90007e8    	str	x8, [sp, #8]
100001538: 14000001    	b	0x10000153c <_free_dictionary+0x40>
10000153c: f94007e8    	ldr	x8, [sp, #8]
100001540: f1000108    	subs	x8, x8, #0
100001544: 1a9f17e8    	cset	w8, eq
100001548: 370001a8    	tbnz	w8, #0, 0x10000157c <_free_dictionary+0x80>
10000154c: 14000001    	b	0x100001550 <_free_dictionary+0x54>
100001550: f94007e8    	ldr	x8, [sp, #8]
100001554: f90003e8    	str	x8, [sp]
100001558: f94007e8    	ldr	x8, [sp, #8]
10000155c: f9400908    	ldr	x8, [x8, #16]
100001560: f90007e8    	str	x8, [sp, #8]
100001564: f94003e8    	ldr	x8, [sp]
100001568: f9400100    	ldr	x0, [x8]
10000156c: 940009cf    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001570: f94003e0    	ldr	x0, [sp]
100001574: 940009cd    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001578: 17fffff1    	b	0x10000153c <_free_dictionary+0x40>
10000157c: 14000001    	b	0x100001580 <_free_dictionary+0x84>
100001580: b85f43a8    	ldur	w8, [x29, #-12]
100001584: 11000508    	add	w8, w8, #1
100001588: b81f43a8    	stur	w8, [x29, #-12]
10000158c: 17ffffe2    	b	0x100001514 <_free_dictionary+0x18>
100001590: f85f83a0    	ldur	x0, [x29, #-8]
100001594: 940009c5    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001598: a9427bfd    	ldp	x29, x30, [sp, #32]
10000159c: 9100c3ff    	add	sp, sp, #48
1000015a0: d65f03c0    	ret

00000001000015a4 <_push_scope>:
1000015a4: d10143ff    	sub	sp, sp, #80
1000015a8: a9047bfd    	stp	x29, x30, [sp, #64]
1000015ac: 910103fd    	add	x29, sp, #64
1000015b0: f0000028    	adrp	x8, 0x100008000 <_push_scope+0x28>
1000015b4: 91000108    	add	x8, x8, #0
1000015b8: f90007e8    	str	x8, [sp, #8]
1000015bc: f81f83a0    	stur	x0, [x29, #-8]
1000015c0: f0000029    	adrp	x9, 0x100008000 <_push_scope+0x38>
1000015c4: 91002129    	add	x9, x9, #8
1000015c8: f9000be9    	str	x9, [sp, #16]
1000015cc: f9400129    	ldr	x9, [x9]
1000015d0: f81f03a9    	stur	x9, [x29, #-16]
1000015d4: f9400100    	ldr	x0, [x8]
1000015d8: f85f03a2    	ldur	x2, [x29, #-16]
1000015dc: d0000001    	adrp	x1, 0x100003000 <_push_scope+0x40>
1000015e0: 91388421    	add	x1, x1, #3617
1000015e4: 97ffff18    	bl	0x100001244 <_upsert>
1000015e8: f94007e8    	ldr	x8, [sp, #8]
1000015ec: f0000029    	adrp	x9, 0x100008000 <_push_scope+0x64>
1000015f0: 91006129    	add	x9, x9, #24
1000015f4: f90013e9    	str	x9, [sp, #32]
1000015f8: f9400129    	ldr	x9, [x9]
1000015fc: f81f03a9    	stur	x9, [x29, #-16]
100001600: f9400100    	ldr	x0, [x8]
100001604: f85f03a2    	ldur	x2, [x29, #-16]
100001608: d0000001    	adrp	x1, 0x100003000 <_push_scope+0x6c>
10000160c: 91389c21    	add	x1, x1, #3623
100001610: 97ffff0d    	bl	0x100001244 <_upsert>
100001614: f94007e8    	ldr	x8, [sp, #8]
100001618: f0000029    	adrp	x9, 0x100008000 <_push_scope+0x90>
10000161c: 91008129    	add	x9, x9, #32
100001620: f9000fe9    	str	x9, [sp, #24]
100001624: f9400129    	ldr	x9, [x9]
100001628: f81f03a9    	stur	x9, [x29, #-16]
10000162c: f9400100    	ldr	x0, [x8]
100001630: f85f03a2    	ldur	x2, [x29, #-16]
100001634: d0000001    	adrp	x1, 0x100003000 <_push_scope+0x98>
100001638: 9138b421    	add	x1, x1, #3629
10000163c: 97ffff02    	bl	0x100001244 <_upsert>
100001640: 97ffff93    	bl	0x10000148c <_create_dictionary>
100001644: f94007ea    	ldr	x10, [sp, #8]
100001648: f9400be9    	ldr	x9, [sp, #16]
10000164c: f81e83a0    	stur	x0, [x29, #-24]
100001650: f9400148    	ldr	x8, [x10]
100001654: f85e83ab    	ldur	x11, [x29, #-24]
100001658: f9019168    	str	x8, [x11, #800]
10000165c: f85e83a8    	ldur	x8, [x29, #-24]
100001660: f9000148    	str	x8, [x10]
100001664: f85f83a8    	ldur	x8, [x29, #-8]
100001668: f9000128    	str	x8, [x9]
10000166c: f85f83a0    	ldur	x0, [x29, #-8]
100001670: 940009ac    	bl	0x100003d20 <_vfprintf+0x100003d20>
100001674: f9400fe9    	ldr	x9, [sp, #24]
100001678: f94013e8    	ldr	x8, [sp, #32]
10000167c: f000002a    	adrp	x10, 0x100008000 <_push_scope+0xf4>
100001680: 9100414a    	add	x10, x10, #16
100001684: f9000140    	str	x0, [x10]
100001688: f900013f    	str	xzr, [x9]
10000168c: f900011f    	str	xzr, [x8]
100001690: a9447bfd    	ldp	x29, x30, [sp, #64]
100001694: 910143ff    	add	sp, sp, #80
100001698: d65f03c0    	ret

000000010000169c <_pop_scope>:
10000169c: d100c3ff    	sub	sp, sp, #48
1000016a0: a9027bfd    	stp	x29, x30, [sp, #32]
1000016a4: 910083fd    	add	x29, sp, #32
1000016a8: f0000028    	adrp	x8, 0x100008000 <_pop_scope+0x28>
1000016ac: 91000108    	add	x8, x8, #0
1000016b0: f90007e8    	str	x8, [sp, #8]
1000016b4: f9400108    	ldr	x8, [x8]
1000016b8: f1000108    	subs	x8, x8, #0
1000016bc: 1a9f07e8    	cset	w8, ne
1000016c0: 37000068    	tbnz	w8, #0, 0x1000016cc <_pop_scope+0x30>
1000016c4: 14000001    	b	0x1000016c8 <_pop_scope+0x2c>
1000016c8: 14000036    	b	0x1000017a0 <_pop_scope+0x104>
1000016cc: f94007e8    	ldr	x8, [sp, #8]
1000016d0: f9400109    	ldr	x9, [x8]
1000016d4: f81f83a9    	stur	x9, [x29, #-8]
1000016d8: f9400109    	ldr	x9, [x8]
1000016dc: f9419129    	ldr	x9, [x9, #800]
1000016e0: f9000109    	str	x9, [x8]
1000016e4: f9400100    	ldr	x0, [x8]
1000016e8: d0000001    	adrp	x1, 0x100003000 <_pop_scope+0x54>
1000016ec: 91388421    	add	x1, x1, #3617
1000016f0: 97fffea4    	bl	0x100001180 <_lookup>
1000016f4: f9000be0    	str	x0, [sp, #16]
1000016f8: f9400be8    	ldr	x8, [sp, #16]
1000016fc: f1000108    	subs	x8, x8, #0
100001700: 1a9f07e8    	cset	w8, ne
100001704: 370000c8    	tbnz	w8, #0, 0x10000171c <_pop_scope+0x80>
100001708: 14000001    	b	0x10000170c <_pop_scope+0x70>
10000170c: d0000000    	adrp	x0, 0x100003000 <_pop_scope+0x78>
100001710: 9138c400    	add	x0, x0, #3633
100001714: 97fffd28    	bl	0x100000bb4 <_error>
100001718: 14000001    	b	0x10000171c <_pop_scope+0x80>
10000171c: f9400be8    	ldr	x8, [sp, #16]
100001720: f9400509    	ldr	x9, [x8, #8]
100001724: f0000028    	adrp	x8, 0x100008000 <_pop_scope+0xa4>
100001728: 91002108    	add	x8, x8, #8
10000172c: f9000109    	str	x9, [x8]
100001730: f9400100    	ldr	x0, [x8]
100001734: 9400097b    	bl	0x100003d20 <_vfprintf+0x100003d20>
100001738: f94007e8    	ldr	x8, [sp, #8]
10000173c: f0000029    	adrp	x9, 0x100008000 <_pop_scope+0xbc>
100001740: 91004129    	add	x9, x9, #16
100001744: f9000120    	str	x0, [x9]
100001748: f9400100    	ldr	x0, [x8]
10000174c: d0000001    	adrp	x1, 0x100003000 <_pop_scope+0xb8>
100001750: 9138b421    	add	x1, x1, #3629
100001754: 97fffe8b    	bl	0x100001180 <_lookup>
100001758: f9000be0    	str	x0, [sp, #16]
10000175c: f9400be8    	ldr	x8, [sp, #16]
100001760: f1000108    	subs	x8, x8, #0
100001764: 1a9f07e8    	cset	w8, ne
100001768: 370000c8    	tbnz	w8, #0, 0x100001780 <_pop_scope+0xe4>
10000176c: 14000001    	b	0x100001770 <_pop_scope+0xd4>
100001770: d0000000    	adrp	x0, 0x100003000 <_pop_scope+0xdc>
100001774: 91392c00    	add	x0, x0, #3659
100001778: 97fffd0f    	bl	0x100000bb4 <_error>
10000177c: 14000001    	b	0x100001780 <_pop_scope+0xe4>
100001780: f9400be8    	ldr	x8, [sp, #16]
100001784: f9400508    	ldr	x8, [x8, #8]
100001788: f0000029    	adrp	x9, 0x100008000 <_pop_scope+0x108>
10000178c: 91008129    	add	x9, x9, #32
100001790: f9000128    	str	x8, [x9]
100001794: f85f83a0    	ldur	x0, [x29, #-8]
100001798: 97ffff59    	bl	0x1000014fc <_free_dictionary>
10000179c: 14000001    	b	0x1000017a0 <_pop_scope+0x104>
1000017a0: a9427bfd    	ldp	x29, x30, [sp, #32]
1000017a4: 9100c3ff    	add	sp, sp, #48
1000017a8: d65f03c0    	ret

00000001000017ac <_PRINT>:
1000017ac: d101c3ff    	sub	sp, sp, #112
1000017b0: a9067bfd    	stp	x29, x30, [sp, #96]
1000017b4: 910183fd    	add	x29, sp, #96
1000017b8: f0000028    	adrp	x8, 0x100008000 <_PRINT+0x28>
1000017bc: 9100a108    	add	x8, x8, #40
1000017c0: f90017e8    	str	x8, [sp, #40]
1000017c4: 940007d7    	bl	0x100003720 <_parse>
1000017c8: f94017e8    	ldr	x8, [sp, #40]
1000017cc: b9400108    	ldr	w8, [x8]
1000017d0: b81d43a8    	stur	w8, [x29, #-44]
1000017d4: 71000108    	subs	w8, w8, #0
1000017d8: 71000508    	subs	w8, w8, #1
1000017dc: 1a9f87e8    	cset	w8, ls
1000017e0: 37000188    	tbnz	w8, #0, 0x100001810 <_PRINT+0x64>
1000017e4: 14000001    	b	0x1000017e8 <_PRINT+0x3c>
1000017e8: b85d43a8    	ldur	w8, [x29, #-44]
1000017ec: 71000908    	subs	w8, w8, #2
1000017f0: 1a9f17e8    	cset	w8, eq
1000017f4: 37000208    	tbnz	w8, #0, 0x100001834 <_PRINT+0x88>
1000017f8: 14000001    	b	0x1000017fc <_PRINT+0x50>
1000017fc: b85d43a8    	ldur	w8, [x29, #-44]
100001800: 71000d08    	subs	w8, w8, #3
100001804: 1a9f17e8    	cset	w8, eq
100001808: 370018a8    	tbnz	w8, #0, 0x100001b1c <_PRINT+0x370>
10000180c: 140000dc    	b	0x100001b7c <_PRINT+0x3d0>
100001810: d10023a0    	sub	x0, x29, #8
100001814: 97fffd90    	bl	0x100000e54 <_symbolcpy>
100001818: f85f83a8    	ldur	x8, [x29, #-8]
10000181c: 910003e9    	mov	x9, sp
100001820: f9000128    	str	x8, [x9]
100001824: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x80>
100001828: 91398c00    	add	x0, x0, #3683
10000182c: 94000931    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
100001830: 140000d3    	b	0x100001b7c <_PRINT+0x3d0>
100001834: d10023a0    	sub	x0, x29, #8
100001838: 97fffd5c    	bl	0x100000da8 <_quotecpy>
10000183c: 14000001    	b	0x100001840 <_PRINT+0x94>
100001840: f85f83a0    	ldur	x0, [x29, #-8]
100001844: 97fffdac    	bl	0x100000ef4 <_process_str>
100001848: b81f43bf    	stur	wzr, [x29, #-12]
10000184c: 14000001    	b	0x100001850 <_PRINT+0xa4>
100001850: f85f83a8    	ldur	x8, [x29, #-8]
100001854: b89f43a9    	ldursw	x9, [x29, #-12]
100001858: 38e96908    	ldrsb	w8, [x8, x9]
10000185c: 71000108    	subs	w8, w8, #0
100001860: 1a9f17e8    	cset	w8, eq
100001864: 370015a8    	tbnz	w8, #0, 0x100001b18 <_PRINT+0x36c>
100001868: 14000001    	b	0x10000186c <_PRINT+0xc0>
10000186c: f85f83a8    	ldur	x8, [x29, #-8]
100001870: b89f43a9    	ldursw	x9, [x29, #-12]
100001874: 38e96908    	ldrsb	w8, [x8, x9]
100001878: 71009508    	subs	w8, w8, #37
10000187c: 1a9f07e8    	cset	w8, ne
100001880: 37001388    	tbnz	w8, #0, 0x100001af0 <_PRINT+0x344>
100001884: 14000001    	b	0x100001888 <_PRINT+0xdc>
100001888: b85f43a8    	ldur	w8, [x29, #-12]
10000188c: 11000508    	add	w8, w8, #1
100001890: b81f43a8    	stur	w8, [x29, #-12]
100001894: 940007a3    	bl	0x100003720 <_parse>
100001898: f85f83a8    	ldur	x8, [x29, #-8]
10000189c: b89f43a9    	ldursw	x9, [x29, #-12]
1000018a0: 38e96908    	ldrsb	w8, [x8, x9]
1000018a4: b90027e8    	str	w8, [sp, #36]
1000018a8: 71009508    	subs	w8, w8, #37
1000018ac: 1a9f17e8    	cset	w8, eq
1000018b0: 37000228    	tbnz	w8, #0, 0x1000018f4 <_PRINT+0x148>
1000018b4: 14000001    	b	0x1000018b8 <_PRINT+0x10c>
1000018b8: b94027e8    	ldr	w8, [sp, #36]
1000018bc: 71019908    	subs	w8, w8, #102
1000018c0: 1a9f17e8    	cset	w8, eq
1000018c4: 37000208    	tbnz	w8, #0, 0x100001904 <_PRINT+0x158>
1000018c8: 14000001    	b	0x1000018cc <_PRINT+0x120>
1000018cc: b94027e8    	ldr	w8, [sp, #36]
1000018d0: 7101a508    	subs	w8, w8, #105
1000018d4: 1a9f17e8    	cset	w8, eq
1000018d8: 37000168    	tbnz	w8, #0, 0x100001904 <_PRINT+0x158>
1000018dc: 14000001    	b	0x1000018e0 <_PRINT+0x134>
1000018e0: b94027e8    	ldr	w8, [sp, #36]
1000018e4: 7101cd08    	subs	w8, w8, #115
1000018e8: 1a9f17e8    	cset	w8, eq
1000018ec: 370000c8    	tbnz	w8, #0, 0x100001904 <_PRINT+0x158>
1000018f0: 14000056    	b	0x100001a48 <_PRINT+0x29c>
1000018f4: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x150>
1000018f8: 91399800    	add	x0, x0, #3686
1000018fc: 940008fd    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
100001900: 1400007b    	b	0x100001aec <_PRINT+0x340>
100001904: d10063a0    	sub	x0, x29, #24
100001908: 97fffd53    	bl	0x100000e54 <_symbolcpy>
10000190c: f94017e8    	ldr	x8, [sp, #40]
100001910: b9400108    	ldr	w8, [x8]
100001914: 71000d08    	subs	w8, w8, #3
100001918: 1a9f17e8    	cset	w8, eq
10000191c: 37000128    	tbnz	w8, #0, 0x100001940 <_PRINT+0x194>
100001920: 14000001    	b	0x100001924 <_PRINT+0x178>
100001924: f85e83a8    	ldur	x8, [x29, #-24]
100001928: 910003e9    	mov	x9, sp
10000192c: f9000128    	str	x8, [x9]
100001930: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x18c>
100001934: 9139a400    	add	x0, x0, #3689
100001938: 97fffc9f    	bl	0x100000bb4 <_error>
10000193c: 14000001    	b	0x100001940 <_PRINT+0x194>
100001940: f0000028    	adrp	x8, 0x100008000 <_PRINT+0x1b0>
100001944: 91000108    	add	x8, x8, #0
100001948: f9400100    	ldr	x0, [x8]
10000194c: f85e83a1    	ldur	x1, [x29, #-24]
100001950: 97fffe0c    	bl	0x100001180 <_lookup>
100001954: f81e03a0    	stur	x0, [x29, #-32]
100001958: f85e03a8    	ldur	x8, [x29, #-32]
10000195c: f1000108    	subs	x8, x8, #0
100001960: 1a9f07e8    	cset	w8, ne
100001964: 37000128    	tbnz	w8, #0, 0x100001988 <_PRINT+0x1dc>
100001968: 14000001    	b	0x10000196c <_PRINT+0x1c0>
10000196c: f85e83a8    	ldur	x8, [x29, #-24]
100001970: 910003e9    	mov	x9, sp
100001974: f9000128    	str	x8, [x9]
100001978: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x1d4>
10000197c: 9139f000    	add	x0, x0, #3708
100001980: 97fffc8d    	bl	0x100000bb4 <_error>
100001984: 14000001    	b	0x100001988 <_PRINT+0x1dc>
100001988: f85f83a8    	ldur	x8, [x29, #-8]
10000198c: b89f43a9    	ldursw	x9, [x29, #-12]
100001990: 38e96908    	ldrsb	w8, [x8, x9]
100001994: 7101a508    	subs	w8, w8, #105
100001998: 1a9f07e8    	cset	w8, ne
10000199c: 37000148    	tbnz	w8, #0, 0x1000019c4 <_PRINT+0x218>
1000019a0: 14000001    	b	0x1000019a4 <_PRINT+0x1f8>
1000019a4: f85e03a8    	ldur	x8, [x29, #-32]
1000019a8: f9400508    	ldr	x8, [x8, #8]
1000019ac: 910003e9    	mov	x9, sp
1000019b0: f9000128    	str	x8, [x9]
1000019b4: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x210>
1000019b8: 913a4c00    	add	x0, x0, #3731
1000019bc: 940008cd    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
1000019c0: 14000021    	b	0x100001a44 <_PRINT+0x298>
1000019c4: f85f83a8    	ldur	x8, [x29, #-8]
1000019c8: b89f43a9    	ldursw	x9, [x29, #-12]
1000019cc: 38e96908    	ldrsb	w8, [x8, x9]
1000019d0: 71019908    	subs	w8, w8, #102
1000019d4: 1a9f07e8    	cset	w8, ne
1000019d8: 37000148    	tbnz	w8, #0, 0x100001a00 <_PRINT+0x254>
1000019dc: 14000001    	b	0x1000019e0 <_PRINT+0x234>
1000019e0: f85e03a8    	ldur	x8, [x29, #-32]
1000019e4: fd400500    	ldr	d0, [x8, #8]
1000019e8: 910003e8    	mov	x8, sp
1000019ec: fd000100    	str	d0, [x8]
1000019f0: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x24c>
1000019f4: 913a5c00    	add	x0, x0, #3735
1000019f8: 940008be    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
1000019fc: 14000011    	b	0x100001a40 <_PRINT+0x294>
100001a00: f85f83a8    	ldur	x8, [x29, #-8]
100001a04: b89f43a9    	ldursw	x9, [x29, #-12]
100001a08: 38e96908    	ldrsb	w8, [x8, x9]
100001a0c: 7101cd08    	subs	w8, w8, #115
100001a10: 1a9f07e8    	cset	w8, ne
100001a14: 37000148    	tbnz	w8, #0, 0x100001a3c <_PRINT+0x290>
100001a18: 14000001    	b	0x100001a1c <_PRINT+0x270>
100001a1c: f85e03a8    	ldur	x8, [x29, #-32]
100001a20: f9400508    	ldr	x8, [x8, #8]
100001a24: 910003e9    	mov	x9, sp
100001a28: f9000128    	str	x8, [x9]
100001a2c: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x288>
100001a30: 91398c00    	add	x0, x0, #3683
100001a34: 940008af    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
100001a38: 14000001    	b	0x100001a3c <_PRINT+0x290>
100001a3c: 14000001    	b	0x100001a40 <_PRINT+0x294>
100001a40: 14000001    	b	0x100001a44 <_PRINT+0x298>
100001a44: 1400002a    	b	0x100001aec <_PRINT+0x340>
100001a48: f94017e8    	ldr	x8, [sp, #40]
100001a4c: b9400108    	ldr	w8, [x8]
100001a50: 71000908    	subs	w8, w8, #2
100001a54: 1a9f07e8    	cset	w8, ne
100001a58: 37000248    	tbnz	w8, #0, 0x100001aa0 <_PRINT+0x2f4>
100001a5c: 14000001    	b	0x100001a60 <_PRINT+0x2b4>
100001a60: f0000028    	adrp	x8, 0x100008000 <_PRINT+0x2d0>
100001a64: 91002108    	add	x8, x8, #8
100001a68: f9400108    	ldr	x8, [x8]
100001a6c: f0000029    	adrp	x9, 0x100008000 <_PRINT+0x2dc>
100001a70: 91006129    	add	x9, x9, #24
100001a74: f9400129    	ldr	x9, [x9]
100001a78: 8b090108    	add	x8, x8, x9
100001a7c: 91000508    	add	x8, x8, #1
100001a80: f9000fe8    	str	x8, [sp, #24]
100001a84: 97fffd92    	bl	0x1000010cc <_len>
100001a88: aa0003e8    	mov	x8, x0
100001a8c: f9400fe0    	ldr	x0, [sp, #24]
100001a90: f1000908    	subs	x8, x8, #2
100001a94: aa0803e1    	mov	x1, x8
100001a98: 97fffca9    	bl	0x100000d3c <_printlen>
100001a9c: 1400000f    	b	0x100001ad8 <_PRINT+0x32c>
100001aa0: f0000028    	adrp	x8, 0x100008000 <_PRINT+0x310>
100001aa4: 91002108    	add	x8, x8, #8
100001aa8: f9400108    	ldr	x8, [x8]
100001aac: f0000029    	adrp	x9, 0x100008000 <_PRINT+0x31c>
100001ab0: 91006129    	add	x9, x9, #24
100001ab4: f9400129    	ldr	x9, [x9]
100001ab8: 8b090108    	add	x8, x8, x9
100001abc: f9000be8    	str	x8, [sp, #16]
100001ac0: 97fffd83    	bl	0x1000010cc <_len>
100001ac4: aa0003e8    	mov	x8, x0
100001ac8: f9400be0    	ldr	x0, [sp, #16]
100001acc: aa0803e1    	mov	x1, x8
100001ad0: 97fffc9b    	bl	0x100000d3c <_printlen>
100001ad4: 14000001    	b	0x100001ad8 <_PRINT+0x32c>
100001ad8: f85f83a8    	ldur	x8, [x29, #-8]
100001adc: b89f43a9    	ldursw	x9, [x29, #-12]
100001ae0: 38e96900    	ldrsb	w0, [x8, x9]
100001ae4: 94000886    	bl	0x100003cfc <_vfprintf+0x100003cfc>
100001ae8: 14000001    	b	0x100001aec <_PRINT+0x340>
100001aec: 14000006    	b	0x100001b04 <_PRINT+0x358>
100001af0: f85f83a8    	ldur	x8, [x29, #-8]
100001af4: b89f43a9    	ldursw	x9, [x29, #-12]
100001af8: 38e96900    	ldrsb	w0, [x8, x9]
100001afc: 94000880    	bl	0x100003cfc <_vfprintf+0x100003cfc>
100001b00: 14000001    	b	0x100001b04 <_PRINT+0x358>
100001b04: 14000001    	b	0x100001b08 <_PRINT+0x35c>
100001b08: b85f43a8    	ldur	w8, [x29, #-12]
100001b0c: 11000508    	add	w8, w8, #1
100001b10: b81f43a8    	stur	w8, [x29, #-12]
100001b14: 17ffff4f    	b	0x100001850 <_PRINT+0xa4>
100001b18: 14000019    	b	0x100001b7c <_PRINT+0x3d0>
100001b1c: d10023a0    	sub	x0, x29, #8
100001b20: 97fffccd    	bl	0x100000e54 <_symbolcpy>
100001b24: f0000028    	adrp	x8, 0x100008000 <_PRINT+0x394>
100001b28: 91000108    	add	x8, x8, #0
100001b2c: f9400100    	ldr	x0, [x8]
100001b30: f85f83a1    	ldur	x1, [x29, #-8]
100001b34: 97fffd93    	bl	0x100001180 <_lookup>
100001b38: f81d83a0    	stur	x0, [x29, #-40]
100001b3c: f85d83a8    	ldur	x8, [x29, #-40]
100001b40: f1000108    	subs	x8, x8, #0
100001b44: 1a9f07e8    	cset	w8, ne
100001b48: 37000128    	tbnz	w8, #0, 0x100001b6c <_PRINT+0x3c0>
100001b4c: 14000001    	b	0x100001b50 <_PRINT+0x3a4>
100001b50: f85f83a8    	ldur	x8, [x29, #-8]
100001b54: 910003e9    	mov	x9, sp
100001b58: f9000128    	str	x8, [x9]
100001b5c: d0000000    	adrp	x0, 0x100003000 <_PRINT+0x3b8>
100001b60: 9139f000    	add	x0, x0, #3708
100001b64: 97fffc14    	bl	0x100000bb4 <_error>
100001b68: 14000001    	b	0x100001b6c <_PRINT+0x3c0>
100001b6c: f85d83a8    	ldur	x8, [x29, #-40]
100001b70: f9400508    	ldr	x8, [x8, #8]
100001b74: f81f83a8    	stur	x8, [x29, #-8]
100001b78: 17ffff32    	b	0x100001840 <_PRINT+0x94>
100001b7c: a9467bfd    	ldp	x29, x30, [sp, #96]
100001b80: 9101c3ff    	add	sp, sp, #112
100001b84: d65f03c0    	ret

0000000100001b88 <_ITEM>:
100001b88: d101c3ff    	sub	sp, sp, #112
100001b8c: a9067bfd    	stp	x29, x30, [sp, #96]
100001b90: 910183fd    	add	x29, sp, #96
100001b94: f0000028    	adrp	x8, 0x100008000 <_ITEM+0x28>
100001b98: 9100a108    	add	x8, x8, #40
100001b9c: f9000fe8    	str	x8, [sp, #24]
100001ba0: f0000028    	adrp	x8, 0x100008000 <_ITEM+0x34>
100001ba4: 91000108    	add	x8, x8, #0
100001ba8: f9000be8    	str	x8, [sp, #16]
100001bac: 940006dd    	bl	0x100003720 <_parse>
100001bb0: f9400fe8    	ldr	x8, [sp, #24]
100001bb4: b9400108    	ldr	w8, [x8]
100001bb8: b90027e8    	str	w8, [sp, #36]
100001bbc: 71000108    	subs	w8, w8, #0
100001bc0: 71000508    	subs	w8, w8, #1
100001bc4: 1a9f87e8    	cset	w8, ls
100001bc8: 37000188    	tbnz	w8, #0, 0x100001bf8 <_ITEM+0x70>
100001bcc: 14000001    	b	0x100001bd0 <_ITEM+0x48>
100001bd0: b94027e8    	ldr	w8, [sp, #36]
100001bd4: 71000908    	subs	w8, w8, #2
100001bd8: 1a9f17e8    	cset	w8, eq
100001bdc: 37000208    	tbnz	w8, #0, 0x100001c1c <_ITEM+0x94>
100001be0: 14000001    	b	0x100001be4 <_ITEM+0x5c>
100001be4: b94027e8    	ldr	w8, [sp, #36]
100001be8: 71000d08    	subs	w8, w8, #3
100001bec: 1a9f17e8    	cset	w8, eq
100001bf0: 370001c8    	tbnz	w8, #0, 0x100001c28 <_ITEM+0xa0>
100001bf4: 14000026    	b	0x100001c8c <_ITEM+0x104>
100001bf8: d10023a0    	sub	x0, x29, #8
100001bfc: 97fffc96    	bl	0x100000e54 <_symbolcpy>
100001c00: f85f83a8    	ldur	x8, [x29, #-8]
100001c04: 910003e9    	mov	x9, sp
100001c08: f9000128    	str	x8, [x9]
100001c0c: d0000000    	adrp	x0, 0x100003000 <_ITEM+0x8c>
100001c10: 913a6800    	add	x0, x0, #3738
100001c14: 97fffbe8    	bl	0x100000bb4 <_error>
100001c18: 1400001d    	b	0x100001c8c <_ITEM+0x104>
100001c1c: d10023a0    	sub	x0, x29, #8
100001c20: 97fffc62    	bl	0x100000da8 <_quotecpy>
100001c24: 1400001a    	b	0x100001c8c <_ITEM+0x104>
100001c28: d10023a0    	sub	x0, x29, #8
100001c2c: 97fffc8a    	bl	0x100000e54 <_symbolcpy>
100001c30: f9400be8    	ldr	x8, [sp, #16]
100001c34: f9400100    	ldr	x0, [x8]
100001c38: f85f83a1    	ldur	x1, [x29, #-8]
100001c3c: 97fffd51    	bl	0x100001180 <_lookup>
100001c40: f81f03a0    	stur	x0, [x29, #-16]
100001c44: f85f03a8    	ldur	x8, [x29, #-16]
100001c48: f1000108    	subs	x8, x8, #0
100001c4c: 1a9f07e8    	cset	w8, ne
100001c50: 37000128    	tbnz	w8, #0, 0x100001c74 <_ITEM+0xec>
100001c54: 14000001    	b	0x100001c58 <_ITEM+0xd0>
100001c58: f85f83a8    	ldur	x8, [x29, #-8]
100001c5c: 910003e9    	mov	x9, sp
100001c60: f9000128    	str	x8, [x9]
100001c64: d0000000    	adrp	x0, 0x100003000 <_ITEM+0xe4>
100001c68: 9139f000    	add	x0, x0, #3708
100001c6c: 97fffbd2    	bl	0x100000bb4 <_error>
100001c70: 14000001    	b	0x100001c74 <_ITEM+0xec>
100001c74: f85f83a0    	ldur	x0, [x29, #-8]
100001c78: f85f03a8    	ldur	x8, [x29, #-16]
100001c7c: f9400501    	ldr	x1, [x8, #8]
100001c80: 92800002    	mov	x2, #-1
100001c84: 940007eb    	bl	0x100003c30 <_vfprintf+0x100003c30>
100001c88: 14000001    	b	0x100001c8c <_ITEM+0x104>
100001c8c: f85f83a0    	ldur	x0, [x29, #-8]
100001c90: 94000824    	bl	0x100003d20 <_vfprintf+0x100003d20>
100001c94: f81e03a0    	stur	x0, [x29, #-32]
100001c98: b81dc3bf    	stur	wzr, [x29, #-36]
100001c9c: 14000001    	b	0x100001ca0 <_ITEM+0x118>
100001ca0: b89dc3a8    	ldursw	x8, [x29, #-36]
100001ca4: f85e03a9    	ldur	x9, [x29, #-32]
100001ca8: eb090108    	subs	x8, x8, x9
100001cac: 1a9fb7e8    	cset	w8, ge
100001cb0: 370013e8    	tbnz	w8, #0, 0x100001f2c <_ITEM+0x3a4>
100001cb4: 14000001    	b	0x100001cb8 <_ITEM+0x130>
100001cb8: f85f83a8    	ldur	x8, [x29, #-8]
100001cbc: b89dc3a9    	ldursw	x9, [x29, #-36]
100001cc0: 38e96900    	ldrsb	w0, [x8, x9]
100001cc4: 94000805    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100001cc8: 71000008    	subs	w8, w0, #0
100001ccc: 1a9f17e8    	cset	w8, eq
100001cd0: 37000068    	tbnz	w8, #0, 0x100001cdc <_ITEM+0x154>
100001cd4: 14000001    	b	0x100001cd8 <_ITEM+0x150>
100001cd8: 14000091    	b	0x100001f1c <_ITEM+0x394>
100001cdc: b81d83bf    	stur	wzr, [x29, #-40]
100001ce0: 14000001    	b	0x100001ce4 <_ITEM+0x15c>
100001ce4: f85f83a8    	ldur	x8, [x29, #-8]
100001ce8: b89dc3a9    	ldursw	x9, [x29, #-36]
100001cec: 38e96900    	ldrsb	w0, [x8, x9]
100001cf0: 940007fa    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100001cf4: 71000008    	subs	w8, w0, #0
100001cf8: 1a9f07e8    	cset	w8, ne
100001cfc: 52800009    	mov	w9, #0
100001d00: b9000fe9    	str	w9, [sp, #12]
100001d04: 37000128    	tbnz	w8, #0, 0x100001d28 <_ITEM+0x1a0>
100001d08: 14000001    	b	0x100001d0c <_ITEM+0x184>
100001d0c: f85f83a8    	ldur	x8, [x29, #-8]
100001d10: b89dc3a9    	ldursw	x9, [x29, #-36]
100001d14: 38e96908    	ldrsb	w8, [x8, x9]
100001d18: 71000108    	subs	w8, w8, #0
100001d1c: 1a9f07e8    	cset	w8, ne
100001d20: b9000fe8    	str	w8, [sp, #12]
100001d24: 14000001    	b	0x100001d28 <_ITEM+0x1a0>
100001d28: b9400fe8    	ldr	w8, [sp, #12]
100001d2c: 36000148    	tbz	w8, #0, 0x100001d54 <_ITEM+0x1cc>
100001d30: 14000001    	b	0x100001d34 <_ITEM+0x1ac>
100001d34: 14000001    	b	0x100001d38 <_ITEM+0x1b0>
100001d38: b85dc3a8    	ldur	w8, [x29, #-36]
100001d3c: 11000508    	add	w8, w8, #1
100001d40: b81dc3a8    	stur	w8, [x29, #-36]
100001d44: b85d83a8    	ldur	w8, [x29, #-40]
100001d48: 11000508    	add	w8, w8, #1
100001d4c: b81d83a8    	stur	w8, [x29, #-40]
100001d50: 17ffffe5    	b	0x100001ce4 <_ITEM+0x15c>
100001d54: b85d83a8    	ldur	w8, [x29, #-40]
100001d58: 11000509    	add	w9, w8, #1
100001d5c: aa0903e8    	mov	x8, x9
100001d60: 93407d00    	sxtw	x0, w8
100001d64: 940007e0    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100001d68: f9001be0    	str	x0, [sp, #48]
100001d6c: f9401be0    	ldr	x0, [sp, #48]
100001d70: f85f83a8    	ldur	x8, [x29, #-8]
100001d74: b89dc3a9    	ldursw	x9, [x29, #-36]
100001d78: 8b090108    	add	x8, x8, x9
100001d7c: b89d83a9    	ldursw	x9, [x29, #-40]
100001d80: eb090101    	subs	x1, x8, x9
100001d84: b89d83a2    	ldursw	x2, [x29, #-40]
100001d88: 92800003    	mov	x3, #-1
100001d8c: 940007ac    	bl	0x100003c3c <_vfprintf+0x100003c3c>
100001d90: f9401be8    	ldr	x8, [sp, #48]
100001d94: b89dc3a9    	ldursw	x9, [x29, #-36]
100001d98: 8b090108    	add	x8, x8, x9
100001d9c: 3900011f    	strb	wzr, [x8]
100001da0: 94000660    	bl	0x100003720 <_parse>
100001da4: f9400fe8    	ldr	x8, [sp, #24]
100001da8: b9400108    	ldr	w8, [x8]
100001dac: b9000be8    	str	w8, [sp, #8]
100001db0: 71000108    	subs	w8, w8, #0
100001db4: 71000508    	subs	w8, w8, #1
100001db8: 1a9f87e8    	cset	w8, ls
100001dbc: 37000188    	tbnz	w8, #0, 0x100001dec <_ITEM+0x264>
100001dc0: 14000001    	b	0x100001dc4 <_ITEM+0x23c>
100001dc4: b9400be8    	ldr	w8, [sp, #8]
100001dc8: 71000908    	subs	w8, w8, #2
100001dcc: 1a9f17e8    	cset	w8, eq
100001dd0: 370005c8    	tbnz	w8, #0, 0x100001e88 <_ITEM+0x300>
100001dd4: 14000001    	b	0x100001dd8 <_ITEM+0x250>
100001dd8: b9400be8    	ldr	w8, [sp, #8]
100001ddc: 71000d08    	subs	w8, w8, #3
100001de0: 1a9f17e8    	cset	w8, eq
100001de4: 37000628    	tbnz	w8, #0, 0x100001ea8 <_ITEM+0x320>
100001de8: 1400004c    	b	0x100001f18 <_ITEM+0x390>
100001dec: f9400fe8    	ldr	x8, [sp, #24]
100001df0: b9400108    	ldr	w8, [x8]
100001df4: 71000108    	subs	w8, w8, #0
100001df8: 1a9f07e8    	cset	w8, ne
100001dfc: 37000268    	tbnz	w8, #0, 0x100001e48 <_ITEM+0x2c0>
100001e00: 14000001    	b	0x100001e04 <_ITEM+0x27c>
100001e04: f0000028    	adrp	x8, 0x100008000 <_ITEM+0x298>
100001e08: 91002108    	add	x8, x8, #8
100001e0c: f9400108    	ldr	x8, [x8]
100001e10: f0000029    	adrp	x9, 0x100008000 <_ITEM+0x2a4>
100001e14: 91006129    	add	x9, x9, #24
100001e18: f9400129    	ldr	x9, [x9]
100001e1c: 8b090100    	add	x0, x8, x9
100001e20: 9400078d    	bl	0x100003c54 <_vfprintf+0x100003c54>
100001e24: f9400be8    	ldr	x8, [sp, #16]
100001e28: aa0003e9    	mov	x9, x0
100001e2c: 93407d29    	sxtw	x9, w9
100001e30: f81e83a9    	stur	x9, [x29, #-24]
100001e34: f9400100    	ldr	x0, [x8]
100001e38: f9401be1    	ldr	x1, [sp, #48]
100001e3c: f85e83a2    	ldur	x2, [x29, #-24]
100001e40: 97fffd01    	bl	0x100001244 <_upsert>
100001e44: 14000010    	b	0x100001e84 <_ITEM+0x2fc>
100001e48: f0000028    	adrp	x8, 0x100008000 <_ITEM+0x2dc>
100001e4c: 91002108    	add	x8, x8, #8
100001e50: f9400108    	ldr	x8, [x8]
100001e54: f0000029    	adrp	x9, 0x100008000 <_ITEM+0x2e8>
100001e58: 91006129    	add	x9, x9, #24
100001e5c: f9400129    	ldr	x9, [x9]
100001e60: 8b090100    	add	x0, x8, x9
100001e64: 94000779    	bl	0x100003c48 <_vfprintf+0x100003c48>
100001e68: f9400be8    	ldr	x8, [sp, #16]
100001e6c: fc1e83a0    	stur	d0, [x29, #-24]
100001e70: f9400100    	ldr	x0, [x8]
100001e74: f9401be1    	ldr	x1, [sp, #48]
100001e78: f85e83a2    	ldur	x2, [x29, #-24]
100001e7c: 97fffcf2    	bl	0x100001244 <_upsert>
100001e80: 14000001    	b	0x100001e84 <_ITEM+0x2fc>
100001e84: 14000025    	b	0x100001f18 <_ITEM+0x390>
100001e88: d10063a0    	sub	x0, x29, #24
100001e8c: 97fffbc7    	bl	0x100000da8 <_quotecpy>
100001e90: f9400be8    	ldr	x8, [sp, #16]
100001e94: f9400100    	ldr	x0, [x8]
100001e98: f9401be1    	ldr	x1, [sp, #48]
100001e9c: f85e83a2    	ldur	x2, [x29, #-24]
100001ea0: 97fffce9    	bl	0x100001244 <_upsert>
100001ea4: 1400001d    	b	0x100001f18 <_ITEM+0x390>
100001ea8: 9100a3e0    	add	x0, sp, #40
100001eac: 97fffbea    	bl	0x100000e54 <_symbolcpy>
100001eb0: f9400be8    	ldr	x8, [sp, #16]
100001eb4: f9400100    	ldr	x0, [x8]
100001eb8: f94017e1    	ldr	x1, [sp, #40]
100001ebc: 97fffcb1    	bl	0x100001180 <_lookup>
100001ec0: f81f03a0    	stur	x0, [x29, #-16]
100001ec4: f85f03a8    	ldur	x8, [x29, #-16]
100001ec8: f1000108    	subs	x8, x8, #0
100001ecc: 1a9f07e8    	cset	w8, ne
100001ed0: 37000128    	tbnz	w8, #0, 0x100001ef4 <_ITEM+0x36c>
100001ed4: 14000001    	b	0x100001ed8 <_ITEM+0x350>
100001ed8: f94017e8    	ldr	x8, [sp, #40]
100001edc: 910003e9    	mov	x9, sp
100001ee0: f9000128    	str	x8, [x9]
100001ee4: d0000000    	adrp	x0, 0x100003000 <_ITEM+0x364>
100001ee8: 9139f000    	add	x0, x0, #3708
100001eec: 97fffb32    	bl	0x100000bb4 <_error>
100001ef0: 14000001    	b	0x100001ef4 <_ITEM+0x36c>
100001ef4: f9400be8    	ldr	x8, [sp, #16]
100001ef8: f85f03a9    	ldur	x9, [x29, #-16]
100001efc: f9400529    	ldr	x9, [x9, #8]
100001f00: f81e83a9    	stur	x9, [x29, #-24]
100001f04: f9400100    	ldr	x0, [x8]
100001f08: f9401be1    	ldr	x1, [sp, #48]
100001f0c: f85e83a2    	ldur	x2, [x29, #-24]
100001f10: 97fffccd    	bl	0x100001244 <_upsert>
100001f14: 14000001    	b	0x100001f18 <_ITEM+0x390>
100001f18: 14000001    	b	0x100001f1c <_ITEM+0x394>
100001f1c: b85dc3a8    	ldur	w8, [x29, #-36]
100001f20: 11000508    	add	w8, w8, #1
100001f24: b81dc3a8    	stur	w8, [x29, #-36]
100001f28: 17ffff5e    	b	0x100001ca0 <_ITEM+0x118>
100001f2c: f85f83a0    	ldur	x0, [x29, #-8]
100001f30: 9400075e    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001f34: a9467bfd    	ldp	x29, x30, [sp, #96]
100001f38: 9101c3ff    	add	sp, sp, #112
100001f3c: d65f03c0    	ret

0000000100001f40 <_FREE>:
100001f40: d100c3ff    	sub	sp, sp, #48
100001f44: a9027bfd    	stp	x29, x30, [sp, #32]
100001f48: 910083fd    	add	x29, sp, #32
100001f4c: 940005f5    	bl	0x100003720 <_parse>
100001f50: d10023a0    	sub	x0, x29, #8
100001f54: 97fffbc0    	bl	0x100000e54 <_symbolcpy>
100001f58: f0000028    	adrp	x8, 0x100008000 <_FREE+0x34>
100001f5c: 9100a108    	add	x8, x8, #40
100001f60: b9400108    	ldr	w8, [x8]
100001f64: 71000d08    	subs	w8, w8, #3
100001f68: 1a9f17e8    	cset	w8, eq
100001f6c: 37000128    	tbnz	w8, #0, 0x100001f90 <_FREE+0x50>
100001f70: 14000001    	b	0x100001f74 <_FREE+0x34>
100001f74: f85f83a8    	ldur	x8, [x29, #-8]
100001f78: 910003e9    	mov	x9, sp
100001f7c: f9000128    	str	x8, [x9]
100001f80: d0000000    	adrp	x0, 0x100003000 <_FREE+0x48>
100001f84: 9139a400    	add	x0, x0, #3689
100001f88: 97fffb0b    	bl	0x100000bb4 <_error>
100001f8c: 14000001    	b	0x100001f90 <_FREE+0x50>
100001f90: f0000028    	adrp	x8, 0x100008000 <_FREE+0x6c>
100001f94: 91000108    	add	x8, x8, #0
100001f98: f9400100    	ldr	x0, [x8]
100001f9c: f85f83a1    	ldur	x1, [x29, #-8]
100001fa0: 97fffc78    	bl	0x100001180 <_lookup>
100001fa4: f9000be0    	str	x0, [sp, #16]
100001fa8: f9400be8    	ldr	x8, [sp, #16]
100001fac: f1000108    	subs	x8, x8, #0
100001fb0: 1a9f07e8    	cset	w8, ne
100001fb4: 37000128    	tbnz	w8, #0, 0x100001fd8 <_FREE+0x98>
100001fb8: 14000001    	b	0x100001fbc <_FREE+0x7c>
100001fbc: f85f83a8    	ldur	x8, [x29, #-8]
100001fc0: 910003e9    	mov	x9, sp
100001fc4: f9000128    	str	x8, [x9]
100001fc8: d0000000    	adrp	x0, 0x100003000 <_FREE+0x90>
100001fcc: 9139f000    	add	x0, x0, #3708
100001fd0: 97fffaf9    	bl	0x100000bb4 <_error>
100001fd4: 14000001    	b	0x100001fd8 <_FREE+0x98>
100001fd8: f9400be8    	ldr	x8, [sp, #16]
100001fdc: f9400500    	ldr	x0, [x8, #8]
100001fe0: 94000732    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100001fe4: a9427bfd    	ldp	x29, x30, [sp, #32]
100001fe8: 9100c3ff    	add	sp, sp, #48
100001fec: d65f03c0    	ret

0000000100001ff0 <_DO>:
100001ff0: d100c3ff    	sub	sp, sp, #48
100001ff4: a9027bfd    	stp	x29, x30, [sp, #32]
100001ff8: 910083fd    	add	x29, sp, #32
100001ffc: 940005c9    	bl	0x100003720 <_parse>
100002000: d0000028    	adrp	x8, 0x100008000 <_DO+0x28>
100002004: 9100a108    	add	x8, x8, #40
100002008: b9400108    	ldr	w8, [x8]
10000200c: b9000fe8    	str	w8, [sp, #12]
100002010: 71000108    	subs	w8, w8, #0
100002014: 71000508    	subs	w8, w8, #1
100002018: 1a9f87e8    	cset	w8, ls
10000201c: 37000188    	tbnz	w8, #0, 0x10000204c <_DO+0x5c>
100002020: 14000001    	b	0x100002024 <_DO+0x34>
100002024: b9400fe8    	ldr	w8, [sp, #12]
100002028: 71000908    	subs	w8, w8, #2
10000202c: 1a9f17e8    	cset	w8, eq
100002030: 37000168    	tbnz	w8, #0, 0x10000205c <_DO+0x6c>
100002034: 14000001    	b	0x100002038 <_DO+0x48>
100002038: b9400fe8    	ldr	w8, [sp, #12]
10000203c: 71000d08    	subs	w8, w8, #3
100002040: 1a9f17e8    	cset	w8, eq
100002044: 37000168    	tbnz	w8, #0, 0x100002070 <_DO+0x80>
100002048: 14000022    	b	0x1000020d0 <_DO+0xe0>
10000204c: b0000000    	adrp	x0, 0x100003000 <_DO+0x60>
100002050: 913ad400    	add	x0, x0, #3765
100002054: 97fffad8    	bl	0x100000bb4 <_error>
100002058: 1400001e    	b	0x1000020d0 <_DO+0xe0>
10000205c: d10023a0    	sub	x0, x29, #8
100002060: 97fffb52    	bl	0x100000da8 <_quotecpy>
100002064: f85f83a0    	ldur	x0, [x29, #-8]
100002068: 97fffd4f    	bl	0x1000015a4 <_push_scope>
10000206c: 14000019    	b	0x1000020d0 <_DO+0xe0>
100002070: d10023a0    	sub	x0, x29, #8
100002074: 97fffb78    	bl	0x100000e54 <_symbolcpy>
100002078: d0000028    	adrp	x8, 0x100008000 <_DO+0xa0>
10000207c: 91000108    	add	x8, x8, #0
100002080: f9400100    	ldr	x0, [x8]
100002084: f85f83a1    	ldur	x1, [x29, #-8]
100002088: 97fffc3e    	bl	0x100001180 <_lookup>
10000208c: f9000be0    	str	x0, [sp, #16]
100002090: f9400be8    	ldr	x8, [sp, #16]
100002094: f1000108    	subs	x8, x8, #0
100002098: 1a9f07e8    	cset	w8, ne
10000209c: 37000128    	tbnz	w8, #0, 0x1000020c0 <_DO+0xd0>
1000020a0: 14000001    	b	0x1000020a4 <_DO+0xb4>
1000020a4: f85f83a8    	ldur	x8, [x29, #-8]
1000020a8: 910003e9    	mov	x9, sp
1000020ac: f9000128    	str	x8, [x9]
1000020b0: b0000000    	adrp	x0, 0x100003000 <_DO+0xc4>
1000020b4: 9139f000    	add	x0, x0, #3708
1000020b8: 97fffabf    	bl	0x100000bb4 <_error>
1000020bc: 14000001    	b	0x1000020c0 <_DO+0xd0>
1000020c0: f9400be8    	ldr	x8, [sp, #16]
1000020c4: f9400500    	ldr	x0, [x8, #8]
1000020c8: 97fffd37    	bl	0x1000015a4 <_push_scope>
1000020cc: 14000001    	b	0x1000020d0 <_DO+0xe0>
1000020d0: a9427bfd    	ldp	x29, x30, [sp, #32]
1000020d4: 9100c3ff    	add	sp, sp, #48
1000020d8: d65f03c0    	ret

00000001000020dc <_concat>:
1000020dc: d10103ff    	sub	sp, sp, #64
1000020e0: a9037bfd    	stp	x29, x30, [sp, #48]
1000020e4: 9100c3fd    	add	x29, sp, #48
1000020e8: f81f83a0    	stur	x0, [x29, #-8]
1000020ec: f81f03a1    	stur	x1, [x29, #-16]
1000020f0: f85f83a0    	ldur	x0, [x29, #-8]
1000020f4: 9400070b    	bl	0x100003d20 <_vfprintf+0x100003d20>
1000020f8: aa0003e8    	mov	x8, x0
1000020fc: b81ec3a8    	stur	w8, [x29, #-20]
100002100: f85f03a0    	ldur	x0, [x29, #-16]
100002104: 94000707    	bl	0x100003d20 <_vfprintf+0x100003d20>
100002108: aa0003e8    	mov	x8, x0
10000210c: b9001be8    	str	w8, [sp, #24]
100002110: b85ec3a8    	ldur	w8, [x29, #-20]
100002114: b9401be9    	ldr	w9, [sp, #24]
100002118: 0b090108    	add	w8, w8, w9
10000211c: 11000509    	add	w9, w8, #1
100002120: aa0903e8    	mov	x8, x9
100002124: 93407d00    	sxtw	x0, w8
100002128: 940006ef    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
10000212c: f9000be0    	str	x0, [sp, #16]
100002130: b9000fff    	str	wzr, [sp, #12]
100002134: 14000001    	b	0x100002138 <_concat+0x5c>
100002138: b9400fe8    	ldr	w8, [sp, #12]
10000213c: b85ec3a9    	ldur	w9, [x29, #-20]
100002140: 6b090108    	subs	w8, w8, w9
100002144: 1a9fb7e8    	cset	w8, ge
100002148: 370001e8    	tbnz	w8, #0, 0x100002184 <_concat+0xa8>
10000214c: 14000001    	b	0x100002150 <_concat+0x74>
100002150: f85f83a8    	ldur	x8, [x29, #-8]
100002154: b9800fe9    	ldrsw	x9, [sp, #12]
100002158: 8b090108    	add	x8, x8, x9
10000215c: 39400108    	ldrb	w8, [x8]
100002160: f9400be9    	ldr	x9, [sp, #16]
100002164: b9800fea    	ldrsw	x10, [sp, #12]
100002168: 8b0a0129    	add	x9, x9, x10
10000216c: 39000128    	strb	w8, [x9]
100002170: 14000001    	b	0x100002174 <_concat+0x98>
100002174: b9400fe8    	ldr	w8, [sp, #12]
100002178: 11000508    	add	w8, w8, #1
10000217c: b9000fe8    	str	w8, [sp, #12]
100002180: 17ffffee    	b	0x100002138 <_concat+0x5c>
100002184: b9000bff    	str	wzr, [sp, #8]
100002188: 14000001    	b	0x10000218c <_concat+0xb0>
10000218c: b9400fe8    	ldr	w8, [sp, #12]
100002190: b85ec3a9    	ldur	w9, [x29, #-20]
100002194: b9401bea    	ldr	w10, [sp, #24]
100002198: 0b0a0129    	add	w9, w9, w10
10000219c: 6b090108    	subs	w8, w8, w9
1000021a0: 1a9fb7e8    	cset	w8, ge
1000021a4: 37000248    	tbnz	w8, #0, 0x1000021ec <_concat+0x110>
1000021a8: 14000001    	b	0x1000021ac <_concat+0xd0>
1000021ac: f85f03a8    	ldur	x8, [x29, #-16]
1000021b0: b9800be9    	ldrsw	x9, [sp, #8]
1000021b4: 8b090108    	add	x8, x8, x9
1000021b8: 39400108    	ldrb	w8, [x8]
1000021bc: f9400be9    	ldr	x9, [sp, #16]
1000021c0: b9800fea    	ldrsw	x10, [sp, #12]
1000021c4: 8b0a0129    	add	x9, x9, x10
1000021c8: 39000128    	strb	w8, [x9]
1000021cc: 14000001    	b	0x1000021d0 <_concat+0xf4>
1000021d0: b9400fe8    	ldr	w8, [sp, #12]
1000021d4: 11000508    	add	w8, w8, #1
1000021d8: b9000fe8    	str	w8, [sp, #12]
1000021dc: b9400be8    	ldr	w8, [sp, #8]
1000021e0: 11000508    	add	w8, w8, #1
1000021e4: b9000be8    	str	w8, [sp, #8]
1000021e8: 17ffffe9    	b	0x10000218c <_concat+0xb0>
1000021ec: f9400be8    	ldr	x8, [sp, #16]
1000021f0: b85ec3a9    	ldur	w9, [x29, #-20]
1000021f4: b9401bea    	ldr	w10, [sp, #24]
1000021f8: 0b0a0129    	add	w9, w9, w10
1000021fc: 8b29c108    	add	x8, x8, w9, sxtw
100002200: 3900011f    	strb	wzr, [x8]
100002204: f9400be0    	ldr	x0, [sp, #16]
100002208: a9437bfd    	ldp	x29, x30, [sp, #48]
10000220c: 910103ff    	add	sp, sp, #64
100002210: d65f03c0    	ret

0000000100002214 <_PROC>:
100002214: d101c3ff    	sub	sp, sp, #112
100002218: a9067bfd    	stp	x29, x30, [sp, #96]
10000221c: 910183fd    	add	x29, sp, #96
100002220: d0000028    	adrp	x8, 0x100008000 <_PROC+0x24>
100002224: 91000108    	add	x8, x8, #0
100002228: f9000be8    	str	x8, [sp, #16]
10000222c: 9400053d    	bl	0x100003720 <_parse>
100002230: d0000028    	adrp	x8, 0x100008000 <_PROC+0x34>
100002234: 9100a108    	add	x8, x8, #40
100002238: b9400108    	ldr	w8, [x8]
10000223c: b9001fe8    	str	w8, [sp, #28]
100002240: 71000108    	subs	w8, w8, #0
100002244: 71000508    	subs	w8, w8, #1
100002248: 1a9f87e8    	cset	w8, ls
10000224c: 37000188    	tbnz	w8, #0, 0x10000227c <_PROC+0x68>
100002250: 14000001    	b	0x100002254 <_PROC+0x40>
100002254: b9401fe8    	ldr	w8, [sp, #28]
100002258: 71000908    	subs	w8, w8, #2
10000225c: 1a9f17e8    	cset	w8, eq
100002260: 37000208    	tbnz	w8, #0, 0x1000022a0 <_PROC+0x8c>
100002264: 14000001    	b	0x100002268 <_PROC+0x54>
100002268: b9401fe8    	ldr	w8, [sp, #28]
10000226c: 71000d08    	subs	w8, w8, #3
100002270: 1a9f17e8    	cset	w8, eq
100002274: 370001c8    	tbnz	w8, #0, 0x1000022ac <_PROC+0x98>
100002278: 14000026    	b	0x100002310 <_PROC+0xfc>
10000227c: d10023a0    	sub	x0, x29, #8
100002280: 97fffaf5    	bl	0x100000e54 <_symbolcpy>
100002284: f85f83a8    	ldur	x8, [x29, #-8]
100002288: 910003e9    	mov	x9, sp
10000228c: f9000128    	str	x8, [x9]
100002290: b0000000    	adrp	x0, 0x100003000 <_PROC+0x80>
100002294: 913a6800    	add	x0, x0, #3738
100002298: 97fffa47    	bl	0x100000bb4 <_error>
10000229c: 1400001d    	b	0x100002310 <_PROC+0xfc>
1000022a0: d10023a0    	sub	x0, x29, #8
1000022a4: 97fffac1    	bl	0x100000da8 <_quotecpy>
1000022a8: 1400001a    	b	0x100002310 <_PROC+0xfc>
1000022ac: d10023a0    	sub	x0, x29, #8
1000022b0: 97fffae9    	bl	0x100000e54 <_symbolcpy>
1000022b4: f9400be8    	ldr	x8, [sp, #16]
1000022b8: f9400100    	ldr	x0, [x8]
1000022bc: f85f83a1    	ldur	x1, [x29, #-8]
1000022c0: 97fffbb0    	bl	0x100001180 <_lookup>
1000022c4: f81f03a0    	stur	x0, [x29, #-16]
1000022c8: f85f03a8    	ldur	x8, [x29, #-16]
1000022cc: f1000108    	subs	x8, x8, #0
1000022d0: 1a9f07e8    	cset	w8, ne
1000022d4: 37000128    	tbnz	w8, #0, 0x1000022f8 <_PROC+0xe4>
1000022d8: 14000001    	b	0x1000022dc <_PROC+0xc8>
1000022dc: f85f83a8    	ldur	x8, [x29, #-8]
1000022e0: 910003e9    	mov	x9, sp
1000022e4: f9000128    	str	x8, [x9]
1000022e8: b0000000    	adrp	x0, 0x100003000 <_PROC+0xd8>
1000022ec: 9139f000    	add	x0, x0, #3708
1000022f0: 97fffa31    	bl	0x100000bb4 <_error>
1000022f4: 14000001    	b	0x1000022f8 <_PROC+0xe4>
1000022f8: f85f83a0    	ldur	x0, [x29, #-8]
1000022fc: f85f03a8    	ldur	x8, [x29, #-16]
100002300: f9400501    	ldr	x1, [x8, #8]
100002304: 92800002    	mov	x2, #-1
100002308: 9400064a    	bl	0x100003c30 <_vfprintf+0x100003c30>
10000230c: 14000001    	b	0x100002310 <_PROC+0xfc>
100002310: 94000504    	bl	0x100003720 <_parse>
100002314: d0000028    	adrp	x8, 0x100008000 <_PROC+0x118>
100002318: 9100a108    	add	x8, x8, #40
10000231c: b9400108    	ldr	w8, [x8]
100002320: b9000fe8    	str	w8, [sp, #12]
100002324: 71000108    	subs	w8, w8, #0
100002328: 71000508    	subs	w8, w8, #1
10000232c: 1a9f87e8    	cset	w8, ls
100002330: 37000188    	tbnz	w8, #0, 0x100002360 <_PROC+0x14c>
100002334: 14000001    	b	0x100002338 <_PROC+0x124>
100002338: b9400fe8    	ldr	w8, [sp, #12]
10000233c: 71000908    	subs	w8, w8, #2
100002340: 1a9f17e8    	cset	w8, eq
100002344: 37000208    	tbnz	w8, #0, 0x100002384 <_PROC+0x170>
100002348: 14000001    	b	0x10000234c <_PROC+0x138>
10000234c: b9400fe8    	ldr	w8, [sp, #12]
100002350: 71000d08    	subs	w8, w8, #3
100002354: 1a9f17e8    	cset	w8, eq
100002358: 370001c8    	tbnz	w8, #0, 0x100002390 <_PROC+0x17c>
10000235c: 14000026    	b	0x1000023f4 <_PROC+0x1e0>
100002360: d10063a0    	sub	x0, x29, #24
100002364: 97fffabc    	bl	0x100000e54 <_symbolcpy>
100002368: f85f83a8    	ldur	x8, [x29, #-8]
10000236c: 910003e9    	mov	x9, sp
100002370: f9000128    	str	x8, [x9]
100002374: b0000000    	adrp	x0, 0x100003000 <_PROC+0x164>
100002378: 913a6800    	add	x0, x0, #3738
10000237c: 97fffa0e    	bl	0x100000bb4 <_error>
100002380: 1400001d    	b	0x1000023f4 <_PROC+0x1e0>
100002384: d10063a0    	sub	x0, x29, #24
100002388: 97fffa88    	bl	0x100000da8 <_quotecpy>
10000238c: 1400001a    	b	0x1000023f4 <_PROC+0x1e0>
100002390: d10063a0    	sub	x0, x29, #24
100002394: 97fffab0    	bl	0x100000e54 <_symbolcpy>
100002398: f9400be8    	ldr	x8, [sp, #16]
10000239c: f9400100    	ldr	x0, [x8]
1000023a0: f85e83a1    	ldur	x1, [x29, #-24]
1000023a4: 97fffb77    	bl	0x100001180 <_lookup>
1000023a8: f81f03a0    	stur	x0, [x29, #-16]
1000023ac: f85f03a8    	ldur	x8, [x29, #-16]
1000023b0: f1000108    	subs	x8, x8, #0
1000023b4: 1a9f07e8    	cset	w8, ne
1000023b8: 37000128    	tbnz	w8, #0, 0x1000023dc <_PROC+0x1c8>
1000023bc: 14000001    	b	0x1000023c0 <_PROC+0x1ac>
1000023c0: f85e83a8    	ldur	x8, [x29, #-24]
1000023c4: 910003e9    	mov	x9, sp
1000023c8: f9000128    	str	x8, [x9]
1000023cc: b0000000    	adrp	x0, 0x100003000 <_PROC+0x1bc>
1000023d0: 9139f000    	add	x0, x0, #3708
1000023d4: 97fff9f8    	bl	0x100000bb4 <_error>
1000023d8: 14000001    	b	0x1000023dc <_PROC+0x1c8>
1000023dc: f85e83a0    	ldur	x0, [x29, #-24]
1000023e0: f85f03a8    	ldur	x8, [x29, #-16]
1000023e4: f9400501    	ldr	x1, [x8, #8]
1000023e8: 92800002    	mov	x2, #-1
1000023ec: 94000611    	bl	0x100003c30 <_vfprintf+0x100003c30>
1000023f0: 14000001    	b	0x1000023f4 <_PROC+0x1e0>
1000023f4: b0000008    	adrp	x8, 0x100003000 <_PROC+0x1e4>
1000023f8: 913b3d08    	add	x8, x8, #3791
1000023fc: f81e03a8    	stur	x8, [x29, #-32]
100002400: f85e03a0    	ldur	x0, [x29, #-32]
100002404: f85f83a1    	ldur	x1, [x29, #-8]
100002408: 97ffff35    	bl	0x1000020dc <_concat>
10000240c: f81d83a0    	stur	x0, [x29, #-40]
100002410: b0000008    	adrp	x8, 0x100003000 <_PROC+0x200>
100002414: 913b7508    	add	x8, x8, #3805
100002418: f9001be8    	str	x8, [sp, #48]
10000241c: f85d83a0    	ldur	x0, [x29, #-40]
100002420: f9401be1    	ldr	x1, [sp, #48]
100002424: 97ffff2e    	bl	0x1000020dc <_concat>
100002428: f90017e0    	str	x0, [sp, #40]
10000242c: f94017e0    	ldr	x0, [sp, #40]
100002430: f85e83a1    	ldur	x1, [x29, #-24]
100002434: 97ffff2a    	bl	0x1000020dc <_concat>
100002438: f9400be8    	ldr	x8, [sp, #16]
10000243c: f90013e0    	str	x0, [sp, #32]
100002440: f9400100    	ldr	x0, [x8]
100002444: f94013e2    	ldr	x2, [sp, #32]
100002448: b0000001    	adrp	x1, 0x100003000 <_PROC+0x238>
10000244c: 9134e021    	add	x1, x1, #3384
100002450: 97fffb7d    	bl	0x100001244 <_upsert>
100002454: f85f83a0    	ldur	x0, [x29, #-8]
100002458: 94000614    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
10000245c: f85d83a0    	ldur	x0, [x29, #-40]
100002460: 94000612    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100002464: f94017e0    	ldr	x0, [sp, #40]
100002468: 94000610    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
10000246c: a9467bfd    	ldp	x29, x30, [sp, #96]
100002470: 9101c3ff    	add	sp, sp, #112
100002474: d65f03c0    	ret

0000000100002478 <_ITEM_IN>:
100002478: d102c3ff    	sub	sp, sp, #176
10000247c: a90a7bfd    	stp	x29, x30, [sp, #160]
100002480: 910283fd    	add	x29, sp, #160
100002484: d0000028    	adrp	x8, 0x100008000 <_ITEM_IN+0x24>
100002488: 9100a108    	add	x8, x8, #40
10000248c: f9001fe8    	str	x8, [sp, #56]
100002490: d0000028    	adrp	x8, 0x100008000 <_ITEM_IN+0x30>
100002494: 91000108    	add	x8, x8, #0
100002498: f90013e8    	str	x8, [sp, #32]
10000249c: d0000028    	adrp	x8, 0x100008000 <_ITEM_IN+0x3c>
1000024a0: 91002108    	add	x8, x8, #8
1000024a4: f90017e8    	str	x8, [sp, #40]
1000024a8: d0000028    	adrp	x8, 0x100008000 <_ITEM_IN+0x48>
1000024ac: 91006108    	add	x8, x8, #24
1000024b0: f9001be8    	str	x8, [sp, #48]
1000024b4: f81f03bf    	stur	xzr, [x29, #-16]
1000024b8: 9400049a    	bl	0x100003720 <_parse>
1000024bc: f9401fe8    	ldr	x8, [sp, #56]
1000024c0: b9400108    	ldr	w8, [x8]
1000024c4: b90047e8    	str	w8, [sp, #68]
1000024c8: 71000108    	subs	w8, w8, #0
1000024cc: 1a9f17e8    	cset	w8, eq
1000024d0: 370001a8    	tbnz	w8, #0, 0x100002504 <_ITEM_IN+0x8c>
1000024d4: 14000001    	b	0x1000024d8 <_ITEM_IN+0x60>
1000024d8: b94047e8    	ldr	w8, [sp, #68]
1000024dc: 71000508    	subs	w8, w8, #1
1000024e0: 71000508    	subs	w8, w8, #1
1000024e4: 1a9f87e8    	cset	w8, ls
1000024e8: 370001e8    	tbnz	w8, #0, 0x100002524 <_ITEM_IN+0xac>
1000024ec: 14000001    	b	0x1000024f0 <_ITEM_IN+0x78>
1000024f0: b94047e8    	ldr	w8, [sp, #68]
1000024f4: 71000d08    	subs	w8, w8, #3
1000024f8: 1a9f17e8    	cset	w8, eq
1000024fc: 370001c8    	tbnz	w8, #0, 0x100002534 <_ITEM_IN+0xbc>
100002500: 14000024    	b	0x100002590 <_ITEM_IN+0x118>
100002504: f9401be9    	ldr	x9, [sp, #48]
100002508: f94017e8    	ldr	x8, [sp, #40]
10000250c: f9400108    	ldr	x8, [x8]
100002510: f9400129    	ldr	x9, [x9]
100002514: 8b090100    	add	x0, x8, x9
100002518: 940005d2    	bl	0x100003c60 <_vfprintf+0x100003c60>
10000251c: f81f03a0    	stur	x0, [x29, #-16]
100002520: 1400001c    	b	0x100002590 <_ITEM_IN+0x118>
100002524: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0xb0>
100002528: 913c7400    	add	x0, x0, #3869
10000252c: 97fff9a2    	bl	0x100000bb4 <_error>
100002530: 14000018    	b	0x100002590 <_ITEM_IN+0x118>
100002534: d10063a0    	sub	x0, x29, #24
100002538: 97fffa47    	bl	0x100000e54 <_symbolcpy>
10000253c: f94013e8    	ldr	x8, [sp, #32]
100002540: f9400100    	ldr	x0, [x8]
100002544: f85e83a1    	ldur	x1, [x29, #-24]
100002548: 97fffb0e    	bl	0x100001180 <_lookup>
10000254c: f81f83a0    	stur	x0, [x29, #-8]
100002550: f85f83a8    	ldur	x8, [x29, #-8]
100002554: f1000108    	subs	x8, x8, #0
100002558: 1a9f07e8    	cset	w8, ne
10000255c: 37000128    	tbnz	w8, #0, 0x100002580 <_ITEM_IN+0x108>
100002560: 14000001    	b	0x100002564 <_ITEM_IN+0xec>
100002564: f85e83a8    	ldur	x8, [x29, #-24]
100002568: 910003e9    	mov	x9, sp
10000256c: f9000128    	str	x8, [x9]
100002570: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0xfc>
100002574: 9139f000    	add	x0, x0, #3708
100002578: 97fff98f    	bl	0x100000bb4 <_error>
10000257c: 14000001    	b	0x100002580 <_ITEM_IN+0x108>
100002580: f85f83a8    	ldur	x8, [x29, #-8]
100002584: f9400508    	ldr	x8, [x8, #8]
100002588: f81f03a8    	stur	x8, [x29, #-16]
10000258c: 14000001    	b	0x100002590 <_ITEM_IN+0x118>
100002590: 94000464    	bl	0x100003720 <_parse>
100002594: f9401fe8    	ldr	x8, [sp, #56]
100002598: b9400108    	ldr	w8, [x8]
10000259c: b9001fe8    	str	w8, [sp, #28]
1000025a0: 71000108    	subs	w8, w8, #0
1000025a4: 71000508    	subs	w8, w8, #1
1000025a8: 1a9f87e8    	cset	w8, ls
1000025ac: 37000188    	tbnz	w8, #0, 0x1000025dc <_ITEM_IN+0x164>
1000025b0: 14000001    	b	0x1000025b4 <_ITEM_IN+0x13c>
1000025b4: b9401fe8    	ldr	w8, [sp, #28]
1000025b8: 71000908    	subs	w8, w8, #2
1000025bc: 1a9f17e8    	cset	w8, eq
1000025c0: 37000208    	tbnz	w8, #0, 0x100002600 <_ITEM_IN+0x188>
1000025c4: 14000001    	b	0x1000025c8 <_ITEM_IN+0x150>
1000025c8: b9401fe8    	ldr	w8, [sp, #28]
1000025cc: 71000d08    	subs	w8, w8, #3
1000025d0: 1a9f17e8    	cset	w8, eq
1000025d4: 370001c8    	tbnz	w8, #0, 0x10000260c <_ITEM_IN+0x194>
1000025d8: 14000026    	b	0x100002670 <_ITEM_IN+0x1f8>
1000025dc: d10083a0    	sub	x0, x29, #32
1000025e0: 97fffa1d    	bl	0x100000e54 <_symbolcpy>
1000025e4: f85e03a8    	ldur	x8, [x29, #-32]
1000025e8: 910003e9    	mov	x9, sp
1000025ec: f9000128    	str	x8, [x9]
1000025f0: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0x17c>
1000025f4: 913a6800    	add	x0, x0, #3738
1000025f8: 97fff96f    	bl	0x100000bb4 <_error>
1000025fc: 1400001d    	b	0x100002670 <_ITEM_IN+0x1f8>
100002600: d10083a0    	sub	x0, x29, #32
100002604: 97fff9e9    	bl	0x100000da8 <_quotecpy>
100002608: 1400001a    	b	0x100002670 <_ITEM_IN+0x1f8>
10000260c: d10083a0    	sub	x0, x29, #32
100002610: 97fffa11    	bl	0x100000e54 <_symbolcpy>
100002614: f94013e8    	ldr	x8, [sp, #32]
100002618: f9400100    	ldr	x0, [x8]
10000261c: f85e03a1    	ldur	x1, [x29, #-32]
100002620: 97fffad8    	bl	0x100001180 <_lookup>
100002624: f81f83a0    	stur	x0, [x29, #-8]
100002628: f85f83a8    	ldur	x8, [x29, #-8]
10000262c: f1000108    	subs	x8, x8, #0
100002630: 1a9f07e8    	cset	w8, ne
100002634: 37000128    	tbnz	w8, #0, 0x100002658 <_ITEM_IN+0x1e0>
100002638: 14000001    	b	0x10000263c <_ITEM_IN+0x1c4>
10000263c: f85e03a8    	ldur	x8, [x29, #-32]
100002640: 910003e9    	mov	x9, sp
100002644: f9000128    	str	x8, [x9]
100002648: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0x1d4>
10000264c: 9139f000    	add	x0, x0, #3708
100002650: 97fff959    	bl	0x100000bb4 <_error>
100002654: 14000001    	b	0x100002658 <_ITEM_IN+0x1e0>
100002658: f85e03a0    	ldur	x0, [x29, #-32]
10000265c: f85f83a8    	ldur	x8, [x29, #-8]
100002660: f9400501    	ldr	x1, [x8, #8]
100002664: 92800002    	mov	x2, #-1
100002668: 94000572    	bl	0x100003c30 <_vfprintf+0x100003c30>
10000266c: 14000001    	b	0x100002670 <_ITEM_IN+0x1f8>
100002670: f94013e8    	ldr	x8, [sp, #32]
100002674: f9400108    	ldr	x8, [x8]
100002678: f81d83a8    	stur	x8, [x29, #-40]
10000267c: f85f03a8    	ldur	x8, [x29, #-16]
100002680: b81d43a8    	stur	w8, [x29, #-44]
100002684: 14000001    	b	0x100002688 <_ITEM_IN+0x210>
100002688: b85d43a8    	ldur	w8, [x29, #-44]
10000268c: 71000108    	subs	w8, w8, #0
100002690: 1a9f17e8    	cset	w8, eq
100002694: 370002c8    	tbnz	w8, #0, 0x1000026ec <_ITEM_IN+0x274>
100002698: 14000001    	b	0x10000269c <_ITEM_IN+0x224>
10000269c: f85d83a8    	ldur	x8, [x29, #-40]
1000026a0: f9419108    	ldr	x8, [x8, #800]
1000026a4: f81d83a8    	stur	x8, [x29, #-40]
1000026a8: f85d83a8    	ldur	x8, [x29, #-40]
1000026ac: f1000108    	subs	x8, x8, #0
1000026b0: 1a9f07e8    	cset	w8, ne
1000026b4: 37000128    	tbnz	w8, #0, 0x1000026d8 <_ITEM_IN+0x260>
1000026b8: 14000001    	b	0x1000026bc <_ITEM_IN+0x244>
1000026bc: f85f03a8    	ldur	x8, [x29, #-16]
1000026c0: 910003e9    	mov	x9, sp
1000026c4: f9000128    	str	x8, [x9]
1000026c8: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0x254>
1000026cc: 913d3800    	add	x0, x0, #3918
1000026d0: 97fff939    	bl	0x100000bb4 <_error>
1000026d4: 14000001    	b	0x1000026d8 <_ITEM_IN+0x260>
1000026d8: 14000001    	b	0x1000026dc <_ITEM_IN+0x264>
1000026dc: b85d43a8    	ldur	w8, [x29, #-44]
1000026e0: 71000508    	subs	w8, w8, #1
1000026e4: b81d43a8    	stur	w8, [x29, #-44]
1000026e8: 17ffffe8    	b	0x100002688 <_ITEM_IN+0x210>
1000026ec: f85e03a0    	ldur	x0, [x29, #-32]
1000026f0: 9400058c    	bl	0x100003d20 <_vfprintf+0x100003d20>
1000026f4: f81c03a0    	stur	x0, [x29, #-64]
1000026f8: b81bc3bf    	stur	wzr, [x29, #-68]
1000026fc: 14000001    	b	0x100002700 <_ITEM_IN+0x288>
100002700: b89bc3a8    	ldursw	x8, [x29, #-68]
100002704: f85c03a9    	ldur	x9, [x29, #-64]
100002708: eb090108    	subs	x8, x8, x9
10000270c: 1a9fb7e8    	cset	w8, ge
100002710: 37001168    	tbnz	w8, #0, 0x10000293c <_ITEM_IN+0x4c4>
100002714: 14000001    	b	0x100002718 <_ITEM_IN+0x2a0>
100002718: f85e03a8    	ldur	x8, [x29, #-32]
10000271c: b89bc3a9    	ldursw	x9, [x29, #-68]
100002720: 38e96900    	ldrsb	w0, [x8, x9]
100002724: 9400056d    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100002728: 71000008    	subs	w8, w0, #0
10000272c: 1a9f17e8    	cset	w8, eq
100002730: 37000068    	tbnz	w8, #0, 0x10000273c <_ITEM_IN+0x2c4>
100002734: 14000001    	b	0x100002738 <_ITEM_IN+0x2c0>
100002738: 1400007d    	b	0x10000292c <_ITEM_IN+0x4b4>
10000273c: b81b83bf    	stur	wzr, [x29, #-72]
100002740: 14000001    	b	0x100002744 <_ITEM_IN+0x2cc>
100002744: f85e03a8    	ldur	x8, [x29, #-32]
100002748: b89bc3a9    	ldursw	x9, [x29, #-68]
10000274c: 38e96900    	ldrsb	w0, [x8, x9]
100002750: 94000562    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100002754: 71000008    	subs	w8, w0, #0
100002758: 1a9f07e8    	cset	w8, ne
10000275c: 52800009    	mov	w9, #0
100002760: b9001be9    	str	w9, [sp, #24]
100002764: 37000128    	tbnz	w8, #0, 0x100002788 <_ITEM_IN+0x310>
100002768: 14000001    	b	0x10000276c <_ITEM_IN+0x2f4>
10000276c: f85e03a8    	ldur	x8, [x29, #-32]
100002770: b89bc3a9    	ldursw	x9, [x29, #-68]
100002774: 38e96908    	ldrsb	w8, [x8, x9]
100002778: 71000108    	subs	w8, w8, #0
10000277c: 1a9f07e8    	cset	w8, ne
100002780: b9001be8    	str	w8, [sp, #24]
100002784: 14000001    	b	0x100002788 <_ITEM_IN+0x310>
100002788: b9401be8    	ldr	w8, [sp, #24]
10000278c: 36000148    	tbz	w8, #0, 0x1000027b4 <_ITEM_IN+0x33c>
100002790: 14000001    	b	0x100002794 <_ITEM_IN+0x31c>
100002794: 14000001    	b	0x100002798 <_ITEM_IN+0x320>
100002798: b85bc3a8    	ldur	w8, [x29, #-68]
10000279c: 11000508    	add	w8, w8, #1
1000027a0: b81bc3a8    	stur	w8, [x29, #-68]
1000027a4: b85b83a8    	ldur	w8, [x29, #-72]
1000027a8: 11000508    	add	w8, w8, #1
1000027ac: b81b83a8    	stur	w8, [x29, #-72]
1000027b0: 17ffffe5    	b	0x100002744 <_ITEM_IN+0x2cc>
1000027b4: b85b83a8    	ldur	w8, [x29, #-72]
1000027b8: 11000509    	add	w9, w8, #1
1000027bc: aa0903e8    	mov	x8, x9
1000027c0: 93407d00    	sxtw	x0, w8
1000027c4: 94000548    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
1000027c8: f9002be0    	str	x0, [sp, #80]
1000027cc: f9402be0    	ldr	x0, [sp, #80]
1000027d0: f85e03a8    	ldur	x8, [x29, #-32]
1000027d4: b89bc3a9    	ldursw	x9, [x29, #-68]
1000027d8: 8b090108    	add	x8, x8, x9
1000027dc: b89b83a9    	ldursw	x9, [x29, #-72]
1000027e0: eb090101    	subs	x1, x8, x9
1000027e4: b89b83a2    	ldursw	x2, [x29, #-72]
1000027e8: 92800003    	mov	x3, #-1
1000027ec: 94000514    	bl	0x100003c3c <_vfprintf+0x100003c3c>
1000027f0: f9402be8    	ldr	x8, [sp, #80]
1000027f4: b89bc3a9    	ldursw	x9, [x29, #-68]
1000027f8: 8b090108    	add	x8, x8, x9
1000027fc: 3900011f    	strb	wzr, [x8]
100002800: 940003c8    	bl	0x100003720 <_parse>
100002804: f9401fe8    	ldr	x8, [sp, #56]
100002808: b9400108    	ldr	w8, [x8]
10000280c: b90017e8    	str	w8, [sp, #20]
100002810: 71000108    	subs	w8, w8, #0
100002814: 71000508    	subs	w8, w8, #1
100002818: 1a9f87e8    	cset	w8, ls
10000281c: 37000188    	tbnz	w8, #0, 0x10000284c <_ITEM_IN+0x3d4>
100002820: 14000001    	b	0x100002824 <_ITEM_IN+0x3ac>
100002824: b94017e8    	ldr	w8, [sp, #20]
100002828: 71000908    	subs	w8, w8, #2
10000282c: 1a9f17e8    	cset	w8, eq
100002830: 37000408    	tbnz	w8, #0, 0x1000028b0 <_ITEM_IN+0x438>
100002834: 14000001    	b	0x100002838 <_ITEM_IN+0x3c0>
100002838: b94017e8    	ldr	w8, [sp, #20]
10000283c: 71000d08    	subs	w8, w8, #3
100002840: 1a9f17e8    	cset	w8, eq
100002844: 370003c8    	tbnz	w8, #0, 0x1000028bc <_ITEM_IN+0x444>
100002848: 14000034    	b	0x100002918 <_ITEM_IN+0x4a0>
10000284c: f9401fe8    	ldr	x8, [sp, #56]
100002850: b9400108    	ldr	w8, [x8]
100002854: 71000108    	subs	w8, w8, #0
100002858: 1a9f07e8    	cset	w8, ne
10000285c: 37000188    	tbnz	w8, #0, 0x10000288c <_ITEM_IN+0x414>
100002860: 14000001    	b	0x100002864 <_ITEM_IN+0x3ec>
100002864: f9401be9    	ldr	x9, [sp, #48]
100002868: f94017e8    	ldr	x8, [sp, #40]
10000286c: f9400108    	ldr	x8, [x8]
100002870: f9400129    	ldr	x9, [x9]
100002874: 8b090100    	add	x0, x8, x9
100002878: 940004f7    	bl	0x100003c54 <_vfprintf+0x100003c54>
10000287c: aa0003e8    	mov	x8, x0
100002880: 93407d08    	sxtw	x8, w8
100002884: f81c83a8    	stur	x8, [x29, #-56]
100002888: 14000009    	b	0x1000028ac <_ITEM_IN+0x434>
10000288c: f9401be9    	ldr	x9, [sp, #48]
100002890: f94017e8    	ldr	x8, [sp, #40]
100002894: f9400108    	ldr	x8, [x8]
100002898: f9400129    	ldr	x9, [x9]
10000289c: 8b090100    	add	x0, x8, x9
1000028a0: 940004ea    	bl	0x100003c48 <_vfprintf+0x100003c48>
1000028a4: fc1c83a0    	stur	d0, [x29, #-56]
1000028a8: 14000001    	b	0x1000028ac <_ITEM_IN+0x434>
1000028ac: 1400001b    	b	0x100002918 <_ITEM_IN+0x4a0>
1000028b0: d100e3a0    	sub	x0, x29, #56
1000028b4: 97fff93d    	bl	0x100000da8 <_quotecpy>
1000028b8: 14000018    	b	0x100002918 <_ITEM_IN+0x4a0>
1000028bc: 910123e0    	add	x0, sp, #72
1000028c0: 97fff965    	bl	0x100000e54 <_symbolcpy>
1000028c4: f94013e8    	ldr	x8, [sp, #32]
1000028c8: f9400100    	ldr	x0, [x8]
1000028cc: f94027e1    	ldr	x1, [sp, #72]
1000028d0: 97fffa2c    	bl	0x100001180 <_lookup>
1000028d4: f81f83a0    	stur	x0, [x29, #-8]
1000028d8: f85f83a8    	ldur	x8, [x29, #-8]
1000028dc: f1000108    	subs	x8, x8, #0
1000028e0: 1a9f07e8    	cset	w8, ne
1000028e4: 37000128    	tbnz	w8, #0, 0x100002908 <_ITEM_IN+0x490>
1000028e8: 14000001    	b	0x1000028ec <_ITEM_IN+0x474>
1000028ec: f94027e8    	ldr	x8, [sp, #72]
1000028f0: 910003e9    	mov	x9, sp
1000028f4: f9000128    	str	x8, [x9]
1000028f8: b0000000    	adrp	x0, 0x100003000 <_ITEM_IN+0x484>
1000028fc: 9139f000    	add	x0, x0, #3708
100002900: 97fff8ad    	bl	0x100000bb4 <_error>
100002904: 14000001    	b	0x100002908 <_ITEM_IN+0x490>
100002908: f85f83a8    	ldur	x8, [x29, #-8]
10000290c: f9400508    	ldr	x8, [x8, #8]
100002910: f81c83a8    	stur	x8, [x29, #-56]
100002914: 14000001    	b	0x100002918 <_ITEM_IN+0x4a0>
100002918: f85d83a0    	ldur	x0, [x29, #-40]
10000291c: f9402be1    	ldr	x1, [sp, #80]
100002920: f85c83a2    	ldur	x2, [x29, #-56]
100002924: 97fffa48    	bl	0x100001244 <_upsert>
100002928: 14000001    	b	0x10000292c <_ITEM_IN+0x4b4>
10000292c: b85bc3a8    	ldur	w8, [x29, #-68]
100002930: 11000508    	add	w8, w8, #1
100002934: b81bc3a8    	stur	w8, [x29, #-68]
100002938: 17ffff72    	b	0x100002700 <_ITEM_IN+0x288>
10000293c: f85e03a0    	ldur	x0, [x29, #-32]
100002940: 940004da    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100002944: a94a7bfd    	ldp	x29, x30, [sp, #160]
100002948: 9102c3ff    	add	sp, sp, #176
10000294c: d65f03c0    	ret

0000000100002950 <_ITER>:
100002950: d10243ff    	sub	sp, sp, #144
100002954: a9087bfd    	stp	x29, x30, [sp, #128]
100002958: 910203fd    	add	x29, sp, #128
10000295c: d0000028    	adrp	x8, 0x100008000 <_ITER+0x24>
100002960: 9100a108    	add	x8, x8, #40
100002964: f90013e8    	str	x8, [sp, #32]
100002968: d0000028    	adrp	x8, 0x100008000 <_ITER+0x30>
10000296c: 91000108    	add	x8, x8, #0
100002970: f9000fe8    	str	x8, [sp, #24]
100002974: 9400036b    	bl	0x100003720 <_parse>
100002978: f94013e8    	ldr	x8, [sp, #32]
10000297c: b9400108    	ldr	w8, [x8]
100002980: b9002fe8    	str	w8, [sp, #44]
100002984: 71000108    	subs	w8, w8, #0
100002988: 71000508    	subs	w8, w8, #1
10000298c: 1a9f87e8    	cset	w8, ls
100002990: 37000188    	tbnz	w8, #0, 0x1000029c0 <_ITER+0x70>
100002994: 14000001    	b	0x100002998 <_ITER+0x48>
100002998: b9402fe8    	ldr	w8, [sp, #44]
10000299c: 71000908    	subs	w8, w8, #2
1000029a0: 1a9f17e8    	cset	w8, eq
1000029a4: 37000208    	tbnz	w8, #0, 0x1000029e4 <_ITER+0x94>
1000029a8: 14000001    	b	0x1000029ac <_ITER+0x5c>
1000029ac: b9402fe8    	ldr	w8, [sp, #44]
1000029b0: 71000d08    	subs	w8, w8, #3
1000029b4: 1a9f17e8    	cset	w8, eq
1000029b8: 370001c8    	tbnz	w8, #0, 0x1000029f0 <_ITER+0xa0>
1000029bc: 14000026    	b	0x100002a54 <_ITER+0x104>
1000029c0: d10023a0    	sub	x0, x29, #8
1000029c4: 97fff924    	bl	0x100000e54 <_symbolcpy>
1000029c8: f85f83a8    	ldur	x8, [x29, #-8]
1000029cc: 910003e9    	mov	x9, sp
1000029d0: f9000128    	str	x8, [x9]
1000029d4: b0000000    	adrp	x0, 0x100003000 <_ITER+0x88>
1000029d8: 913a6800    	add	x0, x0, #3738
1000029dc: 97fff876    	bl	0x100000bb4 <_error>
1000029e0: 1400001d    	b	0x100002a54 <_ITER+0x104>
1000029e4: d10023a0    	sub	x0, x29, #8
1000029e8: 97fff8f0    	bl	0x100000da8 <_quotecpy>
1000029ec: 1400001a    	b	0x100002a54 <_ITER+0x104>
1000029f0: d10023a0    	sub	x0, x29, #8
1000029f4: 97fff918    	bl	0x100000e54 <_symbolcpy>
1000029f8: f9400fe8    	ldr	x8, [sp, #24]
1000029fc: f9400100    	ldr	x0, [x8]
100002a00: f85f83a1    	ldur	x1, [x29, #-8]
100002a04: 97fff9df    	bl	0x100001180 <_lookup>
100002a08: f81f03a0    	stur	x0, [x29, #-16]
100002a0c: f85f03a8    	ldur	x8, [x29, #-16]
100002a10: f1000108    	subs	x8, x8, #0
100002a14: 1a9f07e8    	cset	w8, ne
100002a18: 37000128    	tbnz	w8, #0, 0x100002a3c <_ITER+0xec>
100002a1c: 14000001    	b	0x100002a20 <_ITER+0xd0>
100002a20: f85f83a8    	ldur	x8, [x29, #-8]
100002a24: 910003e9    	mov	x9, sp
100002a28: f9000128    	str	x8, [x9]
100002a2c: b0000000    	adrp	x0, 0x100003000 <_ITER+0xe0>
100002a30: 9139f000    	add	x0, x0, #3708
100002a34: 97fff860    	bl	0x100000bb4 <_error>
100002a38: 14000001    	b	0x100002a3c <_ITER+0xec>
100002a3c: f85f83a0    	ldur	x0, [x29, #-8]
100002a40: f85f03a8    	ldur	x8, [x29, #-16]
100002a44: f9400501    	ldr	x1, [x8, #8]
100002a48: 92800002    	mov	x2, #-1
100002a4c: 94000479    	bl	0x100003c30 <_vfprintf+0x100003c30>
100002a50: 14000001    	b	0x100002a54 <_ITER+0x104>
100002a54: 94000333    	bl	0x100003720 <_parse>
100002a58: f94013e8    	ldr	x8, [sp, #32]
100002a5c: b9400108    	ldr	w8, [x8]
100002a60: b90017e8    	str	w8, [sp, #20]
100002a64: 71000108    	subs	w8, w8, #0
100002a68: 71000508    	subs	w8, w8, #1
100002a6c: 1a9f87e8    	cset	w8, ls
100002a70: 37000188    	tbnz	w8, #0, 0x100002aa0 <_ITER+0x150>
100002a74: 14000001    	b	0x100002a78 <_ITER+0x128>
100002a78: b94017e8    	ldr	w8, [sp, #20]
100002a7c: 71000908    	subs	w8, w8, #2
100002a80: 1a9f17e8    	cset	w8, eq
100002a84: 37000208    	tbnz	w8, #0, 0x100002ac4 <_ITER+0x174>
100002a88: 14000001    	b	0x100002a8c <_ITER+0x13c>
100002a8c: b94017e8    	ldr	w8, [sp, #20]
100002a90: 71000d08    	subs	w8, w8, #3
100002a94: 1a9f17e8    	cset	w8, eq
100002a98: 370001c8    	tbnz	w8, #0, 0x100002ad0 <_ITER+0x180>
100002a9c: 14000026    	b	0x100002b34 <_ITER+0x1e4>
100002aa0: d10063a0    	sub	x0, x29, #24
100002aa4: 97fff8ec    	bl	0x100000e54 <_symbolcpy>
100002aa8: f85e83a8    	ldur	x8, [x29, #-24]
100002aac: 910003e9    	mov	x9, sp
100002ab0: f9000128    	str	x8, [x9]
100002ab4: b0000000    	adrp	x0, 0x100003000 <_ITER+0x168>
100002ab8: 913a6800    	add	x0, x0, #3738
100002abc: 97fff83e    	bl	0x100000bb4 <_error>
100002ac0: 1400001d    	b	0x100002b34 <_ITER+0x1e4>
100002ac4: d10063a0    	sub	x0, x29, #24
100002ac8: 97fff8b8    	bl	0x100000da8 <_quotecpy>
100002acc: 1400001a    	b	0x100002b34 <_ITER+0x1e4>
100002ad0: d10063a0    	sub	x0, x29, #24
100002ad4: 97fff8e0    	bl	0x100000e54 <_symbolcpy>
100002ad8: f9400fe8    	ldr	x8, [sp, #24]
100002adc: f9400100    	ldr	x0, [x8]
100002ae0: f85e83a1    	ldur	x1, [x29, #-24]
100002ae4: 97fff9a7    	bl	0x100001180 <_lookup>
100002ae8: f81f03a0    	stur	x0, [x29, #-16]
100002aec: f85f03a8    	ldur	x8, [x29, #-16]
100002af0: f1000108    	subs	x8, x8, #0
100002af4: 1a9f07e8    	cset	w8, ne
100002af8: 37000128    	tbnz	w8, #0, 0x100002b1c <_ITER+0x1cc>
100002afc: 14000001    	b	0x100002b00 <_ITER+0x1b0>
100002b00: f85e83a8    	ldur	x8, [x29, #-24]
100002b04: 910003e9    	mov	x9, sp
100002b08: f9000128    	str	x8, [x9]
100002b0c: b0000000    	adrp	x0, 0x100003000 <_ITER+0x1c0>
100002b10: 9139f000    	add	x0, x0, #3708
100002b14: 97fff828    	bl	0x100000bb4 <_error>
100002b18: 14000001    	b	0x100002b1c <_ITER+0x1cc>
100002b1c: f85e83a0    	ldur	x0, [x29, #-24]
100002b20: f85f03a8    	ldur	x8, [x29, #-16]
100002b24: f9400501    	ldr	x1, [x8, #8]
100002b28: 92800002    	mov	x2, #-1
100002b2c: 94000441    	bl	0x100003c30 <_vfprintf+0x100003c30>
100002b30: 14000001    	b	0x100002b34 <_ITER+0x1e4>
100002b34: 940002fb    	bl	0x100003720 <_parse>
100002b38: f94013e8    	ldr	x8, [sp, #32]
100002b3c: b9400108    	ldr	w8, [x8]
100002b40: b90013e8    	str	w8, [sp, #16]
100002b44: 71000108    	subs	w8, w8, #0
100002b48: 71000508    	subs	w8, w8, #1
100002b4c: 1a9f87e8    	cset	w8, ls
100002b50: 37000188    	tbnz	w8, #0, 0x100002b80 <_ITER+0x230>
100002b54: 14000001    	b	0x100002b58 <_ITER+0x208>
100002b58: b94013e8    	ldr	w8, [sp, #16]
100002b5c: 71000908    	subs	w8, w8, #2
100002b60: 1a9f17e8    	cset	w8, eq
100002b64: 37000168    	tbnz	w8, #0, 0x100002b90 <_ITER+0x240>
100002b68: 14000001    	b	0x100002b6c <_ITER+0x21c>
100002b6c: b94013e8    	ldr	w8, [sp, #16]
100002b70: 71000d08    	subs	w8, w8, #3
100002b74: 1a9f17e8    	cset	w8, eq
100002b78: 37000128    	tbnz	w8, #0, 0x100002b9c <_ITER+0x24c>
100002b7c: 1400001f    	b	0x100002bf8 <_ITER+0x2a8>
100002b80: b0000000    	adrp	x0, 0x100003000 <_ITER+0x234>
100002b84: 913ad400    	add	x0, x0, #3765
100002b88: 97fff80b    	bl	0x100000bb4 <_error>
100002b8c: 1400001b    	b	0x100002bf8 <_ITER+0x2a8>
100002b90: d10083a0    	sub	x0, x29, #32
100002b94: 97fff885    	bl	0x100000da8 <_quotecpy>
100002b98: 14000018    	b	0x100002bf8 <_ITER+0x2a8>
100002b9c: d10083a0    	sub	x0, x29, #32
100002ba0: 97fff8ad    	bl	0x100000e54 <_symbolcpy>
100002ba4: f9400fe8    	ldr	x8, [sp, #24]
100002ba8: f9400100    	ldr	x0, [x8]
100002bac: f85e03a1    	ldur	x1, [x29, #-32]
100002bb0: 97fff974    	bl	0x100001180 <_lookup>
100002bb4: f81d83a0    	stur	x0, [x29, #-40]
100002bb8: f85d83a8    	ldur	x8, [x29, #-40]
100002bbc: f1000108    	subs	x8, x8, #0
100002bc0: 1a9f07e8    	cset	w8, ne
100002bc4: 37000128    	tbnz	w8, #0, 0x100002be8 <_ITER+0x298>
100002bc8: 14000001    	b	0x100002bcc <_ITER+0x27c>
100002bcc: f85e03a8    	ldur	x8, [x29, #-32]
100002bd0: 910003e9    	mov	x9, sp
100002bd4: f9000128    	str	x8, [x9]
100002bd8: b0000000    	adrp	x0, 0x100003000 <_ITER+0x28c>
100002bdc: 9139f000    	add	x0, x0, #3708
100002be0: 97fff7f5    	bl	0x100000bb4 <_error>
100002be4: 14000001    	b	0x100002be8 <_ITER+0x298>
100002be8: f85d83a8    	ldur	x8, [x29, #-40]
100002bec: f9400508    	ldr	x8, [x8, #8]
100002bf0: f81e03a8    	stur	x8, [x29, #-32]
100002bf4: 14000001    	b	0x100002bf8 <_ITER+0x2a8>
100002bf8: d0000028    	adrp	x8, 0x100008000 <_ITER+0x2c0>
100002bfc: 91006108    	add	x8, x8, #24
100002c00: f9400108    	ldr	x8, [x8]
100002c04: f81d03a8    	stur	x8, [x29, #-48]
100002c08: f85e83a0    	ldur	x0, [x29, #-24]
100002c0c: 94000445    	bl	0x100003d20 <_vfprintf+0x100003d20>
100002c10: f90023e0    	str	x0, [sp, #64]
100002c14: b9003fff    	str	wzr, [sp, #60]
100002c18: 14000001    	b	0x100002c1c <_ITER+0x2cc>
100002c1c: b9803fe8    	ldrsw	x8, [sp, #60]
100002c20: f94023e9    	ldr	x9, [sp, #64]
100002c24: eb090108    	subs	x8, x8, x9
100002c28: 1a9fb7e8    	cset	w8, ge
100002c2c: 37000b68    	tbnz	w8, #0, 0x100002d98 <_ITER+0x448>
100002c30: 14000001    	b	0x100002c34 <_ITER+0x2e4>
100002c34: f85e83a8    	ldur	x8, [x29, #-24]
100002c38: b9803fe9    	ldrsw	x9, [sp, #60]
100002c3c: 38e96900    	ldrsb	w0, [x8, x9]
100002c40: 94000426    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100002c44: 71000008    	subs	w8, w0, #0
100002c48: 1a9f17e8    	cset	w8, eq
100002c4c: 37000068    	tbnz	w8, #0, 0x100002c58 <_ITER+0x308>
100002c50: 14000001    	b	0x100002c54 <_ITER+0x304>
100002c54: 1400004d    	b	0x100002d88 <_ITER+0x438>
100002c58: b9003bff    	str	wzr, [sp, #56]
100002c5c: 14000001    	b	0x100002c60 <_ITER+0x310>
100002c60: f85e83a8    	ldur	x8, [x29, #-24]
100002c64: b9803fe9    	ldrsw	x9, [sp, #60]
100002c68: 38e96900    	ldrsb	w0, [x8, x9]
100002c6c: 9400041b    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100002c70: 71000008    	subs	w8, w0, #0
100002c74: 1a9f07e8    	cset	w8, ne
100002c78: 52800009    	mov	w9, #0
100002c7c: b9000fe9    	str	w9, [sp, #12]
100002c80: 37000128    	tbnz	w8, #0, 0x100002ca4 <_ITER+0x354>
100002c84: 14000001    	b	0x100002c88 <_ITER+0x338>
100002c88: f85e83a8    	ldur	x8, [x29, #-24]
100002c8c: b9803fe9    	ldrsw	x9, [sp, #60]
100002c90: 38e96908    	ldrsb	w8, [x8, x9]
100002c94: 71000108    	subs	w8, w8, #0
100002c98: 1a9f07e8    	cset	w8, ne
100002c9c: b9000fe8    	str	w8, [sp, #12]
100002ca0: 14000001    	b	0x100002ca4 <_ITER+0x354>
100002ca4: b9400fe8    	ldr	w8, [sp, #12]
100002ca8: 36000148    	tbz	w8, #0, 0x100002cd0 <_ITER+0x380>
100002cac: 14000001    	b	0x100002cb0 <_ITER+0x360>
100002cb0: 14000001    	b	0x100002cb4 <_ITER+0x364>
100002cb4: b9403fe8    	ldr	w8, [sp, #60]
100002cb8: 11000508    	add	w8, w8, #1
100002cbc: b9003fe8    	str	w8, [sp, #60]
100002cc0: b9403be8    	ldr	w8, [sp, #56]
100002cc4: 11000508    	add	w8, w8, #1
100002cc8: b9003be8    	str	w8, [sp, #56]
100002ccc: 17ffffe5    	b	0x100002c60 <_ITER+0x310>
100002cd0: b9403be8    	ldr	w8, [sp, #56]
100002cd4: 11000509    	add	w9, w8, #1
100002cd8: aa0903e8    	mov	x8, x9
100002cdc: 93407d00    	sxtw	x0, w8
100002ce0: 94000401    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
100002ce4: f9001be0    	str	x0, [sp, #48]
100002ce8: f9401be0    	ldr	x0, [sp, #48]
100002cec: f85e83a8    	ldur	x8, [x29, #-24]
100002cf0: b9803fe9    	ldrsw	x9, [sp, #60]
100002cf4: 8b090108    	add	x8, x8, x9
100002cf8: b9803be9    	ldrsw	x9, [sp, #56]
100002cfc: eb090101    	subs	x1, x8, x9
100002d00: b9803be2    	ldrsw	x2, [sp, #56]
100002d04: 92800003    	mov	x3, #-1
100002d08: 940003cd    	bl	0x100003c3c <_vfprintf+0x100003c3c>
100002d0c: f9401be8    	ldr	x8, [sp, #48]
100002d10: b9803fe9    	ldrsw	x9, [sp, #60]
100002d14: 8b090108    	add	x8, x8, x9
100002d18: 3900011f    	strb	wzr, [x8]
100002d1c: f85e03a0    	ldur	x0, [x29, #-32]
100002d20: 97fffa21    	bl	0x1000015a4 <_push_scope>
100002d24: f9400fe8    	ldr	x8, [sp, #24]
100002d28: f9401be9    	ldr	x9, [sp, #48]
100002d2c: f81c83a9    	stur	x9, [x29, #-56]
100002d30: f9400100    	ldr	x0, [x8]
100002d34: f85f83a1    	ldur	x1, [x29, #-8]
100002d38: f85c83a2    	ldur	x2, [x29, #-56]
100002d3c: 97fff942    	bl	0x100001244 <_upsert>
100002d40: 94000278    	bl	0x100003720 <_parse>
100002d44: 14000001    	b	0x100002d48 <_ITER+0x3f8>
100002d48: d0000028    	adrp	x8, 0x100008000 <_ITER+0x410>
100002d4c: 91002108    	add	x8, x8, #8
100002d50: f9400108    	ldr	x8, [x8]
100002d54: f85e03a9    	ldur	x9, [x29, #-32]
100002d58: eb090108    	subs	x8, x8, x9
100002d5c: 1a9f07e8    	cset	w8, ne
100002d60: 370000a8    	tbnz	w8, #0, 0x100002d74 <_ITER+0x424>
100002d64: 14000001    	b	0x100002d68 <_ITER+0x418>
100002d68: 97fff6c3    	bl	0x100000874 <_eval>
100002d6c: 9400026d    	bl	0x100003720 <_parse>
100002d70: 17fffff6    	b	0x100002d48 <_ITER+0x3f8>
100002d74: f85d03a8    	ldur	x8, [x29, #-48]
100002d78: d0000029    	adrp	x9, 0x100008000 <_ITER+0x440>
100002d7c: 91008129    	add	x9, x9, #32
100002d80: f9000128    	str	x8, [x9]
100002d84: 14000001    	b	0x100002d88 <_ITER+0x438>
100002d88: b9403fe8    	ldr	w8, [sp, #60]
100002d8c: 11000508    	add	w8, w8, #1
100002d90: b9003fe8    	str	w8, [sp, #60]
100002d94: 17ffffa2    	b	0x100002c1c <_ITER+0x2cc>
100002d98: f85f83a0    	ldur	x0, [x29, #-8]
100002d9c: 940003c3    	bl	0x100003ca8 <_vfprintf+0x100003ca8>
100002da0: a9487bfd    	ldp	x29, x30, [sp, #128]
100002da4: 910243ff    	add	sp, sp, #144
100002da8: d65f03c0    	ret

0000000100002dac <_PARSE>:
100002dac: d10243ff    	sub	sp, sp, #144
100002db0: a9087bfd    	stp	x29, x30, [sp, #128]
100002db4: 910203fd    	add	x29, sp, #128
100002db8: f90023ff    	str	xzr, [sp, #64]
100002dbc: 94000259    	bl	0x100003720 <_parse>
100002dc0: d0000028    	adrp	x8, 0x100008000 <_PARSE+0x2c>
100002dc4: 9100a108    	add	x8, x8, #40
100002dc8: b9400108    	ldr	w8, [x8]
100002dcc: b9001fe8    	str	w8, [sp, #28]
100002dd0: 71000108    	subs	w8, w8, #0
100002dd4: 1a9f17e8    	cset	w8, eq
100002dd8: 370001a8    	tbnz	w8, #0, 0x100002e0c <_PARSE+0x60>
100002ddc: 14000001    	b	0x100002de0 <_PARSE+0x34>
100002de0: b9401fe8    	ldr	w8, [sp, #28]
100002de4: 71000508    	subs	w8, w8, #1
100002de8: 71000508    	subs	w8, w8, #1
100002dec: 1a9f87e8    	cset	w8, ls
100002df0: 37000228    	tbnz	w8, #0, 0x100002e34 <_PARSE+0x88>
100002df4: 14000001    	b	0x100002df8 <_PARSE+0x4c>
100002df8: b9401fe8    	ldr	w8, [sp, #28]
100002dfc: 71000d08    	subs	w8, w8, #3
100002e00: 1a9f17e8    	cset	w8, eq
100002e04: 37000208    	tbnz	w8, #0, 0x100002e44 <_PARSE+0x98>
100002e08: 14000027    	b	0x100002ea4 <_PARSE+0xf8>
100002e0c: d0000028    	adrp	x8, 0x100008000 <_PARSE+0x78>
100002e10: 91002108    	add	x8, x8, #8
100002e14: f9400108    	ldr	x8, [x8]
100002e18: d0000029    	adrp	x9, 0x100008000 <_PARSE+0x84>
100002e1c: 91006129    	add	x9, x9, #24
100002e20: f9400129    	ldr	x9, [x9]
100002e24: 8b090100    	add	x0, x8, x9
100002e28: 9400038e    	bl	0x100003c60 <_vfprintf+0x100003c60>
100002e2c: f90023e0    	str	x0, [sp, #64]
100002e30: 1400001d    	b	0x100002ea4 <_PARSE+0xf8>
100002e34: b0000000    	adrp	x0, 0x100003000 <_PARSE+0x8c>
100002e38: 913c7400    	add	x0, x0, #3869
100002e3c: 97fff75e    	bl	0x100000bb4 <_error>
100002e40: 14000019    	b	0x100002ea4 <_PARSE+0xf8>
100002e44: 9100e3e0    	add	x0, sp, #56
100002e48: 97fff803    	bl	0x100000e54 <_symbolcpy>
100002e4c: d0000028    	adrp	x8, 0x100008000 <_PARSE+0xb8>
100002e50: 91000108    	add	x8, x8, #0
100002e54: f9400100    	ldr	x0, [x8]
100002e58: f9401fe1    	ldr	x1, [sp, #56]
100002e5c: 97fff8c9    	bl	0x100001180 <_lookup>
100002e60: f81d03a0    	stur	x0, [x29, #-48]
100002e64: f85d03a8    	ldur	x8, [x29, #-48]
100002e68: f1000108    	subs	x8, x8, #0
100002e6c: 1a9f07e8    	cset	w8, ne
100002e70: 37000128    	tbnz	w8, #0, 0x100002e94 <_PARSE+0xe8>
100002e74: 14000001    	b	0x100002e78 <_PARSE+0xcc>
100002e78: f9401fe8    	ldr	x8, [sp, #56]
100002e7c: 910003e9    	mov	x9, sp
100002e80: f9000128    	str	x8, [x9]
100002e84: b0000000    	adrp	x0, 0x100003000 <_PARSE+0xdc>
100002e88: 9139f000    	add	x0, x0, #3708
100002e8c: 97fff74a    	bl	0x100000bb4 <_error>
100002e90: 14000001    	b	0x100002e94 <_PARSE+0xe8>
100002e94: f85d03a8    	ldur	x8, [x29, #-48]
100002e98: f9400508    	ldr	x8, [x8, #8]
100002e9c: f90023e8    	str	x8, [sp, #64]
100002ea0: 14000001    	b	0x100002ea4 <_PARSE+0xf8>
100002ea4: d0000028    	adrp	x8, 0x100008000 <_PARSE+0x110>
100002ea8: 91000108    	add	x8, x8, #0
100002eac: f9400108    	ldr	x8, [x8]
100002eb0: f9001be8    	str	x8, [sp, #48]
100002eb4: f94023e8    	ldr	x8, [sp, #64]
100002eb8: b9002fe8    	str	w8, [sp, #44]
100002ebc: 14000001    	b	0x100002ec0 <_PARSE+0x114>
100002ec0: b9402fe8    	ldr	w8, [sp, #44]
100002ec4: 71000108    	subs	w8, w8, #0
100002ec8: 1a9f17e8    	cset	w8, eq
100002ecc: 370002c8    	tbnz	w8, #0, 0x100002f24 <_PARSE+0x178>
100002ed0: 14000001    	b	0x100002ed4 <_PARSE+0x128>
100002ed4: f9401be8    	ldr	x8, [sp, #48]
100002ed8: f9419108    	ldr	x8, [x8, #800]
100002edc: f9001be8    	str	x8, [sp, #48]
100002ee0: f9401be8    	ldr	x8, [sp, #48]
100002ee4: f1000108    	subs	x8, x8, #0
100002ee8: 1a9f07e8    	cset	w8, ne
100002eec: 37000128    	tbnz	w8, #0, 0x100002f10 <_PARSE+0x164>
100002ef0: 14000001    	b	0x100002ef4 <_PARSE+0x148>
100002ef4: f94023e8    	ldr	x8, [sp, #64]
100002ef8: 910003e9    	mov	x9, sp
100002efc: f9000128    	str	x8, [x9]
100002f00: b0000000    	adrp	x0, 0x100003000 <_PARSE+0x158>
100002f04: 913d3800    	add	x0, x0, #3918
100002f08: 97fff72b    	bl	0x100000bb4 <_error>
100002f0c: 14000001    	b	0x100002f10 <_PARSE+0x164>
100002f10: 14000001    	b	0x100002f14 <_PARSE+0x168>
100002f14: b9402fe8    	ldr	w8, [sp, #44]
100002f18: 71000508    	subs	w8, w8, #1
100002f1c: b9002fe8    	str	w8, [sp, #44]
100002f20: 17ffffe8    	b	0x100002ec0 <_PARSE+0x114>
100002f24: f9401be0    	ldr	x0, [sp, #48]
100002f28: b0000001    	adrp	x1, 0x100003000 <_PARSE+0x180>
100002f2c: 91388421    	add	x1, x1, #3617
100002f30: 97fff894    	bl	0x100001180 <_lookup>
100002f34: f81d03a0    	stur	x0, [x29, #-48]
100002f38: f85d03a8    	ldur	x8, [x29, #-48]
100002f3c: f1000108    	subs	x8, x8, #0
100002f40: 1a9f07e8    	cset	w8, ne
100002f44: 37000148    	tbnz	w8, #0, 0x100002f6c <_PARSE+0x1c0>
100002f48: 14000001    	b	0x100002f4c <_PARSE+0x1a0>
100002f4c: 910003e9    	mov	x9, sp
100002f50: b0000008    	adrp	x8, 0x100003000 <_PARSE+0x1a8>
100002f54: 91388508    	add	x8, x8, #3617
100002f58: f9000128    	str	x8, [x9]
100002f5c: b0000000    	adrp	x0, 0x100003000 <_PARSE+0x1b4>
100002f60: 9139f000    	add	x0, x0, #3708
100002f64: 97fff714    	bl	0x100000bb4 <_error>
100002f68: 14000001    	b	0x100002f6c <_PARSE+0x1c0>
100002f6c: f85d03a8    	ldur	x8, [x29, #-48]
100002f70: f9400508    	ldr	x8, [x8, #8]
100002f74: f81f03a8    	stur	x8, [x29, #-16]
100002f78: f9401be0    	ldr	x0, [sp, #48]
100002f7c: b0000001    	adrp	x1, 0x100003000 <_PARSE+0x1d4>
100002f80: 91389c21    	add	x1, x1, #3623
100002f84: 97fff87f    	bl	0x100001180 <_lookup>
100002f88: f81d03a0    	stur	x0, [x29, #-48]
100002f8c: f85d03a8    	ldur	x8, [x29, #-48]
100002f90: f1000108    	subs	x8, x8, #0
100002f94: 1a9f07e8    	cset	w8, ne
100002f98: 37000148    	tbnz	w8, #0, 0x100002fc0 <_PARSE+0x214>
100002f9c: 14000001    	b	0x100002fa0 <_PARSE+0x1f4>
100002fa0: 910003e9    	mov	x9, sp
100002fa4: b0000008    	adrp	x8, 0x100003000 <_PARSE+0x1fc>
100002fa8: 91389d08    	add	x8, x8, #3623
100002fac: f9000128    	str	x8, [x9]
100002fb0: b0000000    	adrp	x0, 0x100003000 <_PARSE+0x208>
100002fb4: 9139f000    	add	x0, x0, #3708
100002fb8: 97fff6ff    	bl	0x100000bb4 <_error>
100002fbc: 14000001    	b	0x100002fc0 <_PARSE+0x214>
100002fc0: f85d03a8    	ldur	x8, [x29, #-48]
100002fc4: f9400508    	ldr	x8, [x8, #8]
100002fc8: f81e03a8    	stur	x8, [x29, #-32]
100002fcc: f9401be0    	ldr	x0, [sp, #48]
100002fd0: b0000001    	adrp	x1, 0x100003000 <_PARSE+0x228>
100002fd4: 9138b421    	add	x1, x1, #3629
100002fd8: 97fff86a    	bl	0x100001180 <_lookup>
100002fdc: f81d03a0    	stur	x0, [x29, #-48]
100002fe0: f85d03a8    	ldur	x8, [x29, #-48]
100002fe4: f1000108    	subs	x8, x8, #0
100002fe8: 1a9f07e8    	cset	w8, ne
100002fec: 37000148    	tbnz	w8, #0, 0x100003014 <_PARSE+0x268>
100002ff0: 14000001    	b	0x100002ff4 <_PARSE+0x248>
100002ff4: 910003e9    	mov	x9, sp
100002ff8: b0000008    	adrp	x8, 0x100003000 <_PARSE+0x250>
100002ffc: 9138b508    	add	x8, x8, #3629
100003000: f9000128    	str	x8, [x9]
100003004: 90000000    	adrp	x0, 0x100003000 <_PARSE+0x258>
100003008: 9139f000    	add	x0, x0, #3708
10000300c: 97fff6ea    	bl	0x100000bb4 <_error>
100003010: 14000001    	b	0x100003014 <_PARSE+0x268>
100003014: f85d03a8    	ldur	x8, [x29, #-48]
100003018: f9400508    	ldr	x8, [x8, #8]
10000301c: f81d83a8    	stur	x8, [x29, #-40]
100003020: f85f03a0    	ldur	x0, [x29, #-16]
100003024: 9400033f    	bl	0x100003d20 <_vfprintf+0x100003d20>
100003028: f81e83a0    	stur	x0, [x29, #-24]
10000302c: 14000001    	b	0x100003030 <_PARSE+0x284>
100003030: 14000001    	b	0x100003034 <_PARSE+0x288>
100003034: f85f03a8    	ldur	x8, [x29, #-16]
100003038: f85d83a9    	ldur	x9, [x29, #-40]
10000303c: 38e96900    	ldrsb	w0, [x8, x9]
100003040: 94000326    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100003044: 71000008    	subs	w8, w0, #0
100003048: 1a9f17e8    	cset	w8, eq
10000304c: 370000c8    	tbnz	w8, #0, 0x100003064 <_PARSE+0x2b8>
100003050: 14000001    	b	0x100003054 <_PARSE+0x2a8>
100003054: f85d83a8    	ldur	x8, [x29, #-40]
100003058: 91000508    	add	x8, x8, #1
10000305c: f81d83a8    	stur	x8, [x29, #-40]
100003060: 17fffff5    	b	0x100003034 <_PARSE+0x288>
100003064: f85d83a8    	ldur	x8, [x29, #-40]
100003068: f85e83a9    	ldur	x9, [x29, #-24]
10000306c: eb090108    	subs	x8, x8, x9
100003070: 1a9fa7e8    	cset	w8, lt
100003074: 37000128    	tbnz	w8, #0, 0x100003098 <_PARSE+0x2ec>
100003078: 14000001    	b	0x10000307c <_PARSE+0x2d0>
10000307c: f9401be8    	ldr	x8, [sp, #48]
100003080: f1000108    	subs	x8, x8, #0
100003084: 1a9f07e8    	cset	w8, ne
100003088: 37000088    	tbnz	w8, #0, 0x100003098 <_PARSE+0x2ec>
10000308c: 14000001    	b	0x100003090 <_PARSE+0x2e4>
100003090: 52800000    	mov	w0, #0
100003094: 940002f6    	bl	0x100003c6c <_vfprintf+0x100003c6c>
100003098: f85d83a8    	ldur	x8, [x29, #-40]
10000309c: f85e83a9    	ldur	x9, [x29, #-24]
1000030a0: eb090108    	subs	x8, x8, x9
1000030a4: 1a9fa7e8    	cset	w8, lt
1000030a8: 37000128    	tbnz	w8, #0, 0x1000030cc <_PARSE+0x320>
1000030ac: 14000001    	b	0x1000030b0 <_PARSE+0x304>
1000030b0: f9401be8    	ldr	x8, [sp, #48]
1000030b4: f1000108    	subs	x8, x8, #0
1000030b8: 1a9f17e8    	cset	w8, eq
1000030bc: 37000088    	tbnz	w8, #0, 0x1000030cc <_PARSE+0x320>
1000030c0: 14000001    	b	0x1000030c4 <_PARSE+0x318>
1000030c4: 97fff976    	bl	0x10000169c <_pop_scope>
1000030c8: 17ffffda    	b	0x100003030 <_PARSE+0x284>
1000030cc: 14000001    	b	0x1000030d0 <_PARSE+0x324>
1000030d0: f85d83a8    	ldur	x8, [x29, #-40]
1000030d4: f81e03a8    	stur	x8, [x29, #-32]
1000030d8: f85f03a8    	ldur	x8, [x29, #-16]
1000030dc: f85d83a9    	ldur	x9, [x29, #-40]
1000030e0: 38e96908    	ldrsb	w8, [x8, x9]
1000030e4: 7100b508    	subs	w8, w8, #45
1000030e8: 1a9f17e8    	cset	w8, eq
1000030ec: 37000148    	tbnz	w8, #0, 0x100003114 <_PARSE+0x368>
1000030f0: 14000001    	b	0x1000030f4 <_PARSE+0x348>
1000030f4: f85f03a8    	ldur	x8, [x29, #-16]
1000030f8: f85d83a9    	ldur	x9, [x29, #-40]
1000030fc: 38e96900    	ldrsb	w0, [x8, x9]
100003100: 940002f3    	bl	0x100003ccc <_vfprintf+0x100003ccc>
100003104: 71000008    	subs	w8, w0, #0
100003108: 1a9f17e8    	cset	w8, eq
10000310c: 37000748    	tbnz	w8, #0, 0x1000031f4 <_PARSE+0x448>
100003110: 14000001    	b	0x100003114 <_PARSE+0x368>
100003114: b81cc3bf    	stur	wzr, [x29, #-52]
100003118: f85d83a8    	ldur	x8, [x29, #-40]
10000311c: 91000508    	add	x8, x8, #1
100003120: f81d83a8    	stur	x8, [x29, #-40]
100003124: 14000001    	b	0x100003128 <_PARSE+0x37c>
100003128: f85f03a8    	ldur	x8, [x29, #-16]
10000312c: f85d83a9    	ldur	x9, [x29, #-40]
100003130: 38e96900    	ldrsb	w0, [x8, x9]
100003134: 940002e6    	bl	0x100003ccc <_vfprintf+0x100003ccc>
100003138: 71000008    	subs	w8, w0, #0
10000313c: 1a9f17e8    	cset	w8, eq
100003140: 370000c8    	tbnz	w8, #0, 0x100003158 <_PARSE+0x3ac>
100003144: 14000001    	b	0x100003148 <_PARSE+0x39c>
100003148: f85d83a8    	ldur	x8, [x29, #-40]
10000314c: 91000508    	add	x8, x8, #1
100003150: f81d83a8    	stur	x8, [x29, #-40]
100003154: 17fffff5    	b	0x100003128 <_PARSE+0x37c>
100003158: f85f03a8    	ldur	x8, [x29, #-16]
10000315c: f85d83a9    	ldur	x9, [x29, #-40]
100003160: 38e96908    	ldrsb	w8, [x8, x9]
100003164: 7100b908    	subs	w8, w8, #46
100003168: 1a9f07e8    	cset	w8, ne
10000316c: 37000228    	tbnz	w8, #0, 0x1000031b0 <_PARSE+0x404>
100003170: 14000001    	b	0x100003174 <_PARSE+0x3c8>
100003174: 14000001    	b	0x100003178 <_PARSE+0x3cc>
100003178: f85f03a8    	ldur	x8, [x29, #-16]
10000317c: f85d83a9    	ldur	x9, [x29, #-40]
100003180: 91000529    	add	x9, x9, #1
100003184: f81d83a9    	stur	x9, [x29, #-40]
100003188: 38e96900    	ldrsb	w0, [x8, x9]
10000318c: 940002d0    	bl	0x100003ccc <_vfprintf+0x100003ccc>
100003190: 71000008    	subs	w8, w0, #0
100003194: 1a9f17e8    	cset	w8, eq
100003198: 37000068    	tbnz	w8, #0, 0x1000031a4 <_PARSE+0x3f8>
10000319c: 14000001    	b	0x1000031a0 <_PARSE+0x3f4>
1000031a0: 17fffff6    	b	0x100003178 <_PARSE+0x3cc>
1000031a4: 52800028    	mov	w8, #1
1000031a8: b81cc3a8    	stur	w8, [x29, #-52]
1000031ac: 14000001    	b	0x1000031b0 <_PARSE+0x404>
1000031b0: f85f03a8    	ldur	x8, [x29, #-16]
1000031b4: f85d83a9    	ldur	x9, [x29, #-40]
1000031b8: 38e96900    	ldrsb	w0, [x8, x9]
1000031bc: 940002c7    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
1000031c0: 71000008    	subs	w8, w0, #0
1000031c4: 1a9f07e8    	cset	w8, ne
1000031c8: 37000148    	tbnz	w8, #0, 0x1000031f0 <_PARSE+0x444>
1000031cc: 14000001    	b	0x1000031d0 <_PARSE+0x424>
1000031d0: f85f03a8    	ldur	x8, [x29, #-16]
1000031d4: f85d83a9    	ldur	x9, [x29, #-40]
1000031d8: 38e96908    	ldrsb	w8, [x8, x9]
1000031dc: 71000108    	subs	w8, w8, #0
1000031e0: 1a9f17e8    	cset	w8, eq
1000031e4: 37000068    	tbnz	w8, #0, 0x1000031f0 <_PARSE+0x444>
1000031e8: 14000001    	b	0x1000031ec <_PARSE+0x440>
1000031ec: 1400005a    	b	0x100003354 <_PARSE+0x5a8>
1000031f0: 14000076    	b	0x1000033c8 <_PARSE+0x61c>
1000031f4: f85f03a8    	ldur	x8, [x29, #-16]
1000031f8: f85d83a9    	ldur	x9, [x29, #-40]
1000031fc: 38e96908    	ldrsb	w8, [x8, x9]
100003200: 71016d08    	subs	w8, w8, #91
100003204: 1a9f07e8    	cset	w8, ne
100003208: 370009e8    	tbnz	w8, #0, 0x100003344 <_PARSE+0x598>
10000320c: 14000001    	b	0x100003210 <_PARSE+0x464>
100003210: 52800048    	mov	w8, #2
100003214: b81cc3a8    	stur	w8, [x29, #-52]
100003218: 52800028    	mov	w8, #1
10000321c: b9002be8    	str	w8, [sp, #40]
100003220: 14000001    	b	0x100003224 <_PARSE+0x478>
100003224: f85d83a8    	ldur	x8, [x29, #-40]
100003228: 91000508    	add	x8, x8, #1
10000322c: f81d83a8    	stur	x8, [x29, #-40]
100003230: f85f03a8    	ldur	x8, [x29, #-16]
100003234: f85d83a9    	ldur	x9, [x29, #-40]
100003238: 38e96908    	ldrsb	w8, [x8, x9]
10000323c: 71000108    	subs	w8, w8, #0
100003240: 1a9f07e8    	cset	w8, ne
100003244: 37000168    	tbnz	w8, #0, 0x100003270 <_PARSE+0x4c4>
100003248: 14000001    	b	0x10000324c <_PARSE+0x4a0>
10000324c: f85f03a8    	ldur	x8, [x29, #-16]
100003250: f85e03a9    	ldur	x9, [x29, #-32]
100003254: 8b090108    	add	x8, x8, x9
100003258: 910003e9    	mov	x9, sp
10000325c: f9000128    	str	x8, [x9]
100003260: 90000000    	adrp	x0, 0x100003000 <_PARSE+0x4b4>
100003264: 913d9400    	add	x0, x0, #3941
100003268: 97fff653    	bl	0x100000bb4 <_error>
10000326c: 14000001    	b	0x100003270 <_PARSE+0x4c4>
100003270: f85f03a8    	ldur	x8, [x29, #-16]
100003274: f85d83a9    	ldur	x9, [x29, #-40]
100003278: 38e96908    	ldrsb	w8, [x8, x9]
10000327c: 71016d08    	subs	w8, w8, #91
100003280: 1a9f07e8    	cset	w8, ne
100003284: 370000c8    	tbnz	w8, #0, 0x10000329c <_PARSE+0x4f0>
100003288: 14000001    	b	0x10000328c <_PARSE+0x4e0>
10000328c: b9402be8    	ldr	w8, [sp, #40]
100003290: 11000508    	add	w8, w8, #1
100003294: b9002be8    	str	w8, [sp, #40]
100003298: 14000015    	b	0x1000032ec <_PARSE+0x540>
10000329c: f85f03a8    	ldur	x8, [x29, #-16]
1000032a0: f85d83a9    	ldur	x9, [x29, #-40]
1000032a4: 38e96908    	ldrsb	w8, [x8, x9]
1000032a8: 71017508    	subs	w8, w8, #93
1000032ac: 1a9f07e8    	cset	w8, ne
1000032b0: 370001c8    	tbnz	w8, #0, 0x1000032e8 <_PARSE+0x53c>
1000032b4: 14000001    	b	0x1000032b8 <_PARSE+0x50c>
1000032b8: f85f03a8    	ldur	x8, [x29, #-16]
1000032bc: f85d83a9    	ldur	x9, [x29, #-40]
1000032c0: f1000529    	subs	x9, x9, #1
1000032c4: 38e96908    	ldrsb	w8, [x8, x9]
1000032c8: 71017108    	subs	w8, w8, #92
1000032cc: 1a9f17e8    	cset	w8, eq
1000032d0: 370000c8    	tbnz	w8, #0, 0x1000032e8 <_PARSE+0x53c>
1000032d4: 14000001    	b	0x1000032d8 <_PARSE+0x52c>
1000032d8: b9402be8    	ldr	w8, [sp, #40]
1000032dc: 71000508    	subs	w8, w8, #1
1000032e0: b9002be8    	str	w8, [sp, #40]
1000032e4: 14000001    	b	0x1000032e8 <_PARSE+0x53c>
1000032e8: 14000001    	b	0x1000032ec <_PARSE+0x540>
1000032ec: 14000001    	b	0x1000032f0 <_PARSE+0x544>
1000032f0: f85f03a8    	ldur	x8, [x29, #-16]
1000032f4: f85d83a9    	ldur	x9, [x29, #-40]
1000032f8: 38e96908    	ldrsb	w8, [x8, x9]
1000032fc: 71017508    	subs	w8, w8, #93
100003300: 1a9f07e8    	cset	w8, ne
100003304: 52800029    	mov	w9, #1
100003308: b9001be9    	str	w9, [sp, #24]
10000330c: 370000e8    	tbnz	w8, #0, 0x100003328 <_PARSE+0x57c>
100003310: 14000001    	b	0x100003314 <_PARSE+0x568>
100003314: b9402be8    	ldr	w8, [sp, #40]
100003318: 71000108    	subs	w8, w8, #0
10000331c: 1a9f07e8    	cset	w8, ne
100003320: b9001be8    	str	w8, [sp, #24]
100003324: 14000001    	b	0x100003328 <_PARSE+0x57c>
100003328: b9401be8    	ldr	w8, [sp, #24]
10000332c: 3707f7c8    	tbnz	w8, #0, 0x100003224 <_PARSE+0x478>
100003330: 14000001    	b	0x100003334 <_PARSE+0x588>
100003334: f85d83a8    	ldur	x8, [x29, #-40]
100003338: 91000508    	add	x8, x8, #1
10000333c: f81d83a8    	stur	x8, [x29, #-40]
100003340: 14000021    	b	0x1000033c4 <_PARSE+0x618>
100003344: f85d83a8    	ldur	x8, [x29, #-40]
100003348: 91000508    	add	x8, x8, #1
10000334c: f81d83a8    	stur	x8, [x29, #-40]
100003350: 14000001    	b	0x100003354 <_PARSE+0x5a8>
100003354: 14000001    	b	0x100003358 <_PARSE+0x5ac>
100003358: f85f03a8    	ldur	x8, [x29, #-16]
10000335c: f85d83a9    	ldur	x9, [x29, #-40]
100003360: 38e96900    	ldrsb	w0, [x8, x9]
100003364: 9400025d    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100003368: 71000008    	subs	w8, w0, #0
10000336c: 1a9f07e8    	cset	w8, ne
100003370: 52800009    	mov	w9, #0
100003374: b90017e9    	str	w9, [sp, #20]
100003378: 37000128    	tbnz	w8, #0, 0x10000339c <_PARSE+0x5f0>
10000337c: 14000001    	b	0x100003380 <_PARSE+0x5d4>
100003380: f85f03a8    	ldur	x8, [x29, #-16]
100003384: f85d83a9    	ldur	x9, [x29, #-40]
100003388: 38e96908    	ldrsb	w8, [x8, x9]
10000338c: 7100c108    	subs	w8, w8, #48
100003390: 1a9f07e8    	cset	w8, ne
100003394: b90017e8    	str	w8, [sp, #20]
100003398: 14000001    	b	0x10000339c <_PARSE+0x5f0>
10000339c: b94017e8    	ldr	w8, [sp, #20]
1000033a0: 360000c8    	tbz	w8, #0, 0x1000033b8 <_PARSE+0x60c>
1000033a4: 14000001    	b	0x1000033a8 <_PARSE+0x5fc>
1000033a8: f85d83a8    	ldur	x8, [x29, #-40]
1000033ac: 91000508    	add	x8, x8, #1
1000033b0: f81d83a8    	stur	x8, [x29, #-40]
1000033b4: 17ffffe9    	b	0x100003358 <_PARSE+0x5ac>
1000033b8: 52800068    	mov	w8, #3
1000033bc: b81cc3a8    	stur	w8, [x29, #-52]
1000033c0: 14000001    	b	0x1000033c4 <_PARSE+0x618>
1000033c4: 14000001    	b	0x1000033c8 <_PARSE+0x61c>
1000033c8: f85f03a8    	ldur	x8, [x29, #-16]
1000033cc: f90013e8    	str	x8, [sp, #32]
1000033d0: f9401be0    	ldr	x0, [sp, #48]
1000033d4: f94013e2    	ldr	x2, [sp, #32]
1000033d8: 90000001    	adrp	x1, 0x100003000 <_PARSE+0x62c>
1000033dc: 91388421    	add	x1, x1, #3617
1000033e0: 97fff799    	bl	0x100001244 <_upsert>
1000033e4: f85e03a8    	ldur	x8, [x29, #-32]
1000033e8: f90013e8    	str	x8, [sp, #32]
1000033ec: f9401be0    	ldr	x0, [sp, #48]
1000033f0: f94013e2    	ldr	x2, [sp, #32]
1000033f4: 90000001    	adrp	x1, 0x100003000 <_PARSE+0x648>
1000033f8: 91389c21    	add	x1, x1, #3623
1000033fc: 97fff792    	bl	0x100001244 <_upsert>
100003400: f85d83a8    	ldur	x8, [x29, #-40]
100003404: f90013e8    	str	x8, [sp, #32]
100003408: f9401be0    	ldr	x0, [sp, #48]
10000340c: f94013e2    	ldr	x2, [sp, #32]
100003410: 90000001    	adrp	x1, 0x100003000 <_PARSE+0x664>
100003414: 9138b421    	add	x1, x1, #3629
100003418: 97fff78b    	bl	0x100001244 <_upsert>
10000341c: a9487bfd    	ldp	x29, x30, [sp, #128]
100003420: 910243ff    	add	sp, sp, #144
100003424: d65f03c0    	ret

0000000100003428 <_COPY_TOKEN>:
100003428: d10203ff    	sub	sp, sp, #128
10000342c: a9077bfd    	stp	x29, x30, [sp, #112]
100003430: 9101c3fd    	add	x29, sp, #112
100003434: b0000028    	adrp	x8, 0x100008000 <_COPY_TOKEN+0x20>
100003438: 91000108    	add	x8, x8, #0
10000343c: f9000be8    	str	x8, [sp, #16]
100003440: f81d03bf    	stur	xzr, [x29, #-48]
100003444: 940000b7    	bl	0x100003720 <_parse>
100003448: b0000028    	adrp	x8, 0x100008000 <_COPY_TOKEN+0x34>
10000344c: 9100a108    	add	x8, x8, #40
100003450: b9400108    	ldr	w8, [x8]
100003454: b9001fe8    	str	w8, [sp, #28]
100003458: 71000108    	subs	w8, w8, #0
10000345c: 1a9f17e8    	cset	w8, eq
100003460: 370001a8    	tbnz	w8, #0, 0x100003494 <_COPY_TOKEN+0x6c>
100003464: 14000001    	b	0x100003468 <_COPY_TOKEN+0x40>
100003468: b9401fe8    	ldr	w8, [sp, #28]
10000346c: 71000508    	subs	w8, w8, #1
100003470: 71000508    	subs	w8, w8, #1
100003474: 1a9f87e8    	cset	w8, ls
100003478: 37000228    	tbnz	w8, #0, 0x1000034bc <_COPY_TOKEN+0x94>
10000347c: 14000001    	b	0x100003480 <_COPY_TOKEN+0x58>
100003480: b9401fe8    	ldr	w8, [sp, #28]
100003484: 71000d08    	subs	w8, w8, #3
100003488: 1a9f17e8    	cset	w8, eq
10000348c: 37000208    	tbnz	w8, #0, 0x1000034cc <_COPY_TOKEN+0xa4>
100003490: 14000026    	b	0x100003528 <_COPY_TOKEN+0x100>
100003494: b0000028    	adrp	x8, 0x100008000 <_COPY_TOKEN+0x80>
100003498: 91002108    	add	x8, x8, #8
10000349c: f9400108    	ldr	x8, [x8]
1000034a0: b0000029    	adrp	x9, 0x100008000 <_COPY_TOKEN+0x8c>
1000034a4: 91006129    	add	x9, x9, #24
1000034a8: f9400129    	ldr	x9, [x9]
1000034ac: 8b090100    	add	x0, x8, x9
1000034b0: 940001ec    	bl	0x100003c60 <_vfprintf+0x100003c60>
1000034b4: f81d03a0    	stur	x0, [x29, #-48]
1000034b8: 1400001c    	b	0x100003528 <_COPY_TOKEN+0x100>
1000034bc: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0x94>
1000034c0: 913c7400    	add	x0, x0, #3869
1000034c4: 97fff5bc    	bl	0x100000bb4 <_error>
1000034c8: 14000018    	b	0x100003528 <_COPY_TOKEN+0x100>
1000034cc: 9100e3e0    	add	x0, sp, #56
1000034d0: 97fff661    	bl	0x100000e54 <_symbolcpy>
1000034d4: f9400be8    	ldr	x8, [sp, #16]
1000034d8: f9400100    	ldr	x0, [x8]
1000034dc: f9401fe1    	ldr	x1, [sp, #56]
1000034e0: 97fff728    	bl	0x100001180 <_lookup>
1000034e4: f81d83a0    	stur	x0, [x29, #-40]
1000034e8: f85d83a8    	ldur	x8, [x29, #-40]
1000034ec: f1000108    	subs	x8, x8, #0
1000034f0: 1a9f07e8    	cset	w8, ne
1000034f4: 37000128    	tbnz	w8, #0, 0x100003518 <_COPY_TOKEN+0xf0>
1000034f8: 14000001    	b	0x1000034fc <_COPY_TOKEN+0xd4>
1000034fc: f9401fe8    	ldr	x8, [sp, #56]
100003500: 910003e9    	mov	x9, sp
100003504: f9000128    	str	x8, [x9]
100003508: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0xe0>
10000350c: 9139f000    	add	x0, x0, #3708
100003510: 97fff5a9    	bl	0x100000bb4 <_error>
100003514: 14000001    	b	0x100003518 <_COPY_TOKEN+0xf0>
100003518: f85d83a8    	ldur	x8, [x29, #-40]
10000351c: f9400508    	ldr	x8, [x8, #8]
100003520: f81d03a8    	stur	x8, [x29, #-48]
100003524: 14000001    	b	0x100003528 <_COPY_TOKEN+0x100>
100003528: f9400be8    	ldr	x8, [sp, #16]
10000352c: f9400108    	ldr	x8, [x8]
100003530: f9001be8    	str	x8, [sp, #48]
100003534: f85d03a8    	ldur	x8, [x29, #-48]
100003538: b9002fe8    	str	w8, [sp, #44]
10000353c: 14000001    	b	0x100003540 <_COPY_TOKEN+0x118>
100003540: b9402fe8    	ldr	w8, [sp, #44]
100003544: 71000108    	subs	w8, w8, #0
100003548: 1a9f17e8    	cset	w8, eq
10000354c: 370002c8    	tbnz	w8, #0, 0x1000035a4 <_COPY_TOKEN+0x17c>
100003550: 14000001    	b	0x100003554 <_COPY_TOKEN+0x12c>
100003554: f9401be8    	ldr	x8, [sp, #48]
100003558: f9419108    	ldr	x8, [x8, #800]
10000355c: f9001be8    	str	x8, [sp, #48]
100003560: f9401be8    	ldr	x8, [sp, #48]
100003564: f1000108    	subs	x8, x8, #0
100003568: 1a9f07e8    	cset	w8, ne
10000356c: 37000128    	tbnz	w8, #0, 0x100003590 <_COPY_TOKEN+0x168>
100003570: 14000001    	b	0x100003574 <_COPY_TOKEN+0x14c>
100003574: f85d03a8    	ldur	x8, [x29, #-48]
100003578: 910003e9    	mov	x9, sp
10000357c: f9000128    	str	x8, [x9]
100003580: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0x158>
100003584: 913d3800    	add	x0, x0, #3918
100003588: 97fff58b    	bl	0x100000bb4 <_error>
10000358c: 14000001    	b	0x100003590 <_COPY_TOKEN+0x168>
100003590: 14000001    	b	0x100003594 <_COPY_TOKEN+0x16c>
100003594: b9402fe8    	ldr	w8, [sp, #44]
100003598: 71000508    	subs	w8, w8, #1
10000359c: b9002fe8    	str	w8, [sp, #44]
1000035a0: 17ffffe8    	b	0x100003540 <_COPY_TOKEN+0x118>
1000035a4: f9401be0    	ldr	x0, [sp, #48]
1000035a8: 90000001    	adrp	x1, 0x100003000 <_COPY_TOKEN+0x180>
1000035ac: 91388421    	add	x1, x1, #3617
1000035b0: 97fff6f4    	bl	0x100001180 <_lookup>
1000035b4: f81d83a0    	stur	x0, [x29, #-40]
1000035b8: f85d83a8    	ldur	x8, [x29, #-40]
1000035bc: f1000108    	subs	x8, x8, #0
1000035c0: 1a9f07e8    	cset	w8, ne
1000035c4: 37000148    	tbnz	w8, #0, 0x1000035ec <_COPY_TOKEN+0x1c4>
1000035c8: 14000001    	b	0x1000035cc <_COPY_TOKEN+0x1a4>
1000035cc: 910003e9    	mov	x9, sp
1000035d0: 90000008    	adrp	x8, 0x100003000 <_COPY_TOKEN+0x1a8>
1000035d4: 91388508    	add	x8, x8, #3617
1000035d8: f9000128    	str	x8, [x9]
1000035dc: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0x1b4>
1000035e0: 9139f000    	add	x0, x0, #3708
1000035e4: 97fff574    	bl	0x100000bb4 <_error>
1000035e8: 14000001    	b	0x1000035ec <_COPY_TOKEN+0x1c4>
1000035ec: f85d83a8    	ldur	x8, [x29, #-40]
1000035f0: f9400508    	ldr	x8, [x8, #8]
1000035f4: f81f03a8    	stur	x8, [x29, #-16]
1000035f8: f9401be0    	ldr	x0, [sp, #48]
1000035fc: 90000001    	adrp	x1, 0x100003000 <_COPY_TOKEN+0x1d4>
100003600: 91389c21    	add	x1, x1, #3623
100003604: 97fff6df    	bl	0x100001180 <_lookup>
100003608: f81d83a0    	stur	x0, [x29, #-40]
10000360c: f85d83a8    	ldur	x8, [x29, #-40]
100003610: f1000108    	subs	x8, x8, #0
100003614: 1a9f07e8    	cset	w8, ne
100003618: 37000148    	tbnz	w8, #0, 0x100003640 <_COPY_TOKEN+0x218>
10000361c: 14000001    	b	0x100003620 <_COPY_TOKEN+0x1f8>
100003620: 910003e9    	mov	x9, sp
100003624: 90000008    	adrp	x8, 0x100003000 <_COPY_TOKEN+0x1fc>
100003628: 91389d08    	add	x8, x8, #3623
10000362c: f9000128    	str	x8, [x9]
100003630: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0x208>
100003634: 9139f000    	add	x0, x0, #3708
100003638: 97fff55f    	bl	0x100000bb4 <_error>
10000363c: 14000001    	b	0x100003640 <_COPY_TOKEN+0x218>
100003640: f85d83a8    	ldur	x8, [x29, #-40]
100003644: f9400508    	ldr	x8, [x8, #8]
100003648: f81e83a8    	stur	x8, [x29, #-24]
10000364c: f9401be0    	ldr	x0, [sp, #48]
100003650: 90000001    	adrp	x1, 0x100003000 <_COPY_TOKEN+0x228>
100003654: 9138b421    	add	x1, x1, #3629
100003658: 97fff6ca    	bl	0x100001180 <_lookup>
10000365c: f81d83a0    	stur	x0, [x29, #-40]
100003660: f85d83a8    	ldur	x8, [x29, #-40]
100003664: f1000108    	subs	x8, x8, #0
100003668: 1a9f07e8    	cset	w8, ne
10000366c: 37000148    	tbnz	w8, #0, 0x100003694 <_COPY_TOKEN+0x26c>
100003670: 14000001    	b	0x100003674 <_COPY_TOKEN+0x24c>
100003674: 910003e9    	mov	x9, sp
100003678: 90000008    	adrp	x8, 0x100003000 <_COPY_TOKEN+0x250>
10000367c: 9138b508    	add	x8, x8, #3629
100003680: f9000128    	str	x8, [x9]
100003684: 90000000    	adrp	x0, 0x100003000 <_COPY_TOKEN+0x25c>
100003688: 9139f000    	add	x0, x0, #3708
10000368c: 97fff54a    	bl	0x100000bb4 <_error>
100003690: 14000001    	b	0x100003694 <_COPY_TOKEN+0x26c>
100003694: f85d83a8    	ldur	x8, [x29, #-40]
100003698: f9400508    	ldr	x8, [x8, #8]
10000369c: f81e03a8    	stur	x8, [x29, #-32]
1000036a0: f85e03a8    	ldur	x8, [x29, #-32]
1000036a4: f85e83a9    	ldur	x9, [x29, #-24]
1000036a8: eb090108    	subs	x8, x8, x9
1000036ac: 91000500    	add	x0, x8, #1
1000036b0: 9400018d    	bl	0x100003ce4 <_vfprintf+0x100003ce4>
1000036b4: f81f83a0    	stur	x0, [x29, #-8]
1000036b8: f85f83a0    	ldur	x0, [x29, #-8]
1000036bc: f85f03a8    	ldur	x8, [x29, #-16]
1000036c0: f85e83a9    	ldur	x9, [x29, #-24]
1000036c4: 8b090101    	add	x1, x8, x9
1000036c8: f85e03a8    	ldur	x8, [x29, #-32]
1000036cc: f85e83a9    	ldur	x9, [x29, #-24]
1000036d0: eb090102    	subs	x2, x8, x9
1000036d4: 92800003    	mov	x3, #-1
1000036d8: 94000159    	bl	0x100003c3c <_vfprintf+0x100003c3c>
1000036dc: f9400be8    	ldr	x8, [sp, #16]
1000036e0: f85f83a9    	ldur	x9, [x29, #-8]
1000036e4: f85e03aa    	ldur	x10, [x29, #-32]
1000036e8: f85e83ab    	ldur	x11, [x29, #-24]
1000036ec: eb0b014a    	subs	x10, x10, x11
1000036f0: 8b0a0129    	add	x9, x9, x10
1000036f4: 3900013f    	strb	wzr, [x9]
1000036f8: f85f83a9    	ldur	x9, [x29, #-8]
1000036fc: f90013e9    	str	x9, [sp, #32]
100003700: f9400100    	ldr	x0, [x8]
100003704: f94013e2    	ldr	x2, [sp, #32]
100003708: 90000001    	adrp	x1, 0x100003000 <_COPY_TOKEN+0x2e0>
10000370c: 9134e021    	add	x1, x1, #3384
100003710: 97fff6cd    	bl	0x100001244 <_upsert>
100003714: a9477bfd    	ldp	x29, x30, [sp, #112]
100003718: 910203ff    	add	sp, sp, #128
10000371c: d65f03c0    	ret

0000000100003720 <_parse>:
100003720: d10103ff    	sub	sp, sp, #64
100003724: a9037bfd    	stp	x29, x30, [sp, #48]
100003728: 9100c3fd    	add	x29, sp, #48
10000372c: b0000028    	adrp	x8, 0x100008000 <_parse+0x20>
100003730: 91002108    	add	x8, x8, #8
100003734: f9000be8    	str	x8, [sp, #16]
100003738: b0000028    	adrp	x8, 0x100008000 <_parse+0x2c>
10000373c: 91008108    	add	x8, x8, #32
100003740: f9000fe8    	str	x8, [sp, #24]
100003744: b0000028    	adrp	x8, 0x100008000 <_parse+0x38>
100003748: 9100a108    	add	x8, x8, #40
10000374c: f81f03a8    	stur	x8, [x29, #-16]
100003750: 14000001    	b	0x100003754 <_parse+0x34>
100003754: f9400fe9    	ldr	x9, [sp, #24]
100003758: f9400be8    	ldr	x8, [sp, #16]
10000375c: f9400108    	ldr	x8, [x8]
100003760: f9400129    	ldr	x9, [x9]
100003764: 38e96900    	ldrsb	w0, [x8, x9]
100003768: 9400015c    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
10000376c: 71000008    	subs	w8, w0, #0
100003770: 1a9f17e8    	cset	w8, eq
100003774: 37000208    	tbnz	w8, #0, 0x1000037b4 <_parse+0x94>
100003778: 14000001    	b	0x10000377c <_parse+0x5c>
10000377c: f9400fe9    	ldr	x9, [sp, #24]
100003780: f9400be8    	ldr	x8, [sp, #16]
100003784: f940012a    	ldr	x10, [x9]
100003788: 9100054a    	add	x10, x10, #1
10000378c: f900012a    	str	x10, [x9]
100003790: f9400108    	ldr	x8, [x8]
100003794: f9400129    	ldr	x9, [x9]
100003798: 8b090108    	add	x8, x8, x9
10000379c: 910003e9    	mov	x9, sp
1000037a0: f9000128    	str	x8, [x9]
1000037a4: 90000000    	adrp	x0, 0x100003000 <_parse+0x84>
1000037a8: 913e0800    	add	x0, x0, #3970
1000037ac: 94000151    	bl	0x100003cf0 <_vfprintf+0x100003cf0>
1000037b0: 17ffffe9    	b	0x100003754 <_parse+0x34>
1000037b4: f9400fe8    	ldr	x8, [sp, #24]
1000037b8: f9400108    	ldr	x8, [x8]
1000037bc: b0000029    	adrp	x9, 0x100008000 <_parse+0xb0>
1000037c0: 91004129    	add	x9, x9, #16
1000037c4: f9400129    	ldr	x9, [x9]
1000037c8: eb090108    	subs	x8, x8, x9
1000037cc: 1a9fa7e8    	cset	w8, lt
1000037d0: 37000188    	tbnz	w8, #0, 0x100003800 <_parse+0xe0>
1000037d4: 14000001    	b	0x1000037d8 <_parse+0xb8>
1000037d8: b0000028    	adrp	x8, 0x100008000 <_parse+0xcc>
1000037dc: 91000108    	add	x8, x8, #0
1000037e0: f9400108    	ldr	x8, [x8]
1000037e4: f9419108    	ldr	x8, [x8, #800]
1000037e8: f1000108    	subs	x8, x8, #0
1000037ec: 1a9f07e8    	cset	w8, ne
1000037f0: 37000088    	tbnz	w8, #0, 0x100003800 <_parse+0xe0>
1000037f4: 14000001    	b	0x1000037f8 <_parse+0xd8>
1000037f8: 52800000    	mov	w0, #0
1000037fc: 9400011c    	bl	0x100003c6c <_vfprintf+0x100003c6c>
100003800: f9400fe8    	ldr	x8, [sp, #24]
100003804: f9400108    	ldr	x8, [x8]
100003808: b0000029    	adrp	x9, 0x100008000 <_parse+0xfc>
10000380c: 91004129    	add	x9, x9, #16
100003810: f9400129    	ldr	x9, [x9]
100003814: eb090108    	subs	x8, x8, x9
100003818: 1a9fa7e8    	cset	w8, lt
10000381c: 370001a8    	tbnz	w8, #0, 0x100003850 <_parse+0x130>
100003820: 14000001    	b	0x100003824 <_parse+0x104>
100003824: b0000028    	adrp	x8, 0x100008000 <_parse+0x118>
100003828: 91000108    	add	x8, x8, #0
10000382c: f9400108    	ldr	x8, [x8]
100003830: f9419108    	ldr	x8, [x8, #800]
100003834: f1000108    	subs	x8, x8, #0
100003838: 1a9f17e8    	cset	w8, eq
10000383c: 370000a8    	tbnz	w8, #0, 0x100003850 <_parse+0x130>
100003840: 14000001    	b	0x100003844 <_parse+0x124>
100003844: 97fff796    	bl	0x10000169c <_pop_scope>
100003848: 97ffffb6    	bl	0x100003720 <_parse>
10000384c: 140000f6    	b	0x100003c24 <_parse+0x504>
100003850: 14000001    	b	0x100003854 <_parse+0x134>
100003854: f9400fe9    	ldr	x9, [sp, #24]
100003858: f9400be8    	ldr	x8, [sp, #16]
10000385c: f940012a    	ldr	x10, [x9]
100003860: b000002b    	adrp	x11, 0x100008000 <_parse+0x154>
100003864: 9100616b    	add	x11, x11, #24
100003868: f900016a    	str	x10, [x11]
10000386c: f9400108    	ldr	x8, [x8]
100003870: f9400129    	ldr	x9, [x9]
100003874: 38e96908    	ldrsb	w8, [x8, x9]
100003878: 7100b508    	subs	w8, w8, #45
10000387c: 1a9f17e8    	cset	w8, eq
100003880: 37000188    	tbnz	w8, #0, 0x1000038b0 <_parse+0x190>
100003884: 14000001    	b	0x100003888 <_parse+0x168>
100003888: f9400fe9    	ldr	x9, [sp, #24]
10000388c: f9400be8    	ldr	x8, [sp, #16]
100003890: f9400108    	ldr	x8, [x8]
100003894: f9400129    	ldr	x9, [x9]
100003898: 38e96900    	ldrsb	w0, [x8, x9]
10000389c: 9400010c    	bl	0x100003ccc <_vfprintf+0x100003ccc>
1000038a0: 71000008    	subs	w8, w0, #0
1000038a4: 1a9f17e8    	cset	w8, eq
1000038a8: 37000908    	tbnz	w8, #0, 0x1000039c8 <_parse+0x2a8>
1000038ac: 14000001    	b	0x1000038b0 <_parse+0x190>
1000038b0: f9400fe9    	ldr	x9, [sp, #24]
1000038b4: f85f03a8    	ldur	x8, [x29, #-16]
1000038b8: b900011f    	str	wzr, [x8]
1000038bc: f9400128    	ldr	x8, [x9]
1000038c0: 91000508    	add	x8, x8, #1
1000038c4: f9000128    	str	x8, [x9]
1000038c8: 14000001    	b	0x1000038cc <_parse+0x1ac>
1000038cc: f9400fe9    	ldr	x9, [sp, #24]
1000038d0: f9400be8    	ldr	x8, [sp, #16]
1000038d4: f9400108    	ldr	x8, [x8]
1000038d8: f9400129    	ldr	x9, [x9]
1000038dc: 38e96900    	ldrsb	w0, [x8, x9]
1000038e0: 940000fb    	bl	0x100003ccc <_vfprintf+0x100003ccc>
1000038e4: 71000008    	subs	w8, w0, #0
1000038e8: 1a9f17e8    	cset	w8, eq
1000038ec: 370000e8    	tbnz	w8, #0, 0x100003908 <_parse+0x1e8>
1000038f0: 14000001    	b	0x1000038f4 <_parse+0x1d4>
1000038f4: f9400fe9    	ldr	x9, [sp, #24]
1000038f8: f9400128    	ldr	x8, [x9]
1000038fc: 91000508    	add	x8, x8, #1
100003900: f9000128    	str	x8, [x9]
100003904: 17fffff2    	b	0x1000038cc <_parse+0x1ac>
100003908: f9400fe9    	ldr	x9, [sp, #24]
10000390c: f9400be8    	ldr	x8, [sp, #16]
100003910: f9400108    	ldr	x8, [x8]
100003914: f9400129    	ldr	x9, [x9]
100003918: 38e96908    	ldrsb	w8, [x8, x9]
10000391c: 7100b908    	subs	w8, w8, #46
100003920: 1a9f07e8    	cset	w8, ne
100003924: 37000288    	tbnz	w8, #0, 0x100003974 <_parse+0x254>
100003928: 14000001    	b	0x10000392c <_parse+0x20c>
10000392c: 14000001    	b	0x100003930 <_parse+0x210>
100003930: f9400fea    	ldr	x10, [sp, #24]
100003934: f9400be8    	ldr	x8, [sp, #16]
100003938: f9400108    	ldr	x8, [x8]
10000393c: f9400149    	ldr	x9, [x10]
100003940: 91000529    	add	x9, x9, #1
100003944: f9000149    	str	x9, [x10]
100003948: 38e96900    	ldrsb	w0, [x8, x9]
10000394c: 940000e0    	bl	0x100003ccc <_vfprintf+0x100003ccc>
100003950: 71000008    	subs	w8, w0, #0
100003954: 1a9f17e8    	cset	w8, eq
100003958: 37000068    	tbnz	w8, #0, 0x100003964 <_parse+0x244>
10000395c: 14000001    	b	0x100003960 <_parse+0x240>
100003960: 17fffff4    	b	0x100003930 <_parse+0x210>
100003964: f85f03a9    	ldur	x9, [x29, #-16]
100003968: 52800028    	mov	w8, #1
10000396c: b9000128    	str	w8, [x9]
100003970: 14000001    	b	0x100003974 <_parse+0x254>
100003974: f9400fe9    	ldr	x9, [sp, #24]
100003978: f9400be8    	ldr	x8, [sp, #16]
10000397c: f9400108    	ldr	x8, [x8]
100003980: f9400129    	ldr	x9, [x9]
100003984: 38e96900    	ldrsb	w0, [x8, x9]
100003988: 940000d4    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
10000398c: 71000008    	subs	w8, w0, #0
100003990: 1a9f07e8    	cset	w8, ne
100003994: 37000188    	tbnz	w8, #0, 0x1000039c4 <_parse+0x2a4>
100003998: 14000001    	b	0x10000399c <_parse+0x27c>
10000399c: f9400fe9    	ldr	x9, [sp, #24]
1000039a0: f9400be8    	ldr	x8, [sp, #16]
1000039a4: f9400108    	ldr	x8, [x8]
1000039a8: f9400129    	ldr	x9, [x9]
1000039ac: 38e96908    	ldrsb	w8, [x8, x9]
1000039b0: 71000108    	subs	w8, w8, #0
1000039b4: 1a9f17e8    	cset	w8, eq
1000039b8: 37000068    	tbnz	w8, #0, 0x1000039c4 <_parse+0x2a4>
1000039bc: 14000001    	b	0x1000039c0 <_parse+0x2a0>
1000039c0: 14000076    	b	0x100003b98 <_parse+0x478>
1000039c4: 14000098    	b	0x100003c24 <_parse+0x504>
1000039c8: f9400fe9    	ldr	x9, [sp, #24]
1000039cc: f9400be8    	ldr	x8, [sp, #16]
1000039d0: f9400108    	ldr	x8, [x8]
1000039d4: f9400129    	ldr	x9, [x9]
1000039d8: 38e96908    	ldrsb	w8, [x8, x9]
1000039dc: 71016d08    	subs	w8, w8, #91
1000039e0: 1a9f07e8    	cset	w8, ne
1000039e4: 37000d08    	tbnz	w8, #0, 0x100003b84 <_parse+0x464>
1000039e8: 14000001    	b	0x1000039ec <_parse+0x2cc>
1000039ec: f85f03a9    	ldur	x9, [x29, #-16]
1000039f0: 52800048    	mov	w8, #2
1000039f4: b9000128    	str	w8, [x9]
1000039f8: 52800028    	mov	w8, #1
1000039fc: b81fc3a8    	stur	w8, [x29, #-4]
100003a00: 14000001    	b	0x100003a04 <_parse+0x2e4>
100003a04: f9400fe9    	ldr	x9, [sp, #24]
100003a08: f9400be8    	ldr	x8, [sp, #16]
100003a0c: f940012a    	ldr	x10, [x9]
100003a10: 9100054a    	add	x10, x10, #1
100003a14: f900012a    	str	x10, [x9]
100003a18: f9400108    	ldr	x8, [x8]
100003a1c: f9400129    	ldr	x9, [x9]
100003a20: 38e96908    	ldrsb	w8, [x8, x9]
100003a24: 71000108    	subs	w8, w8, #0
100003a28: 1a9f07e8    	cset	w8, ne
100003a2c: 370001c8    	tbnz	w8, #0, 0x100003a64 <_parse+0x344>
100003a30: 14000001    	b	0x100003a34 <_parse+0x314>
100003a34: f9400be8    	ldr	x8, [sp, #16]
100003a38: f9400108    	ldr	x8, [x8]
100003a3c: b0000029    	adrp	x9, 0x100008000 <_parse+0x330>
100003a40: 91006129    	add	x9, x9, #24
100003a44: f9400129    	ldr	x9, [x9]
100003a48: 8b090108    	add	x8, x8, x9
100003a4c: 910003e9    	mov	x9, sp
100003a50: f9000128    	str	x8, [x9]
100003a54: 90000000    	adrp	x0, 0x100003000 <_parse+0x334>
100003a58: 913d9400    	add	x0, x0, #3941
100003a5c: 97fff456    	bl	0x100000bb4 <_error>
100003a60: 14000001    	b	0x100003a64 <_parse+0x344>
100003a64: f9400fe9    	ldr	x9, [sp, #24]
100003a68: f9400be8    	ldr	x8, [sp, #16]
100003a6c: f9400108    	ldr	x8, [x8]
100003a70: f9400129    	ldr	x9, [x9]
100003a74: 38e96908    	ldrsb	w8, [x8, x9]
100003a78: 71016d08    	subs	w8, w8, #91
100003a7c: 1a9f07e8    	cset	w8, ne
100003a80: 37000208    	tbnz	w8, #0, 0x100003ac0 <_parse+0x3a0>
100003a84: 14000001    	b	0x100003a88 <_parse+0x368>
100003a88: f9400fe9    	ldr	x9, [sp, #24]
100003a8c: f9400be8    	ldr	x8, [sp, #16]
100003a90: f9400108    	ldr	x8, [x8]
100003a94: f9400129    	ldr	x9, [x9]
100003a98: f1000529    	subs	x9, x9, #1
100003a9c: 38e96908    	ldrsb	w8, [x8, x9]
100003aa0: 71017108    	subs	w8, w8, #92
100003aa4: 1a9f17e8    	cset	w8, eq
100003aa8: 370000c8    	tbnz	w8, #0, 0x100003ac0 <_parse+0x3a0>
100003aac: 14000001    	b	0x100003ab0 <_parse+0x390>
100003ab0: b85fc3a8    	ldur	w8, [x29, #-4]
100003ab4: 11000508    	add	w8, w8, #1
100003ab8: b81fc3a8    	stur	w8, [x29, #-4]
100003abc: 14000019    	b	0x100003b20 <_parse+0x400>
100003ac0: f9400fe9    	ldr	x9, [sp, #24]
100003ac4: f9400be8    	ldr	x8, [sp, #16]
100003ac8: f9400108    	ldr	x8, [x8]
100003acc: f9400129    	ldr	x9, [x9]
100003ad0: 38e96908    	ldrsb	w8, [x8, x9]
100003ad4: 71017508    	subs	w8, w8, #93
100003ad8: 1a9f07e8    	cset	w8, ne
100003adc: 37000208    	tbnz	w8, #0, 0x100003b1c <_parse+0x3fc>
100003ae0: 14000001    	b	0x100003ae4 <_parse+0x3c4>
100003ae4: f9400fe9    	ldr	x9, [sp, #24]
100003ae8: f9400be8    	ldr	x8, [sp, #16]
100003aec: f9400108    	ldr	x8, [x8]
100003af0: f9400129    	ldr	x9, [x9]
100003af4: f1000529    	subs	x9, x9, #1
100003af8: 38e96908    	ldrsb	w8, [x8, x9]
100003afc: 71017108    	subs	w8, w8, #92
100003b00: 1a9f17e8    	cset	w8, eq
100003b04: 370000c8    	tbnz	w8, #0, 0x100003b1c <_parse+0x3fc>
100003b08: 14000001    	b	0x100003b0c <_parse+0x3ec>
100003b0c: b85fc3a8    	ldur	w8, [x29, #-4]
100003b10: 71000508    	subs	w8, w8, #1
100003b14: b81fc3a8    	stur	w8, [x29, #-4]
100003b18: 14000001    	b	0x100003b1c <_parse+0x3fc>
100003b1c: 14000001    	b	0x100003b20 <_parse+0x400>
100003b20: 14000001    	b	0x100003b24 <_parse+0x404>
100003b24: f9400fe9    	ldr	x9, [sp, #24]
100003b28: f9400be8    	ldr	x8, [sp, #16]
100003b2c: f9400108    	ldr	x8, [x8]
100003b30: f9400129    	ldr	x9, [x9]
100003b34: 38e96908    	ldrsb	w8, [x8, x9]
100003b38: 71017508    	subs	w8, w8, #93
100003b3c: 1a9f07e8    	cset	w8, ne
100003b40: 52800029    	mov	w9, #1
100003b44: b9000fe9    	str	w9, [sp, #12]
100003b48: 370000e8    	tbnz	w8, #0, 0x100003b64 <_parse+0x444>
100003b4c: 14000001    	b	0x100003b50 <_parse+0x430>
100003b50: b85fc3a8    	ldur	w8, [x29, #-4]
100003b54: 71000108    	subs	w8, w8, #0
100003b58: 1a9f07e8    	cset	w8, ne
100003b5c: b9000fe8    	str	w8, [sp, #12]
100003b60: 14000001    	b	0x100003b64 <_parse+0x444>
100003b64: b9400fe8    	ldr	w8, [sp, #12]
100003b68: 3707f4e8    	tbnz	w8, #0, 0x100003a04 <_parse+0x2e4>
100003b6c: 14000001    	b	0x100003b70 <_parse+0x450>
100003b70: f9400fe9    	ldr	x9, [sp, #24]
100003b74: f9400128    	ldr	x8, [x9]
100003b78: 91000508    	add	x8, x8, #1
100003b7c: f9000128    	str	x8, [x9]
100003b80: 14000028    	b	0x100003c20 <_parse+0x500>
100003b84: f9400fe9    	ldr	x9, [sp, #24]
100003b88: f9400128    	ldr	x8, [x9]
100003b8c: 91000508    	add	x8, x8, #1
100003b90: f9000128    	str	x8, [x9]
100003b94: 14000001    	b	0x100003b98 <_parse+0x478>
100003b98: 14000001    	b	0x100003b9c <_parse+0x47c>
100003b9c: f9400fe9    	ldr	x9, [sp, #24]
100003ba0: f9400be8    	ldr	x8, [sp, #16]
100003ba4: f9400108    	ldr	x8, [x8]
100003ba8: f9400129    	ldr	x9, [x9]
100003bac: 38e96900    	ldrsb	w0, [x8, x9]
100003bb0: 9400004a    	bl	0x100003cd8 <_vfprintf+0x100003cd8>
100003bb4: 71000008    	subs	w8, w0, #0
100003bb8: 1a9f07e8    	cset	w8, ne
100003bbc: 52800009    	mov	w9, #0
100003bc0: b9000be9    	str	w9, [sp, #8]
100003bc4: 37000168    	tbnz	w8, #0, 0x100003bf0 <_parse+0x4d0>
100003bc8: 14000001    	b	0x100003bcc <_parse+0x4ac>
100003bcc: f9400fe9    	ldr	x9, [sp, #24]
100003bd0: f9400be8    	ldr	x8, [sp, #16]
100003bd4: f9400108    	ldr	x8, [x8]
100003bd8: f9400129    	ldr	x9, [x9]
100003bdc: 38e96908    	ldrsb	w8, [x8, x9]
100003be0: 7100c108    	subs	w8, w8, #48
100003be4: 1a9f07e8    	cset	w8, ne
100003be8: b9000be8    	str	w8, [sp, #8]
100003bec: 14000001    	b	0x100003bf0 <_parse+0x4d0>
100003bf0: b9400be8    	ldr	w8, [sp, #8]
100003bf4: 360000e8    	tbz	w8, #0, 0x100003c10 <_parse+0x4f0>
100003bf8: 14000001    	b	0x100003bfc <_parse+0x4dc>
100003bfc: f9400fe9    	ldr	x9, [sp, #24]
100003c00: f9400128    	ldr	x8, [x9]
100003c04: 91000508    	add	x8, x8, #1
100003c08: f9000128    	str	x8, [x9]
100003c0c: 17ffffe4    	b	0x100003b9c <_parse+0x47c>
100003c10: f85f03a9    	ldur	x9, [x29, #-16]
100003c14: 52800068    	mov	w8, #3
100003c18: b9000128    	str	w8, [x9]
100003c1c: 14000001    	b	0x100003c20 <_parse+0x500>
100003c20: 14000001    	b	0x100003c24 <_parse+0x504>
100003c24: a9437bfd    	ldp	x29, x30, [sp, #48]
100003c28: 910103ff    	add	sp, sp, #64
100003c2c: d65f03c0    	ret

Disassembly of section __TEXT,__stubs:

0000000100003c30 <__stubs>:
100003c30: b0000010    	adrp	x16, 0x100004000 <__stubs+0x4>
100003c34: f9400610    	ldr	x16, [x16, #8]
100003c38: d61f0200    	br	x16
100003c3c: b0000010    	adrp	x16, 0x100004000 <__stubs+0x10>
100003c40: f9400a10    	ldr	x16, [x16, #16]
100003c44: d61f0200    	br	x16
100003c48: b0000010    	adrp	x16, 0x100004000 <__stubs+0x1c>
100003c4c: f9400e10    	ldr	x16, [x16, #24]
100003c50: d61f0200    	br	x16
100003c54: b0000010    	adrp	x16, 0x100004000 <__stubs+0x28>
100003c58: f9401210    	ldr	x16, [x16, #32]
100003c5c: d61f0200    	br	x16
100003c60: b0000010    	adrp	x16, 0x100004000 <__stubs+0x34>
100003c64: f9401610    	ldr	x16, [x16, #40]
100003c68: d61f0200    	br	x16
100003c6c: b0000010    	adrp	x16, 0x100004000 <__stubs+0x40>
100003c70: f9401a10    	ldr	x16, [x16, #48]
100003c74: d61f0200    	br	x16
100003c78: b0000010    	adrp	x16, 0x100004000 <__stubs+0x4c>
100003c7c: f9401e10    	ldr	x16, [x16, #56]
100003c80: d61f0200    	br	x16
100003c84: b0000010    	adrp	x16, 0x100004000 <__stubs+0x58>
100003c88: f9402210    	ldr	x16, [x16, #64]
100003c8c: d61f0200    	br	x16
100003c90: b0000010    	adrp	x16, 0x100004000 <__stubs+0x64>
100003c94: f9402610    	ldr	x16, [x16, #72]
100003c98: d61f0200    	br	x16
100003c9c: b0000010    	adrp	x16, 0x100004000 <__stubs+0x70>
100003ca0: f9402a10    	ldr	x16, [x16, #80]
100003ca4: d61f0200    	br	x16
100003ca8: b0000010    	adrp	x16, 0x100004000 <__stubs+0x7c>
100003cac: f9402e10    	ldr	x16, [x16, #88]
100003cb0: d61f0200    	br	x16
100003cb4: b0000010    	adrp	x16, 0x100004000 <__stubs+0x88>
100003cb8: f9403210    	ldr	x16, [x16, #96]
100003cbc: d61f0200    	br	x16
100003cc0: b0000010    	adrp	x16, 0x100004000 <__stubs+0x94>
100003cc4: f9403610    	ldr	x16, [x16, #104]
100003cc8: d61f0200    	br	x16
100003ccc: b0000010    	adrp	x16, 0x100004000 <__stubs+0xa0>
100003cd0: f9403a10    	ldr	x16, [x16, #112]
100003cd4: d61f0200    	br	x16
100003cd8: b0000010    	adrp	x16, 0x100004000 <__stubs+0xac>
100003cdc: f9403e10    	ldr	x16, [x16, #120]
100003ce0: d61f0200    	br	x16
100003ce4: b0000010    	adrp	x16, 0x100004000 <__stubs+0xb8>
100003ce8: f9404210    	ldr	x16, [x16, #128]
100003cec: d61f0200    	br	x16
100003cf0: b0000010    	adrp	x16, 0x100004000 <__stubs+0xc4>
100003cf4: f9404610    	ldr	x16, [x16, #136]
100003cf8: d61f0200    	br	x16
100003cfc: b0000010    	adrp	x16, 0x100004000 <__stubs+0xd0>
100003d00: f9404a10    	ldr	x16, [x16, #144]
100003d04: d61f0200    	br	x16
100003d08: b0000010    	adrp	x16, 0x100004000 <__stubs+0xdc>
100003d0c: f9404e10    	ldr	x16, [x16, #152]
100003d10: d61f0200    	br	x16
100003d14: b0000010    	adrp	x16, 0x100004000 <__stubs+0xe8>
100003d18: f9405210    	ldr	x16, [x16, #160]
100003d1c: d61f0200    	br	x16
100003d20: b0000010    	adrp	x16, 0x100004000 <__stubs+0xf4>
100003d24: f9405610    	ldr	x16, [x16, #168]
100003d28: d61f0200    	br	x16
100003d2c: b0000010    	adrp	x16, 0x100004000 <__stubs+0x100>
100003d30: f9405a10    	ldr	x16, [x16, #176]
100003d34: d61f0200    	br	x16
