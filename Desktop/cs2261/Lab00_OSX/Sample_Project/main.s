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
	.global	drawRain
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRain, %function
drawRain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	lsl	r2, r1, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r2, r1
	ldr	r5, .L4
	sub	ip, r3, #3
	smull	r6, r7, ip, r5
	sub	lr, r1, #1
	smull	r10, fp, lr, r5
	sub	sp, sp, #36
	stm	sp, {r6-r7}
	str	ip, [sp, #8]
	add	r6, r2, #38
	asr	ip, lr, #31
	sub	r4, r2, #2
	rsb	fp, ip, fp, asr #7
	rsb	ip, r1, r1, lsl #4
	rsb	r1, r2, r1, lsl #5
	mov	r2, r6
	smull	r8, r9, r4, r5
	str	r6, [sp, #12]
	smull	r6, r7, r2, r5
	add	ip, r0, ip, lsl #4
	add	fp, fp, fp, lsl #4
	lsl	r10, ip, #1
	sub	lr, lr, fp, lsl #4
	ldr	fp, .L4+4
	add	r10, r10, #100663296
	strh	fp, [r10]	@ movhi
	ldr	r10, .L4+8
	lsl	lr, lr, #1
	sub	ip, ip, #241
	ldrh	r2, [r10, lr]
	lsl	ip, ip, #1
	lsl	lr, r0, #1
	add	ip, ip, #100663296
	strh	r2, [ip]	@ movhi
	add	r0, lr, r0
	sub	ip, r3, #45
	rsb	r3, r3, r3, lsl #4
	add	r1, lr, r1, lsl #4
	add	r0, r0, r3, lsl #4
	asr	r3, r4, #31
	lsl	r2, r1, #1
	rsb	r3, r3, r9, asr #7
	add	r2, r2, #100663296
	add	r3, r3, r3, lsl #4
	strh	fp, [r2]	@ movhi
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	sub	r4, r4, r3, lsl #4
	smull	r6, r7, ip, r5
	lsl	r4, r4, #1
	lsl	r3, r1, #1
	ldrh	r2, [r10, r4]
	add	r3, r3, #100663296
	sub	r3, r3, #964
	strh	r2, [r3]	@ movhi
	ldr	r2, [sp, #8]
	lsl	r3, r0, #1
	ldr	lr, [sp, #4]
	add	r3, r3, #100663296
	strh	fp, [r3]	@ movhi
	asr	r3, r2, #31
	rsb	r3, r3, lr, asr #7
	add	r3, r3, r3, lsl #4
	sub	r8, r2, r3, lsl #4
	lsl	r8, r8, #1
	ldr	r3, .L4+12
	ldrh	lr, [r10, r8]
	lsl	r2, r0, #1
	ldr	r4, [sp, #12]
	add	r3, r2, r3
	ldr	r2, .L4+16
	strh	lr, [r3]	@ movhi
	lsl	r3, r1, #1
	ldr	lr, [sp, #20]
	add	r2, r3, r2
	asr	r3, r4, #31
	rsb	r3, r3, lr, asr #7
	str	r6, [sp, #24]
	str	r7, [sp, #28]
	add	r3, r3, r3, lsl #4
	strh	fp, [r2]	@ movhi
	sub	r6, r4, r3, lsl #4
	ldr	r5, [sp, #28]
	lsl	r6, r6, #1
	asr	r3, ip, #31
	ldr	lr, .L4+20
	ldr	r2, .L4+24
	ldrh	r4, [r10, r6]
	lsl	r1, r1, #1
	rsb	r3, r3, r5, asr #7
	lsl	r5, r0, #1
	add	r2, r5, r2
	add	lr, r1, lr
	add	r3, r3, r3, lsl #4
	strh	r4, [lr]	@ movhi
	sub	ip, ip, r3, lsl #4
	strh	fp, [r2]	@ movhi
	lsl	ip, ip, #1
	ldr	r3, .L4+28
	ldrh	r2, [r10, ip]
	add	r3, r5, r3
	strh	r2, [r3]	@ movhi
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	2021161081
	.word	30653
	.word	bg
	.word	100661850
	.word	100682536
	.word	100681572
	.word	100642896
	.word	100641450
	.size	drawRain, .-drawRain
	.align	2
	.global	updateBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBG, %function
updateBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	add	r9, r0, #20
	sub	sp, sp, #60
	add	r6, r0, #26
	add	r5, r0, #7
	mov	r1, r9
	bl	drawRain
	mov	r0, r5
	mov	r1, r6
	add	r8, r4, #17
	str	r5, [sp, #4]
	str	r6, [sp, #8]
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	add	r7, r4, #30
	add	r10, r4, #32
	mov	r0, r8
	mov	r1, r4
	bl	drawRain
	mov	r0, r7
	mov	r1, r10
	add	fp, r4, #60
	str	r7, [sp, #12]
	str	r10, [sp, #16]
	bl	drawRain
	add	r3, r4, #42
	mov	r5, r3
	mov	r0, r8
	add	r3, r4, #44
	mov	r1, fp
	mov	r6, r3
	str	fp, [sp, #20]
	bl	drawRain
	add	r3, r4, #11
	mov	r7, r3
	add	r3, r4, #46
	mov	r10, r3
	mov	r0, r5
	mov	r1, r6
	str	r5, [sp, #24]
	str	r6, [sp, #28]
	bl	drawRain
	add	r3, r4, #86
	mov	fp, r3
	mov	r0, r7
	add	r3, r4, #93
	mov	r1, r10
	mov	r5, r3
	str	r7, [sp, #32]
	str	r10, [sp, #36]
	bl	drawRain
	add	r3, r4, #88
	mov	r10, r3
	add	r7, r4, #77
	mov	r0, fp
	mov	r1, r5
	add	r6, r4, #66
	str	fp, [sp, #40]
	str	r5, [sp, #44]
	bl	drawRain
	mov	r0, r10
	mov	r1, r7
	str	r10, [sp, #48]
	bl	drawRain
	mov	r0, r7
	mov	r1, r6
	bl	drawRain
	add	r3, r4, #40
	mov	fp, r3
	add	r5, r4, #55
	mov	r0, r6
	mov	r1, r5
	bl	drawRain
	add	r10, r4, #2
	mov	r0, r5
	str	fp, [sp, #52]
	mov	r1, fp
	add	fp, r4, #3
	bl	drawRain
	mov	r0, r10
	mov	r1, fp
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	ldmib	sp, {r0, r1}
	bl	drawRain
	mov	r1, r9
	mov	r0, r4
	bl	drawRain
	mov	r1, r4
	mov	r0, r8
	bl	drawRain
	add	r0, sp, #12
	ldm	r0, {r0, r1}
	bl	drawRain
	ldr	r1, [sp, #20]
	mov	r0, r8
	bl	drawRain
	add	r0, sp, #24
	ldm	r0, {r0, r1}
	bl	drawRain
	add	r0, sp, #32
	ldm	r0, {r0, r1}
	bl	drawRain
	add	r0, sp, #40
	ldm	r0, {r0, r1}
	bl	drawRain
	mov	r1, r7
	ldr	r0, [sp, #48]
	bl	drawRain
	mov	r1, r6
	mov	r0, r7
	bl	drawRain
	mov	r1, r5
	mov	r0, r6
	bl	drawRain
	ldr	r1, [sp, #52]
	mov	r0, r5
	bl	drawRain
	mov	r1, fp
	mov	r0, r10
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawRain
	.size	updateBG, .-updateBG
	.align	2
	.global	backgroundColor
	.syntax unified
	.arm
	.fpu softvfp
	.type	backgroundColor, %function
backgroundColor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	push	{r4, r5}
	smull	r4, r5, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r5, asr #7
	add	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	ldr	r3, .L10+4
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	pop	{r4, r5}
	bx	lr
.L11:
	.align	2
.L10:
	.word	2021161081
	.word	bg
	.size	backgroundColor, .-backgroundColor
	.align	2
	.global	drawCharacterAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCharacterAt, %function
drawCharacterAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	r3, r1, r1, lsl #4
	lsl	r3, r3, #4
	add	ip, r3, #50331648
	add	r5, r0, #14
	add	ip, ip, #28
	add	r5, r5, r3
	add	ip, ip, r0
	lsl	r5, r5, #1
	ldr	r4, .L66
	sub	sp, sp, #52
	lsl	r6, ip, #1
	add	r5, r5, #100663296
.L13:
	mov	ip, r5
	add	lr, r5, #5248
	add	lr, lr, #32
.L14:
	strh	r4, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, lr
	bne	.L14
	add	r5, r5, #2
	cmp	r5, r6
	bne	.L13
	add	r5, r0, #23
	mov	r10, r5
	add	r2, r2, r2, lsr #31
	asr	ip, r2, #1
	add	r2, ip, #31
	add	lr, ip, #10
	add	r7, r0, #20
	orr	lr, lr, r2, lsl #5
	add	ip, ip, #29
	orr	lr, lr, ip, lsl #10
	add	ip, r7, r3
	lsl	lr, lr, #16
	lsl	ip, ip, #1
	lsr	lr, lr, #16
	add	r6, r0, #21
	add	ip, ip, #100663296
	strh	lr, [ip]	@ movhi
	add	ip, r6, r3
	lsl	ip, ip, #1
	add	r2, r0, #18
	add	ip, ip, #100663296
	strh	lr, [ip]	@ movhi
	str	r2, [sp, #16]
	add	ip, r0, #18
	add	r2, r3, #240
	add	ip, ip, r2
	lsl	ip, ip, #1
	add	r8, r0, #19
	add	ip, ip, #100663296
	strh	lr, [ip]	@ movhi
	add	ip, r8, r2
	lsl	ip, ip, #1
	add	ip, ip, #100663296
	strh	lr, [ip]	@ movhi
	add	ip, r7, r2
	lsl	ip, ip, #1
	add	ip, ip, #100663296
	strh	lr, [ip]	@ movhi
	add	ip, r6, r2
	add	r4, r0, #19
	lsl	ip, ip, #1
	add	ip, ip, #100663296
	str	r4, [sp, #20]
	add	r4, r0, #22
	strh	lr, [ip]	@ movhi
	add	ip, r4, r2
	add	r2, r10, r2
	lsl	ip, ip, #1
	lsl	r2, r2, #1
	add	ip, ip, #100663296
	add	r2, r2, #100663296
	str	r5, [sp, #24]
	add	r5, r3, #480
	strh	lr, [ip]	@ movhi
	strh	lr, [r2]	@ movhi
	mov	r2, r5
	add	r9, r0, #17
	str	r9, [sp, #8]
	add	r9, r3, #1440
	add	r5, r8, r2
	mov	r8, r9
	lsl	r5, r5, #1
	add	r5, r5, #100663296
	strh	lr, [r5]	@ movhi
	add	r5, r7, r2
	lsl	r5, r5, #1
	add	r5, r5, #100663296
	strh	lr, [r5]	@ movhi
	add	r5, r6, r2
	lsl	r5, r5, #1
	add	r2, r4, r2
	add	r5, r5, #100663296
	lsl	r2, r2, #1
	strh	lr, [r5]	@ movhi
	add	r2, r2, #100663296
	add	r5, r3, #720
	strh	lr, [r2]	@ movhi
	add	r2, r7, r5
	add	r5, r6, r5
	lsl	r2, r2, #1
	lsl	r5, r5, #1
	add	r2, r2, #100663296
	add	r5, r5, #100663296
	add	r9, r0, #17
	strh	lr, [r2]	@ movhi
	strh	lr, [r5]	@ movhi
	add	r2, r9, r8
	add	r5, r0, #18
	add	r5, r5, r8
	lsl	r2, r2, #1
	add	r2, r2, #100663296
	add	fp, r0, #24
	lsl	r5, r5, #1
	strh	lr, [r2]	@ movhi
	add	r5, r5, #100663296
	add	r2, r10, r8
	add	r8, fp, r8
	strh	lr, [r5]	@ movhi
	lsl	r2, r2, #1
	add	r5, r3, #2160
	lsl	r8, r8, #1
	add	r2, r2, #100663296
	add	r8, r8, #100663296
	add	r9, r7, r5
	ldr	ip, .L66+4
	add	r5, r6, r5
	strh	lr, [r2]	@ movhi
	lsl	r9, r9, #1
	strh	lr, [r8]	@ movhi
	lsl	r5, r5, #1
	ldr	lr, .L66+8
	add	r8, r3, #3600
	add	r2, r0, #11
	add	r5, r5, #100663296
	add	ip, r3, ip
	add	r9, r9, #100663296
	str	r8, [sp, #12]
	add	r8, r2, r8
	add	ip, ip, r0
	lsl	r8, r8, #1
	strh	lr, [r9]	@ movhi
	strh	lr, [r5]	@ movhi
	ldr	r5, .L66+12
	lsl	ip, ip, #1
	add	r8, r8, #100663296
.L16:
	mov	r2, r8
	add	lr, r8, #3840
.L17:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, lr
	bne	.L17
	add	r8, r8, #2
	cmp	r8, ip
	bne	.L16
	add	lr, r3, #5504
	add	lr, lr, #16
	add	ip, lr, r0
	add	r2, r0, #12
	add	ip, ip, #50331648
	add	r2, r2, lr
	add	ip, ip, #30
	lsl	r2, r2, #1
	ldr	r5, .L66+12
	lsl	ip, ip, #1
	add	r2, r2, #100663296
.L19:
	strh	r5, [r2], #2	@ movhi
	cmp	r2, ip
	bne	.L19
	ldr	r9, .L66+16
	add	r2, r3, #5760
	add	r8, r0, #13
	add	r8, r8, r2
	add	r9, lr, r9
	str	r2, [sp, #4]
	add	r9, r9, r0
	lsl	r8, r8, #1
	ldr	r2, .L66+12
	lsl	r9, r9, #1
	add	r8, r8, #100663296
.L20:
	mov	ip, r8
	add	r5, r8, #5248
	add	r5, r5, #32
.L21:
	strh	r2, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r5
	bne	.L21
	add	r8, r8, #2
	cmp	r8, r9
	bne	.L20
	add	r9, r3, #3360
	add	r5, r9, r0
	lsl	r10, r5, #1
	add	r10, r10, #100663296
	strh	r2, [r10, #32]	@ movhi
	add	r8, r10, #50
	ldr	r10, [sp, #8]
	str	r8, [sp, #28]
	add	r8, r10, r9
	str	r8, [sp, #8]
	add	r8, r3, #3120
	add	r9, fp, r9
	add	r10, r10, r8
	add	r8, fp, r8
	ldr	fp, [sp, #8]
	lsl	r9, r9, #1
	lsl	fp, fp, #1
	lsl	r10, r10, #1
	lsl	r8, r8, #1
	add	r9, r9, #100663296
	add	r8, r8, #100663296
	ldr	ip, .L66+20
	ldr	r5, .L66+24
	add	fp, fp, #100663296
	add	r10, r10, #100663296
	strh	r2, [fp]	@ movhi
	strh	r2, [r10]	@ movhi
	strh	r2, [r8]	@ movhi
	strh	r2, [r9]	@ movhi
	ldr	r9, [sp, #28]
	add	ip, lr, ip
	add	r5, lr, r5
	add	ip, ip, r0
	add	r5, r5, r0
	ldr	r8, .L66
	strh	r2, [r9]	@ movhi
	lsl	ip, ip, #1
	lsl	r5, r5, #1
.L23:
	sub	r2, ip, #3360
.L24:
	strh	r8, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, ip
	bne	.L24
	add	ip, r2, #2
	cmp	ip, r5
	bne	.L23
	ldr	r9, [sp, #12]
	add	r2, r3, #4288
	add	ip, r0, #31
	add	r2, r2, #32
	add	r5, r3, #4080
	add	fp, r9, r0
	add	r7, r7, r2
	add	r9, ip, r9
	str	r5, [sp, #28]
	add	r5, r6, r2
	lsl	r5, r5, #1
	lsl	r6, r7, #1
	lsl	r9, r9, #1
	lsl	r7, fp, #1
	add	r7, r7, #100663296
	add	r6, r6, #100663296
	add	r5, r5, #100663296
	add	r9, r9, #100663296
	strh	r8, [r6]	@ movhi
	strh	r8, [r5]	@ movhi
	strh	r8, [r9]	@ movhi
	strh	r8, [r7, #64]	@ movhi
	mov	r7, #3
	add	r10, r3, #3840
	add	r6, ip, r10
	str	r10, [sp, #32]
	add	r10, r3, #4080
	add	r5, ip, r2
	lsl	r6, r6, #1
	add	ip, ip, r10
	add	r6, r6, #100663296
	add	r9, lr, #50331648
	lsl	r5, r5, #1
	lsl	ip, ip, #1
	strh	r8, [r6]	@ movhi
	add	r5, r5, #100663296
	add	ip, ip, #100663296
	add	r6, r9, #1712
	add	r6, r6, r0
	strh	r8, [ip]	@ movhi
	str	r9, [sp, #8]
	strh	r8, [r5]	@ movhi
	ldr	r5, .L66
	lsl	r6, r6, #1
.L26:
	sub	ip, r6, #6720
.L27:
	strh	r5, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r6
	bne	.L27
	subs	r7, r7, #1
	add	r6, ip, #2
	bne	.L26
	add	ip, r3, #6464
	add	ip, ip, #16
	add	r7, ip, r4
	str	ip, [sp, #44]
	ldr	ip, [sp, #8]
	add	r8, ip, #992
	lsl	r7, r7, #1
	add	r8, r8, r0
	ldr	ip, .L66
	add	r7, r7, #100663296
	lsl	r8, r8, #1
.L28:
	mov	r6, r7
	mov	r5, #27
.L29:
	add	r5, r5, #1
	cmp	r5, #30
	strh	ip, [r6]	@ movhi
	add	r6, r6, #480
	bne	.L29
	add	r7, r7, #2
	cmp	r8, r7
	bne	.L28
	add	r8, r3, #5952
	add	r8, r8, #48
	add	r5, r4, r8
	str	r5, [sp, #36]
	ldr	r5, [sp, #4]
	ldr	r6, [sp, #28]
	add	r7, r4, r5
	add	r5, r0, #10
	ldr	r9, [sp, #12]
	lsl	fp, fp, #1
	add	r6, r5, r6
	str	r6, [sp, #28]
	add	r6, fp, #100663296
	ldr	fp, [sp, #36]
	add	r9, r5, r9
	str	r9, [sp, #40]
	lsl	fp, fp, #1
	add	r10, r3, #6208
	str	fp, [sp, #12]
	add	r10, r10, #32
	ldr	fp, [sp, #40]
	add	r4, r4, r10
	lsl	fp, fp, #1
	lsl	r4, r4, #1
	ldr	r9, [sp, #32]
	add	r6, r6, #18
	str	fp, [sp, #32]
	add	r4, r4, #100663296
	ldr	fp, [sp, #28]
	str	r6, [sp, #28]
	ldr	r6, [sp, #12]
	str	r4, [sp, #12]
	ldr	r4, [sp, #32]
	lsl	fp, fp, #1
	str	fp, [sp, #36]
	add	r4, r4, #100663296
	str	r4, [sp, #32]
	ldr	r4, [sp, #36]
	lsl	r7, r7, #1
	add	r7, r7, #100663296
	add	r4, r4, #100663296
	strh	ip, [r7]	@ movhi
	str	r4, [sp, #36]
	ldr	r7, [sp, #24]
	ldr	r4, [sp, #4]
	add	r4, r7, r4
	lsl	r4, r4, #1
	add	r6, r6, #100663296
	add	r4, r4, #100663296
	strh	ip, [r4]	@ movhi
	strh	ip, [r6]	@ movhi
	add	r4, r7, r8
	add	r6, r7, r10
	lsl	r4, r4, #1
	ldr	r7, [sp, #12]
	lsl	r6, r6, #1
	add	r4, r4, #100663296
	add	r6, r6, #100663296
	strh	ip, [r4]	@ movhi
	strh	ip, [r7]	@ movhi
	strh	ip, [r6]	@ movhi
	mov	r6, #3
	ldr	r4, [sp, #28]
	add	r2, r5, r2
	ldr	r7, [sp, #32]
	lsl	fp, r2, #1
	add	r9, r5, r9
	ldr	r2, .L66+28
	strh	ip, [r4]	@ movhi
	lsl	r9, r9, #1
	strh	ip, [r7]	@ movhi
	ldr	r7, [sp, #36]
	add	r2, lr, r2
	add	r9, r9, #100663296
	add	fp, fp, #100663296
	strh	ip, [r9]	@ movhi
	add	r2, r2, r0
	strh	ip, [r7]	@ movhi
	ldr	r4, .L66
	strh	ip, [fp]	@ movhi
	lsl	r2, r2, #1
.L31:
	sub	ip, r2, #6720
.L32:
	strh	r4, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r2
	bne	.L32
	subs	r6, r6, #1
	add	r2, ip, #2
	bne	.L31
	ldr	r2, [sp, #44]
	add	r4, r2, r5
	ldr	r2, [sp, #8]
	add	r6, r2, #980
	lsl	r4, r4, #1
	add	r6, r6, r0
	ldr	r5, .L66
	add	r4, r4, #100663296
	lsl	r6, r6, #1
.L33:
	mov	ip, r4
	mov	r2, #27
.L34:
	add	r2, r2, #1
	cmp	r2, #30
	strh	r5, [ip]	@ movhi
	add	ip, ip, #480
	bne	.L34
	add	r4, r4, #2
	cmp	r6, r4
	bne	.L33
	ldr	r4, [sp, #16]
	ldr	ip, [sp, #4]
	ldr	fp, [sp, #20]
	add	r6, r4, ip
	add	r7, r4, r8
	add	r9, r4, r10
	lsl	r6, r6, #1
	add	r4, fp, r10
	lsl	r4, r4, #1
	add	r6, r6, #100663296
	ldr	r2, .L66+32
	add	ip, fp, ip
	add	r8, fp, r8
	strh	r5, [r6]	@ movhi
	add	r10, r4, #100663296
	lsl	ip, ip, #1
	lsl	r7, r7, #1
	lsl	r8, r8, #1
	lsl	r9, r9, #1
	add	r6, r0, r3
	ldr	r4, .L66+36
	add	r7, r7, #100663296
	lsl	r6, r6, #1
	add	r2, lr, r2
	add	ip, ip, #100663296
	add	r8, r8, #100663296
	add	r9, r9, #100663296
	strh	r5, [ip]	@ movhi
	add	r2, r2, r0
	strh	r5, [r7]	@ movhi
	add	r4, r6, r4
	strh	r5, [r8]	@ movhi
	ldr	r6, .L66+40
	strh	r5, [r9]	@ movhi
	strh	r5, [r10]	@ movhi
	lsl	r7, r2, #1
.L36:
	mov	r2, r4
	add	ip, r4, #5248
	add	ip, ip, #32
.L37:
	strh	r6, [r2]	@ movhi
	add	r2, r2, #480
	cmp	ip, r2
	bne	.L37
	add	r4, r4, #2
	cmp	r7, r4
	bne	.L36
	ldr	r4, .L66+44
	add	ip, r3, #8640
	add	r2, r0, #1
	add	r4, lr, r4
	add	r2, r2, ip
	add	r4, r4, r0
	lsl	r2, r2, #1
	ldr	r5, .L66+40
	lsl	r4, r4, #1
	add	r2, r2, #100663296
.L39:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L39
	ldr	r4, .L66+48
	add	r2, r0, #2
	add	r4, lr, r4
	add	r2, r2, ip
	add	r4, r4, r0
	lsl	r2, r2, #1
	ldr	r5, .L66+40
	lsl	r4, r4, #1
	add	r2, r2, #100663296
.L40:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L40
	add	r3, r3, #8832
	ldr	r4, [sp, #8]
	add	r2, r3, #48
	add	r4, r4, #4800
	add	r2, r2, r0
	add	r4, r4, r0
	lsl	r2, r2, #1
	ldr	r5, .L66+40
	lsl	r4, r4, #1
	add	r2, r2, #100663296
.L41:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L41
	ldr	r4, .L66+52
	add	r2, r0, #39
	add	r4, lr, r4
	add	r2, r2, ip
	add	r4, r4, r0
	lsl	r2, r2, #1
	ldr	r5, .L66+40
	lsl	r4, r4, #1
	add	r2, r2, #100663296
.L42:
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L42
	ldr	r4, .L66+56
	add	r2, r0, #40
	add	r4, lr, r4
	add	r2, r2, ip
	lsl	r2, r2, #1
	add	ip, r4, r0
	ldr	r4, .L66+40
	lsl	ip, ip, #1
	add	r2, r2, #100663296
.L43:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	ip, r2
	bne	.L43
	ldr	r2, .L66+60
	add	r3, r0, r3
	lsl	r3, r3, #1
	add	r2, lr, r2
	add	r3, r3, #100663296
	add	r2, r2, r0
	ldr	ip, .L66+40
	add	r3, r3, #178
	lsl	r2, r2, #1
.L44:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L44
	ldr	ip, .L66+64
	add	lr, ip, #192
	mov	r5, lr
	ldr	r4, .L66+68
.L45:
	ldr	r2, [lr, #4]!
	ldr	r3, [ip, #4]!
	add	r2, r1, r2
	rsb	r2, r2, r2, lsl #4
	add	r3, r0, r3
	add	r3, r3, r2, lsl #4
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	cmp	r5, ip
	strh	r4, [r3]	@ movhi
	bne	.L45
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	10674
	.word	50335279
	.word	8526
	.word	14076
	.word	50331917
	.word	50330466
	.word	50330472
	.word	50333335
	.word	50334567
	.word	100680102
	.word	26591
	.word	50336929
	.word	50336930
	.word	50336967
	.word	50336968
	.word	50336489
	.word	.LANCHOR0-4
	.word	20216
	.size	drawCharacterAt, .-drawCharacterAt
	.align	2
	.global	updateCharacter
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCharacter, %function
updateCharacter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r0
	ldr	r3, .L82
	smull	r0, r1, r2, r3
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L82+4
	sub	r1, r1, r2, asr #31
	ldr	r3, [r5, #384]
	add	r1, r1, r1, lsl #1
	ldr	r6, .L82+8
	sub	r1, r2, r1, lsl #1
	cmp	r3, #1
	str	r1, [r6]
	beq	.L78
	ldr	r4, .L82+12
	ldr	lr, .L82+16
	ldr	r7, .L82+20
.L70:
	mov	r3, r4
	add	ip, r4, #23040
.L75:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L75
	add	r4, r4, #2
	cmp	r4, r7
	bne	.L70
	rsb	r1, r1, #45
	mov	r0, #100
	bl	drawCharacterAt
	ldr	r3, [r6]
	cmp	r3, #5
	moveq	r3, #1
	streq	r3, [r5, #384]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	ldr	r4, .L82+24
	ldr	lr, .L82+16
	ldr	r7, .L82+28
.L69:
	mov	r3, r4
	add	ip, r4, #23040
.L71:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	ip, r3
	bne	.L71
	add	r4, r4, #2
	cmp	r4, r7
	bne	.L69
	add	r1, r1, #40
	mov	r0, #100
	bl	drawCharacterAt
	ldr	r3, [r6]
	cmp	r3, #5
	moveq	r3, #0
	streq	r3, [r5, #384]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	715827883
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	100685576
	.word	32272
	.word	100685662
	.word	100682216
	.word	100682302
	.size	updateCharacter, .-updateCharacter
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #100663296
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r1, .L105
	ldr	r0, .L105+4
	strh	r1, [r2]	@ movhi
	ldr	r2, .L105+8
	sub	sp, sp, #12
.L85:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L85
	ldr	r1, .L105+12
	ldr	r2, .L105+16
.L86:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L86
	ldr	r2, .L105+20
	ldr	r0, .L105+4
	add	r3, r2, #2
	add	r1, r3, #208
.L87:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r1, r2
	bne	.L87
	add	r3, r3, #540
	ldr	r2, .L105+24
	ldr	r1, .L105+12
	add	r3, r3, #2
.L88:
	strh	r1, [r2, #2]!	@ movhi
	cmp	r3, r2
	bne	.L88
	mov	r9, #0
	ldr	r5, .L105+28
	ldr	r6, .L105+32
	ldr	r4, .L105+36
	ldr	r8, .L105+4
	ldr	r7, .L105+8
.L94:
	smull	r2, r3, r9, r4
	asr	r1, r9, #31
	rsb	r3, r1, r3, asr #5
	rsb	r2, r3, r3, lsl #5
	add	r3, r3, r2, lsl #2
	cmp	r9, r3, lsl #2
	beq	.L103
.L89:
	mov	r0, r9
	mov	lr, pc
	bx	r5
	tst	r9, #7
	beq	.L104
.L92:
	ldr	r2, .L105+40
	add	r9, r9, #1
.L93:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L93
	b	.L94
.L103:
	mov	r3, #100663296
.L90:
	strh	r8, [r3], #2	@ movhi
	cmp	r3, r7
	bne	.L90
	ldr	r1, .L105+12
	ldr	r2, .L105+16
.L91:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L91
	b	.L89
.L104:
	asr	r0, r9, #3
	mov	lr, pc
	bx	r6
	b	.L92
.L106:
	.align	2
.L105:
	.word	1027
	.word	32272
	.word	100713696
	.word	16912
	.word	100740096
	.word	bg-2
	.word	bg+208
	.word	updateBG
	.word	updateCharacter
	.word	274877907
	.word	30000
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	lsl	r1, r1, #1
	add	r1, r1, #100663296
	strh	r2, [r1]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L112
	sub	sp, sp, #8
.L109:
	ldr	r3, [sp, #4]
	subs	r2, r2, #1
	add	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L109
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L113:
	.align	2
.L112:
	.word	30000
	.size	delay, .-delay
	.global	up
	.global	characterposition
	.comm	bg,544,4
	.global	cy
	.global	cx
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cx, %object
	.size	cx, 192
cx:
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	9
	.word	10
	.word	11
	.word	12
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	17
	.word	18
	.word	19
	.word	19
	.word	19
	.word	19
	.word	19
	.word	38
	.word	37
	.word	36
	.word	35
	.word	34
	.word	33
	.word	32
	.word	32
	.word	31
	.word	30
	.word	29
	.word	29
	.word	28
	.word	27
	.word	26
	.word	25
	.word	24
	.word	24
	.word	23
	.word	22
	.word	22
	.word	22
	.word	22
	.word	22
	.type	cy, %object
	.size	cy, 192
cy:
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	38
	.word	39
	.word	39
	.word	39
	.word	39
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	40
	.word	41
	.word	41
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.type	up, %object
	.size	up, 4
up:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	characterposition, %object
	.size	characterposition, 4
characterposition:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
