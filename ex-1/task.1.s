        .data
scanf_str:
        .string "%c"
.set scanf_str_length, . - scanf_str -1
.text
.globl main
.type main, @function

main:
        movl $4, %eax
        movl $1, %ebx
        movl $scanf_str, %ecx
        movl $scanf_str_length, %edx
        int $0x80

        movl $1, %eax
        movl $0, %ebx

        int $0x80
.size main, . - main
