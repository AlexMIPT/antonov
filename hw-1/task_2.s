 .data
       scanf_block:
        .string "%d"

printf_block:
        .string "%d"
value:
        .long 0x00000000


.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp  
        pushl $value
        pushl $scanf_block
        call scanf    
        addl $8, %esp
        shll value    
        movl $31, %ecx
        movl $0, %ebx
label_0:
        pushl %ecx
        shll value
        jc label_1
        pushl $0
        jmp label_2
label_1:
        pushl $1
        movl $1, %ebx
label_2:
        pushl $printf_block
        cmp $0, %ebx     
        je label_3           
       call printf
label_3:
        addl $8, %esp
        popl %ecx
        loop label_0
	cmp $0, %ebx
	jne end     
	pushl $0       
	pushl $printf_block
	call printf
	addl $8, %ecx
end:
        movl %ebp, %esp  
        popl %ebp
        ret
