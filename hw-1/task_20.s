 .data
        
        .comm array,404,32 
    
value:
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

        pushl $value
        pushl $scan
        call scanf   
        addl $8, %esp  

        movl value, %ecx
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
        movl value, %ecx  
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
