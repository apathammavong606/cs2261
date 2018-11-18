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
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	str	lr, [sp, #-4]!
	ldr	r0, [r3, #4]
	ldr	lr, [r3, #40]
	ldr	r1, [r3, #32]
	ldr	ip, [r3]
	ldr	r2, .L4+4
	add	r3, r1, lr, lsl #5
	orr	r0, r0, #16384
	strh	r0, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	shadowOAM
	.size	drawGame, .-drawGame
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
	mov	r2, #130
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L8
	ldr	r3, .L8+4
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	mov	r5, #2
	mov	r2, #0
	mov	lr, #1
	mov	r1, #16
	mov	ip, #20
	ldr	r3, .L8+8
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	add	r3, r3, r3, lsl r5
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #80
	str	r0, [r4, #4]
	str	r5, [r4, #12]
	str	lr, [r4, #24]
	str	ip, [r4, #32]
	str	r2, [r4, #8]
	str	r2, [r4, #28]
	str	r2, [r4, #36]
	str	r2, [r4, #40]
	str	r2, [r4, #44]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	rand
	.word	1717986919
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L32
	ldrh	r3, [r3, #48]
	tst	r3, #32
	sub	sp, sp, #16
	ldr	r6, .L32+4
	bne	.L11
	ldr	r3, [r6, #4]
	cmp	r3, #31
	ldrgt	r2, [r6, #12]
	subgt	r3, r3, r2
	strgt	r3, [r6, #4]
.L11:
	ldr	r3, .L32
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L12
	ldr	r2, [r6, #4]
	ldr	r3, [r6, #16]
	add	r3, r2, r3
	cmp	r3, #208
	ldrle	r3, [r6, #12]
	addle	r2, r3, r2
	strle	r2, [r6, #4]
.L12:
	ldr	r3, .L32+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r6, #48]
	beq	.L30
	ldr	r2, .L32+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L15
.L30:
	add	r3, r3, #1
.L14:
	ldr	r7, .L32+16
	mov	r5, #0
	mov	r4, r7
	str	r3, [r6, #48]
	ldr	r8, .L32+20
.L18:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L31
.L16:
	add	r5, r5, #1
	cmp	r5, #5
	add	r4, r4, #60
	bne	.L18
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	add	ip, r4, #20
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r3, [r6, #16]
	ldr	r2, [r6, #20]
	ldm	r6, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L16
	mov	r0, #0
	mov	r1, #1
	ldr	r2, .L32+24
	ldr	r3, [r2]
	rsb	r5, r5, r5, lsl #4
	add	r5, r7, r5, lsl #2
	sub	r3, r3, #1
	str	r0, [r5, #36]
	str	r1, [r5, #40]
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	cmp	r3, #19
	movgt	r3, #1
	bgt	.L14
	b	.L30
.L33:
	.align	2
.L32:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	collision
	.word	livesLeft
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
	@ link register save eliminated.
	b	drawGame
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L51
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, r2
	mov	r9, #8
	mov	r8, #9
	mov	r7, #6
	mov	r10, #7
	mov	lr, #3
	mov	r0, #1
	ldr	r6, .L51+4
	add	fp, r3, #68
	b	.L45
.L50:
	mov	r1, #2
	str	lr, [r3, #128]
	str	r1, [r3, #104]
.L42:
	mov	r1, #16
	mov	r5, #20
	ldr	r4, [r3, #104]
	add	r2, r2, #1
	cmp	r2, #25
	str	r0, [r3, #108]
	str	ip, [r3, #100]
	str	ip, [r3, #116]
	str	lr, [r3, #120]
	str	r0, [r3, #124]
	str	r1, [r3, #92]
	str	r1, [r3, #96]
	str	r5, [r3, #112]
	str	r4, [r3, #132]
	add	r3, r3, #68
	beq	.L48
.L45:
	cmp	r2, #0
	beq	.L49
	smull	r4, r5, r2, r6
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #1
	ldr	r4, [r3, #4]
	add	r1, r1, r1, lsl #2
	cmp	r2, r1
	add	r1, r4, #20
	moveq	r4, #33
	str	r1, [r3, #72]
	ldreq	r1, [r3]
	ldrne	r1, [r3]
	addeq	r1, r1, #16
	streq	r1, [r3, #68]
	streq	r4, [r3, #72]
	strne	r1, [r3, #68]
	cmp	r1, #5
	streq	ip, [r3, #104]
	streq	r0, [r3, #128]
	beq	.L42
	cmp	r1, #20
	beq	.L50
	cmp	r1, #35
	bne	.L38
	mov	r4, #4
	mov	r1, #5
	str	r4, [r3, #104]
	str	r1, [r3, #128]
	b	.L42
.L48:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	mov	r1, #5
	mov	r4, #33
	stm	fp, {r1, r4}
	str	r2, [r3, #104]
	str	r0, [r3, #128]
	ldr	r1, [r3, #68]
.L38:
	cmp	r1, #50
	streq	r7, [r3, #104]
	streq	r10, [r3, #128]
	beq	.L42
.L44:
	cmp	r1, #65
	streq	r9, [r3, #104]
	streq	r8, [r3, #128]
	b	.L42
.L52:
	.align	2
.L51:
	.word	enemies-68
	.word	1717986919
	.size	initEnemies, .-initEnemies
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
	bl	initPlayer
	mvn	r6, #1
	bl	initEnemies
	mov	r5, #1
	mov	ip, #8
	mov	r2, #0
	mov	r4, #24
	ldr	r3, .L57
	ldr	r0, .L57+4
	add	lr, r3, #300
.L54:
	ldr	r1, [r0], #68
	str	ip, [r3, #20]
	str	ip, [r3, #24]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #28]
	str	r2, [r3, #36]
	str	r4, [r3, #52]
	str	r2, [r3, #56]
	str	r1, [r3]
	str	r1, [r3, #8]
	add	r3, r3, #60
	cmp	r3, lr
	bne	.L54
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r2, #25
	ldr	r1, .L57+12
	ldr	r3, .L57+16
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	bullets
	.word	enemies
	.word	hideSprites
	.word	livesLeft
	.word	enemiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateEnemyEach
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyEach, %function
updateEnemyEach:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateEnemyEach, .-updateEnemyEach
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L67
	mov	r0, ip
	ldr	r2, .L67+4
	push	{r4, r5, lr}
	add	lr, r2, #1696
	add	lr, lr, #4
.L64:
	ldr	r1, [r2, #40]
	ldr	r3, [r2, #4]
	cmp	r1, #0
	ldrne	r1, [r2, #36]
	ldrne	r5, [r2, #48]
	orr	r3, r3, #16384
	ldrne	r4, [r2]
	addne	r1, r1, r5, lsl #5
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lslne	r1, r1, #1
	add	r2, r2, #68
	strheq	r3, [r0, #10]	@ movhi
	strhne	r3, [ip, #2]	@ movhi
	strhne	r1, [ip, #4]	@ movhi
	strhne	r4, [ip]	@ movhi
	cmp	lr, r2
	add	r0, r0, #8
	bne	.L64
	pop	{r4, r5, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	shadowOAM
	.word	enemies
	.size	drawEnemy, .-drawEnemy
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
	mov	ip, #8
	mov	r2, #0
	mvn	r6, #1
	mov	r5, #1
	mov	r4, #24
	ldr	r3, .L73
	ldr	r0, .L73+4
	add	lr, r3, #300
.L70:
	ldr	r1, [r0], #68
	str	ip, [r3, #20]
	str	ip, [r3, #24]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #28]
	str	r2, [r3, #36]
	str	r4, [r3, #52]
	str	r2, [r3, #56]
	str	r1, [r3]
	str	r1, [r3, #8]
	add	r3, r3, #60
	cmp	r3, lr
	bne	.L70
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	bullets
	.word	enemies
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
	@ link register save eliminated.
	bx	lr
	.size	fireBullet, .-fireBullet
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
	bx	lr
	.size	updateBullet, .-updateBullet
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
	@ link register save eliminated.
	bx	lr
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawLives, .-drawLives
	.comm	enemiesRemaining,4,4
	.comm	livesLeft,4,4
	.comm	lives,60,4
	.comm	bullets,300,4
	.comm	enemies,1700,4
	.comm	player,52,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
