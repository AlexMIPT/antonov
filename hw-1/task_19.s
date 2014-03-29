.data
        

scan:
        .string "%d"

print:
        .string "%d\n"

value:
        .long 0x00000000

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
        movl %ecx, %eax     
        pushl %eax          
        pushl $print
        call printf        
        addl $4, %esp
        popl %eax
        movl %eax, %ecx
        loop label

        movl %ebp, %esp  
        popl %ebp
        ret
