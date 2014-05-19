	.data
	.comm array,404,32 

string:
	.string "%d"
scan:
	.string "%lf"
print:
	.string "%.2lf\n"

	.text
funct_1:
	pushl %ecx       
loop_1:
	pushl %ecx        
	movl $array, %ebx
	addl %ecx, %ebx   
	addl %ecx, %ebx    
	addl %ecx, %ebx
	addl %ecx, %ebx
	pushl %ebx
	pushl $scan
	call scanf
	addl $8, %esp
	popl %ecx          
	loop loop_1
	popl %ecx          
	jmp L1   

funct_2:
	movl $0, (%esp)
loop_2:
	movl $array, %ebx
	addl %ecx, %ebx
	addl %ecx, %ebx
	addl %ecx, %ebx
	addl %ecx, %ebx
	fldl (%ebx)
	fldl 4(%esp)
	fadd %st(1), %st    
	fstpl 4(%esp)      
	loop loop_2
	jmp L2    

        .globl main
main:
	pushl %ebp
	movl %esp, %ebp  

	pushl %esp
	pushl $string
	call scanf  
	movl 8(%esp), %ecx

	jmp funct_1

L1:
	jmp funct_2   


L2:
	movl $print, %eax  
	movl %eax,(%esp)        
	call printf
	addl $8, %esp


	movl %ebp, %esp   
	popl %ebp
	movl $0, %eax

	ret
