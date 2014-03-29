  .data

        .comm person,204,32 

scanf_c:
        .string "%c"

scanf_d:
        .string "%d"

printf_c:
        .string "%c"

printf_other:
        .string "Initials\n%c.%c.\nAge\n%d\n"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp 
        movl $person, %ebx
family:
        pushl %ebx
        pushl $scanf_c
        call scanf
        addl $8, %esp       
        movl (%ebx), %eax
        cmp $32, %eax
        jne family_fix
        jmp behind_name

family_fix:
        addl $1, %ebx      
        jmp family

behind_name:
        movl $person+100, %ebx
name:
        pushl %ebx
        pushl $scanf_c
        call scanf       
        addl $8, %esp
        movl (%ebx), %eax
        cmp $32, %eax
        jne name_fix
        jmp age

name_fix:
        addl $1, %ebx     
        jmp name

age:
        pushl $person+200
        pushl $scanf_d
        call scanf       
        addl $8, %esp

        movl $person+200, %ebx
        pushl (%ebx)
        movl $person+100, %ebx
        pushl (%ebx)
        movl $person, %ebx
        pushl (%ebx)
        pushl $printf_other
        call printf    
        addl $16, %esp
            
        movl %ebp, %esp   
        popl %ebp
        ret
