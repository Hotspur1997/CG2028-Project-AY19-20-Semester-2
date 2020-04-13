 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func
@  CG2028 Assignment skeleton
@  ECE, NUS
pdm:
@  Write Probability of Detection function in assembly language here
@  Currently, nothing is done and this function returns straightaway
	PUSH {R4-R8}
	MOV R5, #0 	@initialise register R5 to be 0 ie Temp Sum container
	MOV R6, #0 	@initialise register R6 to be 0
	MOV R7, #0  @initialise the register 10 to M
	MOV R8, #0 	@initialise the register 7 to M
add:
	LDR R6, [R2], #4  @load the value of contents of register R2 into R6 and increment R2 by 4
	ADD R5, R6 	@add the contents of R6 to R5
	CMP R7, R8 @check if R7 and R8 are equal 
	IT EQ 	@store the flag of the condition
	MOVEQ R4, R6  @if R7 and R8 are equal, move the value of R6 into R4
	ADD R7, #1 	@increment R7 by 1
	CMP R7, R0 	@check if R7 is equal to R0
	BEQ eval @branch to eval
	B add

eval:
	MUL R4, R3 	@multiply R4 by the scale value
	SDIV R5, R4, R5 	@divide the contents in R4 by the contents in R5
	STR R5, [R1], #4 	@store the result of R5 in the memory location of R1 and increment R1 by 4
	MOV R5, #0 	@reset register R8 to be 0
	MOV R7, #0 	@reset register R7 to be 0
	ADD R8, #1 	@increment R8 by 1 to move to the next row
	CMP R8, R0 	@set the flag if R8 is equal to M
	BEQ fin 	@branch to fin if flag is true
	B add 	@branch back to add

fin:
	POP {R4-R8}
  	BX LR

@ Define constant values
CONST: .word 123

