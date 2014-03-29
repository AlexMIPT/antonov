.data
int:
	.space	4
int_2:
	.space 4
str_hello:
	.string "\nEnter number from -1073741823 to 1073741823: "
fmt_int:
	.string	"%d"
fmt_sgn:
	.string "%d|"
fmt_endl:
	.string "\n\n"
str_32:
	.string "Signed integer value (32 bit) holds it like: "

	.text
	.globl	main
main:
	pushl	%ebp	
	movl	%esp, 	%ebp	

	pushl	$int		
	pushl	$fmt_int	
	call	scanf
	addl	$8, 	%esp

	movl	int,	%eax	
	movl	%eax,	int_2

	cmpl	$0,	int
	jnl	plus

	movl	$2147483648,	%ebx
	addl	%eax,	%ebx
	movl	%ebx,	%eax

	movl	%eax,	int

plus:

	movl	$31,	%ebx
fill:
	cmpl	$0,	%ebx
	jng	pre

	pushl	$0
	decl	%ebx

	jmp	fill

pre:
	movl	int,	%eax	
	movl	$0,	%edx	#edx = 0;
	movl	$0,	%ebx	#ebx is counter
	movl	$2,	%ecx	#ecx = 2;

start:
	cmpl	$0,	%eax	#(eax==0)?
	jng	poststart

	movl	$0,	%edx	
	divl	%ecx		
	pushl	%edx

	incl	%ebx		
	jmp	start	

poststart:
	cmpl	$32,	%ebx	
	jnl	preinermediate

	pushl	$0
	cmp	$0,	int_2
	jnl	zero
	addl	$4,	%esp
	pushl	$1	
	zero:	
	incl	%ebx

	jmp	poststart

preinermediate:
	pushl	$fmt_sgn
	call printf
	addl	$8,	%esp
	decl	%ebx

intermediate:
	cmpl	$0,	%ebx	
	jng	end

	pushl	$fmt_int		
	call printf
	addl	$8,	%esp

	decl	%ebx		
	jmp	intermediate
end:	

	cmpl	$0,	int
	jne	except_zero
	pushl	$0
	pushl	$fmt_int
	call	printf
	addl	$8,	%esp
except_zero:

	pushl	$fmt_endl	
	call printf
	addl	$4,	%esp

	movl	%ebp,	%esp
	popl	%ebp
	movl	$0,	%eax
	ret 
