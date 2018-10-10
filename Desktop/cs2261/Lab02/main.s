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
	mov	r1, #67108864
	push	{r4, r5, r6, lr}
	mov	lr, #0
	ldr	r2, .L4
	ldr	ip, .L4+4
	ldrh	r0, [r2, #48]
	ldr	r3, .L4+8
	ldr	r2, .L4+12
	strh	ip, [r1]	@ movhi
	ldr	ip, .L4+16
	ldr	r1, .L4+20
	strh	r0, [r2]	@ movhi
	mov	r0, r3
	ldr	r2, .L4+24
	strh	lr, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #20
	mov	r2, #1
	mov	lr, #19
	mov	r4, #15
	mov	r3, #120
	mov	ip, #17
	mov	r0, #10
	ldr	r5, .L4+28
	str	r1, [r5]
	ldr	r5, .L4+32
	str	r1, [r5]
	ldr	r5, .L4+36
	str	r1, [r5]
	ldr	r5, .L4+40
	str	r1, [r5]
	ldr	r1, .L4+44
	str	r2, [r1]
	ldr	r1, .L4+48
	str	r2, [r1]
	ldr	r1, .L4+52
	str	r2, [r1]
	ldr	r1, .L4+56
	str	r2, [r1]
	ldr	r2, .L4+60
	str	lr, [r2]
	ldr	r2, .L4+64
	ldr	lr, .L4+68
	str	r4, [r2]
	ldr	r1, .L4+72
	ldr	r2, .L4+76
	str	r3, [lr]
	str	r3, [r1]
	ldr	lr, .L4+80
	str	r3, [r2]
	ldr	r1, .L4+84
	ldr	r2, .L4+88
	str	r3, [lr]
	str	ip, [r1]
	str	r0, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	1027
	.word	32736
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	gRow
	.word	gCol
	.word	gOldRow
	.word	gOldCol
	.word	gRDel
	.word	gCDel
	.word	bRDel
	.word	bCDel
	.word	gHeight
	.word	gWidth
	.word	bRow
	.word	bCol
	.word	bOldRow
	.word	bOldCol
	.word	bHeight
	.word	bWidth
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L28
	ldrh	r3, [r3]
	tst	r3, #8
	sub	sp, sp, #20
	beq	.L7
	ldr	r3, .L28+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
.L7:
	ldr	r3, .L28+8
	ldrh	r2, [r3, #48]
	ldr	r3, .L28+12
	tst	r2, #32
	ldr	r2, .L28+8
	ldr	lr, [r3]
	ldrh	r2, [r2, #48]
	subeq	lr, lr, #1
	streq	lr, [r3]
	tst	r2, #16
	addeq	lr, lr, #1
	streq	lr, [r3]
	ldr	r3, .L28+8
	ldrh	r2, [r3, #48]
	ldr	r3, .L28+16
	tst	r2, #64
	ldr	r2, .L28+8
	ldr	ip, [r3]
	ldrh	r2, [r2, #48]
	subeq	ip, ip, #1
	ldr	r5, .L28+20
	streq	ip, [r3]
	tst	r2, #128
	addeq	ip, ip, #1
	ldr	r0, [r5]
	streq	ip, [r3]
	ldr	r3, .L28+24
	cmp	r0, #0
	ldr	r7, .L28+28
	ldr	r2, [r3]
	ble	.L14
	add	r3, r0, r2
	cmp	r3, #159
	bgt	.L14
.L15:
	ldr	r4, .L28+32
	ldr	r1, [r4]
	ldr	r3, .L28+36
	cmp	r1, #0
	ldr	r3, [r3]
	ble	.L16
	add	r6, r1, r3
	cmp	r6, #239
	ble	.L27
.L16:
	ldr	r6, .L28+40
	ldr	r8, [r6]
	rsb	r8, r8, #0
	str	r8, [r6]
.L17:
	ldr	r9, .L28+44
	ldr	r8, .L28+48
	ldr	r9, [r9]
	ldr	r8, [r8]
	stm	sp, {ip, lr}
	str	r8, [sp, #8]
	str	r9, [sp, #12]
	ldr	r8, .L28+52
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r2, [r7]
	ldrne	r3, [r6]
	rsbne	r0, r2, #0
	rsbne	r1, r3, #0
	ldr	r2, [r5]
	ldr	r3, [r4]
	ldreq	r0, [r7]
	ldreq	r1, [r6]
	add	r2, r2, r0
	add	r3, r3, r1
	strne	r0, [r7]
	strne	r1, [r6]
	str	r2, [r5]
	str	r3, [r4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L14:
	ldr	r3, [r7]
	rsb	r3, r3, #0
	str	r3, [r7]
	b	.L15
.L27:
	ldr	r6, .L28+40
	b	.L17
.L26:
	ldr	r2, .L28+56
	ldr	r3, .L28+60
	ldrh	r1, [r2]
	cmp	r1, r3
	mvneq	r3, #64512
	movne	r0, r3
	strh	r3, [r2]	@ movhi
	ldreq	r0, .L28+64
	ldr	r3, .L28+68
	mov	lr, pc
	bx	r3
	b	.L7
.L29:
	.align	2
.L28:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	bCol
	.word	bRow
	.word	gRow
	.word	gHeight
	.word	gRDel
	.word	gCol
	.word	gWidth
	.word	gCDel
	.word	bWidth
	.word	bHeight
	.word	collision
	.word	bgColor
	.word	32736
	.word	1023
	.word	fillScreen
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L32
	ldr	r7, .L32+4
	ldrh	ip, [r8]
	ldr	r6, .L32+8
	ldr	r5, .L32+12
	ldr	r1, .L32+16
	sub	sp, sp, #12
	ldr	r4, .L32+20
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, [r5]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	fp, .L32+24
	ldr	lr, .L32+28
	ldrh	ip, [r8]
	ldr	r10, .L32+32
	ldr	r8, .L32+36
	ldr	r1, [lr]
	ldr	r3, [fp]
	ldr	r0, [r8]
	ldr	r2, [r10]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #992
	ldr	r8, .L32+40
	ldr	r9, .L32+44
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	r1, [r8]
	ldr	r0, [r9]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	mov	ip, #31744
	ldr	r6, .L32+48
	ldr	r7, .L32+52
	ldr	r3, [fp]
	ldr	r1, [r6]
	ldr	r0, [r7]
	ldr	r2, [r10]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	ldr	r0, [r9]
	ldr	r1, [r8]
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r0, [r5]
	ldr	r8, .L32+36
	ldr	r0, .L32+16
	ldr	lr, .L32+28
	str	r1, [r0]
	str	r2, [r8]
	str	r3, [lr]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	bgColor
	.word	gWidth
	.word	gHeight
	.word	gOldRow
	.word	gOldCol
	.word	drawRect
	.word	bWidth
	.word	bOldCol
	.word	bHeight
	.word	bOldRow
	.word	gCol
	.word	gRow
	.word	bCol
	.word	bRow
	.size	draw, .-draw
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
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	ldr	r9, .L37+4
	ldr	r4, .L37+8
	ldr	r8, .L37+12
	ldr	r7, .L37+16
	ldr	r6, .L37+20
	ldr	r5, .L37+24
.L35:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L35
.L38:
	.align	2
.L37:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	gWidth,4,4
	.comm	gHeight,4,4
	.comm	gCDel,4,4
	.comm	gRDel,4,4
	.comm	gOldCol,4,4
	.comm	gOldRow,4,4
	.comm	gCol,4,4
	.comm	gRow,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
