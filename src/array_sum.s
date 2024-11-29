.section .data
niz: .long 11,2,32,4,51,10
len: .long 6
count: .long 0

.section .text
.global _start

_start:
	movl $len, %eax
	subl $4, %eax
	movl len, %ebx
	movl $count, %ecx

_loop_start:
	movl (%eax), %edx
	cmpl $0, %ebx
	jle _exit
	addl %edx, (%ecx)

_loop_end:
	decl %ebx
	subl $4, %eax
	jmp _loop_start

_exit:
	movl $1, %eax
	movl count, %ebx
	int $0x80

