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
	.global	start
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L1
	ldr	r3, .L8+8
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L8+12
	strbeq	r2, [r3]
.L1:
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	start, .-start
	.align	2
	.global	goToStartState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartState, %function
goToStartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L12
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L12+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L12+24
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	StartScreenPal
	.word	DMANow
	.word	StartScreenBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStartState, .-goToStartState
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
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L15
	ldr	r3, .L15+4
	strh	r0, [r1]	@ movhi
	ldr	r1, .L15+8
	ldrh	r0, [r3, #48]
	ldr	r3, .L15+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStartState
.L16:
	.align	2
.L15:
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
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
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L25
	push	{r7, lr}
	ldr	r3, .L25+4
	strh	r0, [r1]	@ movhi
	ldr	r4, .L25+8
	mov	r8, r3
	ldr	r7, .L25+12
	ldrh	r3, [r3, #48]
	ldr	r5, .L25+16
	ldr	r6, .L25+20
	strh	r3, [r4]	@ movhi
	strh	r2, [r7]	@ movhi
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	ldrb	r1, [r5]	@ zero_extendqisi2
	b	.L18
.L24:
	cmp	r2, #3
	bhi	.L20
.L18:
	sub	r2, r1, #1
	and	r2, r2, #255
.L20:
	strh	r3, [r7]	@ movhi
	ldrh	r3, [r8, #48]
	cmp	r1, #0
	strh	r3, [r4]	@ movhi
	bne	.L24
	mov	lr, pc
	bx	r6
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldrh	r3, [r4]
	b	.L18
.L26:
	.align	2
.L25:
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	state
	.word	goToStartState
	.size	main, .-main
	.text
	.align	2
	.global	goToGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameState, %function
goToGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L28
	strb	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	state
	.size	goToGameState, .-goToGameState
	.align	2
	.global	goToPauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPauseState, %function
goToPauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L31
	strb	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	state
	.size	goToPauseState, .-goToPauseState
	.align	2
	.global	goToWinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWinState, %function
goToWinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L34
	strb	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.size	goToWinState, .-goToWinState
	.align	2
	.global	goToLoseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseState, %function
goToLoseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L37
	strb	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	state
	.size	goToLoseState, .-goToLoseState
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
