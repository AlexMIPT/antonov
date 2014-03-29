    .data
out_string:
	.string "%d\n"
in_string:
	.string "%d %d"
int_space_a:
	.space 4
counter:
	.space 4
	.text
	.globl main
main:
	pushl %ebp		 
	movl %esp, %ebp

	pushl $counter
	pushl $int_space_a
	pushl $in_string
	call scanf


	movl int_space_a, %eax
	movl %eax, 4(%esp)
	movl $1, 8(%esp) 	

chbn:				
	movl 4(%esp), %ebx
	imull %ebx
	addl $1, 8(%esp) 

test_k:
	movl 8(%esp), %ebx
	cmpl %ebx, counter 	
	jne chbn

	pushl %eax
	pushl $out_string
	call printf
	addl $16, %esp	
	jmp cont

cont:
	movl %ebp, %esp
	popl %ebp

	movl $0, %eax 
	ret
