.section .data
A: .long 128
B: .long 6
K: .long 0
O: .long 0

.section .text
.global _start


_start:	movl A, %eax
		movl B, %ebx
		movl K, %ecx

_loop:	cmpl %ebx, %eax
		jle _end
		subl %ebx, %eax
		incl %ecx
		jmp _loop

_end:	movl %ecx, K
		movl %eax, O

_exit:	movl $1, %eax
		movl O, %ebx
		int $0x80
