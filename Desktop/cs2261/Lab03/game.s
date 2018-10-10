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
	ldr	r2, [r0]
	cmp	r2, #0
	mov	r5, r0
	sub	sp, sp, #20
	ldr	r0, [r0, #16]
	ble	.L2
	ldr	r3, [r5, #24]
	add	r3, r2, r3
	cmp	r3, #120
	bgt	.L2
.L3:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldr	r1, [r5, #20]
	ble	.L4
	ldr	ip, [r5, #28]
	add	ip, r3, ip
	cmp	ip, #239
	bgt	.L4
.L5:
	mov	r7, #0
	add	r2, r2, r0
	add	r3, r3, r1
	ldr	r4, .L17
	stm	r5, {r2, r3}
	ldr	r9, .L17+4
	ldr	r8, .L17+8
	add	r6, r4, #200
.L9:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	beq	.L16
.L7:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L9
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	rsb	r1, r1, #0
	str	r1, [r5, #20]
	b	.L5
.L2:
	rsb	r0, r0, #0
	str	r0, [r5, #16]
	b	.L3
.L16:
	add	ip, r5, #24
	ldm	ip, {ip, lr}
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r8]
	subne	r3, r3, #1
	strne	r7, [r4, #32]
	strne	r3, [r8]
	strne	r7, [r5, #36]
	b	.L7
.L18:
	.align	2
.L17:
	.word	bullets
	.word	collision
	.word	ballsRemaining
	.size	updateBall.part.1, .-updateBall.part.1
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #31
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #240
	mov	r2, #3
	mov	r1, #0
	mov	r0, #120
	ldr	r4, .L21
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	drawRect
	.size	drawBar, .-drawBar
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
	push	{r4, r5, lr}
	mov	r1, #140
	mov	r5, #1
	mov	r4, #10
	mov	lr, #5
	mov	r2, #118
	mov	ip, #992
	mov	r0, #20
	ldr	r3, .L25
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r4, .L29
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L29+4
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
.L30:
	.align	2
.L29:
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
	ldr	r0, .L35
	ldr	r3, .L35+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #200
.L32:
	str	r6, [r3, #20]
	str	r5, [r3, #24]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	strh	r4, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stm	r3, {r1, r2, lr}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L32
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
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
	ldr	r0, .L48
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L47
.L38:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L38
.L47:
	push	{r4, r5, r6, r7, lr}
	mov	r4, #1
	ldr	r5, .L48+4
	ldr	ip, [r5, #24]
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
.L49:
	.align	2
.L48:
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
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L62+4
	bne	.L51
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L51
.L52:
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #32]
	beq	.L61
	ldr	r2, .L62+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L61
	cmp	r3, #19
	bgt	.L56
.L61:
	add	r3, r3, #1
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L62
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L52
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L52
.L56:
	bl	fireBullet
	mov	r3, #1
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
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
	bne	.L68
	ldr	ip, [r0, #36]
	cmp	ip, #0
	beq	.L69
.L66:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L69:
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L70
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L66
.L68:
	mov	ip, #0
	add	r2, r0, #20
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L70
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
	b	.L66
.L71:
	.align	2
.L70:
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
	bgt	.L73
	ldr	r3, [r4, #4]
	cmp	r3, #160
	ble	.L72
.L73:
	mov	r3, #1
	str	r3, [r4, #32]
.L72:
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
	bl	updatePlayer
	ldr	r4, .L94
	add	r5, r4, #200
.L80:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L92
.L79:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L80
	ldr	r4, .L94+4
	add	r5, r4, #220
.L82:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L93
.L81:
	add	r4, r4, #44
	cmp	r5, r4
	bne	.L82
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	mov	r0, r4
	bl	updateBall.part.1
	b	.L81
.L92:
	mov	r0, r4
	bl	updateBullet.part.0
	b	.L79
.L95:
	.align	2
.L94:
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
	mov	r9, #10
	ldr	r4, .L100
	ldr	r5, .L100+4
	ldr	r8, .L100+8
	ldr	r7, .L100+12
	add	r6, r4, #220
.L97:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	lr, #31744
	mov	ip, #0
	smull	r10, fp, r0, r7
	asr	r2, r0, #31
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
	bne	.L97
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
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
	mov	r7, #140
	mov	r8, #1
	ldr	r1, .L106
	mov	r6, #118
	str	r7, [r1]
	str	r7, [r1, #8]
	mov	fp, #10
	mov	r10, #5
	mov	r9, #992
	mov	r5, r7
	mov	r7, #20
	mov	lr, r8
	mov	ip, #2
	mvn	r2, #1
	mov	r3, #0
	mvn	r0, #32768
	str	r6, [r1, #4]
	str	r6, [r1, #12]
	mov	r4, r6
	ldr	r6, .L106+4
	str	fp, [r1, #20]
	str	r10, [r1, #24]
	strh	r9, [r1, #28]	@ movhi
	str	r7, [r1, #32]
	str	r8, [r1, #16]
	add	r1, r6, #200
.L103:
	str	ip, [r6, #20]
	str	lr, [r6, #24]
	str	r4, [r6, #12]
	str	r2, [r6, #16]
	strh	r0, [r6, #28]	@ movhi
	str	r3, [r6, #32]
	stm	r6, {r2, r3, r5}
	add	r6, r6, #40
	cmp	r6, r1
	bne	.L103
	bl	initBalls
	mov	r2, #5
	ldr	r3, .L106+8
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	player
	.word	bullets
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
	bne	.L114
	ldr	ip, [r0, #40]
	cmp	ip, #0
	beq	.L115
.L112:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L115:
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L116
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L112
.L114:
	mov	ip, #0
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L116
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
	b	.L112
.L117:
	.align	2
.L116:
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
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawPlayer
	mov	r3, #31
	ldr	r5, .L120
	mov	r2, #3
	mov	r1, #0
	str	r3, [sp]
	mov	r0, #120
	mov	r3, #240
	ldr	r4, .L120+4
	mov	lr, pc
	bx	r4
	mov	r0, r5
	bl	drawBullet
	add	r0, r5, #40
	bl	drawBullet
	add	r0, r5, #80
	ldr	r4, .L120+8
	bl	drawBullet
	add	r0, r5, #120
	bl	drawBullet
	add	r0, r5, #160
	bl	drawBullet
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #44
	bl	drawBall
	add	r0, r4, #88
	bl	drawBall
	add	r0, r4, #132
	bl	drawBall
	add	r0, r4, #176
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBall
.L121:
	.align	2
.L120:
	.word	bullets
	.word	drawRect
	.word	balls
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,220,4
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
