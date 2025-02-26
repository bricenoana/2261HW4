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
	.global	drawStartScreen
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStartScreen, %function
drawStartScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	StartScreenBitmap
	.word	drawFullscreenImage4
	.size	drawStartScreen, .-drawStartScreen
	.align	2
	.global	drawPauseScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPauseScreen, %function
drawPauseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawPauseScreen, .-drawPauseScreen
	.align	2
	.global	drawWinScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWinScreen, %function
drawWinScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawWinScreen, .-drawWinScreen
	.align	2
	.global	drawLoseScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLoseScreen, %function
drawLoseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawLoseScreen, .-drawLoseScreen
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
	@ link register save eliminated.
	bx	lr
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawGame, .-drawGame
	.comm	state,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
