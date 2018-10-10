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
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L4
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32767
	.word	fillScreen
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #20
	ldr	r7, .L12
	ldr	r6, .L12+4
.L7:
	mov	r4, #70
.L8:
	mov	r1, r4
	mov	r2, r6
	mov	r0, r5
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #170
	bne	.L8
	add	r5, r5, #1
	cmp	r5, #150
	bne	.L7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	setPixel
	.word	32767
	.size	update, .-update
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
	ldr	r2, .L17
	push	{r7, lr}
	ldr	r0, .L17+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L17+12
	ldr	r5, .L17+16
	ldr	r4, .L17+20
	ldr	r9, .L17+24
	ldr	r8, .L17+28
	ldr	r7, .L17+32
.L15:
	mov	r0, #300
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r9
	mov	r0, #300
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r8
	mov	r0, #300
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r1, #90
	mov	r0, #50
	mov	lr, pc
	bx	r7
	b	.L15
.L18:
	.align	2
.L17:
	.word	1027
	.word	32767
	.word	fillScreen
	.word	delay
	.word	waitForVBlank
	.word	update
	.word	drawCherries
	.word	drawPineapple
	.word	drawOrange
	.size	main, .-main
	.ident	"GCC: (devkitARM release 47) 7.1.0"
