	.data

int_1:	
	.space 8
summ:
	.space 8
scan:
	.string "%s"
option:
	.string "%d"
print:
	.string "%s"
prime:
	.string "\n"


	.comm str_1,79,20
	.comm str_2,79,20
	.comm string, 158,20

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp


	pushl $str_1
	pushl $scan
	call scanf

	pushl $str_2
	pushl $scan
	call scanf

	pushl $summ
	pushl $option
	call scanf
  	addl $24, %esp


	movl $str_1, %esi
	movl $0, %ecx
L1: 
	lodsb
	cmp $0, %al
	je R1
	addl $1, %ecx
	jmp L1
R1:

	movl %ecx, int_1

	movl $string, %edi
	movl summ, %ecx
	subl $1, %ecx
	movl $str_2, %esi
	movl %esi, summ
	cmp $0, %ecx
	je BRM

L2:	

	pushl %ecx
	movsb
	popl %ecx
	loop L2
	movl %esi, summ

BRM:
	movl int_1, %ecx 
	movl $str_1, %esi
L3:
	pushl %ecx
	movsb
	popl %ecx
	loop L3



	movl summ, %esi
L4:
	lodsb
	stosb
	cmp $0, %al
	je loop_end
	jmp L4

loop_end:
	pushl $string
	pushl $print	
	call printf
	pushl $prime
	call printf
	addl $12, %esp


        movl %ebp, %esp
        popl %ebp
        movl $0, %eax

ret
