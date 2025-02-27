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
	ldr	r3, .L9
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L1
	ldr	r3, .L9+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L8
.L1:
	pop	{r4, lr}
	bx	lr
.L8:
	ldr	r3, .L9+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L9+16
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r4, .L22
	ldr	r3, .L22+4
	ldrh	r2, [r4, #48]
	ldr	r8, .L22+8
	sub	sp, sp, #44
	strh	r2, [r8]	@ movhi
	ldm	r3, {r0, r1, r2}
	add	ip, r3, #12
	add	lr, sp, #4
	mov	fp, r4
	ldrh	r4, [r4, #48]
	stm	lr, {r0, r1, r2}
	ldm	ip, {r0, r1, r2}
	add	r3, r3, #24
	add	ip, sp, #16
	stm	ip, {r0, r1, r2}
	ldm	r3, {r0, r1, r2}
	add	r3, sp, #40
	ldr	r7, .L22+12
	stmdb	r3, {r0, r1, r2}
	strh	r4, [r7]	@ movhi
	ldr	r10, .L22+16
	ldr	r9, .L22+20
	ldr	r4, .L22+24
.L16:
	add	r3, sp, #40
	add	r6, r3, r5, lsl #2
	ldr	r3, [r6, #-12]
	add	r3, r3, r3, lsr #31
	mov	r2, #83886080
	ldr	r1, [r6, #-36]
	asr	r3, r3, #1
	mov	r0, #3
	mov	lr, pc
	bx	r10
	ldr	r0, [r6, #-24]
	mov	lr, pc
	bx	r9
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+32
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [sp]
	ldr	r3, [sp]
	cmp	r3, r4
	bgt	.L12
.L13:
	ldr	r3, [sp]
	add	r3, r3, #1
	str	r3, [sp]
	ldr	r3, [sp]
	cmp	r3, r4
	ble	.L13
.L12:
	ldrh	r2, [r7]
	strh	r2, [r8]	@ movhi
	ldrh	r3, [fp, #48]
	tst	r2, #8
	strh	r3, [r7]	@ movhi
	beq	.L14
	tst	r3, #8
	beq	.L15
.L14:
	ldr	r2, .L22+36
	add	r5, r5, #1
	umull	r3, r2, r5, r2
	bic	r3, r2, #1
	add	r3, r3, r2, lsr #1
	sub	r5, r5, r3
	b	.L16
.L15:
	ldr	r3, .L22+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L22+44
	strb	r2, [r3]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	67109120
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	DMANow
	.word	drawFullscreenImage4
	.word	29999
	.word	waitForVBlank
	.word	flipPage
	.word	-1431655765
	.word	initGame
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
	mov	r1, #67108864
	mov	ip, #83886080
	mov	r2, #0
	ldr	r0, .L26
	push	{r4, lr}
	ldr	r3, .L26+4
	strh	r0, [r1]	@ movhi
	ldr	lr, .L26+8
	ldrh	r0, [r3, #48]
	ldr	r1, .L26+12
	ldr	r3, .L26+16
	strh	lr, [ip, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r0, [r1]	@ movhi
	bl	goToStartState
	ldr	r3, .L26+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	1044
	.word	67109120
	.word	31775
	.word	buttons
	.word	oldButtons
	.word	initSound
	.size	initialize, .-initialize
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
	push	{r4, lr}
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L30+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	initGame
	.word	state
	.size	goToGameState, .-goToGameState
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC5:
	.ascii	"got too stressed?\000"
	.align	2
.LC6:
	.ascii	"you're paused now!\000"
	.text
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #0
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+4
	mov	r3, #1
	mov	r1, #8
	mov	r0, #136
	ldr	r2, .L45+8
	mov	lr, pc
	bx	r4
	ldr	r7, .L45+12
	mov	r3, #1
	mov	r1, #18
	mov	r0, #130
	ldr	r2, .L45+16
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r7
	ldr	r3, .L45+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+24
	ldr	r6, .L45+28
	ldr	r5, .L45+32
	b	.L36
.L35:
	mov	lr, pc
	bx	r7
.L36:
	ldrh	r2, [r4]
	strh	r2, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	tst	r2, #8
	strh	r3, [r4]	@ movhi
	beq	.L33
	tst	r3, #8
	beq	.L44
.L33:
	tst	r2, #4
	beq	.L35
	tst	r3, #4
	bne	.L35
	mov	r2, #3
	ldr	r3, .L45+36
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L44:
	mov	r2, #1
	ldr	r3, .L45+36
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	fillScreen4
	.word	drawString4
	.word	.LC5
	.word	waitForVBlank
	.word	.LC6
	.word	flipPage
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	state
	.size	goToPauseState, .-goToPauseState
	.align	2
	.global	updateGameLoop
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGameLoop, %function
updateGameLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L54+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L48:
	ldr	r3, .L54+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	pop	{r4, lr}
	b	goToPauseState
.L55:
	.align	2
.L54:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	flipPage
	.size	updateGameLoop, .-updateGameLoop
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
	mov	r2, #4
	ldr	r3, .L57
	strb	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	state
	.size	goToWinState, .-goToWinState
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"The Hunter caught you!\000"
	.align	2
.LC8:
	.ascii	"Press START to try again.\000"
	.text
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
	push	{r4, lr}
	mov	r0, #27
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+4
	mov	r3, #1
	mov	r1, #38
	mov	r0, #50
	ldr	r2, .L66+8
	mov	lr, pc
	bx	r4
	mov	r1, #58
	ldr	r2, .L66+12
	mov	r0, #45
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+20
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L66+24
	ldrh	r1, [r3]
	ldr	r3, .L66+28
	tst	r1, #8
	strb	r2, [r3]
	beq	.L59
	ldr	r3, .L66+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L59:
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToStartState
.L67:
	.align	2
.L66:
	.word	fillScreen4
	.word	drawString4
	.word	.LC7
	.word	.LC8
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	state
	.word	buttons
	.size	goToLoseState, .-goToLoseState
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"High Score: %d\000"
	.align	2
.LC10:
	.ascii	"Scoreboard\000"
	.align	2
.LC11:
	.ascii	"Press START to resume\000"
	.text
	.align	2
	.global	goToScoreboardState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToScoreboardState, %function
goToScoreboardState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #0
	sub	sp, sp, #36
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	ldr	r1, .L76+8
	ldr	r2, [r3]
	mov	r0, sp
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	mov	r1, #20
	ldr	r4, .L76+16
	mov	r0, r1
	mov	r3, #1
	ldr	r2, .L76+20
	mov	lr, pc
	bx	r4
	mov	r2, sp
	mov	r3, #1
	mov	r1, #40
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldr	r7, .L76+24
	mov	r3, #1
	mov	r1, #60
	mov	r0, #20
	ldr	r2, .L76+28
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r7
	ldr	r3, .L76+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L76+36
	ldr	r6, .L76+40
	ldr	r5, .L76+44
	b	.L70
.L69:
	mov	lr, pc
	bx	r7
.L70:
	ldrh	r2, [r4]
	strh	r2, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	tst	r2, #8
	strh	r3, [r4]	@ movhi
	beq	.L69
	tst	r3, #8
	bne	.L69
	mov	r2, #1
	ldr	r3, .L76+48
	strb	r2, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	fillScreen4
	.word	highScore
	.word	.LC9
	.word	sprintf
	.word	drawString4
	.word	.LC10
	.word	waitForVBlank
	.word	.LC11
	.word	flipPage
	.word	buttons
	.word	oldButtons
	.word	67109120
	.word	state
	.size	goToScoreboardState, .-goToScoreboardState
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
	ldr	r6, .L90
	ldr	r7, .L90+4
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L90+12
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	ldr	fp, .L90+16
	ldr	r10, .L90+20
	ldr	r9, .L90+24
	ldr	r8, .L90+28
	ldr	r4, .L90+32
.L81:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L81
.L83:
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L81
	.word	.L82
.L82:
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	b	.L81
.L84:
	mov	lr, pc
	bx	r8
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	b	.L81
.L85:
	mov	lr, pc
	bx	r9
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	b	.L81
.L86:
	mov	lr, pc
	bx	r10
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	b	.L81
.L87:
	mov	lr, pc
	bx	fp
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
	b	.L81
.L91:
	.align	2
.L90:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	updateGameLoop
	.word	goToPauseState
	.word	goToScoreboardState
	.word	67109120
	.word	goToLoseState
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,1,1
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC3:
	.word	start1Pal
	.word	start2Pal
	.word	start3Pal
.LC4:
	.word	start1Bitmap
	.word	start2Bitmap
	.word	start3Bitmap
.LC2:
	.word	512
	.word	512
	.word	512
	.ident	"GCC: (devkitARM release 53) 9.1.0"
