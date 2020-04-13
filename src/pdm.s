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
	PUSH {R4-R10}
	MOV R8, #0 	@initialise register R8 to be 0; Temp Sum container
	MOV R9, #0 	@initialise register R9 to be 0;
	//MOV R6, R2 	@store the address of the Array CM into R6
	//MOV R5, R1 	@store the address of the Array PD into R5
	MOV R10, #0 @initialise the register 10 to M
	MOV R7, #0 	@initialise the register 7 to M
adder:
	LDR R9, [R2], #4  @load the value of contents of register R2 into R9 and increment R2 by 4
	ADD R8, R9 	@add the contents of R9 to R8
	CMP R7, R10 @check if R7 and R10 are equal 
	IT EQ 	@store the flag of the condition
	MOVEQ R4, R9 	@if R7 and R10 are equal, move the value of R9 into R4
	ADD R7, #1 	@increment R7 by 1
	CMP R7, R0 	@check if R7 is equal to R0
	BEQ compute @branch to compute
	B adder

compute:
	MUL R4, R3 	@multiply R4 by the scale value
	SDIV R8, R4, R8 	@divide the contents in R4 by the contents in R8
	STR R8, [R1], #4 	@store the result of R8 into R1 and increment R1 by 4
	MOV R8, #0 	@reset register R8 to be 0
	MOV R7, #0 	@reset register R7 to be 0
	ADD R10, #1 	@increment R10 by 1 to move to the next row
	CMP R10, R0 	@set the flag if R10 is equal to M
	BEQ Done 	@branch to done if flag is true
	B adder 	@branch back to adder

Done:
	POP {R4-R10}
  	BX LR

@ Define constant values
CONST: .word 123

