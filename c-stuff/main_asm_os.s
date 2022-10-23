	.file	"t29.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: ./main <input> <output>"
.LC1:
	.string	"-r"
.LC2:
	.string	"r"
.LC3:
	.string	"%llu"
.LC4:
	.string	"%d"
.LC5:
	.string	"%d "
.LC6:
	.string	"w"
.LC7:
	.string	"Wrong fname"
.LC8:
	.string	"%d\n"
.LC9:
	.string	"Elapsed time:"
.LC11:
	.string	"Read:\t\t%f\n"
.LC12:
	.string	"Calculations:\t%f\n"
.LC13:
	.string	"Write:\t\t%f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 56
	cmp	edi, 2
	jg	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	jmp	.L3
.L2:
	mov	r12, rsi
	call	clock@PLT
	mov	rbx, QWORD PTR 8[r12]
	lea	rsi, .LC1[rip]
	mov	QWORD PTR 8[rsp], rax
	mov	rdi, rbx
	call	strcmp@PLT
	test	eax, eax
	je	.L4
	lea	rsi, .LC2[rip]
	mov	rdi, rbx
	lea	r14, .LC4[rip]
	xor	ebp, ebp
	call	fopen@PLT
	lea	rdx, 40[rsp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	r13, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR 40[rsp]
	lea	rdi, 0[0+rax*4]
	call	malloc@PLT
	mov	rbx, rax
.L5:
	cmp	QWORD PTR 40[rsp], rbp
	jbe	.L22
	lea	rdx, [rbx+rbp*4]
	mov	rsi, r14
	mov	rdi, r13
	xor	eax, eax
	inc	rbp
	call	__isoc99_fscanf@PLT
	jmp	.L5
.L22:
	mov	rdi, r13
	mov	r13d, 2
	call	fclose@PLT
	jmp	.L7
.L4:
	mov	rdi, QWORD PTR 16[r12]
	xor	ebp, ebp
	call	atoll@PLT
	mov	rdi, QWORD PTR 24[r12]
	mov	rbx, rax
	mov	QWORD PTR 40[rsp], rax
	call	atoi@PLT
	mov	rdi, QWORD PTR 32[r12]
	mov	r14d, eax
	call	atoi@PLT
	lea	rdi, 0[0+rbx*4]
	mov	r13d, eax
	sub	r13d, r14d
	call	malloc@PLT
	xor	edi, edi
	mov	rbx, rax
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
.L8:
	cmp	QWORD PTR 40[rsp], rbp
	jbe	.L23
	call	rand@PLT
	cdq
	lea	rsi, .LC5[rip]
	mov	edi, 1
	idiv	r13d
	xor	eax, eax
	add	edx, r14d
	mov	DWORD PTR [rbx+rbp*4], edx
	inc	rbp
	call	__printf_chk@PLT
	jmp	.L8
.L23:
	mov	edi, 10
	mov	r13d, 5
	call	putchar@PLT
.L7:
	call	clock@PLT
	mov	rdi, QWORD PTR [r12+r13*8]
	lea	rsi, .LC6[rip]
	mov	rbp, rax
	call	fopen@PLT
	test	rax, rax
	mov	r12, rax
	jne	.L10
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	rdi, rbx
	call	free@PLT
	jmp	.L3
.L10:
	call	clock@PLT
	mov	r15, QWORD PTR 40[rsp]
	mov	QWORD PTR 16[rsp], rax
	xor	eax, eax
.L11:
	cmp	r15, rax
	je	.L13
	mov	edx, DWORD PTR [rbx+rax*4]
	test	edx, edx
	jns	.L12
	and	dl, 1
	jne	.L12
	mov	r14d, eax
	inc	eax
	jne	.L14
	jmp	.L13
.L12:
	inc	rax
	jmp	.L11
.L13:
	lea	r14d, -1[r15]
.L14:
	lea	rdi, 0[0+r15*4]
	call	malloc@PLT
	movsx	rdx, r14d
	mov	r13, rax
	xor	eax, eax
	lea	rcx, [rbx+rdx*4]
.L16:
	cmp	r15, rax
	je	.L24
	mov	edx, DWORD PTR [rbx+rax*4]
	imul	edx, DWORD PTR [rcx]
	mov	DWORD PTR 0[r13+rax*4], edx
	inc	rax
	jmp	.L16
.L24:
	call	clock@PLT
	sub	rax, QWORD PTR 16[rsp]
	lea	r15, .LC8[rip]
	xor	r14d, r14d
	mov	QWORD PTR 16[rsp], rax
	call	clock@PLT
	mov	QWORD PTR 24[rsp], rax
.L18:
	cmp	QWORD PTR 40[rsp], r14
	jbe	.L25
	mov	ecx, DWORD PTR 0[r13+r14*4]
	mov	rdx, r15
	mov	esi, 1
	mov	rdi, r12
	xor	eax, eax
	inc	r14
	call	__fprintf_chk@PLT
	jmp	.L18
.L25:
	call	clock@PLT
	sub	rax, QWORD PTR 24[rsp]
	mov	rdi, rbx
	mov	r14, rax
	call	free@PLT
	mov	rdi, r13
	call	free@PLT
	mov	rdi, r12
	call	fclose@PLT
	lea	rdi, .LC9[rip]
	call	puts@PLT
	sub	rbp, QWORD PTR 8[rsp]
	lea	rsi, .LC11[rip]
	mov	edi, 1
	mov	al, 1
	cvtsi2sd	xmm0, rbp
	divsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	cvtsi2sd	xmm0, QWORD PTR 16[rsp]
	divsd	xmm0, QWORD PTR .LC10[rip]
	lea	rsi, .LC12[rip]
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	cvtsi2sd	xmm0, r14
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	al, 1
	divsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
.L3:
	add	rsp, 56
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
