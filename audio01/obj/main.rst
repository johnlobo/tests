                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _interruptHandler
                             13 	.globl _cpct_akp_SFXPlay
                             14 	.globl _cpct_akp_SFXInit
                             15 	.globl _cpct_akp_stop
                             16 	.globl _cpct_akp_musicPlay
                             17 	.globl _cpct_akp_musicInit
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_drawStringM1
                             20 	.globl _cpct_setDrawCharM1
                             21 	.globl _cpct_isKeyPressed
                             22 	.globl _cpct_scanKeyboard_if
                             23 	.globl _cpct_setInterruptHandler
                             24 	.globl _cpct_disableFirmware
                             25 	.globl _n_interrupt
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   4AEA                      33 _n_interrupt::
   4AEA                      34 	.ds 4
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/main.c:26: void interruptHandler(){
                             60 ;	---------------------------------
                             61 ; Function interruptHandler
                             62 ; ---------------------------------
   4000                      63 _interruptHandler::
                             64 ;src/main.c:27: if (++n_interrupt == 6){
   4000 FD 21 EA 4A   [14]   65 	ld	iy, #_n_interrupt
   4004 FD 34 00      [23]   66 	inc	0 (iy)
   4007 20 0D         [12]   67 	jr	NZ,00109$
   4009 FD 34 01      [23]   68 	inc	1 (iy)
   400C 20 08         [12]   69 	jr	NZ,00109$
   400E FD 34 02      [23]   70 	inc	2 (iy)
   4011 20 03         [12]   71 	jr	NZ,00109$
   4013 FD 34 03      [23]   72 	inc	3 (iy)
   4016                      73 00109$:
   4016 FD 7E 00      [19]   74 	ld	a, 0 (iy)
   4019 D6 06         [ 7]   75 	sub	a, #0x06
   401B FD B6 01      [19]   76 	or	a, 1 (iy)
   401E FD B6 02      [19]   77 	or	a, 2 (iy)
   4021 FD B6 03      [19]   78 	or	a, 3 (iy)
   4024 C0            [11]   79 	ret	NZ
                             80 ;src/main.c:28: cpct_akp_musicPlay();
   4025 CD 20 41      [17]   81 	call	_cpct_akp_musicPlay
                             82 ;src/main.c:29: cpct_scanKeyboard_if();
   4028 CD D1 49      [17]   83 	call	_cpct_scanKeyboard_if
                             84 ;src/main.c:30: n_interrupt = 0;
   402B AF            [ 4]   85 	xor	a, a
   402C FD 21 EA 4A   [14]   86 	ld	iy, #_n_interrupt
   4030 FD 77 00      [19]   87 	ld	0 (iy), a
   4033 FD 77 01      [19]   88 	ld	1 (iy), a
   4036 FD 77 02      [19]   89 	ld	2 (iy), a
   4039 FD 77 03      [19]   90 	ld	3 (iy), a
   403C C9            [10]   91 	ret
                             92 ;src/main.c:34: void main(void) {
                             93 ;	---------------------------------
                             94 ; Function main
                             95 ; ---------------------------------
   403D                      96 _main::
                             97 ;src/main.c:40: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   403D 21 14 60      [10]   98 	ld	hl, #0x6014
   4040 E5            [11]   99 	push	hl
   4041 21 00 C0      [10]  100 	ld	hl, #0xc000
   4044 E5            [11]  101 	push	hl
   4045 CD 4A 4A      [17]  102 	call	_cpct_getScreenPtr
                            103 ;src/main.c:43: cpct_setDrawCharM1(1, 0);
   4048 E5            [11]  104 	push	hl
   4049 01 01 00      [10]  105 	ld	bc, #0x0001
   404C C5            [11]  106 	push	bc
   404D CD 6A 4A      [17]  107 	call	_cpct_setDrawCharM1
   4050 E1            [10]  108 	pop	hl
                            109 ;src/main.c:45: cpct_drawStringM1("Welcome to CPCtelera!", pvmem);
   4051 01 FC 40      [10]  110 	ld	bc, #___str_0+0
   4054 E5            [11]  111 	push	hl
   4055 C5            [11]  112 	push	bc
   4056 CD 47 49      [17]  113 	call	_cpct_drawStringM1
                            114 ;src/main.c:48: n_interrupt = 0;
   4059 AF            [ 4]  115 	xor	a, a
   405A FD 21 EA 4A   [14]  116 	ld	iy, #_n_interrupt
   405E FD 77 00      [19]  117 	ld	0 (iy), a
   4061 FD 77 01      [19]  118 	ld	1 (iy), a
   4064 FD 77 02      [19]  119 	ld	2 (iy), a
   4067 FD 77 03      [19]  120 	ld	3 (iy), a
                            121 ;src/main.c:49: cpct_disableFirmware();
   406A CD 39 4A      [17]  122 	call	_cpct_disableFirmware
                            123 ;src/main.c:50: cpct_setInterruptHandler(&interruptHandler);
   406D 21 00 40      [10]  124 	ld	hl, #_interruptHandler
   4070 CD BE 4A      [17]  125 	call	_cpct_setInterruptHandler
                            126 ;src/main.c:52: cpct_akp_musicInit(fx_song);
   4073 21 00 90      [10]  127 	ld	hl, #_fx_song
   4076 E5            [11]  128 	push	hl
   4077 CD 23 48      [17]  129 	call	_cpct_akp_musicInit
                            130 ;src/main.c:53: cpct_akp_SFXInit(fx_song);
   407A 21 00 90      [10]  131 	ld	hl, #_fx_song
   407D E3            [19]  132 	ex	(sp),hl
   407E CD AF 48      [17]  133 	call	_cpct_akp_SFXInit
   4081 F1            [10]  134 	pop	af
                            135 ;src/main.c:56: while (1){
   4082                     136 00110$:
                            137 ;src/main.c:57: if (cpct_isKeyPressed(Key_1))
   4082 21 08 01      [10]  138 	ld	hl, #0x0108
   4085 CD 12 41      [17]  139 	call	_cpct_isKeyPressed
   4088 7D            [ 4]  140 	ld	a, l
   4089 B7            [ 4]  141 	or	a, a
   408A 28 17         [12]  142 	jr	Z,00102$
                            143 ;src/main.c:58: cpct_akp_SFXPlay(1, 15, 50, 0, 0, AY_CHANNEL_ALL);
   408C 3E 07         [ 7]  144 	ld	a, #0x07
   408E F5            [11]  145 	push	af
   408F 33            [ 6]  146 	inc	sp
   4090 21 00 00      [10]  147 	ld	hl, #0x0000
   4093 E5            [11]  148 	push	hl
   4094 2E 32         [ 7]  149 	ld	l, #0x32
   4096 E5            [11]  150 	push	hl
   4097 21 01 0F      [10]  151 	ld	hl, #0x0f01
   409A E5            [11]  152 	push	hl
   409B CD CA 48      [17]  153 	call	_cpct_akp_SFXPlay
   409E 21 07 00      [10]  154 	ld	hl, #7
   40A1 39            [11]  155 	add	hl, sp
   40A2 F9            [ 6]  156 	ld	sp, hl
   40A3                     157 00102$:
                            158 ;src/main.c:59: if (cpct_isKeyPressed(Key_2))
   40A3 21 08 02      [10]  159 	ld	hl, #0x0208
   40A6 CD 12 41      [17]  160 	call	_cpct_isKeyPressed
   40A9 7D            [ 4]  161 	ld	a, l
   40AA B7            [ 4]  162 	or	a, a
   40AB 28 17         [12]  163 	jr	Z,00104$
                            164 ;src/main.c:60: cpct_akp_SFXPlay(2, 15, 50, 0, 0, AY_CHANNEL_ALL);
   40AD 3E 07         [ 7]  165 	ld	a, #0x07
   40AF F5            [11]  166 	push	af
   40B0 33            [ 6]  167 	inc	sp
   40B1 21 00 00      [10]  168 	ld	hl, #0x0000
   40B4 E5            [11]  169 	push	hl
   40B5 2E 32         [ 7]  170 	ld	l, #0x32
   40B7 E5            [11]  171 	push	hl
   40B8 21 02 0F      [10]  172 	ld	hl, #0x0f02
   40BB E5            [11]  173 	push	hl
   40BC CD CA 48      [17]  174 	call	_cpct_akp_SFXPlay
   40BF 21 07 00      [10]  175 	ld	hl, #7
   40C2 39            [11]  176 	add	hl, sp
   40C3 F9            [ 6]  177 	ld	sp, hl
   40C4                     178 00104$:
                            179 ;src/main.c:61: if (cpct_isKeyPressed(Key_3))
   40C4 21 07 02      [10]  180 	ld	hl, #0x0207
   40C7 CD 12 41      [17]  181 	call	_cpct_isKeyPressed
   40CA 7D            [ 4]  182 	ld	a, l
   40CB B7            [ 4]  183 	or	a, a
   40CC 28 17         [12]  184 	jr	Z,00106$
                            185 ;src/main.c:62: cpct_akp_SFXPlay(3, 15, 50, 0, 0, AY_CHANNEL_ALL);
   40CE 3E 07         [ 7]  186 	ld	a, #0x07
   40D0 F5            [11]  187 	push	af
   40D1 33            [ 6]  188 	inc	sp
   40D2 21 00 00      [10]  189 	ld	hl, #0x0000
   40D5 E5            [11]  190 	push	hl
   40D6 2E 32         [ 7]  191 	ld	l, #0x32
   40D8 E5            [11]  192 	push	hl
   40D9 21 03 0F      [10]  193 	ld	hl, #0x0f03
   40DC E5            [11]  194 	push	hl
   40DD CD CA 48      [17]  195 	call	_cpct_akp_SFXPlay
   40E0 21 07 00      [10]  196 	ld	hl, #7
   40E3 39            [11]  197 	add	hl, sp
   40E4 F9            [ 6]  198 	ld	sp, hl
   40E5                     199 00106$:
                            200 ;src/main.c:63: if (cpct_isKeyPressed(Key_4)){
   40E5 21 07 01      [10]  201 	ld	hl, #0x0107
   40E8 CD 12 41      [17]  202 	call	_cpct_isKeyPressed
   40EB 7D            [ 4]  203 	ld	a, l
   40EC B7            [ 4]  204 	or	a, a
   40ED 28 93         [12]  205 	jr	Z,00110$
                            206 ;src/main.c:64: cpct_akp_stop();
   40EF CD 83 48      [17]  207 	call	_cpct_akp_stop
                            208 ;src/main.c:65: cpct_akp_musicInit(dr_song);
   40F2 21 00 80      [10]  209 	ld	hl, #_dr_song
   40F5 E5            [11]  210 	push	hl
   40F6 CD 23 48      [17]  211 	call	_cpct_akp_musicInit
   40F9 F1            [10]  212 	pop	af
   40FA 18 86         [12]  213 	jr	00110$
   40FC                     214 ___str_0:
   40FC 57 65 6C 63 6F 6D   215 	.ascii "Welcome to CPCtelera!"
        65 20 74 6F 20 43
        50 43 74 65 6C 65
        72 61 21
   4111 00                  216 	.db 0x00
                            217 	.area _CODE
                            218 	.area _INITIALIZER
                            219 	.area _CABS (ABS)
