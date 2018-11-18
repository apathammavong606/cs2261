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
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateApple.part.1, %function
updateApple.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r2, [r4]
	ldr	r3, [r4, #16]
	ldr	r0, .L9
	sub	sp, sp, #20
	add	r2, r2, r3
	ldr	r1, [r4, #28]
	ldr	r3, [r0, #24]
	ldr	lr, [r4, #24]
	str	r2, [r4]
	ldr	ip, [r4, #4]
	str	r2, [sp]
	ldr	r2, [r0, #20]
	str	r1, [sp, #12]
	ldr	r5, .L9+4
	ldm	r0, {r0, r1}
	stmib	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L2
	mov	r1, #0
	ldr	ip, .L9+8
	ldr	r0, .L9+12
	ldr	r2, [ip]
	ldr	r3, [r0]
	sub	r2, r2, #1
	add	r3, r3, #1
	str	r2, [ip]
	str	r3, [r0]
	str	r1, [r4, #36]
	str	r1, [r4, #40]
.L2:
	ldr	r3, [r4]
	cmp	r3, #160
	ble	.L1
	mov	r2, #0
	ldr	r3, .L9+16
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+20
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	str	r0, [r4, #4]
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	player
	.word	collision
	.word	applesRemaining
	.word	applesCaught
	.word	rand
	.word	2114445439
	.size	updateApple.part.1, .-updateApple.part.1
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
	mov	r1, #140
	str	lr, [sp, #-4]!
	mov	r2, #118
	mov	lr, #1
	mov	ip, #60
	mov	r0, #40
	ldr	r3, .L13
	str	r1, [r3]
	str	r1, [r3, #8]
	ldr	r1, .L13+4
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	strh	r1, [r3, #28]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	10740
	.size	initPlayer, .-initPlayer
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
	@ link register save eliminated.
	ldr	r3, .L19
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L16
	ldr	r3, .L19+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	cmp	r2, r1
	bge	.L18
.L16:
	ldr	r3, .L19
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L19+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #16]
	ldr	r2, [r3, #24]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bx	lr
.L18:
	sub	r2, r2, r1
	str	r2, [r3, #4]
	bx	lr
.L20:
	.align	2
.L19:
	.word	67109120
	.word	player
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L30
	bl	updatePlayer
	add	r5, r4, #440
	b	.L23
.L22:
	add	r4, r4, #44
	cmp	r4, r5
	beq	.L29
.L23:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L22
	mov	r0, r4
	add	r4, r4, #44
	bl	updateApple.part.1
	cmp	r4, r5
	bne	.L23
.L29:
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	apples
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
	push	{r4, r5, lr}
	ldr	r4, .L34
	ldr	ip, .L34+4
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L34+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	1023
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initApples
	.syntax unified
	.arm
	.fpu softvfp
	.type	initApples, %function
initApples:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #10
	ldr	r4, .L40
	ldr	r5, .L40+4
	ldr	r8, .L40+8
	ldr	r7, .L40+12
	add	r6, r4, #440
.L37:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	add	r3, r0, ip
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	lr, #31
	mov	r1, #1
	mov	ip, #0
	smull	r10, fp, r0, r7
	asr	r2, r0, lr
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #36]
	strh	lr, [r4, #32]	@ movhi
	str	ip, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L37
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	apples
	.word	rand
	.word	-2004318071
	.word	2114445439
	.size	initApples, .-initApples
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
	mov	r1, #140
	push	{r4, lr}
	mov	r2, #118
	mov	lr, #1
	mov	r0, #40
	mov	ip, #60
	ldr	r3, .L44
	str	r1, [r3]
	str	r1, [r3, #8]
	ldr	r1, .L44+4
	str	lr, [r3, #16]
	str	r0, [r3, #24]
	strh	r1, [r3, #28]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	ip, [r3, #20]
	bl	initApples
	mov	r0, #10
	mov	r2, #0
	ldr	r1, .L44+8
	ldr	r3, .L44+12
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	10740
	.word	applesRemaining
	.word	applesCaught
	.size	initGame, .-initGame
	.align	2
	.global	updateApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateApple, %function
updateApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateApple.part.1
	.size	updateApple, .-updateApple
	.align	2
	.global	drawApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawApple, %function
drawApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L52
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L53
.L50:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L53:
	ldr	ip, .L54
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L54+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L50
.L52:
	ldr	ip, .L54
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L54+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #32]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	b	.L50
.L55:
	.align	2
.L54:
	.word	1023
	.word	drawRect
	.size	drawApple, .-drawApple
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
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+4
	add	r5, r4, #440
.L57:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawApple
	cmp	r4, r5
	bne	.L57
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	apples
	.size	drawGame, .-drawGame
	.comm	applesCaught,4,4
	.comm	applesRemaining,4,4
	.comm	apples,440,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
