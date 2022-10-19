	.file	"t29.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Wrong args!"
.LC1:
	.string	"%d"
.LC2:
	.string	"Your array is: "
.LC3:
	.string	"%d "
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	r15
	push	r14
	mov	edx, 10
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 24
	mov	rdi, QWORD PTR 8[rsi]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rsi, rax
	call	strtol@PLT
	mov	r13, rax
	mov	rax, QWORD PTR [rsp]
	cmp	BYTE PTR [rax], 0
	jne	.L2
	mov	eax, 2147483648
	mov	edx, 4294967295
	add	rax, r13
	cmp	rax, rdx
	jbe	.L3
.L2:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	jmp	.L4
.L3:
	lea	r14, 0[0+r13*4]
	mov	r12d, r13d
	xor	ebp, ebp
	mov	rdi, r14
	call	malloc@PLT
	mov	rbx, rax
	mov	r15, rax
.L5:
	cmp	ebp, r12d
	jge	.L24
	lea	rdi, .LC1[rip]
	mov	rsi, r15
	xor	eax, eax
	inc	ebp
	add	r15, 4
	call	__isoc99_scanf@PLT
	jmp	.L5
.L24:
	xor	eax, eax
.L7:
	cmp	eax, r12d
	mov	ebp, eax
	jge	.L25
	mov	edx, DWORD PTR [rbx+rax*4]
	test	edx, edx
	jns	.L8
	and	dl, 1
	je	.L9
.L8:
	inc	rax
	jmp	.L7
.L25:
	lea	ebp, -1[r13]
.L9:
	mov	rdi, r14
	movsx	rbp, ebp
	call	malloc@PLT
	lea	rcx, [rbx+rbp*4]
	mov	r13, rax
	xor	eax, eax
.L12:
	cmp	r12d, eax
	jle	.L26
	mov	edx, DWORD PTR [rbx+rax*4]
	imul	edx, DWORD PTR [rcx]
	mov	DWORD PTR 0[r13+rax*4], edx
	inc	rax
	jmp	.L12
.L26:
	lea	rsi, .LC2[rip]
	lea	r14, .LC3[rip]
	mov	edi, 1
	xor	eax, eax
	xor	ebp, ebp
	call	__printf_chk@PLT
.L14:
	cmp	r12d, ebp
	jle	.L27
	mov	edx, DWORD PTR 0[r13+rbp*4]
	mov	rsi, r14
	mov	edi, 1
	xor	eax, eax
	inc	rbp
	call	__printf_chk@PLT
	jmp	.L14
.L27:
	mov	edi, 10
	call	putchar@PLT
	mov	rdi, rbx
	call	free@PLT
	mov	rdi, r13
	call	free@PLT
.L4:
	xor	eax, eax
	mov	rcx, QWORD PTR 8[rsp]
	xor	rcx, QWORD PTR fs:40
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	add	rsp, 24
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
