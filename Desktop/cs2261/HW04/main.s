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
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+12
	mov	r3, r5
	ldr	r2, .L4+16
	mov	r1, #60
	mov	r0, #40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+20
	mov	r1, #62
	mov	r0, #120
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	32767
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	state
	.word	seed
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
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.2, %function
winState.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	winState.part.2, .-winState.part.2
	.set	loseState.part.3,winState.part.2
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
	mov	r0, #0
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+4
	ldr	r3, .L15+8
	ldr	r2, .L15+12
	mov	r1, #5
	mov	r0, #145
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L15+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC2
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
	push	{r4, lr}
	ldr	r2, .L24
	ldr	r4, .L24+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L17
	ldr	r3, .L24+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
.L17:
	pop	{r4, lr}
	bx	lr
.L23:
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r0, [r4]
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	initGame
	.word	srand
	.size	startState, .-startState
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
	@ link register save eliminated.
	ldr	r3, .L36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L36+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L35
.L27:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L35:
	b	goToGame
.L37:
	.align	2
.L36:
	.word	oldButtons
	.word	buttons
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
	ldr	r0, .L40
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+8
	mov	r3, #0
	ldr	r2, .L40+12
	mov	r1, #80
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L40+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	1023
	.word	fillScreen
	.word	drawString
	.word	.LC3
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
	@ link register save eliminated.
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	winState.part.2
.L45:
	.align	2
.L44:
	.word	oldButtons
	.size	winState, .-winState
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
	mov	r0, #992
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	ldr	r4, .L48+4
	mov	r3, #0
	ldr	r2, .L48+8
	mov	r1, #90
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L48+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	fillScreen
	.word	drawString
	.word	.LC4
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
	mov	r0, #31
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	mov	r3, #0
	ldr	r2, .L53+8
	mov	r1, #90
	mov	r0, #70
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L53+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen
	.word	drawString
	.word	.LC5
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r4, .L86
	sub	sp, sp, #8
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L86+8
	ldr	r3, .L86+12
	ldr	r0, .L86+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #16
	str	r2, [sp]
	mov	r1, #131
	mov	r2, #12
	mov	r0, #145
	ldr	r6, .L86+28
	ldr	r5, .L86+32
	mov	lr, pc
	bx	r6
	ldr	r3, .L86+36
	ldr	r2, .L86+16
	mov	r1, #130
	mov	r0, #145
	ldr	r6, .L86+40
	mov	lr, pc
	bx	r6
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L86+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
.L56:
	ldr	r3, [r4]
	cmp	r3, #0
	ldr	r6, .L86+48
	bne	.L57
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L57
	bl	goToWin
.L59:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L60
	ldrh	r2, [r5]
	tst	r2, #2
	beq	.L61
	ldr	r2, .L86+44
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L61
.L60:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToLose
.L57:
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L59
	ldr	r3, .L86+44
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L59
	bl	goToWin
	b	.L59
.L61:
	ldr	r1, [r4]
	cmp	r1, #0
	movle	r2, #0
	movgt	r2, #1
	cmp	r3, #1
	movne	r2, #0
	cmp	r2, #0
	bne	.L85
.L55:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L84:
	bl	goToPause
	b	.L56
.L85:
	ldr	r3, .L86+52
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L60
	b	.L55
.L87:
	.align	2
.L86:
	.word	ballsRemaining
	.word	updateGame
	.word	.LC6
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawRect
	.word	oldButtons
	.word	32767
	.word	drawString
	.word	buttons
	.word	lives
	.word	bulletsRemaining
	.size	gameState, .-gameState
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
	mov	r2, #67108864
	ldr	r1, .L104
	push	{r4, r7, fp, lr}
	ldr	r3, .L104+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	fp, .L104+8
	ldr	r5, .L104+12
	ldr	r9, .L104+16
	ldr	r8, .L104+20
	ldr	r7, .L104+24
	ldr	r6, .L104+28
	ldr	r10, .L104+32
	ldr	r4, .L104+36
.L89:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r9]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L89
.L92:
	.word	.L91
	.word	.L93
	.word	.L94
	.word	.L95
	.word	.L96
.L96:
	tst	r2, #8
	beq	.L89
	ldr	r3, .L104+40
	mov	lr, pc
	bx	r3
	b	.L89
.L95:
	tst	r2, #8
	beq	.L89
	mov	lr, pc
	bx	r10
	b	.L89
.L93:
	mov	lr, pc
	bx	r7
	b	.L89
.L94:
	mov	lr, pc
	bx	r6
	b	.L89
.L91:
	mov	lr, pc
	bx	r8
	b	.L89
.L105:
	.align	2
.L104:
	.word	1027
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState.part.2
	.word	67109120
	.word	loseState.part.3
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"WELCOME TO ASTEROIDS!\000"
	.space	2
.LC1:
	.ascii	"Press Start to Begin\000"
	.space	3
.LC2:
	.ascii	"Asteroids Remaining:\000"
	.space	3
.LC3:
	.ascii	"GAME IS PAUSED\000"
	.space	1
.LC4:
	.ascii	"YOU WIN :)\000"
	.space	1
.LC5:
	.ascii	"YOU LOSE :(\000"
.LC6:
	.ascii	"%u\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
