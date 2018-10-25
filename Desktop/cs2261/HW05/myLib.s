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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	ip, [r3]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #8
	ldrb	r5, [sp, #40]	@ zero_extendqisi2
	ldrb	lr, [sp, #40]	@ zero_extendqisi2
	ldrb	ip, [sp, #40]	@ zero_extendqisi2
	lsl	lr, lr, #16
	ldrb	r4, [sp, #40]	@ zero_extendqisi2
	orr	lr, lr, r5, lsl #24
	orr	lr, lr, r4
	orr	lr, lr, ip, lsl #8
	cmp	r3, #1
	str	lr, [sp, #4]
	and	lr, r1, #1
	beq	.L36
	cmp	r3, #2
	beq	.L37
	cmp	lr, #0
	and	r7, r3, #1
	bne	.L38
	cmp	r7, #0
	beq	.L39
	cmp	r2, #0
	ble	.L7
	ldr	ip, .L41
	add	r2, r0, r2
	add	r6, r3, r3, lsr #31
	sub	r3, r3, #1
	rsb	r0, r0, r0, lsl #4
	asr	r6, r6, #1
	add	r7, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r5, [ip]
	ldr	r4, [ip, #4]
	and	r7, r7, #1
	add	ip, r1, r2, lsl #4
	add	r1, r1, r0, lsl #4
	orr	r0, r6, #-2130706432
	add	r6, sp, #4
.L29:
	add	r2, r1, r1, lsr #31
	bic	r2, r2, #1
	add	r2, r5, r2
	str	lr, [r4, #44]
	str	r6, [r4, #36]
	str	r2, [r4, #40]
	add	r2, r3, r1
	str	r0, [r4, #44]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrh	r9, [r5, r2]
	ldrb	r8, [sp, #40]	@ zero_extendqisi2
	cmp	r7, #0
	and	r8, r8, #255
	and	r10, r9, #255
	add	r1, r1, #240
	andeq	r9, r9, #65280
	orrne	r8, r10, r8, lsl #8
	orreq	r8, r9, r8
	cmp	ip, r1
	strh	r8, [r5, r2]	@ movhi
	bne	.L29
	b	.L7
.L37:
	rsb	r0, r0, r0, lsl #4
	lsl	r3, r0, #4
	ldr	r0, .L41
	add	r2, r1, r3
	ldr	r4, [r0]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	cmp	lr, #0
	ldrb	ip, [sp, #40]	@ zero_extendqisi2
	ldrh	lr, [r4, r2]
	and	ip, ip, #255
	add	r1, r1, #1
	andne	lr, lr, #255
	andeq	lr, lr, #65280
	orrne	ip, lr, ip, lsl #8
	orreq	ip, lr, ip
	add	r3, r1, r3
	strh	ip, [r4, r2]	@ movhi
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	tst	r1, #1
	ldrb	r2, [sp, #40]	@ zero_extendqisi2
	ldrh	r1, [r4, r3]
	and	r2, r2, #255
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	orrne	r2, r1, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [r4, r3]	@ movhi
.L7:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L36:
	rsb	r0, r0, r0, lsl #4
	ldr	r3, .L41
	add	r1, r1, r0, lsl #4
	add	r1, r1, r1, lsr #31
	ldr	r0, [r3]
	bic	r1, r1, #1
	ldrh	r2, [r0, r1]
	ldrb	r3, [sp, #40]	@ zero_extendqisi2
	cmp	lr, #0
	and	r3, r3, #255
	andne	r2, r2, #255
	andeq	r2, r2, #65280
	orrne	r3, r2, r3, lsl #8
	orreq	r3, r2, r3
	strh	r3, [r0, r1]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L38:
	cmp	r7, #0
	beq	.L40
	cmp	r2, #0
	ble	.L7
	mov	lr, #0
	ldr	ip, .L41
	add	r2, r0, r2
	add	r3, r3, r3, lsr #31
	asr	r7, r3, #1
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldm	ip, {r5, ip}
	add	r2, r1, r2, lsl #4
	orr	r7, r7, #-2130706432
	add	r1, r1, r0, lsl #4
	add	r6, sp, #4
.L21:
	add	r0, r1, r1, lsr #31
	bic	r0, r0, #1
	add	r3, r1, #1
	ldrb	r4, [r5, r0]	@ zero_extendqisi2
	ldrb	r8, [sp, #40]	@ zero_extendqisi2
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r1, r1, #240
	orr	r4, r4, r8, lsl #8
	add	r3, r5, r3
	cmp	r2, r1
	strh	r4, [r5, r0]	@ movhi
	str	lr, [ip, #44]
	str	r6, [ip, #36]
	str	r3, [ip, #40]
	str	r7, [ip, #44]
	bne	.L21
	b	.L7
.L40:
	cmp	r2, #0
	ble	.L7
	ldr	ip, .L41
	add	r2, r0, r2
	add	r8, r3, r3, lsr #31
	sub	r3, r3, #1
	add	r9, r1, r3
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r8, r8, #1
	ldr	lr, [ip]
	ldr	r4, [ip, #4]
	orr	r8, r8, #-2130706432
	add	ip, r1, r2, lsl #4
	and	r9, r9, #1
	add	r1, r1, r0, lsl #4
	add	r6, sp, #4
.L24:
	add	r0, r1, r1, lsr #31
	bic	r0, r0, #1
	add	r2, r1, #1
	ldrb	r5, [lr, r0]	@ zero_extendqisi2
	ldrb	r10, [sp, #40]	@ zero_extendqisi2
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	orr	r5, r5, r10, lsl #8
	add	r2, lr, r2
	strh	r5, [lr, r0]	@ movhi
	str	r7, [r4, #44]
	str	r6, [r4, #36]
	str	r2, [r4, #40]
	add	r2, r3, r1
	str	r8, [r4, #44]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrh	r5, [lr, r2]
	ldrb	r0, [sp, #40]	@ zero_extendqisi2
	cmp	r9, #0
	and	r0, r0, #255
	and	r10, r5, #255
	add	r1, r1, #240
	andeq	r5, r5, #65280
	orrne	r0, r10, r0, lsl #8
	orreq	r0, r5, r0
	cmp	ip, r1
	strh	r0, [lr, r2]	@ movhi
	bne	.L24
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L39:
	cmp	r2, #0
	ble	.L7
	ldr	ip, .L41
	add	r2, r0, r2
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldm	ip, {r4, lr}
	orr	r3, r3, #-2130706432
	add	ip, r1, r2, lsl #4
	add	r6, sp, #4
	add	r1, r1, r0, lsl #4
.L30:
	add	r2, r1, r1, lsr #31
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r2, r4, r2
	cmp	r1, ip
	str	r7, [lr, #44]
	str	r6, [lr, #36]
	str	r2, [lr, #40]
	str	r3, [lr, #44]
	bne	.L30
	b	.L7
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	lr, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, lr, lsl #24
	orr	r3, r3, r1
	ldr	r1, .L45
	add	r2, sp, #16
	orr	r3, r3, r0, lsl #8
	str	r3, [r2, #-4]!
	ldm	r1, {r0, r3}
	ldr	r1, .L45+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	ldr	r6, [sp, #24]
	ble	.L47
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L52
	add	r4, r0, r2
	add	r5, r3, r3, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r1, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r1, r1, r0, lsl #4
.L49:
	add	r0, ip, ip, lsr #31
	add	r2, r1, r1, lsr #31
	bic	r0, r0, #1
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r0, r6, r0
	add	r2, r7, r2
	cmp	r4, r1
	str	r8, [lr, #44]
	add	ip, ip, r3
	str	r0, [lr, #36]
	str	r2, [lr, #40]
	str	r5, [lr, #44]
	bne	.L49
.L47:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L55
	ldr	r1, .L55+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L58:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L58
	mov	r2, #67108864
.L59:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L59
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r1, #100663296
	ldrne	r2, .L66
	ldreq	r2, .L66
	ldrne	r1, .L66+4
	str	r1, [r2]
	mov	r2, #67108864
	eor	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	100704256
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L70
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L76
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L78
.L76:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L78:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L76
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 47) 7.1.0"
