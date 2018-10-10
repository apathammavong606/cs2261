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
	.word	32767
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
	ldr	r2, .L13
	ldr	r4, .L13+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L6
	ldr	r3, .L13+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L13+16
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L13+24
	ldr	r0, [r4]
	ldr	r3, .L13+28
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	initGame
	.word	1023
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
	.word	32767
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
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L27
	ldr	r3, .L30+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L28
.L21:
	ldr	r3, .L30+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L30+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L19:
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r3, .L30+28
	ldr	r0, .L30+32
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L30+36
	str	r2, [r3]
	b	.L21
.L27:
	ldr	r3, .L30+28
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L30+36
	str	r2, [r3]
	b	.L21
.L29:
	ldr	r3, .L30+28
	ldr	r0, .L30+32
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L30+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	applesCaught
	.word	applesRemaining
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	15855
	.word	state
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
	ldr	r3, .L34
	ldr	r0, .L34+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L34+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	fillScreen
	.word	1023
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L45
	pop	{r4, lr}
	bx	lr
.L45:
	ldr	r3, .L46+8
	ldr	r0, .L46+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	32767
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
	mov	r4, #0
	ldr	r1, .L58
	ldr	r2, .L58+4
	ldr	r6, .L58+8
	push	{r7, lr}
	ldr	r0, .L58+12
	strh	r1, [r3]	@ movhi
	ldr	r3, .L58+16
	str	r4, [r2]
	ldr	r10, .L58+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L58+24
	str	r4, [r6]
	mov	r2, r4
	ldr	r9, .L58+28
	ldr	r8, .L58+32
	ldr	r7, .L58+36
	ldr	r4, .L58+40
.L49:
	ldrh	r3, [r10]
.L50:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L50
.L52:
	.word	.L51
	.word	.L53
	.word	.L54
	.word	.L54
.L54:
	mov	lr, pc
	bx	r7
.L55:
	ldr	r2, [r6]
	b	.L49
.L53:
	mov	lr, pc
	bx	r8
	b	.L55
.L51:
	mov	lr, pc
	bx	r9
	b	.L55
.L59:
	.align	2
.L58:
	.word	1027
	.word	seed
	.word	state
	.word	32767
	.word	fillScreen
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
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
	ldr	r3, .L62
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L62+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	r3, .L67
	ldr	r0, .L67+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L67+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	fillScreen
	.word	15855
	.word	state
	.size	goToLose, .-goToLose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
