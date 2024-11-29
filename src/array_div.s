.section .data
niz1: .long 52,21,125,43,15,25
niz2: .long 54,42,5,313,126,7
niz3: .long 0,0,0,0,0,0

.section .text
.global _start
_start:
	movl $niz1, %eax
	movl $niz3, %ecx
	subl $4, %ecx
	movl $niz3, %ebx

_loop:
	cmp $niz2, %eax
	jge _exit

	movl (%eax), %edx
	movl (%ecx), %esi

_div:
	cmpl %esi, %edx
	jle _loop_end
	subl %esi, %edx
	incl (%ebx)
	jmp _div

_loop_end:
	addl $4, %eax
	subl $4, %ecx
	addl $4, %ebx
	jmp _loop

_exit:
	movl $1, %eax
	movl $3, %ecx
	movl niz3(,%ecx,4), %ebx
	int $0x80

