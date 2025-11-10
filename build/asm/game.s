	.file	"game.c"
	.text
	.section	.rodata
.LC0:
	.string	"clear"
	.align 8
.LC1:
	.string	"--- Select Difficulty Level ---"
	.align 8
.LC2:
	.string	"[E] Easy - More ships and more shots"
	.align 8
.LC3:
	.string	"[M] Medium - Fewer ships and shots"
	.align 8
.LC4:
	.string	"[H] Hard - Ships are smaller and only 5 misses allowed."
.LC5:
	.string	">>> "
.LC6:
	.string	" %c"
	.align 8
.LC7:
	.string	"Invalid option! Please enter E, M, or H."
	.text
	.globl	chooseDifficulty
	.type	chooseDifficulty, @function
chooseDifficulty:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
	jmp	.L2
.L8:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-13(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-13(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$109, %eax
	je	.L3
	cmpl	$109, %eax
	jg	.L4
	cmpl	$101, %eax
	je	.L5
	cmpl	$104, %eax
	je	.L6
	jmp	.L4
.L5:
	movl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	jmp	.L9
.L3:
	movl	$2, -12(%rbp)
	movl	-12(%rbp), %eax
	jmp	.L9
.L6:
	movl	$3, -12(%rbp)
	movl	-12(%rbp), %eax
	jmp	.L9
.L4:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L2:
	cmpl	$0, -12(%rbp)
	je	.L8
	movl	-12(%rbp), %eax
.L9:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	chooseDifficulty, .-chooseDifficulty
	.globl	newSeed
	.type	newSeed, @function
newSeed:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movl	%esi, %eax
	movw	%ax, -92(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	clearBoard@PLT
	movswl	-92(%rbp), %eax
	leaq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	getShipConfig@PLT
	movl	%eax, -68(%rbp)
	movl	$0, -76(%rbp)
	jmp	.L12
.L16:
	movl	$0, -72(%rbp)
	movl	-76(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, -64(%rbp)
	jmp	.L14
.L15:
	call	rand@PLT
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	%edx, -60(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, -56(%rbp)
	movl	-56(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, -56(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	subl	%eax, %edx
	movl	%edx, -52(%rbp)
	movl	-64(%rbp), %ecx
	movl	-52(%rbp), %edi
	movl	-56(%rbp), %edx
	movl	-60(%rbp), %esi
	movq	-88(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	canPlaceShip@PLT
	testl	%eax, %eax
	je	.L14
	movl	-64(%rbp), %ecx
	movl	-52(%rbp), %edi
	movl	-56(%rbp), %edx
	movl	-60(%rbp), %esi
	movq	-88(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	placeShip@PLT
	movl	$1, -72(%rbp)
.L14:
	cmpl	$0, -72(%rbp)
	je	.L15
	addl	$1, -76(%rbp)
.L12:
	movl	-76(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L16
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	newSeed, .-newSeed
	.section	.rodata
	.align 8
.LC8:
	.string	"Implementation of Battleship - v0.1"
	.align 8
.LC9:
	.string	"-----------------------------------"
.LC10:
	.string	"1. Play it"
.LC11:
	.string	"2. Instructions"
.LC12:
	.string	"3. Exit\n"
.LC13:
	.string	"by Victor Correa"
.LC14:
	.string	"Enter option >>> "
	.align 8
.LC15:
	.string	"--- Battleship by Victor Correa ---"
	.align 8
.LC16:
	.string	"You are playing the classic Battleship game."
	.align 8
.LC17:
	.string	"You need to sink the enemy ships that are placed across the board."
	.align 8
.LC18:
	.string	"To make a shot, simply enter coordinates like A5 for instance.\n"
.LC19:
	.string	"Used Symbols:"
.LC20:
	.string	"  '*' - You hit a ship"
.LC21:
	.string	"  'o' - You missed a shop"
.LC22:
	.string	"  ' ' - Ocean\n"
.LC23:
	.string	"Good luck! And enjoy it :)"
.LC24:
	.string	"Invalid option! Try again."
	.text
	.globl	welcomeMenu
	.type	welcomeMenu, @function
welcomeMenu:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L25:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-9(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-9(%rbp), %eax
	cmpb	$51, %al
	je	.L19
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$101, %eax
	jne	.L20
.L19:
	call	exitMsg
.L20:
	movzbl	-9(%rbp), %eax
	cmpb	$50, %al
	je	.L21
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$104, %eax
	jne	.L22
.L21:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	pressEnterToContinue@PLT
	jmp	.L23
.L22:
	movzbl	-9(%rbp), %eax
	cmpb	$49, %al
	je	.L27
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$115, %eax
	je	.L27
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	pressEnterToContinue@PLT
.L23:
	jmp	.L25
.L27:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	welcomeMenu, .-welcomeMenu
	.section	.rodata
.LC25:
	.string	"Press (S) to sort ships"
.LC26:
	.string	"Press (P) to play the game"
	.align 8
.LC27:
	.string	"Press (D) to change difficulty"
.LC28:
	.string	"Press (E) to exit\n>>> "
	.text
	.globl	selectionMenu
	.type	selectionMenu, @function
selectionMenu:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	selectionMenu, .-selectionMenu
	.section	.rodata
.LC29:
	.string	"Exiting game..."
	.text
	.globl	exitMsg
	.type	exitMsg, @function
exitMsg:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE4:
	.size	exitMsg, .-exitMsg
	.section	.rodata
.LC30:
	.string	"Enter a position to shot >>> "
.LC31:
	.string	" %c%u"
.LC32:
	.string	"Invalid position!"
.LC33:
	.string	"Congratulations! You won :)"
.LC34:
	.string	"Game over! You lost :C"
	.text
	.globl	playGame
	.type	playGame, @function
playGame:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, %eax
	movw	%ax, -60(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -40(%rbp)
	movl	$0, -36(%rbp)
	cmpw	$1, -60(%rbp)
	je	.L31
	cmpw	$2, -60(%rbp)
	jne	.L32
	movl	$16, -28(%rbp)
	jmp	.L33
.L32:
	movl	$12, -28(%rbp)
	jmp	.L33
.L31:
	movl	$27, -28(%rbp)
.L33:
	cmpw	$1, -60(%rbp)
	je	.L34
	cmpw	$2, -60(%rbp)
	jne	.L35
	movl	$12, -24(%rbp)
	jmp	.L36
.L35:
	movl	$9, -24(%rbp)
	jmp	.L36
.L34:
	movl	$16, -24(%rbp)
.L36:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	drawBoard@PLT
	leaq	-36(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	showScore@PLT
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rdx
	leaq	-41(%rbp), %rax
	leaq	.LC31(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-41(%rbp), %rax
	movq	%rax, %rdi
	call	mapColumns@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	js	.L38
	movl	-32(%rbp), %eax
	testl	%eax, %eax
	je	.L38
	movl	-32(%rbp), %eax
	cmpl	$8, %eax
	jbe	.L39
.L38:
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L40
.L39:
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$60, %al
	jne	.L41
	movq	-16(%rbp), %rax
	movb	$42, (%rax)
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	subl	$1, -24(%rbp)
	movl	$7, %edi
	call	putchar@PLT
	jmp	.L42
.L41:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L42
	movq	-16(%rbp), %rax
	movb	$111, (%rax)
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	movl	$7, %edi
	call	putchar@PLT
.L42:
	cmpl	$0, -24(%rbp)
	jne	.L43
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	pressEnterToContinue@PLT
	jmp	.L44
.L43:
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jb	.L36
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	pressEnterToContinue@PLT
	jmp	.L44
.L40:
	jmp	.L36
.L44:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	playGame, .-playGame
	.globl	loopPlay
	.type	loopPlay, @function
loopPlay:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, %eax
	movw	%ax, -116(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L50:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	movswl	-116(%rbp), %edx
	leaq	-96(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	newSeed
	leaq	-96(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	drawBoard@PLT
	call	selectionMenu
	leaq	-97(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-97(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$101, %eax
	jne	.L47
	call	exitMsg
.L47:
	movzbl	-97(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$100, %eax
	jne	.L48
	movl	$0, %eax
	call	chooseDifficulty
	movw	%ax, -116(%rbp)
.L48:
	movzbl	-97(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$112, %eax
	jne	.L49
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	movswl	-116(%rbp), %edx
	leaq	-96(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	playGame
.L49:
	movzbl	-97(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower@PLT
	cmpl	$101, %eax
	jne	.L50
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L51
	call	__stack_chk_fail@PLT
.L51:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	loopPlay, .-loopPlay
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
