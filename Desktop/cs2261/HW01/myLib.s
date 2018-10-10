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
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r2, .L9+4
	ldr	r1, [r3]
	sub	r3, r1, #2
	add	r2, r1, r2
.L6:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L6
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	76798
	.size	fillScreen, .-fillScreen
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
.L12:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L12
	mov	r2, #67108864
.L13:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L13
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
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
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L17
.L19:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L19
.L17:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	drawPineapple
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPineapple, %function
drawPineapple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L106
	ldr	ip, [r3]
	rsb	r0, r0, r0, lsl #4
	push	{r4, r5, r6, r7, r8, lr}
	add	lr, ip, #43520
	add	r1, r1, r0, lsl #4
	add	lr, lr, #158
	sub	r0, r1, #-2147483647
	add	lr, lr, r1, lsl #1
	mvn	r1, #58624
	add	r0, ip, r0, lsl #1
.L23:
	mov	r3, r0
	add	r2, r0, #122
.L24:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L24
	add	r0, r0, #480
	cmp	r0, lr
	bne	.L23
	mvn	r1, #58624
	add	r0, ip, #28928
	add	r4, ip, #62976
	add	lr, r0, #30
	add	r4, r4, #62
.L25:
	mov	r3, lr
	add	r2, lr, #162
.L26:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L26
	add	lr, lr, #480
	cmp	r4, lr
	bne	.L25
	mvn	r1, #58624
	add	r5, ip, #24064
	add	r2, ip, #29184
	add	r3, r5, #116
	add	r2, r2, #254
.L28:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #476
	add	r3, r3, #2
	cmp	r2, r3
	bne	.L28
	mvn	r2, #58624
	add	lr, ip, #28416
	add	r6, ip, #23552
	add	r4, lr, #66
	add	r6, r6, #150
.L29:
	mov	r3, r4
	add	r1, r4, #4800
.L30:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L30
	sub	r4, r4, #476
	sub	r4, r4, #2
	cmp	r6, r4
	bne	.L29
	mvn	r1, #58624
	add	r2, ip, #29440
	add	r2, r2, #162
	add	r3, r5, #236
.L32:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	bne	.L32
	mvn	r2, #58624
	add	r4, ip, #23808
	add	lr, lr, #222
	add	r4, r4, #10
.L33:
	mov	r3, lr
	add	r1, lr, #4800
.L34:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L34
	sub	lr, lr, #480
	sub	lr, lr, #2
	cmp	r4, lr
	bne	.L33
	mvn	r1, #58624
	ldr	r2, .L106+4
	add	r3, ip, #62720
	add	r2, ip, r2
.L36:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #476
	add	r3, r3, #2
	cmp	r2, r3
	bne	.L36
	mvn	r2, #58624
	add	lr, ip, #62208
	add	r4, ip, #57344
	add	lr, lr, #14
	add	r4, r4, #98
.L37:
	mov	r3, lr
	add	r1, lr, #4800
.L38:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L38
	sub	lr, lr, #476
	sub	lr, lr, #2
	cmp	r4, lr
	bne	.L37
	mvn	r1, #58624
	ldr	r2, .L106+8
	add	r3, ip, #62464
	add	r2, ip, r2
	add	r3, r3, #96
.L40:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	bne	.L40
	mvn	r2, #58624
	add	lr, ip, #61952
	add	r4, ip, #57088
	add	lr, lr, #146
	add	r4, r4, #190
.L43:
	mov	r3, lr
	add	r1, lr, #4800
.L42:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L42
	sub	lr, lr, #480
	sub	lr, lr, #2
	cmp	r4, lr
	bne	.L43
	mov	r2, #4800
	add	lr, ip, #18688
	add	r4, lr, #210
	add	r6, r5, #114
.L44:
	mov	r3, r4
	add	r1, r4, #122
.L45:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r1, r3
	bne	.L45
	add	r4, r4, #480
	cmp	r6, r4
	bne	.L44
	mov	r1, #4800
	add	r3, lr, #192
	add	r2, r5, #118
.L47:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	bne	.L47
	mov	r4, #4800
	add	r1, ip, #18432
	add	r7, ip, #13760
	add	r6, r1, #110
	add	r7, r7, #2
.L48:
	mov	r3, r6
	add	r2, r6, #5248
	add	r2, r2, #32
.L49:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L49
	sub	r6, r6, #476
	sub	r6, r6, #2
	cmp	r7, r6
	bne	.L48
	mov	r2, #4800
	add	r4, ip, #18944
	add	r5, r5, #234
	add	r3, r4, #96
.L51:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #476
	add	r3, r3, #2
	cmp	r5, r3
	bne	.L51
	mov	r5, #4800
	add	r6, ip, #18176
	add	r7, ip, #13568
	add	r6, r6, #242
	add	r7, r7, #30
.L54:
	mov	r3, r6
	add	r2, r6, #5248
	add	r2, r2, #32
.L53:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L53
	sub	r6, r6, #480
	sub	r6, r6, #2
	cmp	r7, r6
	bne	.L54
	mov	r5, #4800
	add	r7, ip, #14080
	add	r7, r7, #40
	add	r6, lr, #212
.L55:
	mov	r3, r6
	add	r2, r6, #5248
	add	r2, r2, #32
.L56:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L56
	sub	r6, r6, #476
	sub	r6, r6, #2
	cmp	r7, r6
	bne	.L55
	mov	r5, #4800
	add	r7, ip, #13632
	add	r8, r7, #6
	add	r6, r1, #26
.L59:
	mov	r3, r6
	add	r2, r6, #5248
	add	r2, r2, #32
.L58:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L58
	sub	r6, r6, #480
	sub	r6, r6, #2
	cmp	r8, r6
	bne	.L59
	mov	r5, #4800
	add	r6, ip, #14144
	add	lr, lr, #252
	add	r8, r6, #16
.L60:
	mov	r3, lr
	add	r2, lr, #5248
	add	r2, r2, #32
.L61:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L61
	sub	lr, lr, #476
	sub	lr, lr, #2
	cmp	r8, lr
	bne	.L60
	mov	lr, #4800
	add	r7, r7, #46
	add	r5, r1, #66
.L64:
	mov	r3, r5
	add	r2, r5, #5248
	add	r2, r2, #32
.L63:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L63
	sub	r5, r5, #480
	sub	r5, r5, #2
	cmp	r7, r5
	bne	.L64
	mov	lr, #4800
	add	r4, r4, #36
	add	r6, r6, #56
.L65:
	mov	r3, r4
	add	r2, r4, #5248
	add	r2, r2, #32
.L66:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L66
	sub	r4, r4, #476
	sub	r4, r4, #2
	cmp	r6, r4
	bne	.L65
	mov	lr, #4800
	add	r4, ip, #13696
	add	r1, r1, #106
	add	r4, r4, #22
.L69:
	mov	r3, r1
	add	r2, r1, #5248
	add	r2, r2, #32
.L68:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L68
	sub	r1, r1, #480
	sub	r1, r1, #2
	cmp	r4, r1
	bne	.L69
	mvn	r1, #32768
	add	r2, ip, #30976
	add	r0, r0, #160
	add	r2, r2, #32
.L70:
	mov	r3, r0
	add	lr, r0, #8
.L71:
	strh	r1, [r3, #2]!	@ movhi
	cmp	lr, r3
	bne	.L71
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L70
	mvn	r2, #32768
	add	r3, ip, #32768
	add	ip, ip, #38656
	add	r3, r3, #164
	add	ip, ip, #36
.L73:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	ip, r3
	bne	.L73
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	.LANCHOR0
	.word	67978
	.word	67862
	.size	drawPineapple, .-drawPineapple
	.align	2
	.global	drawCherries
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCherries, %function
drawCherries:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L134
	push	{r4, r5, lr}
	ldr	ip, [r3]
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	sub	r3, r1, #-2147483647
	add	r2, ip, #120
	ldr	r0, .L134+4
	add	r3, ip, r3, lsl #1
	add	r2, r2, r1, lsl #1
.L109:
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L109
	add	r3, ip, #24064
	add	r3, r3, #176
	mov	r2, r3
	add	r1, ip, #38912
	ldr	r0, .L134+4
	add	r1, r1, #146
.L110:
	strh	r0, [r2]	@ movhi
	add	r2, r2, #476
	add	r2, r2, #2
	cmp	r2, r1
	bne	.L110
	add	r2, ip, #39168
	ldr	r1, .L134+4
	add	r2, r2, #14
.L111:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	cmp	r3, r2
	bne	.L111
	mov	r1, #31
	add	r0, ip, #38400
	add	lr, ip, #48384
	add	r0, r0, #158
	add	lr, lr, #254
.L114:
	mov	r3, r0
	add	r2, r0, #42
.L113:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L113
	add	r0, r0, #480
	cmp	r0, lr
	bne	.L114
	mvn	r2, #32768
	add	r4, ip, #39424
	add	lr, ip, #41216
	add	r1, r4, #124
	add	lr, lr, #252
.L115:
	mov	r3, r1
	add	r0, r1, #8
.L116:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r3, r0
	bne	.L116
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L115
	add	r5, ip, #40960
	add	r3, r5, #992
	add	r0, r5, #1472
	add	r1, r5, #1952
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	add	r3, r5, #2432
	strh	r2, [r1, #2]	@ movhi
	add	r0, r5, #2912
	add	r1, r5, #3392
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	mov	r1, #31
	add	r3, r5, #3872
	add	r0, ip, #38656
	add	lr, ip, #48640
	strh	r2, [r3, #2]	@ movhi
	add	r0, r0, #22
	add	lr, lr, #118
.L118:
	mov	r3, r0
	add	r2, r0, #42
.L119:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L119
	add	r0, r0, #480
	cmp	r0, lr
	bne	.L118
	mvn	r2, #32768
	add	ip, ip, #41472
	add	ip, ip, #116
	add	r1, r4, #244
.L120:
	mov	r3, r1
	add	r0, r1, #8
.L121:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r3, r0
	bne	.L121
	add	r1, r1, #480
	cmp	ip, r1
	bne	.L120
	add	r1, r5, #1104
	add	r3, r5, #1584
	strh	r2, [r1, #10]	@ movhi
	add	ip, r5, #2064
	strh	r2, [r3, #10]	@ movhi
	add	r0, r5, #2544
	add	r1, r5, #3024
	add	r3, r5, #3504
	add	r5, r5, #3984
	strh	r2, [ip, #10]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L135:
	.align	2
.L134:
	.word	.LANCHOR0
	.word	6348
	.size	drawCherries, .-drawCherries
	.align	2
	.global	drawOrange
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOrange, %function
drawOrange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L148
	str	lr, [sp, #-4]!
	ldr	lr, [r3]
	rsb	r0, r0, r0, lsl #4
	add	ip, lr, #29184
	add	r1, r1, r0, lsl #4
	add	ip, ip, #94
	sub	r0, r1, #-2147483647
	add	ip, ip, r1, lsl #1
	mvn	r1, #60928
	add	r0, lr, r0, lsl #1
.L137:
	mov	r3, r0
	add	r2, r0, #122
.L138:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L138
	add	r0, r0, #480
	cmp	r0, ip
	bne	.L137
	mvn	r1, #32768
	add	r2, lr, #28928
	add	ip, lr, #30976
	add	r2, r2, #150
	add	ip, ip, #22
.L139:
	mov	r3, r2
	add	r0, r2, #8
.L140:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r0, r3
	bne	.L140
	add	r2, r2, #480
	cmp	r2, ip
	bne	.L139
	mvn	r2, #32768
	add	r3, lr, #33792
	add	lr, lr, #39424
	add	r3, r3, #92
	add	lr, lr, #220
.L142:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L142
	ldr	lr, [sp], #4
	bx	lr
.L149:
	.align	2
.L148:
	.word	.LANCHOR0
	.size	drawOrange, .-drawOrange
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
