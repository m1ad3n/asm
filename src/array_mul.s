.section .data
niz: .long 1,2,3,4,5
len: .long 5
sum: .long 1

.section .text
.global _start

_start:
	movl $len, %eax
	subl $4, %eax
	
_loop:
	cmpl $0, len
	je _exit

	movl (%eax), %ebx
	movl sum, %edx

_mul:
	cmpl $1, %ebx
	je _mul_end
	addl %edx, sum
	decl %ebx
	jmp _mul
	
_mul_end:
	subl $4, %eax
	decl len
	jmp _loop

_exit:
	movl $1, %eax
	movl sum, %ebx
	int $0x80

