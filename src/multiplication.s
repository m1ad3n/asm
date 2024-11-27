.section .data
A: .long 11
B: .long 6
P: .long 0

.section .text
.global _start
_start:
	movl A, %eax
	movl B, %ebx
	movl P, %ecx
_loop:
	cmpl $0, %ebx
	je _end
	addl %eax, %ecx
	decl %ebx
	jmp _loop

_end:
	movl %ecx, P

_exit:
	movl $1, %eax
	movl P, %ebx
	int $0x80
