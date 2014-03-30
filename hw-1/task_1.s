	.data
vari:
	.space 4
strforscan:
	.string "%d"
strforprint:
	.string "%d\n"
	.text
	.globl main
shift:	
	movl 	$2, 	%ebx
	idiv 	%ebx
	pushl 	%edx
	movl 	$0, 	%edx
	addl 	$1, 	%ecx
	cmp 	$0, 	%eax
	jne 	shift
	movl 	$0, 	%eax
	jmp 	next	
main:
	pushl 	%ebp	
	movl 	%esp, %ebp

	pushl	$vari 	
	pushl	$strforscan
	call	scanf
	addl 	$8, 	%esp

	movl	vari, 	%eax	
	movl 	$0, 	%ecx

	cmp 	$0, 	%eax
	jne 	shift
	pushl 	%eax
	movl 	$0, 	%ecx
	jmp 	next
next:
	popl 	%ebx 		
	movl 	$10, 	%edx 
	imul 	%edx 		
	addl 	%ebx, 	%eax 	
	loop 	next

	pushl	%eax 
	pushl	$strforprint
	call	printf
	addl	$8, 	%esp

	movl 	%ebp, 	%esp	
	popl 	%ebp
	movl 	$0 , 	%eax
	ret
