	.file	"ships.c"
	.text
	.globl	getShipConfig
	.type	getShipConfig, @function
getShipConfig:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movq	%rsi, -32(%rbp)
	movw	%ax, -20(%rbp)
	movl	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movswl	-20(%rbp), %eax
	cmpl	$3, %eax
	je	.L2
	cmpl	$3, %eax
	jg	.L3
	cmpl	$1, %eax
	je	.L4
	cmpl	$2, %eax
	je	.L5
	jmp	.L3
.L4:
	leaq	easy.2(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$6, -16(%rbp)
	jmp	.L3
.L5:
	leaq	medium.1(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$5, -16(%rbp)
	jmp	.L3
.L2:
	leaq	hard.0(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$5, -16(%rbp)
	nop
.L3:
	movl	$0, -12(%rbp)
	jmp	.L6
.L7:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -12(%rbp)
.L6:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L7
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	getShipConfig, .-getShipConfig
	.globl	canPlaceShip
	.type	canPlaceShip, @function
canPlaceShip:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	%r8d, -40(%rbp)
	cmpl	$0, -40(%rbp)
	je	.L10
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	cmpl	$10, %eax
	jle	.L11
	movl	$0, %eax
	jmp	.L12
.L11:
	movl	$0, -8(%rbp)
	jmp	.L13
.L15:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	cmpb	$32, %al
	je	.L14
	movl	$0, %eax
	jmp	.L12
.L14:
	addl	$1, -8(%rbp)
.L13:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L15
	jmp	.L16
.L10:
	movl	-28(%rbp), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	cmpl	$8, %eax
	jle	.L17
	movl	$0, %eax
	jmp	.L12
.L17:
	movl	$0, -4(%rbp)
	jmp	.L18
.L20:
	movl	-28(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	cmpb	$32, %al
	je	.L19
	movl	$0, %eax
	jmp	.L12
.L19:
	addl	$1, -4(%rbp)
.L18:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L20
.L16:
	movl	$1, %eax
.L12:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	canPlaceShip, .-canPlaceShip
	.globl	placeShip
	.type	placeShip, @function
placeShip:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	%r8d, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L25:
	cmpl	$0, -40(%rbp)
	je	.L23
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	movb	$60, (%rdx,%rax)
	jmp	.L24
.L23:
	movl	-28(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	movb	$60, (%rdx,%rax)
.L24:
	addl	$1, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L25
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	placeShip, .-placeShip
	.section	.rodata
	.align 16
	.type	easy.2, @object
	.size	easy.2, 24
easy.2:
	.long	4
	.long	3
	.long	3
	.long	2
	.long	2
	.long	2
	.align 16
	.type	medium.1, @object
	.size	medium.1, 20
medium.1:
	.long	4
	.long	3
	.long	2
	.long	2
	.long	1
	.align 16
	.type	hard.0, @object
	.size	hard.0, 20
hard.0:
	.long	3
	.long	2
	.long	2
	.long	1
	.long	1
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
