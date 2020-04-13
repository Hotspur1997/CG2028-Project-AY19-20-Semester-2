#include <stdio.h>
// CG2028 Assignment 
// (c) Eric Cheung, ECE NUS 2020
// Classification methods using Probability of Detection
// Definition of assembly function, students should not modify it

extern void pdm(int M, int* pd, int* CM, int scale);

#define M 4

int main(void)

{
	// Variable definition
	
	int col_i, row_i, scale = 10000000;
	float summ, pd_c, pd_asm;

	int CM[M][M] =
	{
		{75,2,4,1},
		{10,56,14,8},
		{12,16,30,5},
		{20,50,24,19}
	};
	
	int pd[M];
	
	for (row_i = 0; row_i < M; row_i++)
	{
		pd[row_i] = 0;
	}
	
	// ARM ASM & Integer version
	printf("ARM ASM & Integer version:\n");

	pdm(M, (int*)pd, (int*)CM, scale);

	for (row_i = 0; row_i < M; row_i++)
	{
		pd_asm = (float)pd[row_i]/scale;
		printf ("pd_asm %d: %f \n", row_i, pd_asm);
	}

	// NOTE: You DO NOT need to modify the code below this line
	
	// C & Floating Point version
	printf ("\nC & floating point version: \n");
	
	for (row_i = 0; row_i < M; row_i++)
	{ 
		summ = 0;
		for (col_i = 0; col_i < M; col_i++)
		{ 
			summ = summ + CM[row_i][col_i];
		}
		pd_c = CM[row_i][row_i]/summ;
		printf("pd_c %d: %f \n", row_i, pd_c);
	}
	
	// This is for convenience to allow registers, variables and memory locations to be inspected at the end
	volatile static int loop = 0;
	while (1)
	{
		loop++;
	}
}
