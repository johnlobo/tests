;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _interruptHandler
	.globl _cpct_akp_SFXPlay
	.globl _cpct_akp_SFXInit
	.globl _cpct_akp_stop
	.globl _cpct_akp_musicPlay
	.globl _cpct_akp_musicInit
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM1
	.globl _cpct_setDrawCharM1
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _n_interrupt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_n_interrupt::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:26: void interruptHandler(){
;	---------------------------------
; Function interruptHandler
; ---------------------------------
_interruptHandler::
;src/main.c:27: if (++n_interrupt == 6){
	ld	iy, #_n_interrupt
	inc	0 (iy)
	jr	NZ,00109$
	inc	1 (iy)
	jr	NZ,00109$
	inc	2 (iy)
	jr	NZ,00109$
	inc	3 (iy)
00109$:
	ld	a, 0 (iy)
	sub	a, #0x06
	or	a, 1 (iy)
	or	a, 2 (iy)
	or	a, 3 (iy)
	ret	NZ
;src/main.c:28: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:29: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:30: n_interrupt = 0;
	xor	a, a
	ld	iy, #_n_interrupt
	ld	0 (iy), a
	ld	1 (iy), a
	ld	2 (iy), a
	ld	3 (iy), a
	ret
;src/main.c:34: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:40: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
	ld	hl, #0x6014
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:43: cpct_setDrawCharM1(1, 0);
	push	hl
	ld	bc, #0x0001
	push	bc
	call	_cpct_setDrawCharM1
	pop	hl
;src/main.c:45: cpct_drawStringM1("Welcome to CPCtelera!", pvmem);
	ld	bc, #___str_0+0
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/main.c:48: n_interrupt = 0;
	xor	a, a
	ld	iy, #_n_interrupt
	ld	0 (iy), a
	ld	1 (iy), a
	ld	2 (iy), a
	ld	3 (iy), a
;src/main.c:49: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:50: cpct_setInterruptHandler(&interruptHandler);
	ld	hl, #_interruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:52: cpct_akp_musicInit(fx_song);
	ld	hl, #_fx_song
	push	hl
	call	_cpct_akp_musicInit
;src/main.c:53: cpct_akp_SFXInit(fx_song);
	ld	hl, #_fx_song
	ex	(sp),hl
	call	_cpct_akp_SFXInit
	pop	af
;src/main.c:56: while (1){
00110$:
;src/main.c:57: if (cpct_isKeyPressed(Key_1))
	ld	hl, #0x0108
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/main.c:58: cpct_akp_SFXPlay(1, 15, 50, 0, 0, AY_CHANNEL_ALL);
	ld	a, #0x07
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	l, #0x32
	push	hl
	ld	hl, #0x0f01
	push	hl
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
00102$:
;src/main.c:59: if (cpct_isKeyPressed(Key_2))
	ld	hl, #0x0208
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/main.c:60: cpct_akp_SFXPlay(2, 15, 50, 0, 0, AY_CHANNEL_ALL);
	ld	a, #0x07
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	l, #0x32
	push	hl
	ld	hl, #0x0f02
	push	hl
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
00104$:
;src/main.c:61: if (cpct_isKeyPressed(Key_3))
	ld	hl, #0x0207
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00106$
;src/main.c:62: cpct_akp_SFXPlay(3, 15, 50, 0, 0, AY_CHANNEL_ALL);
	ld	a, #0x07
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	l, #0x32
	push	hl
	ld	hl, #0x0f03
	push	hl
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
00106$:
;src/main.c:63: if (cpct_isKeyPressed(Key_4)){
	ld	hl, #0x0107
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00110$
;src/main.c:64: cpct_akp_stop();
	call	_cpct_akp_stop
;src/main.c:65: cpct_akp_musicInit(dr_song);
	ld	hl, #_dr_song
	push	hl
	call	_cpct_akp_musicInit
	pop	af
	jr	00110$
___str_0:
	.ascii "Welcome to CPCtelera!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
