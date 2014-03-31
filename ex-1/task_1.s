
print:
	.string "%u\n"

put_in:
		.space 4096
string:
	.string "%s"
	.text

str_length:

	pushl %ebp
	movl %esp, %ebp

	pushl $str_in
	pushl $string
	call scanf
	addl $8, %esp
	
	pushl %edi
	
	movl 8(%ebp), %edi
	
	movl $0x80, %ecx
	xorl %eax, %eax

	repne scasb

	notl %ecx
	decl %ecx

	movl %ecx, %eax

	popl %edi

	movl %ebp, %esp
	popl %ebp

	ret


.globl main

main:

	pushl %ebp
	movl %esp, %ebp

	pushl $put_in
	call str_length

	pushl %eax
	pushl $print
	call printf

	movl $0, %eax

	movl %ebp, %esp
	popl %ebp

	ret
