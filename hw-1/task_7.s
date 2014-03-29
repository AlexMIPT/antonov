	.data
longlong:
	.space	10
fmt_Ld:
	.string "%Le"
fmt_int:
	.string	"%d"
fmt_intn:
	.string "%d\n"
fmt_endl:
	.string "\n"

	.text
	.globl main
	.globl show	
main:
	pushl 	%ebp		
	movl	%esp, 	%ebp	

	pushl	$longlong		
	pushl	$fmt_Ld		
	call	scanf
	addl	$8, 	%esp

	movl	$longlong,	%eax
	addl	$8,	%eax
	pushl	(%eax)
	pushl	$16
	call	show
	addl	$8,	%esp

	movl	$longlong,	%eax
	addl	$4,	%eax
	pushl	(%eax)
	pushl	$32
	call	show
	addl	$8,	%esp

	pushl	longlong
	pushl	$32
	call	show
	addl	$8,	%esp

	pushl	$fmt_endl	
	call printf
	addl	$4,	%esp

	movl	%ebp,	%esp	
	popl	%ebp		
	movl	$0,	%eax
	ret 

show:
	pushl	%ebx
	pushl	%ecx
	pushl	%edx	
	pushl	%ebp		
	movl	%esp, 	%ebp	

	movl 20(%ebp),	%ecx
	movl 24(%ebp),	%ebx

	movl 20(%ebp),	%ecx
l_r:
	movl	$1,	%edx
	rorl	$1,	%ebx
	jc	one
	movl	$0,	%edx
     	one:	
	pushl	%edx
	loop l_r	

	movl 20(%ebp),	%ecx
l_p:
	movl	%ecx,	%ebx
	pushl $fmt_int
	call printf
	addl	$8,	%esp	
	movl	%ebx,	%ecx
	loop l_p

	movl	%ebp,	%esp	
	popl	%ebp		
	popl	%edx
	popl	%ecx
	popl	%ebx
	ret 
