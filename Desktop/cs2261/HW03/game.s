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
	.type	updateBall.part.1, %function
updateBall.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [r0]
	cmp	lr, #0
	sub	sp, sp, #20
	mov	r5, r0
	ldr	r1, [r0, #24]
	ldr	ip, [r0, #16]
	ble	.L2
	add	r3, lr, r1
	cmp	r3, #159
	bgt	.L2
.L3:
	ldr	r0, [r5, #4]
	cmp	r0, #0
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #20]
	ble	.L4
	add	r4, r0, r2
	cmp	r4, #239
	bgt	.L4
.L5:
	ldr	r4, .L18
	add	ip, lr, ip
	add	r0, r0, r3
	mov	r9, #0
	str	ip, [r5]
	str	r0, [r5, #4]
	ldr	r7, .L18+4
	ldr	r8, .L18+8
	add	r6, r4, #400
	b	.L8
.L6:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L17
.L8:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	bne	.L6
	ldr	r3, [r4, #24]
	str	r2, [sp, #12]
	ldr	r2, [r4, #20]
	str	r1, [sp, #8]
	ldr	r1, [r4, #4]
	str	r0, [sp, #4]
	ldr	r0, [r4]
	str	ip, [sp]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	strne	r9, [r4, #32]
	subne	r3, r3, #1
	add	r4, r4, #40
	strne	r9, [r5, #36]
	strne	r3, [r8]
	add	r1, r5, #24
	cmp	r6, r4
	ldr	ip, [r5]
	ldr	r0, [r5, #4]
	ldm	r1, {r1, r2}
	bne	.L8
.L17:
	ldr	lr, .L18+12
	str	r2, [sp, #12]
	ldr	r3, [lr, #28]
	str	r1, [sp, #8]
	ldr	r2, [lr, #24]
	str	r0, [sp, #4]
	ldm	lr, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r2, .L18+16
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	rsb	r3, r3, #0
	str	r3, [r5, #20]
	b	.L5
.L2:
	rsb	ip, ip, #0
	str	ip, [r5, #16]
	b	.L3
.L19:
	.align	2
.L18:
	.word	bullets
	.word	collision
	.word	ballsRemaining
	.word	player
	.word	lives
	.size	updateBall.part.1, .-updateBall.part.1
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
	mov	ip, #150
	mov	r4, #31
	mov	lr, #20
	mov	r0, #120
	mov	r1, #1
	mov	r2, #10
	ldr	r3, .L22
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #36]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.size	initPlayer, .-initPlayer
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
	mov	ip, #0
	push	{r4, r5, lr}
	ldr	r4, .L26
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L26+4
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
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mvn	r1, #1
	mov	r6, #2
	mov	r5, #1
	mov	r2, #0
	mvn	r4, #32768
	ldr	r0, .L32
	ldr	r3, .L32+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #400
.L29:
	str	r6, [r3, #20]
	str	r5, [r3, #24]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	strh	r4, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stm	r3, {r1, r2, lr}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L29
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L44
	mov	r3, #0
	mov	r2, r0
	b	.L37
.L35:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #40
	bxeq	lr
.L37:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L35
	push	{r4, r5, r6, r7, lr}
	mov	r4, #1
	ldr	r5, .L44+4
	ldr	ip, [r5, #28]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	add	lr, ip, ip, lsr #31
	ldm	r5, {r7, ip}
	add	r2, r0, r3
	ldr	r6, [r0, r3]
	str	r7, [r0, r3]
	ldr	r3, [r2, #24]
	add	ip, ip, lr, asr r4
	ldr	r0, [r2, #4]
	add	r3, r3, r3, lsr #31
	add	r3, ip, r3, asr r4
	str	r6, [r2, #8]
	str	r4, [r2, #32]
	str	r1, [r2, #36]
	str	r0, [r2, #12]
	str	r3, [r2, #4]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L61+4
	bne	.L47
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L47
.L48:
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #36]
	beq	.L59
	ldr	r2, .L61+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L59
	cmp	r3, #19
	bgt	.L54
.L59:
	add	r3, r3, #1
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L49
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #28]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	ble	.L48
.L49:
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L60
.L50:
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L48
	add	r1, r4, #20
	ldr	r2, [r4]
	ldm	r1, {r1, r3}
	add	r3, r2, r3
	rsb	r0, r1, #160
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4]
	b	.L48
.L60:
	ldr	r3, [r4]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4]
	bge	.L48
	b	.L50
.L54:
	bl	fireBullet
	mov	r3, #1
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L67
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L68
.L65:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L68:
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L69
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L65
.L67:
	mov	ip, #0
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L69
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
	b	.L65
.L70:
	.align	2
.L69:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	ldr	r1, [r0, #4]
	add	r3, r3, r2
	str	r3, [r0]
	str	r2, [r0, #8]
	str	r1, [r0, #12]
	bl	drawBullet
	ldr	r3, [r4]
	cmp	r3, #240
	bgt	.L72
	ldr	r3, [r4, #4]
	cmp	r3, #160
	ble	.L71
.L72:
	mov	r3, #1
	str	r3, [r4, #32]
.L71:
	pop	{r4, lr}
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
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
	ldr	r4, .L93
	bl	updatePlayer
	add	r5, r4, #400
	b	.L79
.L78:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L91
.L79:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L78
	mov	r0, r4
	add	r4, r4, #40
	bl	updateBullet.part.0
	cmp	r4, r5
	bne	.L79
.L91:
	ldr	r4, .L93+4
	add	r5, r4, #440
	b	.L81
.L80:
	add	r4, r4, #44
	cmp	r5, r4
	beq	.L92
.L81:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L80
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBall.part.1
	cmp	r5, r4
	bne	.L81
.L92:
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L99
	ldr	r5, .L99+4
	ldr	r9, .L99+8
	ldr	r8, .L99+12
	ldr	r7, .L99+16
	add	r6, r4, #440
.L96:
	mov	r3, #10
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r10, fp, r0, r9
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	ip, #0
	smull	r10, fp, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r3, [r4]
	add	r0, r0, #10
	strh	r7, [r4, #32]	@ movhi
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #36]
	str	ip, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L96
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
	.word	15855
	.size	initBalls, .-initBalls
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #150
	mov	r7, #120
	mov	r3, #1
	mov	r9, #10
	mov	fp, #31
	mov	r10, #20
	mov	r6, r8
	mov	r5, r7
	mov	lr, #2
	mvn	r1, #1
	mov	r2, #0
	mvn	ip, #32768
	ldr	r0, .L105
	mov	r4, r3
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	ldr	r3, .L105+4
	str	r8, [r0]
	str	r8, [r0, #8]
	strh	fp, [r0, #32]	@ movhi
	str	r10, [r0, #36]
	str	r7, [r0, #4]
	str	r7, [r0, #12]
	str	r9, [r0, #24]
	str	r9, [r0, #28]
	add	r0, r3, #400
.L102:
	str	lr, [r3, #20]
	str	r4, [r3, #24]
	str	r5, [r3, #12]
	str	r1, [r3, #16]
	strh	ip, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stm	r3, {r1, r2, r6}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L102
	bl	initBalls
	mov	r1, #10
	ldr	r3, .L105+8
	ldr	r2, .L105+12
	str	r4, [r3]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	player
	.word	bullets
	.word	lives
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.1
	.size	updateBall, .-updateBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L113
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L114
.L111:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L114:
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L115
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L111
.L113:
	mov	ip, #0
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L115
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
	b	.L111
.L116:
	.align	2
.L115:
	.word	drawRect
	.size	drawBall, .-drawBall
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
	ldr	r4, .L123
	add	r5, r4, #400
.L118:
	mov	r0, r4
	add	r4, r4, #40
	bl	drawBullet
	cmp	r4, r5
	bne	.L118
	ldr	r4, .L123+4
	add	r5, r4, #440
.L119:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawBall
	cmp	r5, r4
	bne	.L119
	pop	{r4, r5, r6, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	bullets
	.word	balls
	.size	drawGame, .-drawGame
	.comm	lives,4,4
	.comm	ballsRemaining,4,4
	.comm	balls,440,4
	.comm	bullets,400,4
	.comm	player,40,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
