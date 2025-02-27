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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #12
	mov	r1, #120
	mov	r2, #16
	mov	ip, #0
	ldr	r3, .L3
	str	r0, [r3]
	str	r0, [r3, #8]
	str	ip, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initHunter
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHunter, %function
initHunter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #150
	mov	r0, #130
	mov	r1, #0
	push	{r4, lr}
	mov	lr, #16
	ldr	ip, .L7
	ldr	r4, .L7+4
	str	r2, [ip]
	str	r2, [ip, #8]
	str	r1, [ip, #24]
	str	r0, [ip, #4]
	str	r0, [ip, #12]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L7+8
	str	lr, [ip, #20]
	str	lr, [ip, #16]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	hunter
	.word	DMANow
	.word	ghostHunterPal
	.size	initHunter, .-initHunter
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L23+4
	ldrh	r3, [r3]
	ldm	r5, {r0, r1}
	tst	r3, #32
	str	r0, [r5, #8]
	subeq	r0, r0, #2
	streq	r0, [r5]
	tst	r3, #16
	addeq	r0, r0, #2
	streq	r0, [r5]
	tst	r3, #64
	str	r1, [r5, #12]
	subeq	r1, r1, #2
	streq	r1, [r5, #4]
	tst	r3, #128
	addeq	r1, r1, #2
	streq	r1, [r5, #4]
	cmp	r0, #0
	movlt	r3, #0
	movlt	r0, r3
	ldr	r2, [r5, #20]
	strlt	r3, [r5]
	rsb	r3, r2, #240
	cmp	r3, r0
	movlt	r0, r3
	strlt	r3, [r5]
	cmp	r1, #0
	movlt	r3, #0
	movlt	r1, r3
	strlt	r3, [r5, #4]
	ldr	r3, [r5, #24]
	rsb	ip, r3, #160
	cmp	ip, r1
	movlt	r1, ip
	ldr	r4, .L23+8
	strlt	ip, [r5, #4]
	ldr	r6, .L23+12
	sub	sp, sp, #20
	add	r7, r4, #80
.L20:
	add	r8, r4, #8
	ldm	r8, {r8, r9}
	ldm	r4, {ip, lr}
	str	r9, [sp, #12]
	stm	sp, {ip, lr}
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #16
	bne	.L22
	cmp	r7, r4
	beq	.L9
	add	r2, r5, #20
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L20
.L22:
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	stm	r5, {r2, r3}
.L9:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	buttons
	.word	player
	.word	.LANCHOR0
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateHunter
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHunter, %function
updateHunter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L45
	ldr	r5, .L45+4
	ldr	r3, [r8]
	ldm	r5, {r9, r10}
	cmp	r3, #0
	movgt	r0, r9
	movgt	r1, r10
	sub	sp, sp, #16
	ble	.L43
.L26:
	ldr	r2, [r8, #4]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L27
.L29:
	.word	.L32
	.word	.L31
	.word	.L30
	.word	.L28
.L28:
	sub	r0, r0, #3
	str	r0, [r5]
.L27:
	ldr	r4, .L45+8
	sub	r3, r3, #1
	str	r3, [r8]
	ldr	r6, .L45+12
	add	r7, r4, #80
.L35:
	ldr	r3, [r4, #12]
	ldmib	r4, {r2, ip}
	str	r3, [sp, #12]
	ldr	r3, [r4]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r4, r4, #16
	bne	.L44
	cmp	r4, r7
	ldm	r5, {r0, r1}
	bne	.L35
.L34:
	cmp	r0, #0
	movlt	r3, #0
	movlt	r0, r3
	strlt	r3, [r5]
	ldr	r3, [r5, #16]
	rsb	r3, r3, #240
	cmp	r3, r0
	strlt	r3, [r5]
	cmp	r1, #0
	movlt	r3, #0
	movlt	r1, r3
	strlt	r3, [r5, #4]
	ldr	r3, [r5, #20]
	rsb	r3, r3, #160
	cmp	r3, r1
	strlt	r3, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L30:
	add	r1, r1, #3
	str	r1, [r5, #4]
	b	.L27
.L31:
	add	r0, r0, #3
	str	r0, [r5]
	b	.L27
.L32:
	sub	r1, r1, #3
	str	r1, [r5, #4]
	b	.L27
.L43:
	ldr	r4, .L45+16
	mov	lr, pc
	bx	r4
	rsbs	r2, r0, #0
	and	r2, r2, #3
	and	r3, r0, #3
	rsbpl	r3, r2, #0
	str	r3, [r8, #4]
	mov	lr, pc
	bx	r4
	ldr	r2, .L45+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #10
	ldm	r5, {r0, r1}
	b	.L26
.L44:
	mov	r3, #0
	mov	r1, r10
	mov	r0, r9
	stm	r5, {r9, r10}
	str	r3, [r8]
	b	.L34
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
	.word	hunter
	.word	.LANCHOR0
	.word	collision
	.word	rand
	.word	-2004318071
	.size	updateHunter, .-updateHunter
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L49
	ldr	ip, .L49+4
	sub	sp, sp, #8
	add	r2, r0, #20
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L49+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	player
	.word	NormalBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawHunter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHunter, %function
drawHunter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L53
	ldr	ip, .L53+4
	sub	sp, sp, #8
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L53+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	hunter
	.word	ghostHunterBitmap
	.word	drawImage4
	.size	drawHunter, .-drawHunter
	.align	2
	.global	drawCross
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCross, %function
drawCross:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #1
	ldr	r4, .L64
	ldr	r6, .L64+4
	sub	sp, sp, #12
	add	r5, r4, #100
.L57:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L63
.L56:
	add	r4, r4, #20
	cmp	r4, r5
	bne	.L57
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L63:
	ldm	r4, {r0, r1}
	mov	r3, #11
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	ldm	r4, {r0, r1}
	mov	r3, #2
	mov	r2, #8
	str	r7, [sp]
	add	r1, r1, #3
	sub	r0, r0, #3
	mov	lr, pc
	bx	r6
	b	.L56
.L65:
	.align	2
.L64:
	.word	crosses
	.word	drawRect4
	.size	drawCross, .-drawCross
	.align	2
	.global	spawnCross
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCross, %function
spawnCross:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L72
	ldr	r8, .L72+4
	ldr	r7, .L72+8
	ldr	fp, .L72+12
	ldr	r10, .L72+16
	sub	sp, sp, #20
.L67:
	mov	lr, pc
	bx	r9
	smull	r2, r3, fp, r0
	asr	r6, r0, #31
	add	r3, r3, r0
	rsb	r6, r6, r3, asr #7
	rsb	r6, r6, r6, lsl #3
	sub	r6, r0, r6, lsl #5
	mov	lr, pc
	bx	r9
	smull	r3, r1, r10, r0
	asr	r5, r0, #31
	rsb	r5, r5, r1, asr #5
	add	r5, r5, r5, lsl #3
	ldr	r4, .L72+20
	sub	r5, r0, r5, lsl #4
.L68:
	mov	r3, #16
	ldmib	r4, {r0, ip, lr}
	ldr	r1, [r4]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	mov	r1, r5
	mov	r0, r6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	add	r4, r4, #16
	bne	.L67
	cmp	r4, r8
	bne	.L68
	mov	r2, #16
	mov	r1, #1
	ldr	r3, .L72+24
	str	r2, [r3, #8]
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r2, [r3, #12]
	str	r1, [r3, #16]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	rand
	.word	.LANCHOR0+80
	.word	collision
	.word	-1840700269
	.word	954437177
	.word	.LANCHOR0
	.word	crosses
	.size	spawnCross, .-spawnCross
	.align	2
	.global	initCross
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCross, %function
initCross:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	ldr	r3, .L75
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #88]
	str	r2, [r3, #92]
	b	spawnCross
.L76:
	.align	2
.L75:
	.word	crosses
	.size	initCross, .-initCross
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #12
	mov	r4, #16
	mov	r2, #120
	mov	r0, #0
	ldr	r3, .L79
	ldr	ip, .L79+4
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r0, [ip]
	str	r4, [r3, #24]
	str	r4, [r3, #20]
	str	r0, [r3, #16]
	bl	initHunter
	ldr	r3, .L79+8
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #48]
	str	r4, [r3, #52]
	str	r4, [r3, #68]
	str	r4, [r3, #72]
	str	r4, [r3, #88]
	str	r4, [r3, #92]
	bl	spawnCross
	ldr	r4, .L79+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	player
	.word	score
	.word	crosses
	.word	DMANow
	.word	NormalPal
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L94
	sub	sp, sp, #16
	bl	updatePlayer
	bl	updateHunter
	ldr	r3, [r5, #16]
	cmp	r3, #0
	ldr	r4, .L94+4
	bne	.L82
	ldr	r6, .L94+8
.L83:
	ldr	r3, .L94+12
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L81
	ldr	r3, .L94+16
	ldr	r2, .L94+20
	ldr	r1, [r3, #8]
	ldr	r2, [r2]
	cmp	r2, r1
	strgt	r2, [r3, #8]
	mov	r0, #6
	ldr	r3, .L94+24
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L94+28
	strb	r2, [r3]
.L81:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	ldr	ip, [r5, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r6, [r5, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldm	r4, {r0, r1}
	ldr	r6, .L94+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L83
	ldr	r2, .L94+20
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	mov	r0, #7
	ldr	r3, .L94+24
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r5, #16]
	bl	spawnCross
	b	.L83
.L95:
	.align	2
.L94:
	.word	crosses
	.word	player
	.word	collision
	.word	hunter
	.word	.LANCHOR1
	.word	score
	.word	playAnalogSound
	.word	state
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBorders
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBorders, %function
drawBorders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #1
	ldr	r4, .L102
	ldr	r6, .L102+4
	sub	sp, sp, #8
	add	r5, r4, #80
.L99:
	ldr	lr, [r4]
	ldr	r2, [r4, #8]
	add	r3, lr, r2
	ldr	ip, [r4, #4]
	cmp	r3, #240
	ldr	r3, [r4, #12]
	add	r8, ip, r3
	rsbgt	r2, lr, #240
	cmp	r8, #160
	rsbgt	r3, ip, #160
	mov	r0, lr
	mov	r1, ip
	str	r7, [sp]
	add	r4, r4, #16
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L99
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.word	drawRect4
	.size	drawBorders, .-drawBorders
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score: %d\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L106
	sub	sp, sp, #16
	mov	r0, #0
	mov	lr, pc
	bx	r3
	bl	drawBorders
	bl	drawPlayer
	bl	drawHunter
	bl	drawCross
	ldr	r3, .L106+4
	mov	r0, sp
	ldr	r2, [r3]
	ldr	r1, .L106+8
	ldr	r3, .L106+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L106+16
	mov	r2, sp
	mov	r3, #1
	mov	r1, #5
	mov	r0, #160
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	fillScreen4
	.word	score
	.word	.LC0
	.word	sprintf
	.word	drawString4
	.size	drawGame, .-drawGame
	.align	2
	.global	showYayAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	showYayAnimation, %function
showYayAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #60
	ldr	fp, .L112
	ldr	r5, .L112+4
	ldr	r10, .L112+8
	ldr	r7, .L112+12
	ldr	r4, .L112+16
	ldr	r9, .L112+20
	ldr	r8, .L112+24
	sub	sp, sp, #28
.L109:
	mov	r0, #0
	mov	lr, pc
	bx	fp
	bl	drawBorders
	str	r10, [sp]
	add	r2, r5, #20
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	str	r9, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	bl	drawCross
	ldr	r3, .L112+28
	mov	r1, r8
	ldr	r2, [r3]
	add	r0, sp, #8
	ldr	r3, .L112+32
	mov	lr, pc
	bx	r3
	mov	r1, #5
	mov	r0, #160
	ldr	ip, .L112+36
	add	r2, sp, #8
	mov	r3, #1
	mov	lr, pc
	bx	ip
	ldr	r3, .L112+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L112+44
	mov	lr, pc
	bx	r3
	subs	r6, r6, #1
	bne	.L109
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	fillScreen4
	.word	player
	.word	YayBitmap
	.word	drawImage4
	.word	hunter
	.word	ghostHunterBitmap
	.word	.LC0
	.word	score
	.word	sprintf
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.size	showYayAnimation, .-showYayAnimation
	.global	walls
	.global	highScore
	.comm	score,4,4
	.comm	crosses,100,4
	.comm	cross,20,4
	.comm	hunter,32,4
	.comm	player,32,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	walls, %object
	.size	walls, 80
walls:
	.word	42
	.word	94
	.word	21
	.word	66
	.word	172
	.word	95
	.word	21
	.word	67
	.word	155
	.word	32
	.word	85
	.word	20
	.word	41
	.word	31
	.word	74
	.word	20
	.word	96
	.word	0
	.word	19
	.word	31
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	steps.5048, %object
	.size	steps.5048, 4
steps.5048:
	.space	4
	.type	direction.5049, %object
	.size	direction.5049, 4
direction.5049:
	.space	4
	.type	highScore, %object
	.size	highScore, 4
highScore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
