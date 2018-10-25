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
	.type	updateDish.part.1, %function
updateDish.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r5, .L17
	ldr	r0, [r0, #28]
	ldr	lr, [r4, #24]
	ldr	ip, [r4, #4]
	sub	sp, sp, #20
	add	r1, r1, r2
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #20]
	ldr	r6, .L17+4
	str	r1, [r4]
	str	r1, [sp]
	str	r0, [sp, #12]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #8]
	stmib	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L2
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldrne	r2, .L17+8
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r2, #0
	ldr	r0, .L17+12
	ldr	r3, [r0]
	cmp	r3, r2
	str	r2, [r4, #40]
	str	r2, [r4, #44]
	ldrne	r1, [r4, #24]
	ldrne	r2, [r5, #8]
	subne	r2, r2, r1
	ldr	r1, .L17+16
	strne	r2, [r5, #8]
	ldr	r2, [r1]
	add	r3, r3, #1
	sub	r2, r2, #1
	str	r3, [r0]
	str	r2, [r1]
.L2:
	ldr	r3, [r4]
	cmp	r3, #160
	ble	.L1
	mov	r2, #0
	ldr	r3, .L17+20
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+24
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	add	r2, r0, r7
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #10
	str	r3, [r4, #4]
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	collision
	.word	loseDish
	.word	dishStack
	.word	dishesRemaining
	.word	rand
	.word	-1240768329
	.size	updateDish.part.1, .-updateDish.part.1
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
	str	lr, [sp, #-4]!
	mov	r1, #120
	mov	lr, #118
	mov	r2, #2
	mov	ip, #30
	mov	r0, #20
	ldr	r3, .L21
	str	lr, [r3, #4]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
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
	ldr	r3, .L27
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L24
	ldr	r3, .L27+4
	ldr	r1, [r3, #12]
	ldr	r2, [r3, #4]
	add	r0, r1, #8
	cmp	r0, r2
	blt	.L26
.L24:
	ldr	r3, .L27
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L27+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #12]
	ldr	r2, [r3, #24]
	rsb	ip, r0, #235
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bx	lr
.L26:
	sub	r2, r2, r1
	str	r2, [r3, #4]
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r4, .L38
	bl	updatePlayer
	add	r5, r4, #720
	b	.L31
.L30:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L37
.L31:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L30
	mov	r0, r4
	add	r4, r4, #48
	bl	updateDish.part.1
	cmp	r4, r5
	bne	.L31
.L37:
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	dishes
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
	push	{r4, lr}
	ldr	r0, .L42
	ldr	ip, .L42+4
	sub	sp, sp, #8
	add	r2, r0, #20
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L42+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	mamaBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initDishes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDishes, %function
initDishes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	mov	r8, #3
	ldr	r4, .L48
	ldr	r5, .L48+4
	ldr	r7, .L48+8
	ldr	r6, .L48+12
.L45:
	mov	r3, #30
	str	r8, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	fp, ip, r0, r7
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mvn	lr, #4
	mov	ip, #0
	smull	r10, fp, r0, r6
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r2, [r4]
	and	r3, r9, r1
	add	r9, r9, r1
	add	r0, r0, #10
	cmp	r9, #15
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #40]
	strb	lr, [r4, #32]
	str	ip, [r4, #44]
	str	r2, [r4, #8]
	str	r3, [r4, #36]
	add	r4, r4, #48
	bne	.L45
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	dishes
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initDishes, .-initDishes
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
	mov	r1, #120
	mov	r2, #2
	mov	lr, #118
	mov	ip, #30
	mov	r0, #20
	ldr	r3, .L52
	str	r1, [r3]
	str	r1, [r3, #8]
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	bl	initDishes
	mov	r0, #15
	mov	r4, #0
	ldr	r1, .L52+4
	ldr	lr, .L52+8
	ldr	ip, .L52+12
	str	r0, [r1]
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L52+16
	mov	r0, #3
	ldr	r5, .L52+20
	str	r4, [lr]
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L52+24
	ldr	r2, .L52+28
	strh	r4, [r3, #244]	@ movhi
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	dishesRemaining
	.word	dishStack
	.word	loseDish
	.word	mamaPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateDish
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDish, %function
updateDish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bxeq	lr
	b	updateDish.part.1
	.size	updateDish, .-updateDish
	.align	2
	.global	drawDish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDish, %function
drawDish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #40]
	cmp	r3, #0
	sub	sp, sp, #8
	mov	r4, r0
	beq	.L57
	ldr	r3, [r0, #36]
	cmp	r3, #0
	movne	ip, #253
	ldrbeq	ip, [r4, #32]	@ zero_extendqisi2
	add	r2, r4, #24
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r5, .L66
	str	ip, [sp]
	mov	lr, pc
	bx	r5
.L57:
	ldr	r5, .L66+4
	ldr	r3, [r5]
	cmp	r3, #1
	beq	.L65
	ble	.L60
	mov	r8, #252
	ldr	r6, .L66+8
	ldm	r6, {r0, r1}
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #24]
	sub	r1, r1, #7
	sub	r0, r0, #2
	str	r8, [sp]
	ldr	r7, .L66
	mov	lr, pc
	bx	r7
	ldr	r3, [r5]
	ldr	r2, [r4, #24]
	mul	ip, r3, r2
	ldm	r6, {r0, r1}
	ldr	r3, [r4, #28]
	mov	r2, ip
	str	r8, [sp]
	sub	r0, r0, ip
	sub	r1, r1, #7
	mov	lr, pc
	bx	r7
.L60:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	mov	ip, #252
	ldr	r2, .L66+8
	ldm	r2, {r0, r1}
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #24]
	sub	r1, r1, #7
	sub	r0, r0, #2
	str	ip, [sp]
	ldr	r5, .L66
	mov	lr, pc
	bx	r5
	b	.L60
.L67:
	.align	2
.L66:
	.word	drawRect4
	.word	dishStack
	.word	player
	.size	drawDish, .-drawDish
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
	mov	r0, #254
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	ldr	r4, .L72+4
	add	r5, r4, #720
.L69:
	mov	r0, r4
	add	r4, r4, #48
	bl	drawDish
	cmp	r4, r5
	bne	.L69
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	fillScreen4
	.word	dishes
	.size	drawGame, .-drawGame
	.comm	loseDish,4,4
	.comm	dishStack,4,4
	.comm	dishesRemaining,4,4
	.comm	dishes,720,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
