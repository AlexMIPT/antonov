.data
first_string:
	.string "First number is bigger or equal\n"
second_string:
	.string "Second is bigger\n"
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
	jge first		
	pushl $second_string 
	call printf
	addl $4, %esp
	jmp contune

first:
	pushl $first_string 
	call printf
	addl $4, %esp

contune: 					
	popl %eax
	popl %ebx

	movl %ebp, %esp
	popl %ebp

	movl $0, %eax 	
	ret
