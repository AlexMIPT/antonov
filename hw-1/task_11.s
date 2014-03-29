		.data
int:
	.space 8
space:
	.space 8
address:
	.int 	0x00110012
in_int:
	.string "%d"
out_int:
	.string "%d\n"
	.text
	.globl main
main:
	pushl	%ebp 			
	movl	%esp,	%ebp

	pushl 	$int 
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	movl	$space,	%ebx 
	movl	int,	%eax 
	movl	%eax,	space

	movl	$23,	%eax 		
	movl	(address),	%eax		
	movl	(%ebx),	%eax	

	pushl	%eax 
	pushl	$out_int
	call	printf
	addl	$8,	%esp

	movl	%ebp,	%esp 		
	popl	%ebp
	movl	$0,	%eax 		
	ret
