	.file	"t29.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Usage: ./main <input> <output>"
.LC1:
	.string	"-r"
.LC2:
	.string	"r"
.LC3:
	.string	"Wrong fname"
.LC4:
	.string	"%llu"
	.align 8
.LC5:
	.string	"Length is greater than 100000000!"
.LC6:
	.string	"%d"
.LC7:
	.string	"%d "
.LC8:
	.string	"w"
.LC9:
	.string	"%d\n"
.LC11:
	.string	"Elapsed time:"
.LC12:
	.string	"Read:\t\t%f\n"
.LC13:
	.string	"Calculations:\t%f\n"
.LC14:
	.string	"Write:\t\t%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 208
	mov	DWORD PTR -180[rbp], edi
	mov	QWORD PTR -192[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -180[rbp], 2
	jg	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L23
.L2:
	mov	DWORD PTR -168[rbp], 2
	call	clock@PLT
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L4
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -88[rbp], rax
	cmp	QWORD PTR -88[rbp], 0
	jne	.L5
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L23
.L5:
	lea	rdx, -152[rbp]
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -152[rbp]
	cmp	rax, 100000000
	jbe	.L6
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L23
.L6:
	mov	rax, QWORD PTR -152[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -144[rbp], rax
	mov	QWORD PTR -136[rbp], 0
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -136[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	QWORD PTR -136[rbp], 1
.L7:
	mov	rax, QWORD PTR -152[rbp]
	cmp	QWORD PTR -136[rbp], rax
	jb	.L8
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L9
.L4:
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoll@PLT
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR -152[rbp]
	cmp	rax, 100000000
	jbe	.L10
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L23
.L10:
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -160[rbp], eax
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -156[rbp], eax
	mov	DWORD PTR -168[rbp], 5
	mov	rax, QWORD PTR -152[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -144[rbp], rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	QWORD PTR -128[rbp], 0
	jmp	.L11
.L12:
	call	rand@PLT
	mov	edx, eax
	mov	eax, DWORD PTR -156[rbp]
	sub	eax, DWORD PTR -160[rbp]
	mov	ecx, eax
	mov	eax, edx
	cdq
	idiv	ecx
	mov	ecx, edx
	mov	rax, QWORD PTR -128[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -160[rbp]
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -128[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	add	QWORD PTR -128[rbp], 1
.L11:
	mov	rax, QWORD PTR -152[rbp]
	cmp	QWORD PTR -128[rbp], rax
	jb	.L12
	mov	edi, 10
	call	putchar@PLT
.L9:
	call	clock@PLT
	sub	rax, QWORD PTR -96[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -168[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -192[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -88[rbp], rax
	cmp	QWORD PTR -88[rbp], 0
	jne	.L13
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -144[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	jmp	.L23
.L13:
	call	clock@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -164[rbp], -1
	mov	QWORD PTR -120[rbp], 0
	jmp	.L14
.L17:
	mov	rax, QWORD PTR -120[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L15
	mov	rax, QWORD PTR -120[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	and	eax, 1
	test	eax, eax
	jne	.L15
	mov	rax, QWORD PTR -120[rbp]
	mov	DWORD PTR -164[rbp], eax
	jmp	.L16
.L15:
	add	QWORD PTR -120[rbp], 1
.L14:
	mov	rax, QWORD PTR -152[rbp]
	cmp	QWORD PTR -120[rbp], rax
	jb	.L17
.L16:
	cmp	DWORD PTR -164[rbp], -1
	jne	.L18
	mov	rax, QWORD PTR -152[rbp]
	sub	eax, 1
	mov	DWORD PTR -164[rbp], eax
.L18:
	mov	rax, QWORD PTR -152[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -112[rbp], 0
	jmp	.L19
.L20:
	mov	rax, QWORD PTR -112[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, DWORD PTR -164[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -144[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	rdx, QWORD PTR -112[rbp]
	lea	rsi, 0[0+rdx*4]
	mov	rdx, QWORD PTR -64[rbp]
	add	rdx, rsi
	imul	eax, ecx
	mov	DWORD PTR [rdx], eax
	add	QWORD PTR -112[rbp], 1
.L19:
	mov	rax, QWORD PTR -152[rbp]
	cmp	QWORD PTR -112[rbp], rax
	jb	.L20
	call	clock@PLT
	sub	rax, QWORD PTR -72[rbp]
	mov	QWORD PTR -56[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -104[rbp], 0
	jmp	.L21
.L22:
	mov	rax, QWORD PTR -104[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -64[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	QWORD PTR -104[rbp], 1
.L21:
	mov	rax, QWORD PTR -152[rbp]
	cmp	QWORD PTR -104[rbp], rax
	jb	.L22
	call	clock@PLT
	sub	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -144[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	fclose@PLT
	cvtsi2sd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	cvtsi2sd	xmm0, QWORD PTR -56[rbp]
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	cvtsi2sd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	lea	rdi, .LC11[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC12[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC13[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC14[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L23:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
