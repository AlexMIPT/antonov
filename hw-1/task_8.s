		.data
fmt_d:.string "%d"	
fmt_c:.string "%c"
fmt_x:.string "%x\n"
fmt_n:.string "\n"
int:	.space	4	

		.text
	.globl main

main:
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl 	%ebp
	movl	%esp,	%ebp

	xor	%edi,	%edi

	movl	$0,	int

	movl	$12,	%edi
start:
	cmpl	$0,	%edi
	jng	out		

	pushl	$int		
	pushl	$fmt_c
	call scanf		
	addl	$8,	%esp

	subl	$48,	int

	cmpl	$0,	int	
	jl	out		

	pushl	int	
	pushl	$4
	call	show
	addl	$8,	%esp

	decl	%edi		
	jmp	start
out:

	pushl	$fmt_n
	call	printf
	addl	$4,	%esp

	movl	$0,	%eax
	movl	%ebp,	%esp
	popl	%ebp
	popl	%edx
	popl	%ecx
	popl	%ebx
	ret


show:
        pushl   %ebx
        pushl   %ecx
        pushl   %edx
        pushl   %ebp        
        movl    %esp,   %ebp

        movl 20(%ebp),  %ecx
        movl 24(%ebp),  %ebx
        
	movl 20(%ebp),  %ecx
l_r:
        movl    $1,     %edx
        rorl    $1,     %ebx
        jc      one
        movl    $0,     %edx
        one:
        pushl   %edx
        loop l_r

        movl 20(%ebp),  %ecx
l_p:
        movl    %ecx,   %ebx
        pushl 	$fmt_d
        call printf
        addl    $8,     %esp
        movl    %ebx,   %ecx
        loop l_p

        movl    %ebp,   %esp    
        popl    %ebp            
        popl    %edx
        popl    %ecx
        popl    %ebx
        ret

