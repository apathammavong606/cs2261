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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r7, #4352
	mov	r3, #67108864
	mov	r5, #56320
	mov	r4, #72
	mov	r1, #3
	mov	r2, #0
	mov	r6, #112
	mov	ip, #16
	mov	r0, #1
	mov	lr, #100
	strh	r7, [r3]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	ldr	r3, .L4+48
	ldr	r5, .L4+52
	str	r4, [r3]
	ldrh	r5, [r5, #48]
	ldr	r4, .L4+56
	str	r1, [r3, #40]
	ldr	r1, .L4+60
	str	r6, [r3, #4]
	strh	r5, [r4]	@ movhi
	stm	r1, {r2, lr}
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	bgPal
	.word	4848
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	pikachu
	.word	67109120
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
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
	push	{r4, r7, fp, lr}
	ldr	r7, .L28
	ldr	r3, .L28+4
	mov	fp, r7
	mov	lr, pc
	bx	r3
	mov	r10, #4
	ldr	r4, .L28+8
	ldr	r5, .L28+12
	ldr	r9, .L28+16
	ldr	r8, .L28+20
	ldr	r6, .L28+24
	b	.L19
.L27:
	ldrh	r1, [r6, #48]
	tst	r1, #16
	mov	r1, #3
	ldr	r3, [r5]
	sub	r3, r3, #1
	str	r3, [r5]
	str	r1, [r4, #28]
	movne	lr, r1
	bne	.L14
.L13:
	mov	r1, #2
	mov	lr, r1
	add	r3, r3, #1
	str	r3, [r5]
	str	r1, [r4, #28]
.L14:
	ldr	r3, [r4, #36]
	add	r2, r2, #1
	lsl	r3, r3, #21
	str	r2, [r4, #24]
	lsr	ip, r3, #16
.L17:
	ldr	r3, [r4, #16]
	add	r0, r3, #7
	cmp	r3, #0
	movlt	r3, r0
	ldr	r2, [r4, #20]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	asr	r0, r3, #3
	mul	r3, r0, lr
	asr	r2, r2, #3
	mla	r3, r2, ip, r3
	cmp	r1, #4
	strh	r3, [r7, #4]	@ movhi
	moveq	r3, #0
	ldm	r4, {r0, r2}
	orr	r2, r2, #16384
	streq	r3, [r4, #36]
	strh	r2, [r7, #2]	@ movhi
	strh	r0, [r7]	@ movhi
	mov	lr, pc
	bx	r9
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, fp
	mov	r0, #3
	mov	lr, pc
	bx	r8
	mov	r3, #67108864
	ldrh	r1, [r5]
	ldrh	r2, [r5, #4]
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
.L19:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	ldr	r2, [r4, #24]
	strne	r3, [r4, #32]
	ldr	r3, .L28+28
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	str	r10, [r4, #28]
	bne	.L8
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	addlt	r0, r0, #1
	strlt	r0, [r4, #36]
	strge	r3, [r4, #36]
.L8:
	ldrh	r3, [r6, #48]
	tst	r3, #64
	moveq	r1, #1
	ldreq	r3, [r5, #4]
	subeq	r3, r3, #1
	streq	r3, [r5, #4]
	ldrh	r3, [r6, #48]
	streq	r1, [r4, #28]
	ands	r3, r3, #128
	ldreq	r1, [r5, #4]
	streq	r3, [r4, #28]
	ldrh	r3, [r6, #48]
	addeq	r1, r1, #1
	streq	r1, [r5, #4]
	tst	r3, #32
	beq	.L27
	ldrh	r3, [r6, #48]
	tst	r3, #16
	ldreq	r3, [r5]
	beq	.L13
.L15:
	ldr	r1, [r4, #28]
	cmp	r1, #4
	lslne	lr, r1, #16
	lsrne	lr, lr, #16
	bne	.L14
	mov	r3, #0
	ldr	r1, [r4, #32]
	lsl	lr, r1, #16
	str	r1, [r4, #28]
	lsr	lr, lr, #16
	str	r3, [r4, #36]
	mov	ip, r3
	b	.L17
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.word	initialize
	.word	pikachu
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	1717986919
	.size	main, .-main
	.comm	pikachu,44,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
