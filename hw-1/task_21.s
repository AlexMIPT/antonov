        .data

        .comm array,40004,32

value1:
        .long 0x00000000

value2:
        .long 0x00000000

scan:
        .string "%d"

print:
        .string "%d\n"

.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp  

	pushl $value1
        pushl $scan
        call scanf
        addl $8, %esp  

        pushl $value2
        pushl $scan
        call scanf
        addl $8, %esp  

        movl value1, %eax
        mulw value2
        movl %eax, %ecx
label:
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
        loop label  

        movl $array+4, %ebx
        movl (%ebx), %eax
        movl $array, %ebx
        movl value1, %eax
        mulw value2
        movl %eax, %ecx 
label_search:
        addl $4, %ebx
        cmp %eax, (%ebx)
        jle less
next:
        loop label_search  
        jmp finish

less:
        movl (%ebx), %eax 
        jmp next

finish:
        pushl %eax 
        pushl $print
        call printf
        addl $8, %esp

        movl %ebp, %esp  
        popl %ebp
        ret
