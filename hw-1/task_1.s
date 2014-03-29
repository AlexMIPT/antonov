.section	.rodata
.LC0:
	.string	"%i"
.LC1:
	.string	"0%i"
	.text
.globl main
	.type	main, @function
main:
.Label_0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$.LC0, %eax
	leaq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	js	.L2
	movl	$0, -20(%rbp)
	movl	$1, -16(%rbp)
	jmp	.L3
.Label_4:
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	imull	-16(%rbp), %eax
	addl	%eax, -20(%rbp)
	movl	-16(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	leal	(%rdx,%rax), %eax
	sarl	%eax
	movl	%eax, -24(%rbp)
.Label_3:
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	jne	.L4
	movl	$.LC1, %eax
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	jmp	.L5
.Label_2:
	movl	-24(%rbp), %eax
	negl	%eax
	movl	%eax, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L6
.Label_7:
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	imull	-8(%rbp), %eax
	addl	%eax, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -8(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	leal	(%rdx,%rax), %eax
	sarl	%eax
	movl	%eax, -24(%rbp)
.Label_6:
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	jne	.L7
	movl	$0, -4(%rbp)
	jmp	.L8
.Label_9:
	movl	-8(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	-8(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -8(%rbp)
.Label_8:
	cmpl	$0, -8(%rbp)
	jne	.L9
	movl	-4(%rbp), %eax
	subl	%eax, -12(%rbp)
	negl	-12(%rbp)
	addl	$1, -12(%rbp)
	movl	$.LC0, %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.Label_5:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
