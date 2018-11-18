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
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r1, #4352
	mov	r2, #56320
	push	{r4, lr}
	mov	lr, #0
	ldr	ip, .L8
	ldr	r4, .L8+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L8+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #2160
	mov	r2, #100663296
	ldr	r1, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+32
	mov	r3, #16384
	ldr	r1, .L8+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L8+44
	ldr	r3, .L8+48
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	state
	.word	DMANow
	.word	titleScreenPal
	.word	titleScreenTiles
	.word	100720640
	.word	titleScreenMap
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	hideSprites
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
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
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100720640
	.word	backgroundMap
	.word	hideSprites
	.word	initGame
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToGame
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	startState, .-startState
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+4
	ldr	r3, .L40+8
	ldr	r5, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L40+16
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L40+20
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L24
	ldr	r2, .L40+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L24:
	tst	r3, #1
	beq	.L25
	ldr	r2, .L40+24
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L38
.L25:
	tst	r3, #2
	beq	.L23
	ldr	r3, .L40+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L39
.L23:
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L40+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L37:
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L40+32
	ldrh	r3, [r5]
	str	r1, [r2]
	b	.L24
.L38:
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r1, #3
	ldr	r2, .L40+32
	ldrh	r3, [r5]
	str	r1, [r2]
	b	.L25
.L41:
	.align	2
.L40:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.word	hideSprites
	.word	state
	.size	gameState, .-gameState
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L44+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
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
	push	{r4, lr}
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L53+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L53+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #864
	mov	r2, #100663296
	ldr	r1, .L53+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L53+20
	ldr	r1, .L53+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
	ldr	r3, .L53+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
.L46:
	pop	{r4, lr}
	bx	lr
.L52:
	pop	{r4, lr}
	b	goToGame
.L54:
	.align	2
.L53:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pauseState, .-pauseState
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
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L57+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
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
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L66+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L66+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #560
	mov	r2, #100663296
	ldr	r1, .L66+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+20
	ldr	r1, .L66+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L66+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L59:
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToStart
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winScreenPal
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
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
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L70+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L71:
	.align	2
.L70:
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
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
	push	{r4, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L79+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L79+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #448
	mov	r2, #100663296
	ldr	r1, .L79+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L79+20
	ldr	r1, .L79+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L79+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
.L72:
	pop	{r4, lr}
	bx	lr
.L78:
	pop	{r4, lr}
	b	goToStart
.L80:
	.align	2
.L79:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	loseState, .-loseState
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L93
	mov	lr, pc
	bx	r3
	ldr	r6, .L93+4
	ldr	r7, .L93+8
	ldr	r5, .L93+12
	ldr	fp, .L93+16
	ldr	r10, .L93+20
	ldr	r9, .L93+24
	ldr	r8, .L93+28
	ldr	r4, .L93+32
.L82:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L83:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L83
.L85:
	.word	.L84
	.word	.L86
	.word	.L87
	.word	.L88
	.word	.L89
.L89:
	ldr	r3, .L93+36
	mov	lr, pc
	bx	r3
	b	.L82
.L88:
	mov	lr, pc
	bx	r8
	b	.L82
.L87:
	mov	lr, pc
	bx	r9
	b	.L82
.L86:
	mov	lr, pc
	bx	r10
	b	.L82
.L84:
	mov	lr, pc
	bx	fp
	b	.L82
.L94:
	.align	2
.L93:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.word	67109120
	.word	loseState
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
