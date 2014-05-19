  .data
string_CF:
  .string "%d "
string_ZF:
  .string "%d\n"
string_SF:
  .string "%d "
string_OF:
  .string "%d "
int_1:
  .space 4
string:
  .string "%d "

  .macro OUTF
L0:
  pushl $0
  jmp L8

L1:
  pushl $1
  jmp L8

L2:
  pushl $0
  jmp L10

L3:
  pushl $1
  jmp L10

L4:
  pushl $0
  jmp L11

L5:
  pushl $1
  jmp L11

L6:
  pushl $0
  jmp L9

L7:
  pushl $1
  jmp L9

  pushl %eax
  pushl %ebx
  pushl %ecx
  pushl %edx

  je L0
  jne L1

L8:
  jb L6
  jae L7

L9:
  js L2
  jns L3

L10:
  jno L4
  jo L5

L11:
  pushl $string_OF
  call printf
  addl $8, %esp

  pushl $string_SF
  call printf
  addl $8, %esp

  pushl $string_CF
  call printf
  addl $8, %esp

  pushl $string_ZF
  call printf
  addl $8, %esp

  popl %edx
  popl %ecx
  popl %ebx
  popl %eax
.endm
.text
.globl main
  main:


pushl %ebp
movl %esp, %ebp

pushl $int_1
pushl $string
call scanf

OUTF


movl $0, %eax
movl %ebp, %esp
popl %ebp

ret
