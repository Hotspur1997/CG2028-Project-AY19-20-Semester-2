 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func
@  CG2028 Assignment
@  Lab Group B02-12
@  ECE, NUS

pdm:
@  Write Probability of Detection function in assembly language here

	PUSH {R4-R8}@push registers to backup register content
	CMP R0, #0  @check if the value stored inside R8 is 0
	BEQ Finish  @branch to Finish block if R0 is equal to 0
	MOV R5, #0 	@initialise register R5 to be 0 ie Denominator Accumulator
	MOV R6, #0 	@initialise register R6 to be 0
	MOV R7, #0  @initialise the register 7 to 0
	MOV R8, #0 	@initialise the register 8 to 0

Add:
	LDR R6, [R2], #4  @load the value of contents of register R2 into R6 and increment R2 by 4
	ADD R5, R6 	@add the contents of R6 to R5
	CMP R7, R8  @check if R7 and R8 are equal
	IT EQ
	MOVEQ R4, R6  @if R7 and R8 are equal, move the value of R6 into R4
	ADD R7, #1    @increment R7 by 1
	CMP R7, R0 	  @check if R7 is equal to R0
	BEQ Evaluate  @branch to eval
	B Add

Evaluate:
	MUL R4, R3 	@multiply R4 by the scale value
	UDIV R5, R4, R5 	@divide the contents in R4 by the contents in R5
	STR R5, [R1], #4 	@store the result of R5 in the memory location of R1 and increment R1 by 4
	MOV R5, #0 	@reset register R8 to be 0
	MOV R7, #0 	@reset register R7 to be 0
	ADD R8, #1 	@increment R8 by 1 to move to the next row
	CMP R8, R0 	@set the flag if R8 is equal to M
	BEQ Finish 	@branch to fin if flag is true
	B Add 	@branch back to add

Finish:
	POP {R4-R8} @pop registers to restore register content
  	BX LR
