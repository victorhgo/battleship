	.file	"board.c"
	.text
	.section	.rodata
.LC0:
	.string	"     "
.LC1:
	.string	" %c  "
.LC2:
	.string	"    "
.LC3:
	.string	"%3d |"
.LC4:
	.string	" %c |"
	.text
	.globl	drawBoard
	.type	drawBoard, @function
drawBoard:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, %eax
	movb	%al, -44(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	leal	65(%rax), %edx
	leaq	.LC1(%rip), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -20(%rbp)
.L2:
	cmpl	$9, -20(%rbp)
	jle	.L3
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -16(%rbp)
	jmp	.L4
.L5:
	movl	$95, %edi
	call	putchar@PLT
	addl	$1, -16(%rbp)
.L4:
	cmpl	$40, -16(%rbp)
	jle	.L5
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -12(%rbp)
	jmp	.L6
.L12:
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	leaq	.LC3(%rip), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -8(%rbp)
	jmp	.L7
.L9:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	movb	%al, -21(%rbp)
	cmpb	$0, -44(%rbp)
	je	.L8
	cmpb	$60, -21(%rbp)
	jne	.L8
	movb	$32, -21(%rbp)
.L8:
	movsbl	-21(%rbp), %eax
	leaq	.LC4(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L7:
	cmpl	$9, -8(%rbp)
	jle	.L9
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L10
.L11:
	movl	$95, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L10:
	cmpl	$40, -4(%rbp)
	jle	.L11
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -12(%rbp)
.L6:
	cmpl	$7, -12(%rbp)
	jle	.L12
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	drawBoard, .-drawBoard
	.globl	clearBoard
	.type	clearBoard, @function
clearBoard:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L14
.L17:
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movb	$32, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L15:
	cmpl	$9, -4(%rbp)
	jle	.L16
	addl	$1, -8(%rbp)
.L14:
	cmpl	$7, -8(%rbp)
	jle	.L17
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	clearBoard, .-clearBoard
	.globl	mapColumns
	.type	mapColumns, @function
mapColumns:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper@PLT
	subl	$65, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	mapColumns, .-mapColumns
	.section	.rodata
	.align 8
.LC5:
	.string	"Targets hit: %d | Missed Shots: %d\n"
	.text
	.globl	showScore
	.type	showScore, @function
showScore:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leaq	.LC5(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	showScore, .-showScore
	.section	.rodata
.LC6:
	.string	"\nPress ENTER to continue..."
	.text
	.globl	pressEnterToContinue
	.type	pressEnterToContinue, @function
pressEnterToContinue:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	nop
.L23:
	call	getchar@PLT
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L22
	cmpl	$-1, -4(%rbp)
	jne	.L23
.L22:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	nop
.L25:
	call	getchar@PLT
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L26
	cmpl	$-1, -4(%rbp)
	jne	.L25
.L26:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	pressEnterToContinue, .-pressEnterToContinue
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
