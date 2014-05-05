	.data
del:
pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
movl %eax,%edx
sarl $31, %edx
        idivl %ebx
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret
int_1:
        .space 4
int_2:
        .space 4
out_string:
        .string "%d\n"
scan:
        .string "%d %d"
string_warn: .string "Division with remainder\n"
.text
.globl del, main
main:
        pushl %ebp	
        movl %esp, %ebp

pushl $int_2
        pushl $int_1
        pushl $scan
        call scanf	
        addl $8, %esp

        
pushl int_2
pushl int_1
call del
addl $8, %esp

pushl %eax
pushl $out_string
call printf
addl $8, %esp

        
	pushl int_2 
	pushl int_1
	call del     
	addl $8, %esp
	pushl %eax

        mull int_2
	movl %eax, %ebx
        
       
        pushl $int_1
	movl int_1, %eax
	


	cmpl %ebx, %eax
	
	je loop_end

	jmp loop_start

loop_start:

pushl %eax
	pushl $string_warn
	call printf
	addl $8, %esp

loop_end:


        movl %ebp, %esp	
        popl %ebp
      
        movl $0, %eax

ret
