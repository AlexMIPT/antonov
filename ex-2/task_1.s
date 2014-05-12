	.data

int_1:	
	.space 8
int_2:
	.space 8
summ:
	.space 8

	.comm str_1,79,20
	.comm str_2,79,20

scan:
	.string "%s"
print:
	.string "%d\n"
	
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


	addl $16, %esp
	movl $(-1), summ

	movl $str_2, %esi
	movl $0, %ecx

L1:

	lodsb
	cmp $0, %al
	je R1
	addl $1, %ecx
	jmp L1

R1:

	movl %ecx, int_1
	
        movl $str_1, %esi
        movl $0, %ecx
L2:
        lodsb
        cmp $0, %al
        je R2
        addl $1, %ecx
        jmp L2

R2:
        
	movl %ecx, int_2

	movl int_2, %ecx
	movl int_1, %eax
	subl %eax, %ecx
	cmp $0, %ecx
	jl loop_end
	addl $1, %ecx

L0:	

	subl $1, %ecx
	pushl %ecx
	movl $str_1, %esi
	movl $str_2, %edi
	addl %ecx, %esi
	movl int_1, %ecx
	
L4:

	pushl %ecx
	cmpsb
	popl %ecx
	jne R4
	loop L4
	popl %ecx
	movl %ecx, summ
	pushl summ

R4:

	popl %ecx
	addl $1, %ecx
	loop L0

loop_end:

	addl $1, summ
	pushl summ
	pushl $print
	call printf
	addl $8, %esp

        movl %ebp, %esp 
        popl %ebp
        movl $0, %eax

ret
