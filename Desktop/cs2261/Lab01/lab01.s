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
	.file	"lab01.c"
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r0, r0, r0, lsl #4
	ldr	r3, .L13
	push	{r4, r5, lr}
	lsl	r4, r0, #4
	add	r2, r1, r4
	ldr	r0, [r3]
	lsl	r5, r2, #1
	add	r3, r0, r5
	mov	r2, r3
	mvn	lr, #32768
	add	ip, r0, #10048
	add	ip, ip, #32
	add	ip, ip, r5
.L6:
	strh	lr, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, ip
	bne	.L6
	mvn	ip, #32768
	add	r2, r0, #10112
	add	r2, r2, #10
	add	r2, r2, r5
.L7:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r2
	bne	.L7
	mvn	ip, #32768
	add	r2, r4, #4800
	add	r1, r1, r2
	sub	r3, r1, #-2147483647
	add	r2, r0, #40
	add	r3, r0, r3, lsl #1
	add	r2, r2, r1, lsl #1
.L8:
	strh	ip, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L8
	pop	{r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
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
	mov	r3, #67108864
	ldr	r2, .L18
	push	{r4, lr}
	mov	r1, #36
	strh	r2, [r3]	@ movhi
	mov	r0, #50
	ldr	r4, .L18+4
	mov	lr, pc
	bx	r4
	mov	r1, #104
	mov	r0, #100
	mov	lr, pc
	bx	r4
	mov	r1, #72
	mov	r0, #6
	mov	lr, pc
	bx	r4
.L16:
	b	.L16
.L19:
	.align	2
.L18:
	.word	1027
	.word	drawTriangle
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
