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
	mov	r4, #0
	ldr	r1, .L4
	ldr	r2, .L4+4
	strh	r1, [r3]	@ movhi
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	seed
	.word	32736
	.word	fillScreen
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L13
	ldr	r3, [r4]
	ldr	r2, .L13+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L13+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L6
	ldr	r3, .L13+12
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L13+20
	ldr	r0, [r4]
	ldr	r3, .L13+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	seed
	.word	initGame
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.size	startState, .-startState
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L17
	ldr	r0, .L17+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L17+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L18:
	.align	2
.L17:
	.word	fillScreen
	.word	32736
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L32
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L20
	ldr	r2, .L32+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L30
.L20:
	tst	r3, #2
	beq	.L21
	ldr	r3, .L32+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L31
.L21:
	ldr	r3, .L32+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L22
	ldr	r3, .L32+12
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L32+16
	str	r2, [r3]
.L22:
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	ldr	r3, .L32+12
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L32+16
	str	r2, [r3]
	b	.L21
.L30:
	ldr	r3, .L32+12
	ldr	r0, .L32+32
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L32+16
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L20
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	ballsRemaining
	.word	fillScreen
	.word	state
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	15855
	.size	gameState, .-gameState
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L36
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L36+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L39
	ldr	r2, .L50+4
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L48
.L39:
	tst	r3, #4
	beq	.L38
	ldr	r3, .L50+4
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L49
.L38:
	pop	{r4, lr}
	bx	lr
.L49:
	ldr	r3, .L50+8
	ldr	r0, .L50+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r3, .L50+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L50+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L54
	ldr	r0, .L54+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L54+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	fillScreen
	.word	15855
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L66
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L65
	pop	{r4, lr}
	bx	lr
.L65:
	ldr	r3, .L66+8
	ldr	r0, .L66+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32736
	.word	state
	.size	winState, .-winState
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
	push	{r4, r7, fp, lr}
	mov	r4, #0
	ldr	r1, .L79
	ldr	r2, .L79+4
	ldr	r6, .L79+8
	strh	r1, [r3]	@ movhi
	ldr	r0, .L79+12
	ldr	r3, .L79+16
	str	r4, [r2]
	ldr	fp, .L79+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L79+24
	str	r4, [r6]
	mov	r2, r4
	ldr	r10, .L79+28
	ldr	r9, .L79+32
	ldr	r8, .L79+36
	ldr	r7, .L79+40
	ldr	r4, .L79+44
.L69:
	ldrh	r3, [fp]
.L70:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L70
.L72:
	.word	.L71
	.word	.L73
	.word	.L74
	.word	.L75
	.word	.L75
.L75:
	mov	lr, pc
	bx	r7
.L76:
	ldr	r2, [r6]
	b	.L69
.L74:
	mov	lr, pc
	bx	r8
	b	.L76
.L73:
	mov	lr, pc
	bx	r9
	b	.L76
.L71:
	mov	lr, pc
	bx	r10
	b	.L76
.L80:
	.align	2
.L79:
	.word	1027
	.word	seed
	.word	state
	.word	32736
	.word	fillScreen
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L83
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L83+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
	.word	fillScreen
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L88
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L88+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L89:
	.align	2
.L88:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
