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
	mov	r4, #20
	mov	lr, #100
	mov	ip, #16
	mov	r0, #2
	mov	r1, #3
	ldr	r3, .L4
	stm	r3, {r4, lr}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #48]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
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
	ldr	r2, .L8
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	str	lr, [sp, #-4]!
	ldr	r0, [r2, #24]
	ldr	lr, [r2, #36]
	ldr	r1, .L8+4
	ldr	ip, [r2]
	add	r2, r0, lr, lsl #5
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	swat
	.syntax unified
	.arm
	.fpu softvfp
	.type	swat, %function
swat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	ldr	r3, .L23
	ldr	r2, [r3, #32]
	cmp	r2, #29
	str	r1, [r3, #48]
	bgt	.L16
	add	r0, r3, #36
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	movge	r2, #0
	strge	r2, [r3, #48]
	blt	.L22
.L16:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	ldrne	r2, [r3, #32]
	ldreq	r1, [r3, #28]
	addne	r2, r2, #1
	streq	r2, [r3, #36]
	streq	r1, [r3, #24]
	strne	r2, [r3, #32]
	bx	lr
.L22:
	ldr	r1, .L23+4
	push	{r4, r5}
	smull	r4, r5, r2, r1
	asr	r1, r2, #31
	add	r2, r2, #1
	str	r2, [r3, #32]
	ldr	r2, [r3, #24]
	cmp	r2, #0
	rsb	r1, r1, r5, asr #2
	ldrne	r2, [r3, #32]
	str	r1, [r3, #36]
	ldreq	r1, [r3, #28]
	addne	r2, r2, #1
	streq	r2, [r3, #36]
	streq	r1, [r3, #24]
	strne	r2, [r3, #32]
	pop	{r4, r5}
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.word	1717986919
	.size	swat, .-swat
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
	ldr	r3, .L38
	ldrh	r3, [r3, #48]
	tst	r3, #64
	push	{r4, lr}
	ldr	r4, .L38+4
	bne	.L26
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4]
.L26:
	ldr	r3, .L38
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L27
	ldr	r2, [r4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r3, #160
	ldrle	r3, [r4, #16]
	addle	r2, r3, r2
	strle	r2, [r4]
.L27:
	ldr	r3, .L38
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L28
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
.L28:
	ldr	r3, .L38
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L29
	ldmib	r4, {r2, r3}
	ldr	r1, [r4, #20]
	add	r3, r2, r3
	rsb	r0, r1, #240
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
.L29:
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L30
	ldr	r3, .L38+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L37
.L30:
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L37:
	bl	swat
	b	.L30
.L39:
	.align	2
.L38:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFood, %function
initFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #12
	mov	r5, #140
	mov	ip, #16
	mov	r0, #1
	mov	r2, #0
	mov	r4, #4
	mov	lr, #2
	ldr	r3, .L44
.L41:
	str	r1, [r3, #4]
	add	r1, r1, #20
	cmp	r1, #212
	str	r5, [r3]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	lr, [r3, #48]
	add	r3, r3, #52
	bne	.L41
	pop	{r4, r5, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	food
	.size	initFood, .-initFood
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
	push	{r4, lr}
	mov	r4, #20
	mov	lr, #100
	mov	r2, #0
	mov	ip, #16
	mov	r0, #2
	mov	r1, #3
	ldr	r3, .L48
	stm	r3, {r4, lr}
	pop	{r4, lr}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #48]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	b	initFood
.L49:
	.align	2
.L48:
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	updateFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFood, %function
updateFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #20]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r4, r0
	ldr	lr, [r0]
	ldr	ip, [r0, #12]
	bne	.L64
.L51:
	rsb	ip, ip, #0
	cmp	lr, #160
	cmple	ip, lr
	ble	.L50
	mov	r1, #140
	mov	r2, #0
	mov	r3, #1
	str	r1, [r4]
	str	r2, [r4, #28]
	str	r3, [r4, #16]
.L50:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	ldr	r6, [r0, #16]
	sub	lr, lr, r6
	ldr	r6, [r4, #8]
	str	ip, [sp, #8]
	ldr	r5, .L66
	ldr	ip, [r4, #4]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldm	r5, {r0, r1}
	str	lr, [r4]
	str	r6, [sp, #12]
	str	lr, [sp]
	str	ip, [sp, #4]
	ldr	r6, .L66+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L63
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L63
	ldr	r2, [r5, #48]
	cmp	r2, #1
	beq	.L65
	mvn	r0, #0
	mov	r1, #1
	ldr	r2, [r5, #44]
	add	r2, r2, r0
	str	r3, [r4, #20]
	str	r1, [r4, #24]
	str	r1, [r4, #28]
	ldr	lr, [r4]
	ldr	ip, [r4, #12]
	str	r2, [r5, #44]
	str	r0, [r4, #16]
	b	.L51
.L65:
	mvn	r3, #0
	str	r2, [r4, #28]
	str	r3, [r4, #16]
.L63:
	ldr	lr, [r4]
	ldr	ip, [r4, #12]
	b	.L51
.L67:
	.align	2
.L66:
	.word	player
	.word	collision
	.size	updateFood, .-updateFood
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
	ldr	r4, .L72
	add	r5, r4, #520
.L69:
	mov	r0, r4
	add	r4, r4, #52
	bl	updateFood
	cmp	r4, r5
	bne	.L69
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	food
	.size	updateGame, .-updateGame
	.align	2
	.global	drawFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFood, %function
drawFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	push	{r4, r5, lr}
	ldr	r2, .L79+4
	ldr	r5, .L79+8
	add	ip, r3, #520
.L76:
	ldr	r1, [r3, #20]
	cmp	r1, #1
	bne	.L75
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #44]
	ldr	r0, [r3, #32]
	and	r1, r1, r5
	ldrb	lr, [r3]	@ zero_extendqisi2
	orr	r1, r1, #16384
	add	r0, r0, r4, lsl #5
	strh	r1, [r2, #10]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	strh	lr, [r2, #8]	@ movhi
.L75:
	add	r3, r3, #52
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L76
	pop	{r4, r5, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	food
	.word	shadowOAM
	.word	511
	.size	drawFood, .-drawFood
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
	ldr	r2, .L83
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r2, #36]
	ldr	r1, [r2, #24]
	push	{r4, lr}
	ldr	r0, [r2]
	ldr	r4, .L83+4
	add	r2, r1, ip, lsl #5
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	bl	drawFood
	ldr	r3, .L83+8
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L83+12
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.comm	lives,36,4
	.comm	food,520,4
	.comm	player,52,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
