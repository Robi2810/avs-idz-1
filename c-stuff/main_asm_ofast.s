	.file	"t29.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Usage: ./main <input> <output>"
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.p2align 4,,15
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
	jle	.L46
	mov	r13, rsi
	call	clock@PLT
	mov	rbx, QWORD PTR 8[r13]
	lea	rsi, .LC1[rip]
	mov	QWORD PTR 16[rsp], rax
	mov	rdi, rbx
	call	strcmp@PLT
	test	eax, eax
	je	.L4
	lea	rsi, .LC2[rip]
	mov	rdi, rbx
	call	fopen@PLT
	lea	rdx, 40[rsp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	r12, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rbp, QWORD PTR 40[rsp]
	lea	rdi, 0[0+rbp*4]
	call	malloc@PLT
	test	rbp, rbp
	mov	rbx, rax
	je	.L5
	lea	r14, .LC4[rip]
	mov	r15, rax
	xor	ebp, ebp
	.p2align 4,,10
	.p2align 3
.L6:
	mov	rdx, r15
	xor	eax, eax
	mov	rsi, r14
	mov	rdi, r12
	add	rbp, 1
	add	r15, 4
	call	__isoc99_fscanf@PLT
	cmp	QWORD PTR 40[rsp], rbp
	ja	.L6
.L5:
	mov	rdi, r12
	mov	ebp, 2
	call	fclose@PLT
.L7:
	call	clock@PLT
	mov	rdi, QWORD PTR 0[r13+rbp*8]
	lea	rsi, .LC6[rip]
	mov	QWORD PTR 8[rsp], rax
	call	fopen@PLT
	test	rax, rax
	mov	rbp, rax
	je	.L47
	call	clock@PLT
	mov	r15, QWORD PTR 40[rsp]
	mov	r14, rax
	test	r15, r15
	je	.L11
	xor	eax, eax
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L12:
	add	rax, 1
	cmp	r15, rax
	je	.L11
.L14:
	mov	edx, DWORD PTR [rbx+rax*4]
	test	edx, edx
	jns	.L12
	and	edx, 1
	jne	.L12
	mov	r13d, eax
	add	eax, 1
	je	.L11
	lea	rdi, 0[0+r15*4]
	call	malloc@PLT
	mov	r12, rax
	jmp	.L23
.L4:
	mov	rdi, QWORD PTR 16[r13]
	xor	esi, esi
	mov	edx, 10
	call	strtoll@PLT
	mov	rdi, QWORD PTR 24[r13]
	xor	esi, esi
	mov	edx, 10
	mov	QWORD PTR 40[rsp], rax
	call	strtol@PLT
	mov	rdi, QWORD PTR 32[r13]
	xor	esi, esi
	mov	edx, 10
	mov	rbp, rax
	mov	r14d, eax
	call	strtol@PLT
	mov	r12, rax
	mov	rax, QWORD PTR 40[rsp]
	lea	rdi, 0[0+rax*4]
	call	malloc@PLT
	xor	edi, edi
	mov	rbx, rax
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	QWORD PTR 40[rsp], 0
	je	.L8
	lea	r15, .LC5[rip]
	sub	r12d, ebp
	xor	ebp, ebp
	.p2align 4,,10
	.p2align 3
.L9:
	call	rand@PLT
	cdq
	mov	rsi, r15
	mov	edi, 1
	idiv	r12d
	xor	eax, eax
	add	edx, r14d
	mov	DWORD PTR [rbx+rbp*4], edx
	add	rbp, 1
	call	__printf_chk@PLT
	cmp	QWORD PTR 40[rsp], rbp
	ja	.L9
.L8:
	mov	edi, 10
	mov	ebp, 5
	call	putchar@PLT
	jmp	.L7
.L46:
	lea	rdi, .LC0[rip]
	call	puts@PLT
.L42:
	add	rsp, 56
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L11:
	lea	rdi, 0[0+r15*4]
	lea	r13d, -1[r15]
	call	malloc@PLT
	test	r15, r15
	mov	r12, rax
	je	.L15
.L23:
	mov	rcx, rbx
	mov	edx, 4
	movsx	r13, r13d
	shr	rcx, 2
	mov	edi, DWORD PTR [rbx+r13*4]
	neg	rcx
	and	ecx, 3
	lea	rax, 3[rcx]
	cmp	rax, 4
	cmovb	rax, rdx
	lea	rdx, -1[r15]
	cmp	rax, rdx
	ja	.L24
	test	rcx, rcx
	je	.L25
	mov	eax, DWORD PTR [rbx]
	imul	eax, edi
	cmp	rcx, 1
	mov	DWORD PTR [r12], eax
	je	.L26
	mov	eax, DWORD PTR 4[rbx]
	imul	eax, edi
	cmp	rcx, 3
	mov	DWORD PTR 4[r12], eax
	jne	.L27
	mov	eax, DWORD PTR 8[rbx]
	mov	esi, 3
	imul	eax, edi
	mov	DWORD PTR 8[r12], eax
.L17:
	mov	DWORD PTR 24[rsp], edi
	mov	r10, r15
	xor	eax, eax
	movd	xmm4, DWORD PTR 24[rsp]
	sub	r10, rcx
	sal	rcx, 2
	mov	r8, r10
	lea	r11, [rbx+rcx]
	xor	edx, edx
	pshufd	xmm2, xmm4, 0
	shr	r8, 2
	add	rcx, r12
	movdqa	xmm3, xmm2
	psrlq	xmm3, 32
	.p2align 4,,10
	.p2align 3
.L19:
	movdqa	xmm0, XMMWORD PTR [r11+rax]
	add	rdx, 1
	movdqa	xmm1, xmm2
	psrlq	xmm0, 32
	pmuludq	xmm0, xmm3
	pshufd	xmm0, xmm0, 8
	pmuludq	xmm1, XMMWORD PTR [r11+rax]
	pshufd	xmm1, xmm1, 8
	punpckldq	xmm1, xmm0
	movups	XMMWORD PTR [rcx+rax], xmm1
	add	rax, 16
	cmp	r8, rdx
	ja	.L19
	mov	rax, r10
	and	rax, -4
	add	rsi, rax
	cmp	rax, r10
	je	.L15
.L16:
	mov	eax, DWORD PTR [rbx+rsi*4]
	imul	eax, edi
	mov	DWORD PTR [r12+rsi*4], eax
	lea	rax, 1[rsi]
	cmp	r15, rax
	jbe	.L15
	mov	edx, DWORD PTR [rbx+rax*4]
	imul	edx, edi
	mov	DWORD PTR [r12+rax*4], edx
	lea	rax, 2[rsi]
	cmp	r15, rax
	jbe	.L15
	mov	edx, DWORD PTR [rbx+rax*4]
	imul	edx, edi
	mov	DWORD PTR [r12+rax*4], edx
	lea	rax, 3[rsi]
	cmp	r15, rax
	jbe	.L15
	mov	edx, DWORD PTR [rbx+rax*4]
	imul	edx, edi
	mov	DWORD PTR [r12+rax*4], edx
	lea	rax, 4[rsi]
	cmp	r15, rax
	jbe	.L15
	mov	edx, DWORD PTR [rbx+rax*4]
	add	rsi, 5
	imul	edx, edi
	cmp	r15, rsi
	mov	DWORD PTR [r12+rax*4], edx
	jbe	.L15
	imul	edi, DWORD PTR [rbx+rsi*4]
	mov	DWORD PTR [r12+rsi*4], edi
.L15:
	call	clock@PLT
	sub	rax, r14
	mov	r15, rax
	call	clock@PLT
	cmp	QWORD PTR 40[rsp], 0
	mov	QWORD PTR 24[rsp], rax
	je	.L21
	lea	r13, .LC8[rip]
	xor	r14d, r14d
	.p2align 4,,10
	.p2align 3
.L22:
	mov	ecx, DWORD PTR [r12+r14*4]
	xor	eax, eax
	mov	rdx, r13
	mov	esi, 1
	mov	rdi, rbp
	add	r14, 1
	call	__fprintf_chk@PLT
	cmp	QWORD PTR 40[rsp], r14
	ja	.L22
.L21:
	call	clock@PLT
	sub	rax, QWORD PTR 24[rsp]
	mov	rdi, rbx
	mov	r13, rax
	call	free@PLT
	mov	rdi, r12
	call	free@PLT
	mov	rdi, rbp
	call	fclose@PLT
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	r12, QWORD PTR 8[rsp]
	sub	r12, QWORD PTR 16[rsp]
	lea	rsi, .LC11[rip]
	pxor	xmm0, xmm0
	mov	edi, 1
	mov	eax, 1
	cvtsi2sdq	xmm0, r12
	mulsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	pxor	xmm0, xmm0
	lea	rsi, .LC12[rip]
	mov	edi, 1
	mov	eax, 1
	cvtsi2sdq	xmm0, r15
	mulsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	pxor	xmm0, xmm0
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 1
	cvtsi2sdq	xmm0, r13
	mulsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	jmp	.L42
.L26:
	mov	esi, 1
	jmp	.L17
.L47:
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	rdi, rbx
	call	free@PLT
	jmp	.L42
.L25:
	xor	esi, esi
	jmp	.L17
.L27:
	mov	esi, 2
	jmp	.L17
.L24:
	xor	esi, esi
	jmp	.L16
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
