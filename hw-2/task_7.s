	.data

printf_format:
	.string "%s\n"
str_in:
	.string "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.set str_in_length, .-str_in
	.bss
str_out:
	.space str_in_length
	.text

.globl main

main:
	pushl %ebp
	movl %esp, %ebp
 
	movl $str_in, %esi
	movl $str_out, %edi
 
	movl $str_in_length - 1, %ecx

 
 
cmpl $65, %eax
	jg convekt
	jmp contune
 
convekt:
	subl $26, %eax
 
	jmp contune
 

contune:
 
	pushl $str_out
	pushl $printf_format
	call printf
 
	movl $0, %eax
 
	movl %ebp, %esp
	popl %ebp
 
ret
