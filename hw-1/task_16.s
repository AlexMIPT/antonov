.data
bigger_string:
	.string ">\n"
lower_string:
	.string "<\n"
equal_string:
	.string "=\n"
int_string:
	.string "%d %d"
int_space_a:
	.space 4
int_space_b:
	.space 4
	.text
	.globl main
main:
	pushl %ebp 			
	movl %esp, %ebp

	pushl $int_space_b 
	pushl $int_space_a
	pushl $int_string
	call scanf
	addl $8, %esp

	pushl %ebx 			
	pushl %eax

	movl int_space_a, %eax
	movl int_space_b, %ebx

	cmp %ebx, %eax
	je eq			

	cmp %ebx,%eax
	jg big

	cmp %eax, %ebx
	jg low

eq:
	pushl $equal_string 	
	call printf
	addl $4, %esp
	jmp contune

big:
	pushl $bigger_string	
	call printf
	addl $4, %esp
	jmp contune

low:
	pushl $lower_string	
	call printf
	addl $4, %esp

contune:	
	popl %eax
	popl %ebx

	movl %ebp, %esp			
	popl %ebp

	movl $0, %eax 
	ret
