	.data
str_a:	.string "%d"
str_b:	.string "%d\n"

		.text
	.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp


	pushl	%esp
	
	pushl	$str_a
	call scanf
	movl  8(%esp),	%eax	
	addl	$8,	%esp

	movl	%eax, %edx
	shrl	$31, %edx	 
	leal	(%edx,%eax), %eax
	sarl	%eax	 

	pushl	%eax
	pushl	$str_b
	call printf
	addl	$8,	%esp

	movl	$0, %eax
	leave
ret
