	.file	"t29.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Wrong args!"
.LC1:
	.string	"%d"
.LC2:
	.string	"Your array is: "
.LC3:
	.string	"%d "
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
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rcx, -40[rbp]
	mov	edx, 10
	mov	rsi, rcx
	mov	rdi, rax
	call	strtol@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L2
	cmp	QWORD PTR -32[rbp], 2147483647
	jg	.L2
	cmp	QWORD PTR -32[rbp], -2147483648
	jge	.L3
.L2:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L16
.L3:
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR -44[rbp], eax
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -64[rbp], 0
	jmp	.L5
.L6:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -64[rbp], 1
.L5:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L6
	mov	DWORD PTR -60[rbp], -1
	mov	DWORD PTR -56[rbp], 0
	jmp	.L7
.L10:
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L8
	mov	eax, DWORD PTR -56[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	and	eax, 1
	test	eax, eax
	jne	.L8
	mov	eax, DWORD PTR -56[rbp]
	mov	DWORD PTR -60[rbp], eax
	jmp	.L9
.L8:
	add	DWORD PTR -56[rbp], 1
.L7:
	mov	eax, DWORD PTR -56[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L10
.L9:
	cmp	DWORD PTR -60[rbp], -1
	jne	.L11
	mov	eax, DWORD PTR -44[rbp]
	sub	eax, 1
	mov	DWORD PTR -60[rbp], eax
.L11:
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	lea	rsi, 0[0+rdx*4]
	mov	rdx, QWORD PTR -16[rbp]
	add	rdx, rsi
	imul	eax, ecx
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -52[rbp], 1
.L12:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L13
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -48[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -48[rbp], 1
.L14:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L15
	mov	edi, 10
	call	putchar@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L16:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
