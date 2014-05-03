.data
printf_format:
	.string "%d\n"
array:
	.space 80
element_number:
	.space 4
scan:
	.string "%d"
print:
	.string "%d\n"
memor:
	.space 4
.text
.globl main

main: 	pushl 	%ebp			
        movl 	%esp, 	%ebp

	pushl 	$element_number		
	pushl	$scanform
	call	scanf
	addl	$8,	%esp

	movl	element_number,	%eax	
	movl	%eax,	memor	

	movl	$array,	%ecx	

	pushl   $array            
       	pushl   $scan
       	call    scanf
      	addl    $8,     %esp



	pushl	(%ecx)
        pushl   $print
        call    printf
        addl    $8,     %esp



	movl 	$0,	%eax		
	movl	%ebp,	%esp
	popl	%ebp
	ret
