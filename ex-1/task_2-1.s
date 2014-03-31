      	.data
scan:
        .string "%d"

print:
        .string "%d\n"

value:
        .long 0x80

.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp 
        pushl $value
        pushl $scan
        call scanf
        addl $4, %esp
        movl value, %ebx
        pushl $value
        pushl $scan
        call scanf
        addl $4, %esp
        movl value, %eax 

        addl %eax, %ebx

        pushl %ebx
        pushl $print
        call printf
        addl $4, %esp

        movl %ebp, %esp
        popl %ebp
        movl $0, %eax
        ret
