.data
	.globl a

        a:
            .space 4

	.globl b

        b:
            .space 4
	.globl c

        c:
            .space 4
	.globl d

        d:
            .space 4
	.globl e

        e:
            .space 4
	.globl case
	case:
		.space 4	
	in:
            .string "%d"

        out:
            .string "%d\n"
            .text
            .globl pointer
            
    pointer:
            pushl   %ebp
            movl    %esp, %ebp

	  cmpl	$1, case
	  je	label_1

	    cmpl  $2, case
          je   label_2
	    cmpl  $3, case
          je    label_3

	    cmpl  $4, case
          je   label_4
	    cmpl  $5, case
          je    label_5
label_1: 
	movl $a, %eax
	jmp next
label_2:    
        movl $b, %eax
	jmp next

label_3:    
        movl $c, %eax
	jmp next
label_4:    
        movl $d, %eax
	jmp next

label_5:    
        movl $e, %eax
	jmp next


next:
	    movl    %ebp, %esp
            popl    %ebp
            
            ret

	.globl main
            
    main:
            pushl   %ebp
            movl    %esp, %ebp

            pushl	$case
	    pushl	$in
	    call	scanf
            call    pointer
            
            pushl   %eax
            pushl   $out
            call    printf
            addl    $8, %esp
            movl    $0, %eax
            
            movl $0,%eax
            movl    %ebp, %esp
            popl    %ebp
            ret
