   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 41524D20 		.ascii	"ARM ASM & Integer version:\012\000"
  21      41534D20 
  21      2620496E 
  21      74656765 
  21      72207665 
  22              		.global	__aeabi_i2f
  23              		.global	__aeabi_fdiv
  24              		.align	2
  25              	.LC2:
  26 001c 70645F61 		.ascii	"pd_asm %d: %f \012\000"
  26      736D2025 
  26      643A2025 
  26      66200A00 
  27              		.global	__aeabi_f2d
  28              		.align	2
  29              	.LC3:
  30 002c 0A432026 		.ascii	"\012C & floating point version: \012\000"
  30      20666C6F 
  30      6174696E 
  30      6720706F 
  30      696E7420 
  31              		.global	__aeabi_fadd
  32 004b 00       		.align	2
  33              	.LC4:
  34 004c 70645F63 		.ascii	"pd_c %d: %f \012\000"
  34      2025643A 
  34      20256620 
  34      0A00
  35 005a 0000     		.align	2
  36              	.LC0:
  37 005c 4B000000 		.word	75
  38 0060 02000000 		.word	2
  39 0064 04000000 		.word	4
  40 0068 01000000 		.word	1
  41 006c 0A000000 		.word	10
  42 0070 38000000 		.word	56
  43 0074 0E000000 		.word	14
  44 0078 08000000 		.word	8
  45 007c 0C000000 		.word	12
  46 0080 10000000 		.word	16
  47 0084 1E000000 		.word	30
  48 0088 05000000 		.word	5
  49 008c 14000000 		.word	20
  50 0090 32000000 		.word	50
  51 0094 18000000 		.word	24
  52 0098 13000000 		.word	19
  53              		.section	.text.main,"ax",%progbits
  54              		.align	2
  55              		.global	main
  56              		.thumb
  57              		.thumb_func
  59              	main:
  60              	.LFB0:
  61              		.file 1 "../src/main.c"
   1:../src/main.c **** #include <stdio.h>
   2:../src/main.c **** // CG2028 Assignment 
   3:../src/main.c **** // (c) Eric Cheung, ECE NUS 2020
   4:../src/main.c **** // Classification methods using Probability of Detection
   5:../src/main.c **** // Definition of assembly function, students should not modify it
   6:../src/main.c **** 
   7:../src/main.c **** extern void pdm(int M, int* pd, int* CM, int scale);
   8:../src/main.c **** 
   9:../src/main.c **** #define M 4
  10:../src/main.c **** 
  11:../src/main.c **** int main(void)
  12:../src/main.c **** 
  13:../src/main.c **** {
  62              		.loc 1 13 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 104
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 B0B5     		push	{r4, r5, r7, lr}
  67              	.LCFI0:
  68              		.cfi_def_cfa_offset 16
  69              		.cfi_offset 14, -4
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 5, -12
  72              		.cfi_offset 4, -16
  73 0002 9AB0     		sub	sp, sp, #104
  74              	.LCFI1:
  75              		.cfi_def_cfa_offset 120
  76 0004 00AF     		add	r7, sp, #0
  77              	.LCFI2:
  78              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	// Variable definition
  15:../src/main.c **** 	
  16:../src/main.c **** 	int col_i, row_i, scale = 10000000; //10 ^ 7 for a precision of up to 0.000001
  79              		.loc 1 16 0
  80 0006 49F28063 		movw	r3, #38528
  81 000a C0F29803 		movt	r3, 152
  82 000e BB65     		str	r3, [r7, #88]
  17:../src/main.c **** 	float summ, pd_c, pd_asm;
  18:../src/main.c **** 
  19:../src/main.c **** 	int CM[M][M] =
  83              		.loc 1 19 0
  84 0010 40F20003 		movw	r3, #:lower16:.LC0
  85 0014 C0F20003 		movt	r3, #:upper16:.LC0
  86 0018 07F11004 		add	r4, r7, #16
  87 001c 1D46     		mov	r5, r3
  88 001e 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  89 0020 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  90 0022 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  91 0024 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  92 0026 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  93 0028 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  94 002a 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
  95 002e 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  20:../src/main.c **** 	{
  21:../src/main.c **** 		{75,2,4,1},
  22:../src/main.c **** 		{10,56,14,8},
  23:../src/main.c **** 		{12,16,30,5},
  24:../src/main.c **** 		{20,50,24,19}
  25:../src/main.c **** 	};
  26:../src/main.c **** 	
  27:../src/main.c **** 	int pd[M];
  28:../src/main.c **** 	
  29:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
  96              		.loc 1 29 0
  97 0032 4FF00003 		mov	r3, #0
  98 0036 3B66     		str	r3, [r7, #96]
  99 0038 0DE0     		b	.L2
 100              	.L3:
  30:../src/main.c **** 	{
  31:../src/main.c **** 		pd[row_i] = 0;
 101              		.loc 1 31 0 discriminator 2
 102 003a 3B6E     		ldr	r3, [r7, #96]
 103 003c 4FEA8303 		lsl	r3, r3, #2
 104 0040 07F16802 		add	r2, r7, #104
 105 0044 D318     		adds	r3, r2, r3
 106 0046 4FF00002 		mov	r2, #0
 107 004a 43F8682C 		str	r2, [r3, #-104]
  29:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 108              		.loc 1 29 0 discriminator 2
 109 004e 3B6E     		ldr	r3, [r7, #96]
 110 0050 03F10103 		add	r3, r3, #1
 111 0054 3B66     		str	r3, [r7, #96]
 112              	.L2:
  29:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 113              		.loc 1 29 0 is_stmt 0 discriminator 1
 114 0056 3B6E     		ldr	r3, [r7, #96]
 115 0058 032B     		cmp	r3, #3
 116 005a EEDD     		ble	.L3
  32:../src/main.c **** 	}
  33:../src/main.c **** 	
  34:../src/main.c **** 	// ARM ASM & Integer version
  35:../src/main.c **** 	printf("ARM ASM & Integer version:\n");
 117              		.loc 1 35 0 is_stmt 1
 118 005c 40F20003 		movw	r3, #:lower16:.LC1
 119 0060 C0F20003 		movt	r3, #:upper16:.LC1
 120 0064 1846     		mov	r0, r3
 121 0066 FFF7FEFF 		bl	printf
  36:../src/main.c **** 
  37:../src/main.c **** 	pdm(M, (int*)pd, (int*)CM, scale);
 122              		.loc 1 37 0
 123 006a 3A46     		mov	r2, r7
 124 006c 07F11003 		add	r3, r7, #16
 125 0070 4FF00400 		mov	r0, #4
 126 0074 1146     		mov	r1, r2
 127 0076 1A46     		mov	r2, r3
 128 0078 BB6D     		ldr	r3, [r7, #88]
 129 007a FFF7FEFF 		bl	pdm
  38:../src/main.c **** 
  39:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 130              		.loc 1 39 0
 131 007e 4FF00003 		mov	r3, #0
 132 0082 3B66     		str	r3, [r7, #96]
 133 0084 26E0     		b	.L4
 134              	.L5:
  40:../src/main.c **** 	{
  41:../src/main.c **** 		pd_asm = (float)pd[row_i]/scale;
 135              		.loc 1 41 0 discriminator 2
 136 0086 3B6E     		ldr	r3, [r7, #96]
 137 0088 4FEA8303 		lsl	r3, r3, #2
 138 008c 07F16802 		add	r2, r7, #104
 139 0090 D318     		adds	r3, r2, r3
 140 0092 53F8683C 		ldr	r3, [r3, #-104]
 141 0096 1846     		mov	r0, r3
 142 0098 FFF7FEFF 		bl	__aeabi_i2f
 143 009c 0446     		mov	r4, r0
 144 009e B86D     		ldr	r0, [r7, #88]
 145 00a0 FFF7FEFF 		bl	__aeabi_i2f
 146 00a4 0346     		mov	r3, r0
 147 00a6 2046     		mov	r0, r4
 148 00a8 1946     		mov	r1, r3
 149 00aa FFF7FEFF 		bl	__aeabi_fdiv
 150 00ae 0346     		mov	r3, r0
 151 00b0 7B65     		str	r3, [r7, #84]	@ float
  42:../src/main.c **** 		printf ("pd_asm %d: %f \n", row_i, pd_asm);
 152              		.loc 1 42 0 discriminator 2
 153 00b2 40F20004 		movw	r4, #:lower16:.LC2
 154 00b6 C0F20004 		movt	r4, #:upper16:.LC2
 155 00ba 786D     		ldr	r0, [r7, #84]	@ float
 156 00bc FFF7FEFF 		bl	__aeabi_f2d
 157 00c0 0246     		mov	r2, r0
 158 00c2 0B46     		mov	r3, r1
 159 00c4 2046     		mov	r0, r4
 160 00c6 396E     		ldr	r1, [r7, #96]
 161 00c8 FFF7FEFF 		bl	printf
  39:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 162              		.loc 1 39 0 discriminator 2
 163 00cc 3B6E     		ldr	r3, [r7, #96]
 164 00ce 03F10103 		add	r3, r3, #1
 165 00d2 3B66     		str	r3, [r7, #96]
 166              	.L4:
  39:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 167              		.loc 1 39 0 is_stmt 0 discriminator 1
 168 00d4 3B6E     		ldr	r3, [r7, #96]
 169 00d6 032B     		cmp	r3, #3
 170 00d8 D5DD     		ble	.L5
  43:../src/main.c **** 	}
  44:../src/main.c **** 
  45:../src/main.c **** 	// NOTE: You DO NOT need to modify the code below this line
  46:../src/main.c **** 	
  47:../src/main.c **** 	// C & Floating Point version
  48:../src/main.c **** 	printf ("\nC & floating point version: \n");
 171              		.loc 1 48 0 is_stmt 1
 172 00da 40F20003 		movw	r3, #:lower16:.LC3
 173 00de C0F20003 		movt	r3, #:upper16:.LC3
 174 00e2 1846     		mov	r0, r3
 175 00e4 FFF7FEFF 		bl	printf
  49:../src/main.c **** 	
  50:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 176              		.loc 1 50 0
 177 00e8 4FF00003 		mov	r3, #0
 178 00ec 3B66     		str	r3, [r7, #96]
 179 00ee 4AE0     		b	.L6
 180              	.L9:
  51:../src/main.c **** 	{ 
  52:../src/main.c **** 		summ = 0;
 181              		.loc 1 52 0
 182 00f0 2D4B     		ldr	r3, .L11	@ float
 183 00f2 FB65     		str	r3, [r7, #92]	@ float
  53:../src/main.c **** 		for (col_i = 0; col_i < M; col_i++)
 184              		.loc 1 53 0
 185 00f4 4FF00003 		mov	r3, #0
 186 00f8 7B66     		str	r3, [r7, #100]
 187 00fa 19E0     		b	.L7
 188              	.L8:
  54:../src/main.c **** 		{ 
  55:../src/main.c **** 			summ = summ + CM[row_i][col_i];
 189              		.loc 1 55 0 discriminator 2
 190 00fc 3B6E     		ldr	r3, [r7, #96]
 191 00fe 4FEA8302 		lsl	r2, r3, #2
 192 0102 7B6E     		ldr	r3, [r7, #100]
 193 0104 D318     		adds	r3, r2, r3
 194 0106 4FEA8303 		lsl	r3, r3, #2
 195 010a 07F16802 		add	r2, r7, #104
 196 010e D318     		adds	r3, r2, r3
 197 0110 53F8583C 		ldr	r3, [r3, #-88]
 198 0114 1846     		mov	r0, r3
 199 0116 FFF7FEFF 		bl	__aeabi_i2f
 200 011a 0346     		mov	r3, r0
 201 011c F86D     		ldr	r0, [r7, #92]	@ float
 202 011e 1946     		mov	r1, r3
 203 0120 FFF7FEFF 		bl	__aeabi_fadd
 204 0124 0346     		mov	r3, r0
 205 0126 FB65     		str	r3, [r7, #92]	@ float
  53:../src/main.c **** 		for (col_i = 0; col_i < M; col_i++)
 206              		.loc 1 53 0 discriminator 2
 207 0128 7B6E     		ldr	r3, [r7, #100]
 208 012a 03F10103 		add	r3, r3, #1
 209 012e 7B66     		str	r3, [r7, #100]
 210              	.L7:
  53:../src/main.c **** 		for (col_i = 0; col_i < M; col_i++)
 211              		.loc 1 53 0 is_stmt 0 discriminator 1
 212 0130 7B6E     		ldr	r3, [r7, #100]
 213 0132 032B     		cmp	r3, #3
 214 0134 E2DD     		ble	.L8
  56:../src/main.c **** 		}
  57:../src/main.c **** 		pd_c = CM[row_i][row_i]/summ;
 215              		.loc 1 57 0 is_stmt 1
 216 0136 3A6E     		ldr	r2, [r7, #96]
 217 0138 1346     		mov	r3, r2
 218 013a 4FEA8303 		lsl	r3, r3, #2
 219 013e 9B18     		adds	r3, r3, r2
 220 0140 4FEA8303 		lsl	r3, r3, #2
 221 0144 07F16802 		add	r2, r7, #104
 222 0148 D318     		adds	r3, r2, r3
 223 014a A3F15803 		sub	r3, r3, #88
 224 014e 1B68     		ldr	r3, [r3, #0]
 225 0150 1846     		mov	r0, r3
 226 0152 FFF7FEFF 		bl	__aeabi_i2f
 227 0156 0346     		mov	r3, r0
 228 0158 1846     		mov	r0, r3
 229 015a F96D     		ldr	r1, [r7, #92]	@ float
 230 015c FFF7FEFF 		bl	__aeabi_fdiv
 231 0160 0346     		mov	r3, r0
 232 0162 3B65     		str	r3, [r7, #80]	@ float
  58:../src/main.c **** 		printf("pd_c %d: %f \n", row_i, pd_c);
 233              		.loc 1 58 0
 234 0164 40F20004 		movw	r4, #:lower16:.LC4
 235 0168 C0F20004 		movt	r4, #:upper16:.LC4
 236 016c 386D     		ldr	r0, [r7, #80]	@ float
 237 016e FFF7FEFF 		bl	__aeabi_f2d
 238 0172 0246     		mov	r2, r0
 239 0174 0B46     		mov	r3, r1
 240 0176 2046     		mov	r0, r4
 241 0178 396E     		ldr	r1, [r7, #96]
 242 017a FFF7FEFF 		bl	printf
  50:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 243              		.loc 1 50 0
 244 017e 3B6E     		ldr	r3, [r7, #96]
 245 0180 03F10103 		add	r3, r3, #1
 246 0184 3B66     		str	r3, [r7, #96]
 247              	.L6:
  50:../src/main.c **** 	for (row_i = 0; row_i < M; row_i++)
 248              		.loc 1 50 0 is_stmt 0 discriminator 1
 249 0186 3B6E     		ldr	r3, [r7, #96]
 250 0188 032B     		cmp	r3, #3
 251 018a B1DD     		ble	.L9
 252              	.L10:
  59:../src/main.c **** 	}
  60:../src/main.c **** 	
  61:../src/main.c **** 	// This is for convenience to allow registers, variables and memory locations to be inspected at t
  62:../src/main.c **** 	volatile static int loop = 0;
  63:../src/main.c **** 	while (1)
  64:../src/main.c **** 	{
  65:../src/main.c **** 		loop++;
 253              		.loc 1 65 0 is_stmt 1 discriminator 1
 254 018c 40F20003 		movw	r3, #:lower16:loop.3834
 255 0190 C0F20003 		movt	r3, #:upper16:loop.3834
 256 0194 1B68     		ldr	r3, [r3, #0]
 257 0196 03F10102 		add	r2, r3, #1
 258 019a 40F20003 		movw	r3, #:lower16:loop.3834
 259 019e C0F20003 		movt	r3, #:upper16:loop.3834
 260 01a2 1A60     		str	r2, [r3, #0]
  66:../src/main.c **** 	}
 261              		.loc 1 66 0 discriminator 1
 262 01a4 F2E7     		b	.L10
 263              	.L12:
 264 01a6 00BF     		.align	2
 265              	.L11:
 266 01a8 00000000 		.word	0
 267              		.cfi_endproc
 268              	.LFE0:
 270              		.bss
 271              		.align	2
 272              	loop.3834:
 273 0000 00000000 		.space	4
 274              		.text
 275              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:19     .rodata:00000000 $d
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:20     .rodata:00000000 .LC1
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:25     .rodata:0000001c .LC2
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:29     .rodata:0000002c .LC3
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:33     .rodata:0000004c .LC4
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:36     .rodata:0000005c .LC0
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:54     .text.main:00000000 $t
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:59     .text.main:00000000 main
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:272    .bss:00000000 loop.3834
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:266    .text.main:000001a8 $d
C:\Users\ASUS\AppData\Local\Temp\ccDy7Eyb.s:271    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2f
__aeabi_fdiv
__aeabi_f2d
__aeabi_fadd
printf
pdm
