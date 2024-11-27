.section .data
A: .long 4
B: .long 11
R: .long 0

.section .text
.global _start


_start:
	movl B, %ebx
	movl R, %ecx
	movl $1, %ecx
	cmpl $0, %ebx
	je _end

_step:
	cmpl $0, %ebx
	jle _end
	movl A, %eax
	movl %ecx, %edx

_loop:
	cmpl $1, %eax
	jle _endlo
	addl %edx, %ecx
	decl %eax
	jmp _loop

_endlo:
	decl %ebx
	jmp _step

_end:
	movl %ecx, R

_exit:
	movl $1, %eax
	movl R, %ebx
	int $0x80

