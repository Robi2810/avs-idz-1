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
.LC10:
	.string	"Elapsed time:"
.LC11:
	.string	"Read:\t\t%f\n"
.LC12:
	.string	"Calculations:\t%f\n"
.LC13:
	.string	"Write:\t\t%f\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 208
	mov	DWORD PTR -180[rbp], edi
	mov	QWORD PTR -192[rbp], rsi
	cmp	DWORD PTR -180[rbp], 2
	jg	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L20
.L2:
	mov	DWORD PTR -12[rbp], 2
	call	clock@PLT
	mov	QWORD PTR -72[rbp], rax
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
	lea	rdx, -168[rbp]
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -168[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	QWORD PTR -24[rbp], 1
.L5:
	mov	rax, QWORD PTR -168[rbp]
	cmp	QWORD PTR -24[rbp], rax
	jb	.L6
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L7
.L4:
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoll@PLT
	mov	QWORD PTR -168[rbp], rax
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -76[rbp], eax
	mov	rax, QWORD PTR -192[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -80[rbp], eax
	mov	DWORD PTR -12[rbp], 5
	mov	rax, QWORD PTR -168[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	QWORD PTR -32[rbp], 0
	jmp	.L8
.L9:
	call	rand@PLT
	mov	edx, eax
	mov	eax, DWORD PTR -80[rbp]
	sub	eax, DWORD PTR -76[rbp]
	mov	ecx, eax
	mov	eax, edx
	cdq
	idiv	ecx
	mov	ecx, edx
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -76[rbp]
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	QWORD PTR -32[rbp], 1
.L8:
	mov	rax, QWORD PTR -168[rbp]
	cmp	QWORD PTR -32[rbp], rax
	jb	.L9
	mov	edi, 10
	call	putchar@PLT
.L7:
	call	clock@PLT
	sub	rax, QWORD PTR -72[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -192[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -88[rbp], rax
	cmp	QWORD PTR -88[rbp], 0
	jne	.L10
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	jmp	.L20
.L10:
	call	clock@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	DWORD PTR -36[rbp], -1
	mov	QWORD PTR -48[rbp], 0
	jmp	.L11
.L14:
	mov	rax, QWORD PTR -48[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L12
	mov	rax, QWORD PTR -48[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	and	eax, 1
	test	eax, eax
	jne	.L12
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR -36[rbp], eax
	jmp	.L13
.L12:
	add	QWORD PTR -48[rbp], 1
.L11:
	mov	rax, QWORD PTR -168[rbp]
	cmp	QWORD PTR -48[rbp], rax
	jb	.L14
.L13:
	cmp	DWORD PTR -36[rbp], -1
	jne	.L15
	mov	rax, QWORD PTR -168[rbp]
	sub	eax, 1
	mov	DWORD PTR -36[rbp], eax
.L15:
	mov	rax, QWORD PTR -168[rbp]
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	jmp	.L16
.L17:
	mov	rax, QWORD PTR -56[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	rdx, QWORD PTR -56[rbp]
	lea	rsi, 0[0+rdx*4]
	mov	rdx, QWORD PTR -112[rbp]
	add	rdx, rsi
	imul	eax, ecx
	mov	DWORD PTR [rdx], eax
	add	QWORD PTR -56[rbp], 1
.L16:
	mov	rax, QWORD PTR -168[rbp]
	cmp	QWORD PTR -56[rbp], rax
	jb	.L17
	call	clock@PLT
	sub	rax, QWORD PTR -104[rbp]
	mov	QWORD PTR -120[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -128[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	jmp	.L18
.L19:
	mov	rax, QWORD PTR -64[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -112[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	QWORD PTR -64[rbp], 1
.L18:
	mov	rax, QWORD PTR -168[rbp]
	cmp	QWORD PTR -64[rbp], rax
	jb	.L19
	call	clock@PLT
	sub	rax, QWORD PTR -128[rbp]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -112[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	fclose@PLT
	cvtsi2sd	xmm0, QWORD PTR -96[rbp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -144[rbp], xmm0
	cvtsi2sd	xmm0, QWORD PTR -120[rbp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -152[rbp], xmm0
	cvtsi2sd	xmm0, QWORD PTR -136[rbp]
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -160[rbp], xmm0
	lea	rdi, .LC10[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -144[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC11[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -152[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC12[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -160[rbp]
	mov	QWORD PTR -200[rbp], rax
	movsd	xmm0, QWORD PTR -200[rbp]
	lea	rdi, .LC13[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L20:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
