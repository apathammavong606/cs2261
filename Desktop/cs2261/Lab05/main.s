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
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #67108864
	ldr	ip, .L3
	ldr	r1, .L3+4
	ldr	r2, .L3+8
	strh	ip, [r0]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L4:
	.align	2
.L3:
	.word	1044
	.word	state
	.word	seed
	.size	initialize, .-initialize
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
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L6
	ldr	r2, .L6+4
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L7:
	.align	2
.L6:
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L15
	ldr	r3, [r4]
	ldr	r2, .L15+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L15+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L15+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
.L8:
	pop	{r4, lr}
	bx	lr
.L14:
	ldr	r0, [r4]
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L15+20
	ldr	r3, .L15+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L18
	str	r2, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	state
	.size	goToGame, .-goToGame
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
	mov	r0, #255
	ldr	r3, .L22
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+4
	mov	r3, #250
	ldr	r2, .L22+8
	mov	r1, #105
	mov	r0, #77
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L22+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L25
	ldr	r2, .L35+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L34
.L25:
	tst	r3, #4
	beq	.L24
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r1, .L35+12
	ldreq	r2, .L35+16
	streq	r3, [r1]
	streq	r3, [r2]
.L24:
	pop	{r4, lr}
	bx	lr
.L34:
	mov	r2, #1
	ldr	r3, .L35+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	seed
	.size	pause, .-pause
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
	mov	r0, #252
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r4, .L39+4
	mov	r3, #250
	ldr	r2, .L39+8
	mov	r1, #111
	mov	r0, #77
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L39+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r1, .L47+12
	ldreq	r2, .L47+16
	streq	r3, [r1]
	streq	r3, [r2]
.L41:
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	seed
	.size	win, .-win
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
	mov	r0, #253
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	ldr	r4, .L51+4
	mov	r3, #250
	ldr	r2, .L51+8
	mov	r1, #108
	mov	r0, #77
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L51+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L67
	ldr	r4, .L67+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L67+12
	ldr	r3, .L67+16
	ldr	r0, .L67+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L67+24
	ldr	r2, .L67+20
	mov	r1, #5
	mov	r0, #145
	mov	r3, #254
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L67+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L64
.L54:
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L65
	tst	r3, #2
	beq	.L53
	ldr	r3, .L67+40
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L66
.L53:
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L64:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L66:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L68:
	.align	2
.L67:
	.word	updateGame
	.word	ballsRemaining
	.word	drawGame
	.word	.LC3
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L80
	push	{r4, r7, fp, lr}
	strh	r0, [r2]	@ movhi
	mov	r2, r3
	ldr	r1, .L80+4
	ldr	r6, .L80+8
	str	r3, [r1]
	str	r3, [r6]
	ldr	fp, .L80+12
	ldr	r5, .L80+16
	ldr	r10, .L80+20
	ldr	r9, .L80+24
	ldr	r8, .L80+28
	ldr	r7, .L80+32
	ldr	r4, .L80+36
.L70:
	ldrh	r3, [fp]
.L71:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L71
.L73:
	.word	.L72
	.word	.L74
	.word	.L75
	.word	.L76
	.word	.L76
.L76:
	mov	lr, pc
	bx	r7
.L77:
	ldr	r2, [r6]
	b	.L70
.L75:
	mov	lr, pc
	bx	r8
	b	.L77
.L74:
	mov	lr, pc
	bx	r9
	b	.L77
.L72:
	mov	lr, pc
	bx	r10
	b	.L77
.L81:
	.align	2
.L80:
	.word	1044
	.word	seed
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Pause\000"
	.space	2
.LC1:
	.ascii	"Win\000"
.LC2:
	.ascii	"Lose\000"
	.space	3
.LC3:
	.ascii	"Balls Remaining: %d\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
