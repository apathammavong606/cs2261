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
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #800
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+16
	mov	r3, #1024
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	titleScreenPal
	.word	titleScreenTiles
	.word	100720640
	.word	titleScreenMap
	.word	waitForVBlank
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #7168
	mov	ip, #4352
	mov	r0, #0
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L7
	ldr	r1, .L7+4
	ldr	r3, .L7+8
	ldrh	r2, [r2, #48]
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	state
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L11
	mov	lr, pc
	bx	r3
	ldr	r4, .L11+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L11+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L11+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3664
	mov	r2, #100663296
	ldr	r1, .L11+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L11+20
	mov	r3, #1024
	ldr	r1, .L11+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L11+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	instructionsScreenPal
	.word	instructionsScreenTiles
	.word	100720640
	.word	instructionsScreenMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToInstructions
.L21:
	.align	2
.L20:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	startState, .-startState
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
	ldr	r4, .L24
	mov	r2, #83886080
	ldr	r1, .L24+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4416
	mov	r2, #100663296
	ldr	r1, .L24+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L24+28
	mov	r3, #16384
	ldr	r1, .L24+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+36
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100720640
	.word	backgroundMap
	.word	83886592
	.word	spriteSheet2Pal
	.word	100728832
	.word	spriteSheet2Tiles
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructionsState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionsState, %function
instructionsState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L26
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L32
.L26:
	pop	{r4, lr}
	bx	lr
.L32:
	bl	goToGame
	ldr	r3, .L33+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructionsState, .-instructionsState
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
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	ldr	r4, .L37+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L37+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L37+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #224
	mov	r2, #100663296
	ldr	r1, .L37+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L37+20
	mov	r3, #1024
	ldr	r1, .L37+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L37+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r4, .L52
	ldr	r5, .L52+4
	mov	lr, pc
	bx	r4
	ldr	r6, .L52+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L52+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L40:
	tst	r3, #4
	beq	.L41
	ldr	r3, .L52+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
.L41:
	ldr	r3, .L52+24
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L39
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L52+28
	str	r2, [r3]
.L39:
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L52+28
	str	r2, [r3]
	b	.L41
.L50:
	bl	goToPause
	ldrh	r3, [r6]
	b	.L40
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	hideSprites
	.word	oldButtons
	.word	updateGame
	.word	drawGame
	.word	buttons
	.word	player
	.word	state
	.size	gameState, .-gameState
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
	ldr	r3, .L66
	ldr	r4, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L66+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L64
.L55:
	tst	r3, #4
	beq	.L54
	ldr	r3, .L66+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L65
.L54:
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToStart
.L64:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L55
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	oldButtons
	.word	hideSprites
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
	mov	r3, #256
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
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+4
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L83+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
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
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L92+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L92+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #100663296
	ldr	r1, .L92+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L92+20
	ldr	r1, .L92+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L92+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
	ldr	r3, .L92+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L85:
	pop	{r4, lr}
	bx	lr
.L91:
	pop	{r4, lr}
	b	goToStart
.L93:
	.align	2
.L92:
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
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #7168
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	r6, .L107
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r4, .L107+4
	str	r2, [r6]
	ldr	r7, .L107+8
	ldrh	r2, [r4, #48]
	ldr	r3, .L107+12
	strh	r2, [r7]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L107+16
	ldr	fp, .L107+20
	ldr	r10, .L107+24
	ldr	r9, .L107+28
	ldr	r8, .L107+32
.L95:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L96:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L96
.L98:
	.word	.L97
	.word	.L99
	.word	.L100
	.word	.L101
	.word	.L102
	.word	.L103
.L103:
	ldr	r3, .L107+36
	mov	lr, pc
	bx	r3
	b	.L95
.L102:
	ldr	r3, .L107+40
	mov	lr, pc
	bx	r3
	b	.L95
.L101:
	mov	lr, pc
	bx	r8
	b	.L95
.L100:
	mov	lr, pc
	bx	r9
	b	.L95
.L99:
	mov	lr, pc
	bx	r10
	b	.L95
.L97:
	mov	lr, pc
	bx	fp
	b	.L95
.L108:
	.align	2
.L107:
	.word	state
	.word	67109120
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	startState
	.word	instructionsState
	.word	gameState
	.word	pauseState
	.word	loseState
	.word	winState
	.size	main, .-main
	.comm	state,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 47) 7.1.0"
