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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #96
	mov	r5, #9
	mov	r2, #0
	mov	r0, #16
	mov	r4, #168
	mov	lr, #121
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L4
	str	r6, [r3]
	ldr	r3, .L4+4
	str	r5, [r3]
	ldr	r3, .L4+8
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	pikachu
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	lr, #16
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L8
	ldr	r3, .L8+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L8+8
	add	r0, r0, #72
	add	r1, r1, #112
	str	r4, [r3, #48]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	vOff
	.word	hOff
	.word	pikachu
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L24
	ldr	r3, .L24+4
	ldr	r5, [r4, #32]
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r2, [r4, #36]
	bne	.L11
	ldr	r0, [r4, #44]
	ldr	r3, .L24+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L11:
	ldr	r3, .L24+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #36]
	ldr	r3, .L24+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #36]
	ldr	r3, .L24+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L14
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #36]
	beq	.L17
.L16:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L23
.L17:
	mov	r3, #2
	str	r3, [r4, #36]
	b	.L16
.L23:
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L16
	mov	r3, #0
	str	r6, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	pikachu
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	ldrh	r2, [r3, #48]
	ldr	ip, .L57+4
	ldr	r3, .L57+8
	tst	r2, #64
	push	{r4, r5, r6, lr}
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	ldr	lr, [ip]
	bne	.L27
	cmp	r2, #0
	ble	.L27
	sub	r0, r2, #1
	lsl	r0, r0, #8
	add	r4, r0, r1
	ldr	r5, .L57+12
	lsl	r4, r4, #1
	ldrh	r4, [r5, r4]
	cmp	r4, #0
	beq	.L27
	ldr	r4, [r3, #24]
	add	r0, r0, r4
	add	r0, r0, r1
	add	r0, r5, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L27
	ldr	r0, [r3, #16]
	cmp	lr, #0
	sub	r2, r2, r0
	str	r2, [r3, #8]
	ble	.L27
	ldr	r4, [r3]
	cmp	r4, #80
	suble	lr, lr, r0
	strle	lr, [ip]
.L27:
	ldr	r0, .L57
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L28
	ldr	r0, [r3, #28]
	add	r0, r2, r0
	cmp	r0, #255
	ble	.L56
.L28:
	ldr	r0, .L57
	ldrh	r0, [r0, #48]
	ldr	r4, .L57+16
	tst	r0, #32
	ldr	ip, [r4]
	bne	.L29
	cmp	r1, #0
	ble	.L29
	sub	r0, r1, #1
	add	r5, r0, r2, lsl #8
	ldr	r6, .L57+12
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L29
	ldr	r5, [r3, #28]
	add	r5, r2, r5
	sub	r5, r5, #1
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L29
	ldr	r0, [r3, #20]
	cmp	ip, #0
	sub	r1, r1, r0
	str	r1, [r3, #12]
	ble	.L29
	ldr	r5, [r3, #4]
	cmp	r5, #120
	suble	ip, ip, r0
	strle	ip, [r4]
.L29:
	ldr	r0, .L57
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L30
	ldr	r0, [r3, #24]
	add	r0, r1, r0
	cmp	r0, #255
	bgt	.L30
	add	r5, r0, r2, lsl #8
	ldr	r6, .L57+12
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L30
	ldr	r5, [r3, #28]
	add	r5, r2, r5
	sub	r5, r5, #1
	add	r0, r0, r5, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L30
	ldr	r0, [r3, #20]
	cmp	ip, #15
	add	r1, r1, r0
	str	r1, [r3, #12]
	bgt	.L30
	ldr	r5, [r3, #4]
	cmp	r5, #119
	addgt	ip, ip, r0
	strgt	ip, [r4]
.L30:
	sub	r2, r2, lr
	sub	r1, r1, ip
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	str	r1, [r3, #4]
	b	animatePlayer
.L56:
	ldr	r0, [r3, #24]
	add	r4, r0, r2
	lsl	r4, r4, #8
	add	r5, r4, r1
	ldr	r6, .L57+12
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	cmp	r5, #0
	beq	.L28
	add	r0, r0, r4
	add	r0, r0, r1
	add	r0, r6, r0, lsl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	beq	.L28
	ldr	r0, [r3, #16]
	cmp	lr, #95
	add	r2, r2, r0
	addle	lr, lr, r0
	str	r2, [r3, #8]
	strle	lr, [ip]
	b	.L28
.L58:
	.align	2
.L57:
	.word	67109120
	.word	vOff
	.word	pikachu
	.word	collisionmapBitmap
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L67
	ldr	r3, [r2, #52]
	cmp	r3, #0
	bne	.L66
	ldr	r3, [r2, #4]
	str	lr, [sp, #-4]!
	ldr	r1, [r2, #36]
	ldr	lr, [r2, #44]
	lsl	r3, r3, #23
	ldr	r0, .L67+4
	ldrb	ip, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r1, lr, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L66:
	ldr	r2, .L67+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L68:
	.align	2
.L67:
	.word	pikachu
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L71+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L71+12
	ldrh	r1, [r2]
	ldr	r2, .L71+16
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L72:
	.align	2
.L71:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	pikachu,56,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
