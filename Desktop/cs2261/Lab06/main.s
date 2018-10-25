	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2048
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #8064
	push	{r4, r5, r6, lr}
	mov	r0, #3
	sub	sp, sp, #2048
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L4+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r6, #5
	mov	r0, sp
	mov	r2, #2048
	mov	r1, #0
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r3, #2
	mov	r2, #10
	mov	ip, #4
	mov	r5, #3
	mov	r1, #1
	mov	r0, #9
	add	lr, sp, #268
	strh	r6, [lr]	@ movhi
	add	lr, sp, #292
	strh	r3, [lr, #2]	@ movhi
	add	lr, sp, #344
	strh	r3, [lr]	@ movhi
	add	lr, sp, #400
	strh	r3, [lr]	@ movhi
	add	lr, sp, #424
	strh	r3, [lr, #2]	@ movhi
	add	lr, sp, #484
	strh	r3, [lr]	@ movhi
	add	lr, sp, #596
	strh	r3, [lr]	@ movhi
	strh	r3, [sp, #222]	@ movhi
	add	r3, sp, #604
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+12
	add	r2, sp, #732
	strh	r3, [r2, #2]	@ movhi
	add	r2, sp, #976
	strh	r3, [r2, #2]	@ movhi
	add	r2, sp, #916
	strh	ip, [r2]	@ movhi
	add	r2, sp, #924
	strh	r5, [r2, #2]	@ movhi
	add	r2, sp, #932
	strh	r1, [r2, #2]	@ movhi
	add	r3, r3, #9216
	add	r2, sp, #980
	ldr	r1, .L4+16
	strh	r0, [r2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	add	r2, sp, #992
	strh	r3, [r2]	@ movhi
	str	r1, [sp, #4]
	add	r2, sp, #1000
	ldr	ip, .L4+20
	add	r1, r1, #67108864
	strh	r3, [r2]	@ movhi
	add	r1, r1, #198656
	ldr	r3, .L4+24
	ldr	r2, .L4+28
	ldr	lr, .L4+32
	add	r1, r1, #4
	str	ip, [sp, #8]
	add	ip, ip, #198656
	add	ip, ip, #2
	mov	r0, r5
	str	r3, [sp, #12]
	str	r2, [sp, #16]
	str	r1, [sp, #20]
	str	r1, [sp, #668]
	mov	r3, #1152
	mov	r2, #100663296
	ldr	r1, .L4+36
	str	lr, [sp]
	str	ip, [sp, #988]
	str	ip, [sp, #996]
	mov	lr, pc
	bx	r4
	mov	r1, sp
	mov	r0, r5
	mov	r3, #1024
	ldr	r2, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	str	r3, [r2]
	ldr	r2, .L4+52
	str	r3, [r1]
	ldrh	r2, [r2, #48]
	ldr	r3, .L4+56
	strh	r2, [r3]	@ movhi
	add	sp, sp, #2048
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	lab06Pal
	.word	memset
	.word	2055
	.word	262147
	.word	393221
	.word	524295
	.word	655369
	.word	131073
	.word	lab06Tiles
	.word	100726784
	.word	vOff
	.word	hOff
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	push	{r4, r5, r6, lr}
	ldr	r5, .L16+4
	tst	r3, #64
	ldreq	r3, [r5]
	subeq	r3, r3, #1
	streq	r3, [r5]
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r5]
	addeq	r3, r3, #1
	streq	r3, [r5]
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	ldr	r4, .L16+8
	tst	r3, #32
	ldreq	r3, [r4]
	subeq	r3, r3, #1
	streq	r3, [r4]
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r3, [r4]
	addeq	r3, r3, #1
	streq	r3, [r4]
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r4]
	ldrh	r2, [r5]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	67109120
	.word	vOff
	.word	hOff
	.word	waitForVBlank
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r7, .L21+4
	ldr	r6, .L21+8
	ldr	r4, .L21+12
	ldr	r5, .L21+16
.L19:
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	b	.L19
.L22:
	.align	2
.L21:
	.word	initialize
	.word	game
	.word	oldButtons
	.word	buttons
	.word	67109120
	.size	main, .-main
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
