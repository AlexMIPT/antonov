        .data
str_1:
        .string "%d\n"
str_2:
        .string "%d\n"
scan:
        .string "%d %d"
        
        .text

        .globl main
        
main:


        pushl %ebp	
        movl %esp, %ebp

        pushl $str_1
        pushl $str_2
        pushl $scan
        call scanf	
        addl $8, %esp














ret
