
.section .data
niz: .long 1,2,3,4,5
drugi_niz: .long 0,0,0

len: .long 6
pow_res: .long 0

.section .text
.global _start
_start:
	movl $niz, %eax
	movl $drugi_niz, %ecx

_loop:
	cmp $drugi_niz, %eax
	jge _exit

	movl (%eax), %ebx
	movl %ebx, %edx
	movl $0, pow_res

_pow_2:
	cmp $0, %edx
	je _pow_end
	addl %ebx, pow_res
	decl %edx
	jmp _pow_2

_pow_end:
	movl pow_res, %ebx
	movl %ebx, (%ecx)
	addl $8, %eax
	addl $4, %ecx
	jmp _loop

_exit:
	movl $1, %eax
	movl $1, %ecx
	movl drugi_niz(,%ecx,4), %ebx
	int $0x80

