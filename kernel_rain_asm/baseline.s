	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"kernel_rain: %s\n"
	.text
	.p2align 4
	.type	die, @function
die:
.LFB74:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %rcx
	movq	stderr(%rip), %rdi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.cfi_endproc
.LFE74:
	.size	die, .-die
	.section	.rodata.str1.1
.LC1:
	.string	"out of memory"
	.text
	.p2align 4
	.type	rain_resize, @function
rain_resize:
.LFB104:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movslq	%esi, %rdi
	movl	$40, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	16(%r12), %r15d
	movq	(%r12), %r13
	call	*calloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L5
	movq	%rax, %r14
	testl	%r15d, %r15d
	jle	.L20
	testl	%ebp, %ebp
	jg	.L98
	xorl	%ecx, %ecx
.L9:
	movslq	%ecx, %rax
	movsd	.LC2(%rip), %xmm0
	leaq	(%rax,%rax,4), %rax
	leaq	0(%r13,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L30:
	movl	%ecx, %eax
	cltd
	idivl	%ebp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L21
	movq	240(%rax), %rsi
	movq	%rsi, (%rdi)
	testq	%rsi, %rsi
	je	.L99
.L22:
	subq	$1, 16(%rdi)
	movq	$0, 240(%rax)
.L21:
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r14,%rdx,8), %rsi
	testq	%rax, %rax
	jne	.L29
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L101:
	movq	%rax, 240(%r8)
.L94:
	movq	%rax, 8(%rsi)
	movq	(%rdi), %rax
	addq	$1, %rdx
	movq	%rdx, 16(%rsi)
	testq	%rax, %rax
	je	.L23
	movq	240(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L100
.L28:
	subq	$1, 16(%rdi)
	movq	$0, 240(%rax)
.L29:
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	je	.L24
	movl	388(%rax), %r8d
	testl	%r8d, %r8d
	je	.L24
	movl	$0, 388(%rax)
	movsd	%xmm0, 400(%rax)
.L24:
	movq	$0, 240(%rax)
	movq	8(%rsi), %r8
	testq	%r8, %r8
	jne	.L101
	movq	%rax, (%rsi)
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L23:
	addl	$1, %ecx
	addq	$40, %rdi
	cmpl	%r15d, %ecx
	jl	.L30
.L20:
	cmpl	%ebp, %r15d
	jge	.L8
.L109:
	movsd	.LC2(%rip), %xmm0
	leaq	40(%r14), %r9
	cmpl	$1, %ebp
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%r14), %rsi
	movq	%r9, %rax
	movl	$1, %edx
	xorl	%r15d, %r15d
	xorl	%r11d, %r11d
	movq	%rsi, %r10
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L103:
	movslq	%r11d, %r8
	leaq	(%r8,%r8,4), %r8
	leaq	(%r14,%r8,8), %r8
	cmpq	%r10, %rcx
	jb	.L49
.L104:
	movslq	%r15d, %rcx
	addl	$1, %edx
	addq	$40, %rax
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%r14,%rcx,8), %rdi
	cmpl	%edx, %ebp
	je	.L102
.L34:
	movq	16(%rax), %rcx
	movq	%rax, %rdi
	cmpq	%rcx, %rsi
	jnb	.L103
	movq	%rcx, %rsi
	movq	%rax, %r8
	movl	%edx, %r11d
	cmpq	%r10, %rcx
	jnb	.L104
.L49:
	movl	%edx, %r15d
	addl	$1, %edx
	movq	%rcx, %r10
	addq	$40, %rax
	cmpl	%edx, %ebp
	jne	.L34
.L102:
	movq	%rsi, %rax
	subq	%r10, %rax
	cmpq	$1, %rax
	jbe	.L8
	movq	(%r8), %r15
	xorl	%ecx, %ecx
	movq	240(%r15), %r11
	movq	%r15, %r10
	movq	%r11, %rax
	testq	%r11, %r11
	jne	.L37
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L51:
	movq	%rdx, %rax
.L37:
	movl	392(%rax), %edx
	testl	%edx, %edx
	movq	240(%rax), %rdx
	cmovne	%r10, %rcx
	movq	%rax, %r10
	testq	%rdx, %rdx
	jne	.L51
	movq	8(%r8), %rdx
	testq	%rcx, %rcx
	je	.L39
	movq	240(%rcx), %rax
	movq	240(%rax), %r10
	movq	%r10, 240(%rcx)
	cmpq	%rdx, %rax
	je	.L46
.L41:
	movq	8(%rdi), %rcx
	subq	$1, %rsi
	movq	%rsi, 16(%r8)
	movq	16(%rdi), %rdx
	movl	$0, 388(%rax)
	movq	$0, 240(%rax)
	movsd	%xmm0, 400(%rax)
	testq	%rcx, %rcx
	je	.L42
	movq	%rax, 240(%rcx)
.L97:
	movq	%rax, 8(%rdi)
	leaq	1(%rdx), %rax
	movq	%rax, 16(%rdi)
	testq	%rdx, %rdx
	jne	.L95
	movq	$0x000000000, 24(%rdi)
	movl	$1, 32(%rdi)
	cmpl	$1, %ebp
	jg	.L95
.L8:
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r14, (%r12)
	movl	%ebp, 16(%r12)
	movl	%ebx, 20(%r12)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L98:
	.cfi_restore_state
	cmpl	%ebp, %r15d
	movl	%ebp, %r8d
	leaq	24(%rax), %rdi
	movq	%r13, %rsi
	movsd	.LC2(%rip), %xmm0
	cmovle	%r15d, %r8d
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%ecx, %eax
	cltd
	idivl	%ebp
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L10
	movq	240(%rax), %r9
	movq	%r9, (%rsi)
	testq	%r9, %r9
	je	.L106
.L11:
	subq	$1, 16(%rsi)
	movq	$0, 240(%rax)
.L10:
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r14,%rdx,8), %r9
	testq	%rax, %rax
	jne	.L18
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L108:
	movq	%rax, 240(%r10)
.L93:
	movq	%rax, 8(%r9)
	movq	(%rsi), %rax
	addq	$1, %rdx
	movq	%rdx, 16(%r9)
	testq	%rax, %rax
	je	.L12
	movq	240(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	je	.L107
.L17:
	subq	$1, 16(%rsi)
	movq	$0, 240(%rax)
.L18:
	movq	16(%r9), %rdx
	testq	%rdx, %rdx
	je	.L13
	movl	388(%rax), %r10d
	testl	%r10d, %r10d
	je	.L13
	movl	$0, 388(%rax)
	movsd	%xmm0, 400(%rax)
.L13:
	movq	$0, 240(%rax)
	movq	8(%r9), %r10
	testq	%r10, %r10
	jne	.L108
	movq	%rax, (%r9)
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L52:
	movq	%rax, %r15
.L39:
	movq	%r11, %rax
	movq	240(%r11), %r11
	cmpq	%rax, %rdx
	jne	.L52
	movq	%r11, 240(%r15)
	movq	%r15, %rcx
.L46:
	movq	%rcx, 8(%r8)
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L100:
	movq	$0, 8(%rdi)
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L107:
	movq	$0, 8(%rsi)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L12:
	movsd	24(%rsi), %xmm1
	movl	32(%rsi), %eax
	addl	$1, %ecx
	addq	$40, %rsi
	addq	$40, %rdi
	movsd	%xmm1, -40(%rdi)
	movl	%eax, -32(%rdi)
	cmpl	%ecx, %r8d
	jg	.L19
	cmpl	%ecx, %r15d
	jg	.L9
	cmpl	%ebp, %r15d
	jge	.L8
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rax, (%rdi)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L106:
	movq	$0, 8(%rsi)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L99:
	movq	$0, 8(%rdi)
	jmp	.L22
.L105:
	movq	8(%r8), %rdx
	jmp	.L39
.L5:
	leaq	.LC1(%rip), %rdi
	call	die
	.cfi_endproc
.LFE104:
	.size	rain_resize, .-rain_resize
	.p2align 4
	.type	sampler_destroy, @function
sampler_destroy:
.LFB92:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	call	*free@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movq	$0, 32(%rbx)
	movups	%xmm0, (%rbx)
	movups	%xmm0, 16(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE92:
	.size	sampler_destroy, .-sampler_destroy
	.p2align 4
	.type	rain_destroy, @function
rain_destroy:
.LFB101:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L113
	.p2align 4,,10
	.p2align 3
.L114:
	movq	%rbx, %rdi
	movq	248(%rbx), %rbx
	call	*free@GOTPCREL(%rip)
	testq	%rbx, %rbx
	jne	.L114
.L113:
	movq	0(%rbp), %rdi
	call	*free@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 0(%rbp)
	movups	%xmm0, 16(%rbp)
	movups	%xmm0, 32(%rbp)
	movups	%xmm0, 48(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE101:
	.size	rain_destroy, .-rain_destroy
	.section	.rodata.str1.1
.LC4:
	.string	"r"
.LC5:
	.string	"/proc/stat"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"cpu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
	.section	.rodata.str1.1
.LC7:
	.string	"ctxt %llu"
.LC8:
	.string	"processes %llu"
.LC9:
	.string	"/proc/diskstats"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"%u %u %63s %llu %llu %llu %llu %llu %llu %llu"
	.section	.rodata.str1.1
.LC11:
	.string	"nvme"
.LC12:
	.string	"/proc/net/dev"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	" %llu %llu %llu %llu %llu %llu %llu %llu %llu"
	.text
	.p2align 4
	.type	read_counters, @function
read_counters:
.LFB81:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	leaq	.LC4(%rip), %rsi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1336, %rsp
	.cfi_def_cfa_offset 1392
	movq	%fs:40, %rax
	movq	%rax, 1320(%rsp)
	xorl	%eax, %eax
	movups	%xmm0, (%rdi)
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, 32(%rdi)
	leaq	.LC5(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L121
	leaq	288(%rsp), %rbx
	movq	%rax, %r12
	movq	%rax, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	testq	%rax, %rax
	je	.L197
	leaq	216(%rsp), %rax
	movaps	%xmm0, 144(%rsp)
	leaq	144(%rsp), %rdx
	movq	%rbx, %rdi
	movaps	%xmm0, 160(%rsp)
	leaq	152(%rsp), %rcx
	leaq	.LC6(%rip), %rsi
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	pushq	%rax
	.cfi_def_cfa_offset 1400
	leaq	216(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1408
	leaq	216(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1416
	leaq	216(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1424
	leaq	216(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1432
	leaq	216(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1440
	xorl	%eax, %eax
	leaq	216(%rsp), %r9
	leaq	208(%rsp), %r8
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	addq	$48, %rsp
	.cfi_def_cfa_offset 1392
	cmpl	$3, %eax
	jle	.L197
	movq	0(%rbp), %xmm0
	movl	%eax, %edx
	shrl	%edx
	movdqa	%xmm0, %xmm1
	movdqa	160(%rsp), %xmm0
	paddq	144(%rsp), %xmm0
	cmpl	$2, %edx
	je	.L125
	paddq	176(%rsp), %xmm0
	cmpl	$3, %edx
	je	.L126
	paddq	192(%rsp), %xmm0
	cmpl	$4, %edx
	je	.L126
	paddq	208(%rsp), %xmm0
.L126:
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	paddq	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	testb	$1, %al
	je	.L198
	andl	$-2, %eax
	cltq
	movq	144(%rsp,%rax,8), %xmm1
	paddq	%xmm1, %xmm0
.L198:
	movq	176(%rsp), %xmm1
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
.L129:
	paddq	%xmm1, %xmm0
.L128:
	movq	%xmm0, 8(%rbp)
	leaq	56(%rsp), %r13
	leaq	.LC7(%rip), %r15
	leaq	.LC8(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%r12, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L199
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L131
	movq	56(%rsp), %rax
	movq	%rax, 16(%rbp)
.L131:
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L130
	movq	56(%rsp), %rax
	movq	%rax, 24(%rbp)
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L199:
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
	leaq	.LC4(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L135
	.p2align 4,,10
	.p2align 3
.L134:
	movq	%r13, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L200
	leaq	56(%rsp), %rax
	leaq	4(%rsp), %rcx
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	leaq	224(%rsp), %r12
	pushq	%rax
	.cfi_def_cfa_offset 1400
	leaq	.LC10(%rip), %rsi
	movq	%r12, %r8
	leaq	56(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1408
	leaq	56(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1416
	leaq	56(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1424
	leaq	56(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1432
	leaq	56(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1440
	xorl	%eax, %eax
	leaq	56(%rsp), %r9
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	addq	$48, %rsp
	.cfi_def_cfa_offset 1392
	cmpl	$10, %eax
	jne	.L134
	xorl	%r14d, %r14d
	movq	%r12, %rdi
	cmpl	$1701672558, 224(%rsp)
	setne	%r14b
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r15
	testl	%r14d, %r14d
	je	.L139
	testq	%rax, %rax
	je	.L134
	xorl	%r12d, %r12d
	cmpb	$115, 224(%rsp)
	jne	.L162
.L201:
	cmpb	$100, 225(%rsp)
	jne	.L162
.L144:
	call	*__ctype_b_loc@GOTPCREL(%rip)
	movzbl	223(%rsp,%r15), %edx
	movq	(%rax), %rax
	testb	$4, 1(%rax,%rdx,2)
	jne	.L147
.L142:
	testl	%r12d, %r12d
	je	.L134
.L147:
	movq	56(%rsp), %rax
	addq	24(%rsp), %rax
	salq	$9, %rax
	addq	%rax, 32(%rbp)
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L139:
	movq	%r12, %rdi
	movl	$112, %esi
	xorl	%r12d, %r12d
	call	*strchr@GOTPCREL(%rip)
	testq	%rax, %rax
	sete	%r12b
	testq	%r15, %r15
	je	.L142
	cmpb	$115, 224(%rsp)
	je	.L201
.L162:
	cmpb	$118, 224(%rsp)
	jne	.L163
	cmpb	$100, 225(%rsp)
	je	.L144
	.p2align 4,,10
	.p2align 3
.L163:
	cmpb	$120, 224(%rsp)
	jne	.L142
	cmpb	$118, 225(%rsp)
	jne	.L142
	cmpb	$100, 226(%rsp)
	je	.L144
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L200:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
.L135:
	leaq	.LC4(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L156
	leaq	.LC13(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%r12, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L202
	movl	$58, %esi
	movq	%rbx, %rdi
	call	*strchr@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L149
	movb	$0, (%rax)
	call	*__ctype_b_loc@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movq	(%rax), %rsi
	movzbl	288(%rsp), %eax
	testb	$32, 1(%rsi,%rax,2)
	je	.L151
	.p2align 4,,10
	.p2align 3
.L152:
	movzbl	1(%rdx), %ecx
	addq	$1, %rdx
	testb	$32, 1(%rsi,%rcx,2)
	jne	.L152
.L151:
	cmpb	$108, (%rdx)
	jne	.L164
	cmpb	$111, 1(%rdx)
	jne	.L164
	cmpb	$0, 2(%rdx)
	je	.L149
	.p2align 4,,10
	.p2align 3
.L164:
	leaq	64(%rsp), %rdx
	leaq	72(%rsp), %rcx
	subq	$8, %rsp
	.cfi_def_cfa_offset 1400
	movq	%r13, %rsi
	leaq	136(%rsp), %rax
	leaq	1(%r14), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 1408
	leaq	136(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1416
	leaq	136(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1424
	leaq	136(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1432
	leaq	136(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 1440
	xorl	%eax, %eax
	leaq	136(%rsp), %r9
	leaq	128(%rsp), %r8
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	addq	$48, %rsp
	.cfi_def_cfa_offset 1392
	cmpl	$9, %eax
	jne	.L149
	movq	128(%rsp), %rax
	addq	64(%rsp), %rax
	addq	%rax, 40(%rbp)
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L156:
	movl	$1, %eax
.L120:
	movq	1320(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L203
	addq	$1336, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L197:
	.cfi_restore_state
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L121:
	xorl	%eax, %eax
	jmp	.L120
.L125:
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	paddq	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	cmpl	$4, %eax
	je	.L204
	movq	176(%rsp), %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
	jmp	.L129
.L204:
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
	jmp	.L128
.L203:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE81:
	.size	read_counters, .-read_counters
	.section	.rodata.str1.1
.LC14:
	.string	"/proc/%d/stat"
.LC15:
	.string	" \n"
.LC16:
	.string	"/proc/%d/io"
.LC17:
	.string	"read_bytes: %llu"
.LC18:
	.string	"write_bytes: %llu"
	.text
	.p2align 4
	.type	read_process, @function
read_process:
.LFB86:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$296, %rsp
	.cfi_def_cfa_offset 4448
	leaq	.LC14(%rip), %r8
	movl	$64, %ecx
	movl	$2, %edx
	movq	%fs:40, %rax
	movq	%rax, 4376(%rsp)
	xorl	%eax, %eax
	leaq	208(%rsp), %r13
	movl	%edi, %r9d
	movl	%edi, %r12d
	movq	%rsi, %rbp
	movq	%r13, %rdi
	movl	$64, %esi
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC4(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L208
	leaq	272(%rsp), %rbx
	movq	%rax, %r15
	movq	%rax, %rdx
	movl	$4096, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	movq	%r15, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	testq	%r14, %r14
	je	.L208
	movl	$40, %esi
	movq	%rbx, %rdi
	call	*strchr@GOTPCREL(%rip)
	movl	$41, %esi
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	*strrchr@GOTPCREL(%rip)
	testq	%r15, %r15
	movq	%rax, %rdx
	sete	%al
	testq	%rdx, %rdx
	sete	%cl
	orb	%cl, %al
	jne	.L208
	cmpq	%rdx, %r15
	jnb	.L208
	cmpb	$32, 1(%rdx)
	je	.L235
.L208:
	xorl	%eax, %eax
.L205:
	movq	4376(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L236
	addq	$4392, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L235:
	.cfi_restore_state
	leaq	12(%rbp), %rdi
	movl	%ebp, %eax
	movq	$0, 4(%rbp)
	leaq	16(%rbp), %r8
	andq	$-8, %rdi
	leaq	1(%r15), %rsi
	movq	$0, 232(%rbp)
	subl	%edi, %eax
	leal	240(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	%rdx, %rax
	movl	$127, %ecx
	movl	%r12d, 0(%rbp)
	subq	%r15, %rax
	subq	$1, %rax
	cmpq	%rcx, %rax
	cmovg	%rcx, %rax
	movl	%eax, %ecx
	cmpl	$8, %eax
	jnb	.L209
	testb	$4, %al
	jne	.L237
	testl	%ecx, %ecx
	jne	.L238
.L210:
	leaq	32(%rsp), %r14
	movb	$0, 16(%rbp,%rax)
	movl	$22, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	leaq	.LC15(%rip), %rsi
	movq	$0, 16(%rsp)
	rep stosq
	leaq	16(%rsp), %rax
	leaq	2(%rdx), %rdi
	movq	%rax, (%rsp)
	movq	%rax, %rdx
	call	*strtok_r@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L208
	movl	$1, %r15d
	.p2align 4,,10
	.p2align 3
.L213:
	xorl	%edi, %edi
	movq	%rax, -8(%r14,%r15,8)
	movq	(%rsp), %rdx
	leaq	.LC15(%rip), %rsi
	call	*strtok_r@GOTPCREL(%rip)
	movq	%r15, %rdi
	testq	%rax, %rax
	setne	%sil
	cmpl	$21, %r15d
	setle	%dl
	addq	$1, %r15
	testb	%dl, %sil
	jne	.L213
	cmpl	$22, %edi
	jne	.L208
	movq	32(%rsp), %rax
	xorl	%esi, %esi
	movq	120(%rsp), %rdi
	movl	$10, %edx
	movzbl	(%rax), %eax
	movb	%al, 144(%rbp)
	call	*strtoull@GOTPCREL(%rip)
	xorl	%esi, %esi
	movl	$10, %edx
	movq	128(%rsp), %rdi
	movq	%rax, %r15
	call	*strtoull@GOTPCREL(%rip)
	xorl	%esi, %esi
	movl	$10, %edx
	movq	168(%rsp), %rdi
	addq	%rax, %r15
	movq	%r15, 152(%rbp)
	call	*strtol@GOTPCREL(%rip)
	xorl	%esi, %esi
	movl	$10, %edx
	movq	184(%rsp), %rdi
	movq	%rax, 184(%rbp)
	call	*strtoull@GOTPCREL(%rip)
	xorl	%esi, %esi
	movl	$10, %edx
	movq	200(%rsp), %rdi
	movq	%rax, 8(%rbp)
	call	*strtol@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r13, %rdi
	movl	%r12d, %r9d
	testq	%rax, %rax
	movl	$64, %ecx
	movl	$64, %esi
	cmovs	%rdx, %rax
	leaq	.LC16(%rip), %r8
	movl	$2, %edx
	movq	%rax, 176(%rbp)
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	leaq	.LC4(%rip), %rsi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L218
	movl	$0, 12(%rsp)
	leaq	24(%rsp), %r12
	leaq	.LC17(%rip), %r15
	movl	$0, (%rsp)
	leaq	.LC18(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L214:
	movq	%r13, %rdx
	movl	$4096, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L239
	xorl	%eax, %eax
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L215
	movq	24(%rsp), %rax
	movl	$1, (%rsp)
	movq	%rax, 160(%rbp)
.L215:
	xorl	%eax, %eax
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L214
	movq	24(%rsp), %rax
	movl	$1, 12(%rsp)
	movq	%rax, 168(%rbp)
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L209:
	movl	%eax, %ecx
	movq	-8(%rsi,%rcx), %rdi
	movq	%rdi, -8(%r8,%rcx)
	leal	-1(%rax), %ecx
	movq	%r8, %rdi
	shrl	$3, %ecx
	rep movsq
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L238:
	movzbl	1(%r15), %edi
	movb	%dil, 16(%rbp)
	testb	$2, %cl
	je	.L210
	movzwl	-2(%rsi,%rcx), %esi
	movw	%si, -2(%r8,%rcx)
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L239:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
	movl	(%rsp), %eax
	movl	12(%rsp), %ebx
	andl	%ebx, %eax
	movl	%eax, 192(%rbp)
.L218:
	movl	$1, %eax
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L237:
	movl	1(%r15), %edi
	movl	%edi, 16(%rbp)
	movl	-4(%rsi,%rcx), %esi
	movl	%esi, -4(%r8,%rcx)
	jmp	.L210
.L236:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE86:
	.size	read_process, .-read_process
	.section	.rodata.str1.1
.LC19:
	.string	"clock_gettime failed"
	.text
	.p2align 4
	.type	monotonic_seconds, @function
monotonic_seconds:
.LFB76:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	$1, %edi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L244
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	(%rsp), %xmm1
	cvtsi2sdq	8(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L245
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L244:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	die
.L245:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE76:
	.size	monotonic_seconds, .-monotonic_seconds
	.p2align 4
	.type	identity_compare, @function
identity_compare:
.LFB87:
	.cfi_startproc
	endbr64
	movl	(%rsi), %eax
	cmpl	%eax, (%rdi)
	je	.L247
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L247:
	movq	8(%rsi), %rdx
	xorl	%eax, %eax
	cmpq	%rdx, 8(%rdi)
	je	.L246
	sbbl	%eax, %eax
	orl	$1, %eax
.L246:
	ret
	.cfi_endproc
.LFE87:
	.size	identity_compare, .-identity_compare
	.section	.rodata.str1.1
.LC21:
	.string	"invalid %s: %s\n"
	.text
	.p2align 4
	.type	positive_int, @function
positive_int:
.LFB114:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	*__errno_location@GOTPCREL(%rip)
	movl	$10, %edx
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	movl	$0, (%rax)
	call	*strtol@GOTPCREL(%rip)
	movl	0(%rbp), %edx
	testl	%edx, %edx
	jne	.L253
	cmpb	$0, (%rbx)
	je	.L253
	movq	(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L253
	leaq	-1(%rax), %rdx
	cmpq	$2147483646, %rdx
	ja	.L253
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L257
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L253:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L257:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE114:
	.size	positive_int, .-positive_int
	.p2align 4
	.type	table_add, @function
table_add:
.LFB88:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	movq	16(%rdi), %rax
	cmpq	%rax, 8(%rdi)
	je	.L264
.L259:
	movq	8(%rbp), %rdx
	movdqu	(%rbx), %xmm0
	leaq	1(%rdx), %rax
	movq	%rax, 8(%rbp)
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	0(%rbp), %rax
	movups	%xmm0, (%rax)
	movdqu	16(%rbx), %xmm1
	movups	%xmm1, 16(%rax)
	movdqu	32(%rbx), %xmm2
	movups	%xmm2, 32(%rax)
	movdqu	48(%rbx), %xmm3
	movups	%xmm3, 48(%rax)
	movdqu	64(%rbx), %xmm4
	movups	%xmm4, 64(%rax)
	movdqu	80(%rbx), %xmm5
	movups	%xmm5, 80(%rax)
	movdqu	96(%rbx), %xmm6
	movups	%xmm6, 96(%rax)
	movdqu	112(%rbx), %xmm7
	movups	%xmm7, 112(%rax)
	movdqu	128(%rbx), %xmm0
	movups	%xmm0, 128(%rax)
	movdqu	144(%rbx), %xmm1
	movups	%xmm1, 144(%rax)
	movdqu	160(%rbx), %xmm2
	movups	%xmm2, 160(%rax)
	movdqu	176(%rbx), %xmm3
	movups	%xmm3, 176(%rax)
	movdqu	192(%rbx), %xmm4
	movups	%xmm4, 192(%rax)
	movdqu	208(%rbx), %xmm5
	movups	%xmm5, 208(%rax)
	movdqu	224(%rbx), %xmm6
	movups	%xmm6, 224(%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L264:
	.cfi_restore_state
	testq	%rax, %rax
	leaq	(%rax,%rax), %r12
	movl	$128, %eax
	movq	(%rdi), %rdi
	cmove	%rax, %r12
	imulq	$240, %r12, %rsi
	call	*realloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L265
	movq	%rax, 0(%rbp)
	movq	%r12, 16(%rbp)
	jmp	.L259
.L265:
	leaq	.LC1(%rip), %rdi
	call	die
	.cfi_endproc
.LFE88:
	.size	table_add, .-table_add
	.section	.rodata.str1.1
.LC22:
	.string	"/sys/class/hwmon"
.LC23:
	.string	"hwmon"
.LC24:
	.string	"/sys/class/hwmon/%s/name"
.LC25:
	.string	"%63s"
.LC26:
	.string	"k10temp"
.LC27:
	.string	"coretemp"
.LC28:
	.string	"zenpower"
.LC29:
	.string	"/sys/class/hwmon/%s"
.LC30:
	.string	"temp"
.LC31:
	.string	"_input"
.LC32:
	.string	"%s/%s"
.LC33:
	.string	"%ld"
.LC34:
	.string	"%s"
.LC35:
	.string	"\n"
.LC36:
	.string	"Tdie"
.LC37:
	.string	"Tctl"
.LC38:
	.string	"Package id"
.LC40:
	.string	"%s %.0f\302\260C"
	.text
	.p2align 4
	.type	read_temperature.constprop.0, @function
read_temperature.constprop.0:
.LFB129:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 8248
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 12344
	orq	$0, (%rsp)
	subq	$216, %rsp
	.cfi_def_cfa_offset 12560
	movabsq	$7002937031188637044, %rcx
	movq	%rdi, 40(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 12488(%rsp)
	xorl	%eax, %eax
	movq	%rcx, (%rdi)
	movb	$0, 8(%rdi)
	leaq	.LC22(%rip), %rdi
	call	*opendir@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L266
	movl	$2147483647, 36(%rsp)
	leaq	.LC30(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L268:
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L321
.L282:
	leaq	19(%rax), %rbx
	movl	$5, %edx
	leaq	.LC23(%rip), %rsi
	movq	%rbx, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L268
	pxor	%xmm0, %xmm0
	movq	%rbx, %r9
	leaq	192(%rsp), %rbp
	movl	$4096, %ecx
	movaps	%xmm0, 64(%rsp)
	leaq	.LC24(%rip), %r8
	movl	$2, %edx
	movq	%rbp, %rdi
	movaps	%xmm0, 80(%rsp)
	movl	$4096, %esi
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC4(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L268
	leaq	64(%rsp), %r12
	movq	%rax, %rdi
	leaq	.LC25(%rip), %rsi
	xorl	%eax, %eax
	movq	%r12, %rdx
	call	*__isoc99_fscanf@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	%eax, %r14d
	call	*fclose@GOTPCREL(%rip)
	cmpl	$1, %r14d
	jne	.L268
	leaq	.LC26(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L270
	leaq	.LC27(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L270
	leaq	.LC28(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L268
.L270:
	leaq	4288(%rsp), %rax
	movq	%rbx, %r9
	movl	$4096, %ecx
	movl	$2, %edx
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	movl	$4096, %esi
	leaq	.LC29(%rip), %r8
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*opendir@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L268
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L271:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L322
.L280:
	leaq	19(%rax), %r13
	movl	$4, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L271
	leaq	.LC31(%rip), %rsi
	movq	%r13, %rdi
	call	*strstr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L271
	subq	$8, %rsp
	.cfi_def_cfa_offset 12568
	movl	$4096, %ecx
	movl	$2, %edx
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 12576
	movl	$4096, %esi
	movq	32(%rsp), %r9
	movq	%rbp, %rdi
	leaq	.LC32(%rip), %r8
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	.cfi_def_cfa_offset 12568
	popq	%rcx
	.cfi_def_cfa_offset 12560
	cmpl	$4095, %eax
	jg	.L271
	leaq	.LC4(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L271
	movq	%rax, %rdi
	movq	24(%rsp), %rdx
	xorl	%eax, %eax
	leaq	.LC33(%rip), %rsi
	call	*__isoc99_fscanf@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	%eax, %r14d
	call	*fclose@GOTPCREL(%rip)
	cmpl	$1, %r14d
	jne	.L271
	movq	56(%rsp), %rax
	addq	$20000, %rax
	cmpq	$170000, %rax
	ja	.L271
	pxor	%xmm0, %xmm0
	movl	$4096, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	8384(%rsp), %r13
	movaps	%xmm0, 128(%rsp)
	leaq	.LC34(%rip), %rdx
	movq	%r13, %rdi
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	call	*snprintf@GOTPCREL(%rip)
	leaq	.LC31(%rip), %rsi
	movq	%r13, %rdi
	call	*strstr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L273
	movl	$1650551903, (%rax)
	movl	$7103842, 3(%rax)
.L273:
	movq	%r13, %rdi
	leaq	.LC4(%rip), %rsi
	leaq	128(%rsp), %r14
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L274
	movq	%rax, %rdx
	movl	$64, %esi
	movq	%r14, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L275
	leaq	.LC35(%rip), %rsi
	movq	%r14, %rdi
	call	*strcspn@GOTPCREL(%rip)
	movb	$0, 128(%rsp,%rax)
.L275:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
.L274:
	leaq	.LC36(%rip), %rsi
	movq	%r14, %rdi
	call	*strcmp@GOTPCREL(%rip)
	movl	%eax, %r13d
	testl	%eax, %eax
	je	.L276
	leaq	.LC37(%rip), %rsi
	movq	%r14, %rdi
	movl	$1, %r13d
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L276
	movl	$10, %edx
	leaq	.LC38(%rip), %rsi
	movq	%r14, %rdi
	movl	$2, %r13d
	call	*strncmp@GOTPCREL(%rip)
	cmpl	$1, %eax
	sbbl	$-1, %r13d
.L276:
	cmpl	%r13d, 36(%rsp)
	jle	.L271
	cmpb	$0, 128(%rsp)
	pxor	%xmm0, %xmm0
	movq	%r14, %r9
	movq	40(%rsp), %rdi
	cvtsi2sdq	56(%rsp), %xmm0
	cmove	%r12, %r9
	leaq	.LC40(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movl	$64, %esi
	movl	$1, %eax
	divsd	.LC39(%rip), %xmm0
	call	*__snprintf_chk@GOTPCREL(%rip)
	movl	%r13d, 36(%rsp)
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L280
	.p2align 4,,10
	.p2align 3
.L322:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L282
.L321:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L320
	movq	8(%rsp), %rdi
	addq	$12504, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	*closedir@GOTPCREL(%rip)
.L320:
	.cfi_restore_state
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L266:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L320
	addq	$12504, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE129:
	.size	read_temperature.constprop.0, .-read_temperature.constprop.0
	.p2align 4
	.type	record_history.isra.0, @function
record_history.isra.0:
.LFB130:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movl	384(%rdi), %r13d
	cmpl	$6, %r13d
	jle	.L323
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	movq	%rdi, %rbx
	movl	%edx, %ebp
	cvtsi2sdq	%rsi, %xmm0
	movsd	%xmm2, (%rsp)
	movsd	.LC42(%rip), %xmm1
	mulsd	%xmm2, %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	200(%rbx), %rax
	movsd	(%rsp), %xmm2
	testq	%rax, %rax
	js	.L325
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
.L326:
	divsd	%xmm0, %xmm3
	movl	$17, %r12d
	comisd	.LC43(%rip), %xmm3
	jnb	.L327
	movl	$6, %r12d
	pxor	%xmm3, %xmm3
.L327:
	movq	208(%rbx), %rax
	testq	%rax, %rax
	js	.L329
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L330:
	divsd	%xmm2, %xmm0
	movsd	%xmm3, 8(%rsp)
	movsd	.LC44(%rip), %xmm1
	movsd	%xmm2, (%rsp)
	divsd	.LC45(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm3
	movsd	(%rsp), %xmm2
	movapd	%xmm0, %xmm4
	comisd	%xmm3, %xmm0
	ja	.L351
	movq	216(%rbx), %rax
	movapd	%xmm3, %xmm4
	testq	%rax, %rax
	js	.L332
.L383:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L333:
	divsd	%xmm2, %xmm0
	movsd	%xmm4, (%rsp)
	movsd	.LC44(%rip), %xmm1
	divsd	.LC45(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm4
	movapd	%xmm0, %xmm3
	comisd	%xmm4, %xmm0
	ja	.L352
	movapd	%xmm4, %xmm3
.L334:
	movq	224(%rbx), %r14
	pxor	%xmm0, %xmm0
	movsd	%xmm3, (%rsp)
	movsd	.LC44(%rip), %xmm1
	cvtsi2sdq	%r14, %xmm0
	mulsd	.LC46(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm3
	movapd	%xmm0, %xmm2
	comisd	%xmm3, %xmm0
	ja	.L353
	movapd	%xmm3, %xmm2
.L335:
	negq	%r14
	pxor	%xmm0, %xmm0
	movsd	%xmm2, (%rsp)
	movsd	.LC44(%rip), %xmm1
	cvtsi2sdq	%r14, %xmm0
	mulsd	.LC46(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm2
	comisd	%xmm2, %xmm0
	ja	.L354
	cmpq	$0, 232(%rbx)
	movapd	%xmm2, %xmm0
	jle	.L379
.L337:
	movsd	.LC44(%rip), %xmm5
	movl	$20, %eax
	ucomisd	%xmm0, %xmm5
	cmova	%rax, %r12
.L339:
	leal	-1(%r13), %eax
	cmpl	$7, %r13d
	je	.L340
	leal	-8(%r13), %edx
	cltq
	movq	%rdx, %rdi
	leaq	256(,%rax,8), %rax
	leaq	8(,%rdx,8), %rdx
	negq	%rdi
	salq	$3, %rdi
	leaq	-8(%rax,%rdi), %rsi
	addq	%rax, %rdi
	addq	%rbx, %rsi
	addq	%rbx, %rdi
	call	*memmove@GOTPCREL(%rip)
.L340:
	movabsq	$-7046029254386353131, %rax
	addq	664(%rbx), %rax
	movl	%ebp, %esi
	movl	%ebp, %r8d
	movq	%rax, %rdx
	movq	%rax, 664(%rbx)
	shrl	%esi
	andl	$1, %r8d
	shrq	$30, %rdx
	andl	$1, %esi
	movl	%ebp, %edi
	xorq	%rax, %rdx
	movabsq	$-4658895280553007687, %rax
	imulq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	movabsq	$-7723592293110705685, %rax
	imulq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	cmpl	$1, %esi
	movl	%r8d, %edx
	sbbl	$-1, %edx
	shrl	$2, %edi
	andl	$1, %edi
	cmpl	$1, %edi
	sbbl	$-1, %edx
	shrl	$3, %ebp
	andl	$1, %ebp
	cmpl	$1, %ebp
	sbbl	$-1, %edx
	movslq	%edx, %rcx
	xorl	%edx, %edx
	divq	%rcx
	movl	%edx, %eax
	testl	%r8d, %r8d
	je	.L344
	leal	-1(%rdx), %eax
	testq	%rdx, %rdx
	je	.L357
.L344:
	testl	%esi, %esi
	je	.L358
	leal	-1(%rax), %edx
	testl	%eax, %eax
	je	.L380
	testl	%edi, %edi
	je	.L360
.L384:
	leal	-1(%rdx), %eax
	testl	%edx, %edx
	je	.L381
.L347:
	testl	%ebp, %ebp
	je	.L348
	testl	%eax, %eax
	je	.L382
.L348:
	salq	$5, %r12
	leaq	symbols(%rip), %rax
	movq	24(%rax,%r12), %rax
.L349:
	movq	%rax, 304(%rbx)
.L323:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L325:
	.cfi_restore_state
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm3, %xmm3
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm3
	addsd	%xmm3, %xmm3
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L351:
	movq	216(%rbx), %rax
	movl	$14, %r12d
	testq	%rax, %rax
	jns	.L383
.L332:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L333
	.p2align 4,,10
	.p2align 3
.L354:
	cmpq	$0, 232(%rbx)
	movl	$11, %r12d
	jg	.L337
.L379:
	je	.L339
	movsd	.LC44(%rip), %xmm6
	movl	$21, %eax
	ucomisd	%xmm0, %xmm6
	cmova	%rax, %r12
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L353:
	movl	$10, %r12d
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L352:
	movl	$15, %r12d
	jmp	.L334
	.p2align 4,,10
	.p2align 3
.L329:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L330
	.p2align 4,,10
	.p2align 3
.L358:
	movl	%eax, %edx
	testl	%edi, %edi
	jne	.L384
.L360:
	movl	%edx, %eax
	jmp	.L347
.L357:
	xorl	%eax, %eax
.L345:
	leaq	(%rax,%r12,4), %rdx
	leaq	symbols(%rip), %rax
	movq	(%rax,%rdx,8), %rax
	jmp	.L349
.L380:
	movl	$1, %eax
	jmp	.L345
.L381:
	movl	$2, %eax
	jmp	.L345
.L382:
	movl	$3, %eax
	jmp	.L345
	.cfi_endproc
.LFE130:
	.size	record_history.isra.0, .-record_history.isra.0
	.p2align 4
	.type	semantic_keys.isra.0, @function
semantic_keys.isra.0:
.LFB131:
	.cfi_startproc
	movzbl	144(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	subl	$68, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rcx, %rbx
	cmpb	$48, %al
	ja	.L386
	leaq	.L388(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L388:
	.long	.L392-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L390-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L402-.L388
	.long	.L390-.L388
	.long	.L387-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L389-.L388
	.long	.L386-.L388
	.long	.L389-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L386-.L388
	.long	.L387-.L388
	.text
	.p2align 4,,10
	.p2align 3
.L386:
	movl	$5, %eax
.L391:
	pxor	%xmm1, %xmm1
	movl	%eax, (%rbx)
	cvtsi2sdq	%rdi, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC42(%rip), %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	200(%rbp), %rax
	testq	%rax, %rax
	js	.L393
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L394:
	divsd	%xmm0, %xmm1
	movsd	.LC43(%rip), %xmm0
	movl	$6, %eax
	comisd	%xmm1, %xmm0
	ja	.L395
	movsd	.LC47(%rip), %xmm0
	movl	$7, %eax
	comisd	%xmm1, %xmm0
	ja	.L395
	movsd	.LC48(%rip), %xmm0
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	setbe	%al
	addl	$8, %eax
.L395:
	movq	224(%rbp), %rdx
	movl	%eax, 4(%rbx)
	movl	$10, %eax
	cmpq	$16, %rdx
	jg	.L397
	xorl	%eax, %eax
	cmpq	$-17, %rdx
	setg	%al
	addl	$11, %eax
.L397:
	movl	%eax, 8(%rbx)
	movl	192(%rbp), %edx
	movl	$5, %eax
	testl	%edx, %edx
	je	.L398
	movq	216(%rbp), %rax
	cmpq	$1, %rax
	sbbl	%eax, %eax
	andl	$-2, %eax
	cmpq	$0, 208(%rbp)
	jne	.L416
	addl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L398:
	cmpq	$0, 232(%rbp)
	movl	%eax, 12(%rbx)
	movl	$10, %eax
	jg	.L400
	sete	%al
	movzbl	%al, %eax
	addl	$11, %eax
.L400:
	movl	%eax, 16(%rbx)
	leal	-1(%r12), %eax
	movl	$5, %edx
	cmpl	$3, %eax
	ja	.L401
	leaq	CSWTCH.148(%rip), %rdx
	movl	(%rdx,%rax,4), %edx
.L401:
	movl	%edx, 20(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L387:
	.cfi_restore_state
	movl	$3, %eax
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L389:
	movl	$4, %eax
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L392:
	movl	$2, %eax
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L393:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm1, %xmm1
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L394
	.p2align 4,,10
	.p2align 3
.L416:
	addl	$16, %eax
	jmp	.L398
	.p2align 4,,10
	.p2align 3
.L390:
	movl	$1, %eax
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L402:
	xorl	%eax, %eax
	jmp	.L391
	.cfi_endproc
.LFE131:
	.size	semantic_keys.isra.0, .-semantic_keys.isra.0
	.p2align 4
	.type	rain_init, @function
rain_init:
.LFB100:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pxor	%xmm0, %xmm0
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, 32(%rdi)
	movl	%esi, 16(%rdi)
	movl	%edx, 20(%rdi)
	movl	%ecx, 32(%rdi)
	movq	%r8, 40(%rdi)
	movups	%xmm0, (%rdi)
	movups	%xmm0, 48(%rdi)
	movl	$2, %edi
	call	*sysconf@GOTPCREL(%rip)
	movl	$100, %edx
	movslq	%ebp, %rdi
	movl	$40, %esi
	testq	%rax, %rax
	cmovle	%rdx, %rax
	movq	%rax, 24(%rbx)
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L421
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L421:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	call	die
	.cfi_endproc
.LFE100:
	.size	rain_init, .-rain_init
	.p2align 4
	.type	telemetry_init, @function
telemetry_init:
.LFB84:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$32, %ecx
	movq	%rdi, %rbx
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	rep stosq
	movq	%rbx, %rdi
	call	read_counters
	testl	%eax, %eax
	jne	.L430
.L422:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L431
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L430:
	.cfi_restore_state
	movq	%rsp, %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L432
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	leaq	192(%rbx), %rdi
	cvtsi2sdq	(%rsp), %xmm1
	cvtsi2sdq	8(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rbx)
	call	read_temperature.constprop.0
	movl	$1, %eax
	jmp	.L422
.L431:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L432:
	leaq	.LC19(%rip), %rdi
	call	die
	.cfi_endproc
.LFE84:
	.size	telemetry_init, .-telemetry_init
	.p2align 4
	.type	update_semantics.constprop.0, @function
update_semantics.constprop.0:
.LFB132:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	movq	%rdx, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	32(%r12), %r9d
	movl	488(%rdi), %edx
	movl	%r9d, %eax
	movl	%r9d, %ebx
	andl	$2, %eax
	andl	$1, %ebx
	movq	%r8, -8(%rsp)
	cmpl	$1, %eax
	movl	%r9d, %eax
	movl	%ebx, -12(%rsp)
	sbbl	$-1, %ebx
	andl	$4, %eax
	cmpl	$1, %eax
	movl	%ebx, %r8d
	movl	%r9d, %eax
	sbbl	$-1, %r8d
	andl	$8, %eax
	cmpl	$1, %eax
	sbbl	$-1, %r8d
	testl	%edx, %edx
	jne	.L495
	movq	8(%rdi), %rdx
	movl	(%rdi), %ebx
	movslq	%r8d, %rbp
	movabsq	$-4658895280553007687, %r11
	movabsq	$-7723592293110705685, %r10
	movl	$1, 488(%rdi)
	movq	664(%rdi), %r14
	movabsq	$-5853766786057164379, %r13
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	xorq	%rax, %rbx
	shrq	$31, %rax
	xorq	%rax, %rbx
	movl	(%rsi), %eax
	movl	%eax, 440(%rdi)
	movq	(%rcx), %rax
	movq	%rax, 496(%rdi)
	movabsq	$-7046029254386353131, %rax
	addq	%r14, %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rdi)
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 464(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rbx, %rdx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r13
	movl	4(%rsi), %eax
	movl	%eax, 444(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 592(%rdi)
	movq	8(%rcx), %rax
	movq	%rax, 504(%rdi)
	movabsq	$4354685564936845354, %rax
	addq	%r14, %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rdi)
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 468(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$1, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	xorq	%rbx, %rax
	shrq	$31, %rdx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r13
	movl	8(%rsi), %eax
	movl	%eax, 448(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 600(%rdi)
	movq	16(%rcx), %rax
	movq	%rax, 512(%rdi)
	movabsq	$-2691343689449507777, %rax
	addq	%r14, %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rdi)
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 472(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$2, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	xorq	%rbx, %rax
	shrq	$31, %rdx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r13
	movl	12(%rsi), %eax
	movl	%eax, 452(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 608(%rdi)
	movq	24(%rcx), %rax
	movq	%rax, 520(%rdi)
	movabsq	$8709371129873690708, %rax
	addq	%r14, %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rdi)
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 476(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$3, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rbx, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r13
	movl	16(%rsi), %eax
	movl	%eax, 456(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 616(%rdi)
	movq	32(%rcx), %rax
	movq	%rax, 528(%rdi)
	movabsq	$1663341875487337577, %rax
	addq	%r14, %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rdi)
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 480(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$4, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	xorq	%rbx, %rax
	shrq	$31, %rdx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r13
	movl	20(%rsi), %eax
	movl	%eax, 460(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 624(%rdi)
	movq	40(%rcx), %rax
	movq	%rax, 536(%rdi)
	movabsq	$-5382687378899015554, %rax
	addq	%rax, %r14
	movq	%r14, %rdx
	movq	%r14, 664(%rdi)
	shrq	$30, %rdx
	xorq	%r14, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r10, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 484(%rdi)
	movq	40(%r12), %rdx
	movq	%rdx, %rbp
	movq	%rdx, %rax
	xorq	$5, %rbp
	shrq	$30, %rax
	xorq	%rbp, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	xorq	%rax, %rbx
	shrq	$31, %rax
	xorq	%rax, %rbx
	movq	%rbx, %rax
	shrq	$30, %rax
	xorq	%rbx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r10
	shrq	$31, %r10
	xorq	%rax, %r10
	movq	%r10, %rax
	mulq	%r13
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r10
	addq	$8000, %r10
	movq	%r10, 632(%rdi)
.L495:
	movl	-12(%rsp), %eax
	movl	%r9d, %ebp
	movl	%r9d, %r12d
	andl	$2, %ebp
	andl	$4, %r12d
	testl	%eax, %eax
	je	.L591
	shrl	$3, %r9d
	leaq	440(%rdi), %r11
	leaq	256(%rdi), %rbx
	addq	$464, %rdi
	leaq	symbols(%rip), %r13
	andl	$1, %r9d
	jmp	.L494
	.p2align 4,,10
	.p2align 3
.L484:
	leal	1(%r10), %eax
	cltd
	idivl	%r8d
	movslq	%edx, %r10
	movl	%r10d, 24(%r11)
	movslq	(%rsi), %rax
	movq	$0, 288(%rbx)
	movq	(%rcx), %rdx
.L483:
	movl	%eax, (%r11)
	movq	%rdx, 240(%rbx)
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L490
	testl	%ebp, %ebp
	je	.L592
	subl	$2, %r10d
	testl	%edx, %edx
	je	.L593
	testl	%r12d, %r12d
	je	.L594
.L489:
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L595
.L492:
	movq	%rax, %r10
	salq	$5, %r10
	movq	24(%r13,%r10), %r10
	testb	%r9b, %r9b
	je	.L487
	testl	%edx, %edx
	je	.L596
.L487:
	addq	$4, %r11
	movq	%r10, (%rbx)
	addq	$4, %rsi
	addq	$8, %rbx
	addq	$8, %rcx
	cmpq	%r11, %rdi
	je	.L433
.L494:
	movslq	(%rsi), %rax
	movslq	24(%r11), %r10
	cmpl	(%r11), %eax
	jne	.L484
	movq	(%rcx), %rdx
	cmpq	240(%rbx), %rdx
	jne	.L484
	movq	-8(%rsp), %r14
	testq	%r14, %r14
	je	.L483
	movq	336(%rbx), %r15
	addq	288(%rbx), %r14
	movq	%r14, 288(%rbx)
	cmpq	%r15, %r14
	jb	.L485
	leal	1(%r10), %eax
	cltd
	idivl	%r8d
	movq	%r14, %rax
	movslq	%edx, %r10
	xorl	%edx, %edx
	divq	%r15
	movl	%r10d, 24(%r11)
	movslq	(%rsi), %rax
	movq	%rdx, 288(%rbx)
	movq	(%rcx), %rdx
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L592:
	movl	%edx, %r10d
	testl	%r12d, %r12d
	jne	.L489
.L594:
	movl	%r10d, %edx
	jmp	.L492
	.p2align 4,,10
	.p2align 3
.L591:
	cmpq	$0, -8(%rsp)
	jne	.L597
	movslq	(%rsi), %rax
	movl	464(%rdi), %edx
	cmpl	%eax, 440(%rdi)
	je	.L598
.L441:
	movq	$0, 544(%rdi)
	leal	1(%rdx), %eax
	movq	(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 464(%rdi)
	movslq	(%rsi), %rax
.L442:
	movl	%eax, 440(%rdi)
	movq	%r10, 496(%rdi)
	testl	%ebp, %ebp
	je	.L504
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L599
.L443:
	testl	%r12d, %r12d
	je	.L506
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L600
.L445:
	movq	%rax, %rdx
	leaq	symbols(%rip), %r13
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L446
	testl	%r11d, %r11d
	je	.L601
.L446:
	movq	%rdx, 256(%rdi)
	movslq	4(%rsi), %rax
	movl	468(%rdi), %edx
	cmpl	444(%rdi), %eax
	je	.L602
.L447:
	movq	$0, 552(%rdi)
	leal	1(%rdx), %eax
	movq	8(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 468(%rdi)
	movslq	4(%rsi), %rax
.L448:
	movl	%eax, 444(%rdi)
	movq	%r10, 504(%rdi)
	testl	%ebp, %ebp
	je	.L508
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L603
.L449:
	testl	%r12d, %r12d
	je	.L510
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L604
.L451:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L452
	testl	%r11d, %r11d
	je	.L605
.L452:
	movq	%rdx, 264(%rdi)
	movslq	8(%rsi), %rax
	movl	472(%rdi), %edx
	cmpl	448(%rdi), %eax
	je	.L606
.L453:
	movq	$0, 560(%rdi)
	leal	1(%rdx), %eax
	movq	16(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 472(%rdi)
	movslq	8(%rsi), %rax
.L454:
	movl	%eax, 448(%rdi)
	movq	%r10, 512(%rdi)
	testl	%ebp, %ebp
	je	.L512
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L607
.L455:
	testl	%r12d, %r12d
	je	.L514
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L608
.L457:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L458
	testl	%r11d, %r11d
	je	.L609
.L458:
	movq	%rdx, 272(%rdi)
	movslq	12(%rsi), %rax
	movl	476(%rdi), %edx
	cmpl	452(%rdi), %eax
	je	.L610
.L459:
	movq	$0, 568(%rdi)
	leal	1(%rdx), %eax
	movq	24(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 476(%rdi)
	movslq	12(%rsi), %rax
.L460:
	movl	%eax, 452(%rdi)
	movq	%r10, 520(%rdi)
	testl	%ebp, %ebp
	je	.L516
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L611
.L461:
	testl	%r12d, %r12d
	je	.L518
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L612
.L463:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L464
	testl	%r11d, %r11d
	je	.L613
.L464:
	movq	%rdx, 280(%rdi)
	movslq	16(%rsi), %rax
	movl	480(%rdi), %edx
	cmpl	%eax, 456(%rdi)
	je	.L614
.L465:
	movq	$0, 576(%rdi)
	leal	1(%rdx), %eax
	movq	32(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 480(%rdi)
	movslq	16(%rsi), %rax
.L466:
	movl	%eax, 456(%rdi)
	movq	%r10, 528(%rdi)
	testl	%ebp, %ebp
	je	.L520
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L615
.L467:
	testl	%r12d, %r12d
	je	.L522
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L616
.L469:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L470
	testl	%r11d, %r11d
	je	.L617
.L470:
	movq	%rdx, 288(%rdi)
	movslq	20(%rsi), %rax
	movl	484(%rdi), %edx
	cmpl	460(%rdi), %eax
	je	.L471
.L473:
	movq	$0, 584(%rdi)
	leal	1(%rdx), %eax
	movq	40(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 484(%rdi)
	movslq	20(%rsi), %rax
.L472:
	movl	%eax, 460(%rdi)
	movq	%r10, 536(%rdi)
	testl	%ebp, %ebp
	je	.L618
	leal	-1(%rdx), %ecx
	testl	%edx, %edx
	je	.L619
.L474:
	testl	%r12d, %r12d
	je	.L620
	leal	-1(%rcx), %esi
	testl	%ecx, %ecx
	je	.L621
.L480:
	movq	%rax, %rdx
	salq	$5, %rdx
	andl	$8, %r9d
	movq	24(%r13,%rdx), %rdx
	je	.L476
	testl	%esi, %esi
	je	.L622
.L476:
	movq	%rdx, 296(%rdi)
.L433:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L593:
	.cfi_restore_state
	movl	$1, %r10d
.L490:
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L487
.L597:
	shrl	$3, %r9d
	leaq	440(%rdi), %r10
	leaq	256(%rdi), %r11
	addq	$464, %rdi
	leaq	symbols(%rip), %r13
	andl	$1, %r9d
	jmp	.L440
	.p2align 4,,10
	.p2align 3
.L496:
	leal	1(%rbx), %eax
	cltd
	idivl	%r8d
	movl	%edx, 24(%r10)
	movl	%edx, %ebx
	movslq	(%rsi), %rax
	movq	$0, 288(%r11)
	movq	(%rcx), %rdx
.L498:
	movl	%eax, (%r10)
	movq	%rdx, 240(%r11)
	testl	%ebp, %ebp
	je	.L531
	leal	-1(%rbx), %edx
	testl	%ebx, %ebx
	je	.L623
	testl	%r12d, %r12d
	je	.L533
.L626:
	leal	-1(%rdx), %ebx
	testl	%edx, %edx
	je	.L624
.L502:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	%r9b, %r9b
	je	.L503
	testl	%ebx, %ebx
	je	.L625
.L503:
	addq	$4, %r10
	movq	%rdx, (%r11)
	addq	$4, %rsi
	addq	$8, %r11
	addq	$8, %rcx
	cmpq	%r10, %rdi
	je	.L433
.L440:
	movslq	(%rsi), %rax
	movl	24(%r10), %ebx
	cmpl	%eax, (%r10)
	jne	.L496
	movq	(%rcx), %rdx
	cmpq	%rdx, 240(%r11)
	jne	.L496
	movq	336(%r11), %r15
	movq	-8(%rsp), %r14
	addq	288(%r11), %r14
	movq	%r14, 288(%r11)
	cmpq	%r15, %r14
	jb	.L590
	leal	1(%rbx), %eax
	cltd
	idivl	%r8d
	movq	%r14, %rax
	movl	%edx, 24(%r10)
	movl	%edx, %ebx
	xorl	%edx, %edx
	divq	%r15
	movslq	(%rsi), %rax
	movq	%rdx, 288(%r11)
.L590:
	movq	(%rcx), %rdx
	jmp	.L498
.L485:
	movq	(%rcx), %rdx
	jmp	.L483
	.p2align 4,,10
	.p2align 3
.L531:
	movl	%ebx, %edx
	testl	%r12d, %r12d
	jne	.L626
.L533:
	movl	%edx, %ebx
	jmp	.L502
.L595:
	movl	$2, %r10d
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L487
.L596:
	movl	$3, %r10d
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L487
.L471:
	movq	40(%rcx), %r10
	cmpq	%r10, 536(%rdi)
	jne	.L473
	jmp	.L472
.L614:
	movq	32(%rcx), %r10
	cmpq	%r10, 528(%rdi)
	jne	.L465
	jmp	.L466
.L610:
	movq	24(%rcx), %r10
	cmpq	520(%rdi), %r10
	jne	.L459
	jmp	.L460
.L606:
	movq	16(%rcx), %r10
	cmpq	%r10, 512(%rdi)
	jne	.L453
	jmp	.L454
.L602:
	movq	8(%rcx), %r10
	cmpq	504(%rdi), %r10
	jne	.L447
	jmp	.L448
.L598:
	movq	(%rcx), %r10
	cmpq	496(%rdi), %r10
	jne	.L441
	jmp	.L442
.L508:
	movl	%edx, %r10d
	jmp	.L449
.L504:
	movl	%edx, %r10d
	jmp	.L443
.L516:
	movl	%edx, %r10d
	jmp	.L461
.L512:
	movl	%edx, %r10d
	jmp	.L455
.L618:
	movl	%edx, %ecx
	jmp	.L474
.L520:
	movl	%edx, %r10d
	jmp	.L467
.L620:
	movl	%ecx, %esi
	jmp	.L480
.L522:
	movl	%r10d, %r11d
	jmp	.L469
.L518:
	movl	%r10d, %r11d
	jmp	.L463
.L514:
	movl	%r10d, %r11d
	jmp	.L457
.L510:
	movl	%r10d, %r11d
	jmp	.L451
.L506:
	movl	%r10d, %r11d
	jmp	.L445
.L623:
	movl	$1, %edx
.L501:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L503
.L624:
	movl	$2, %edx
	jmp	.L501
.L625:
	movl	$3, %edx
	jmp	.L501
.L617:
	movl	$3, %edx
.L468:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L470
.L616:
	movl	$2, %edx
	jmp	.L468
.L599:
	movl	$1, %edx
	leaq	symbols(%rip), %r13
.L444:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L446
.L619:
	movl	$1, %edx
.L478:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L476
.L622:
	movl	$3, %edx
	jmp	.L478
.L621:
	movl	$2, %edx
	jmp	.L478
.L615:
	movl	$1, %edx
	jmp	.L468
.L611:
	movl	$1, %edx
.L462:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L464
.L613:
	movl	$3, %edx
	jmp	.L462
.L612:
	movl	$2, %edx
	jmp	.L462
.L609:
	movl	$3, %edx
.L456:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L458
.L608:
	movl	$2, %edx
	jmp	.L456
.L601:
	movl	$3, %edx
	jmp	.L444
.L600:
	movl	$2, %edx
	leaq	symbols(%rip), %r13
	jmp	.L444
.L607:
	movl	$1, %edx
	jmp	.L456
.L603:
	movl	$1, %edx
.L450:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L452
.L605:
	movl	$3, %edx
	jmp	.L450
.L604:
	movl	$2, %edx
	jmp	.L450
	.cfi_endproc
.LFE132:
	.size	update_semantics.constprop.0, .-update_semantics.constprop.0
	.section	.rodata.str1.1
.LC49:
	.string	"/proc"
	.text
	.p2align 4
	.type	read_process_table, @function
read_process_table:
.LFB89:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	leaq	.LC49(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	call	*opendir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L636
	movq	$0, 8(%rsp)
	movq	%rax, %rbx
	xorl	%r13d, %r13d
	leaq	24(%rsp), %rbp
	movq	$0, (%rsp)
	.p2align 4,,10
	.p2align 3
.L629:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L642
	call	*__errno_location@GOTPCREL(%rip)
	leaq	19(%r15), %rdi
	movl	$10, %edx
	movq	%rbp, %rsi
	movq	%rax, %r14
	movl	$0, (%rax)
	call	*strtol@GOTPCREL(%rip)
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jne	.L629
	movq	24(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L629
	leaq	-1(%rax), %rdx
	cmpq	$2147483646, %rdx
	ja	.L629
	leaq	32(%rsp), %rsi
	movl	%eax, %edi
	call	read_process
	testl	%eax, %eax
	je	.L629
	movq	8(%rsp), %rax
	cmpq	%rax, %r13
	je	.L643
.L632:
	movq	%r13, %rax
	movq	(%rsp), %rcx
	movdqa	32(%rsp), %xmm0
	salq	$4, %rax
	movdqa	48(%rsp), %xmm1
	movdqa	64(%rsp), %xmm2
	subq	%r13, %rax
	movdqa	80(%rsp), %xmm3
	movdqa	96(%rsp), %xmm4
	addq	$1, %r13
	movdqa	112(%rsp), %xmm5
	salq	$4, %rax
	movdqa	128(%rsp), %xmm6
	movdqa	144(%rsp), %xmm7
	addq	%rcx, %rax
	movups	%xmm0, (%rax)
	movdqa	160(%rsp), %xmm0
	movups	%xmm1, 16(%rax)
	movdqa	176(%rsp), %xmm1
	movups	%xmm2, 32(%rax)
	movdqa	192(%rsp), %xmm2
	movups	%xmm3, 48(%rax)
	movdqa	208(%rsp), %xmm3
	movups	%xmm4, 64(%rax)
	movdqa	224(%rsp), %xmm4
	movups	%xmm5, 80(%rax)
	movdqa	240(%rsp), %xmm5
	movups	%xmm6, 96(%rax)
	movdqa	256(%rsp), %xmm6
	movups	%xmm7, 112(%rax)
	movups	%xmm0, 128(%rax)
	movups	%xmm1, 144(%rax)
	movups	%xmm2, 160(%rax)
	movups	%xmm3, 176(%rax)
	movups	%xmm4, 192(%rax)
	movups	%xmm5, 208(%rax)
	movups	%xmm6, 224(%rax)
	jmp	.L629
	.p2align 4,,10
	.p2align 3
.L642:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$240, %edx
	movq	%r13, %rsi
	leaq	identity_compare(%rip), %rcx
	call	*qsort@GOTPCREL(%rip)
.L628:
	movq	(%rsp), %rax
	movq	%r13, 8(%r12)
	movq	%rax, (%r12)
	movq	8(%rsp), %rax
	movq	%rax, 16(%r12)
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L644
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L643:
	.cfi_restore_state
	testq	%r13, %r13
	jne	.L645
	movq	$128, 8(%rsp)
	movl	$30720, %esi
.L633:
	movq	(%rsp), %rdi
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L632
	leaq	.LC1(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L645:
	movq	%r13, %rsi
	leaq	(%r13,%r13), %rax
	salq	$4, %rsi
	movq	%rax, 8(%rsp)
	subq	%r13, %rsi
	salq	$5, %rsi
	jmp	.L633
.L636:
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	jmp	.L628
.L644:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE89:
	.size	read_process_table, .-read_process_table
	.p2align 4
	.type	sampler_init, @function
sampler_init:
.LFB90:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	pxor	%xmm0, %xmm0
	movq	%rdi, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	$0, 32(%rdi)
	movups	%xmm0, (%rdi)
	movups	%xmm0, 16(%rdi)
	movq	%rsp, %rdi
	call	read_process_table
	movdqu	(%rsp), %xmm2
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	movups	%xmm2, (%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L650
	pxor	%xmm1, %xmm1
	movq	.LC50(%rip), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	32(%rsp), %xmm1
	cvtsi2sdq	40(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	movq	%rax, 32(%rbx)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rbx)
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L651
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L650:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	die
.L651:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE90:
	.size	sampler_init, .-sampler_init
	.section	.rodata.str1.1
.LC52:
	.string	" "
	.text
	.p2align 4
	.type	rain_sync.constprop.0.isra.0, @function
rain_sync.constprop.0.isra.0:
.LFB134:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	xorl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movl	56(%rdi), %ecx
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	%rsi, 40(%rsp)
	testl	%ecx, %ecx
	je	.L653
	movq	48(%rdi), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	cmpq	%rax, %rdx
	cmovb	%rsi, %rcx
	movq	%rcx, 40(%rsp)
.L653:
	movq	8(%rbx), %r12
	movq	%rdx, 48(%rbx)
	movl	$1, 56(%rbx)
	movq	%r12, %rax
	testq	%r12, %r12
	je	.L657
	.p2align 4,,10
	.p2align 3
.L654:
	movl	$0, 392(%rax)
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L654
.L657:
	xorl	%ebp, %ebp
	cmpq	$0, 8(%r13)
	je	.L652
	.p2align 4,,10
	.p2align 3
.L655:
	movq	%rbp, %r9
	salq	$4, %r9
	subq	%rbp, %r9
	salq	$4, %r9
	addq	0(%r13), %r9
	movq	8(%r9), %rdx
	movl	(%r9), %eax
	movq	%r9, %r14
	testq	%r12, %r12
	je	.L658
	movq	%r12, %r15
	jmp	.L661
	.p2align 4,,10
	.p2align 3
.L659:
	movq	248(%r15), %r15
	testq	%r15, %r15
	je	.L658
.L661:
	cmpl	(%r15), %eax
	jne	.L659
	cmpq	8(%r15), %rdx
	jne	.L659
	movdqu	(%r14), %xmm7
	movups	%xmm7, (%r15)
	movdqu	16(%r14), %xmm7
	movups	%xmm7, 16(%r15)
	movdqu	32(%r14), %xmm3
	movups	%xmm3, 32(%r15)
	movdqu	48(%r14), %xmm5
	movups	%xmm5, 48(%r15)
	movdqu	64(%r14), %xmm6
	movups	%xmm6, 64(%r15)
	movdqu	80(%r14), %xmm7
	movups	%xmm7, 80(%r15)
	movdqu	96(%r14), %xmm3
	movups	%xmm3, 96(%r15)
	movdqu	112(%r14), %xmm5
	movups	%xmm5, 112(%r15)
	movdqu	128(%r14), %xmm6
	movups	%xmm6, 128(%r15)
	movdqu	144(%r14), %xmm7
	movups	%xmm7, 144(%r15)
	movdqu	160(%r14), %xmm3
	movups	%xmm3, 160(%r15)
	movdqu	176(%r14), %xmm5
	movups	%xmm5, 176(%r15)
	movdqu	192(%r14), %xmm6
	movups	%xmm6, 192(%r15)
	movdqu	208(%r14), %xmm4
	movups	%xmm4, 208(%r15)
	movsd	.LC44(%rip), %xmm4
	movdqu	224(%r14), %xmm7
	movsd	%xmm4, 16(%rsp)
	movups	%xmm7, 224(%r15)
	movsd	%xmm4, 416(%r15)
.L679:
	movq	24(%rbx), %rax
	movsd	.LC50(%rip), %xmm0
	leaq	48(%rsp), %r12
	movq	%r14, %rsi
	movl	$1, 392(%r15)
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	semantic_keys.isra.0
	movl	488(%r15), %eax
	testl	%eax, %eax
	movq	(%rsp), %rax
	je	.L669
	movl	440(%r15), %esi
	cmpl	%esi, 48(%rsp)
	je	.L669
	addq	$1, 640(%r15)
.L669:
	movdqu	224(%r14), %xmm1
	pxor	%xmm0, %xmm0
	movdqu	648(%r15), %xmm5
	movdqa	%xmm1, %xmm2
	psrlq	$63, %xmm2
	psubq	%xmm2, %xmm0
	pxor	%xmm0, %xmm1
	psubq	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	paddq	%xmm5, %xmm1
	divsd	.LC53(%rip), %xmm0
	movups	%xmm1, 648(%r15)
	movaps	%xmm1, (%rsp)
	call	*lround@GOTPCREL(%rip)
	movl	$1, %ecx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	testq	%rax, %rax
	movdqa	(%rsp), %xmm1
	movq	40(%rsp), %r8
	movq	$0, 120(%rsp)
	movq	640(%r15), %rdx
	cmovne	%rax, %rcx
	movq	152(%r14), %rax
	movdqa	%xmm1, %xmm0
	movhps	%xmm1, 112(%rsp)
	movq	%rdx, 80(%rsp)
	xorl	%edx, %edx
	psrlq	$4, %xmm0
	divq	%rcx
	movq	%xmm0, 96(%rsp)
	movq	%r12, %rdx
	leaq	80(%rsp), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, 88(%rsp)
	movq	168(%r14), %rax
	addq	160(%r14), %rax
	shrq	$16, %rax
	movq	%rax, 104(%rsp)
	call	update_semantics.constprop.0
	movq	24(%rbx), %r12
	movsd	.LC42(%rip), %xmm1
	cvtsi2sdq	%r12, %xmm0
	mulsd	.LC50(%rip), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	200(%r15), %rax
	movapd	%xmm0, %xmm1
	testq	%rax, %rax
	js	.L670
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L671:
	divsd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm1
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	216(%r15), %rax
	movsd	%xmm0, (%rsp)
	addq	208(%r15), %rax
	js	.L672
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L673:
	divsd	.LC50(%rip), %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	16(%rsp), %xmm1
	divsd	.LC54(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	424(%r15), %xmm2
	movapd	%xmm0, %xmm1
	movsd	(%rsp), %xmm0
	movsd	%xmm2, 24(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movsd	24(%rsp), %xmm2
	subsd	%xmm2, %xmm0
	mulsd	.LC55(%rip), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rsp)
	movsd	%xmm0, 424(%r15)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	176(%r15), %xmm0
	addsd	16(%rsp), %xmm0
	call	*log2@GOTPCREL(%rip)
	movq	184(%r15), %rax
	movsd	%xmm0, 24(%rsp)
	movsd	16(%rsp), %xmm0
	testq	%rax, %rax
	jle	.L674
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L674:
	call	*log2@GOTPCREL(%rip)
	movsd	.LC56(%rip), %xmm1
	movsd	%xmm0, 32(%rsp)
	movsd	.LC50(%rip), %xmm0
	addsd	432(%r15), %xmm0
	call	*fmin@GOTPCREL(%rip)
	movsd	.LC56(%rip), %xmm6
	movsd	%xmm0, 432(%r15)
	comisd	%xmm0, %xmm6
	ja	.L675
	movsd	(%rsp), %xmm0
	mulsd	.LC57(%rip), %xmm0
	call	*round@GOTPCREL(%rip)
	movl	$6, %eax
	movl	$3, %ecx
	movapd	%xmm0, %xmm1
	movsd	24(%rsp), %xmm0
	mulsd	.LC48(%rip), %xmm0
	cvttsd2sil	%xmm0, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	cvttsd2sil	32(%rsp), %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	leal	6(%rdx,%rax), %eax
	cvttsd2sil	%xmm1, %edx
	addl	%edx, %eax
	movl	$16, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	384(%r15), %rdx
	cmpl	%edx, %eax
	je	.L675
	movq	$0x000000000, 432(%r15)
	jle	.L676
	leal	1(%rdx), %eax
	movl	%eax, 384(%r15)
	leaq	.LC52(%rip), %rax
	movq	%rax, 256(%r15,%rdx,8)
.L675:
	movl	32(%rbx), %edx
	movsd	.LC50(%rip), %xmm0
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	record_history.isra.0
	pxor	%xmm0, %xmm0
	movsd	.LC42(%rip), %xmm1
	cvtsi2sdq	24(%rbx), %xmm0
	mulsd	.LC50(%rip), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	200(%r14), %rax
	movapd	%xmm0, %xmm1
	testq	%rax, %rax
	js	.L677
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L678:
	divsd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm1
	addq	$1, %rbp
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	mulsd	.LC58(%rip), %xmm0
	addsd	.LC59(%rip), %xmm0
	movsd	%xmm0, 408(%r15)
	cmpq	8(%r13), %rbp
	jnb	.L652
	movq	8(%rbx), %r12
	jmp	.L655
	.p2align 4,,10
	.p2align 3
.L672:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L673
	.p2align 4,,10
	.p2align 3
.L670:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L671
	.p2align 4,,10
	.p2align 3
.L677:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L678
	.p2align 4,,10
	.p2align 3
.L676:
	subl	$1, %edx
	leaq	.LC52(%rip), %rax
	movl	%edx, 384(%r15)
	movslq	%edx, %rdx
	movq	%rax, 256(%r15,%rdx,8)
	jmp	.L675
	.p2align 4,,10
	.p2align 3
.L658:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L697
	movdqu	(%r14), %xmm3
	pxor	%xmm0, %xmm0
	movups	%xmm3, (%rax)
	movdqu	16(%r14), %xmm5
	movups	%xmm5, 16(%rax)
	movdqu	32(%r14), %xmm6
	movups	%xmm6, 32(%rax)
	movdqu	48(%r14), %xmm3
	movups	%xmm3, 48(%rax)
	movdqu	64(%r14), %xmm5
	movups	%xmm5, 64(%rax)
	movdqu	80(%r14), %xmm6
	movups	%xmm6, 80(%rax)
	movdqu	96(%r14), %xmm3
	movups	%xmm3, 96(%rax)
	movdqu	112(%r14), %xmm5
	movups	%xmm5, 112(%rax)
	movdqu	128(%r14), %xmm6
	movups	%xmm6, 128(%rax)
	movdqu	144(%r14), %xmm3
	movups	%xmm3, 144(%rax)
	movdqu	160(%r14), %xmm5
	movups	%xmm5, 160(%rax)
	movdqu	176(%r14), %xmm6
	movups	%xmm6, 176(%rax)
	movdqu	192(%r14), %xmm3
	movups	%xmm3, 192(%rax)
	movdqu	208(%r14), %xmm5
	movups	%xmm5, 208(%rax)
	movdqu	224(%r14), %xmm6
	movups	%xmm6, 224(%rax)
	movq	.LC2(%rip), %rax
	movq	%rax, 400(%r15)
	movq	.LC44(%rip), %rax
	cvtsi2sdq	176(%r14), %xmm0
	addsd	.LC44(%rip), %xmm0
	movq	%rax, 16(%rsp)
	movq	%rax, 416(%r15)
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC48(%rip), %xmm0
	movq	184(%r14), %rdx
	cvttsd2sil	%xmm0, %eax
	movsd	.LC44(%rip), %xmm0
	testq	%rdx, %rdx
	jle	.L663
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L663:
	movl	%eax, (%rsp)
	call	*log2@GOTPCREL(%rip)
	movl	$3, %ecx
	movl	(%rsp), %eax
	movq	(%rbx), %r10
	cvttsd2sil	%xmm0, %edx
	movq	40(%rbx), %rsi
	movq	%rsi, %rdi
	cmpl	%ecx, %edx
	cmovg	%ecx, %edx
	movl	$6, %ecx
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	shrq	$30, %rdi
	movabsq	$-4658895280553007687, %rcx
	xorq	%rsi, %rdi
	imulq	%rcx, %rdi
	leal	6(%rdx,%rax), %eax
	movq	8(%r14), %rdx
	movl	%eax, 384(%r15)
	movq	%rdx, %rax
	shrq	$30, %rax
	movq	%rdi, %rsi
	xorq	%rdx, %rax
	shrq	$27, %rsi
	imulq	%rcx, %rax
	xorq	%rsi, %rdi
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movabsq	$-7723592293110705685, %rdx
	imulq	%rdx, %rdi
	imulq	%rdx, %rax
	movq	%rdi, %rsi
	shrq	$31, %rsi
	xorq	%rdi, %rsi
	movl	(%r14), %edi
	movq	%r12, 248(%r15)
	movq	%r15, 8(%rbx)
	xorq	%rdi, %rsi
	movq	%rax, %rdi
	shrq	$31, %rdi
	xorq	%rsi, %rax
	xorq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$30, %rax
	xorq	%rdi, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rax
	imulq	%rdx, %rax
	movq	%rax, %rdi
	shrq	$31, %rdi
	xorq	%rdi, %rax
	movq	%rax, 664(%r15)
	movq	8(%r14), %rdi
	leaq	.LC52(%rip), %rax
	movq	%rax, 256(%r15)
	movq	%rax, 264(%r15)
	movq	%rax, 272(%r15)
	movq	%rax, 280(%r15)
	movq	%rax, 288(%r15)
	movq	%rax, 296(%r15)
	movq	%rax, 304(%r15)
	movq	%rax, 312(%r15)
	movq	%rax, 320(%r15)
	movq	%rax, 328(%r15)
	movq	%rax, 336(%r15)
	movq	%rax, 344(%r15)
	movq	%rax, 352(%r15)
	movq	%rax, 360(%r15)
	movq	%rax, 368(%r15)
	movq	%rax, 376(%r15)
	movq	%rdi, %rax
	shrq	$30, %rax
	xorq	%rdi, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rax
	imulq	%rdx, %rax
	xorq	%rax, %rsi
	shrq	$31, %rax
	xorq	%rax, %rsi
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movslq	16(%rbx), %rcx
	imulq	%rax, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rcx
	movslq	%edx, %r11
	testl	%ecx, %ecx
	jle	.L664
	movl	%edx, %ecx
	leal	(%rsi,%rdx), %r8d
	movq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L666:
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	leaq	(%rax,%rax,4), %rax
	movq	16(%r10,%rax,8), %rax
	cmpq	%rdi, %rax
	jnb	.L665
	movslq	%edx, %r11
	movq	%rax, %rdi
.L665:
	addl	$1, %ecx
	cmpl	%ecx, %r8d
	jne	.L666
.L664:
	movq	$0, 240(%r15)
	leaq	(%r11,%r11,4), %rax
	leaq	(%r10,%rax,8), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L667
	movq	%r15, 240(%rdx)
.L668:
	addq	$1, 16(%rax)
	movq	%r15, 8(%rax)
	jmp	.L679
.L652:
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L698
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L667:
	.cfi_restore_state
	movq	%r15, (%rax)
	jmp	.L668
.L697:
	leaq	.LC1(%rip), %rdi
	call	die
.L698:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE134:
	.size	rain_sync.constprop.0.isra.0, .-rain_sync.constprop.0.isra.0
	.section	.rodata.str1.1
.LC61:
	.string	" | PAUSED"
.LC62:
	.string	""
.LC63:
	.string	"columns"
.LC64:
	.string	"rows"
.LC65:
	.string	"fps"
.LC68:
	.string	"poll"
.LC69:
	.string	","
.LC70:
	.string	"kanji"
.LC71:
	.string	"hiragana"
.LC72:
	.string	"katakana"
.LC73:
	.string	"ascii"
.LC74:
	.string	"unknown glyph set"
.LC75:
	.string	"empty glyph selection"
.LC76:
	.string	"invalid seed"
.LC77:
	.string	"proc"
	.section	.rodata.str1.8
	.align 8
.LC78:
	.string	"only --source proc is supported"
	.align 8
.LC79:
	.ascii	"Usage: kernel_rain [OPTIONS]\n  --fill                 fit t"
	.ascii	"he terminal and respond to resize\n  --columns N            "
	.ascii	"columns (default 30)\n  --rows N               rows (default"
	.ascii	" 60)\n  --fps N                animation frames/s (default 3"
	.ascii	"0)\n  --poll SECONDS         procfs interval (default 0.2)\n"
	.ascii	"  --glyphs LIST          comma-separated kanji,hiragana,kata"
	.ascii	"kana,ascii\n  --seed N               repeatable placement an"
	.ascii	"d glyph selection\n  --source proc          procfs mode; eB"
	.string	"PF is not built here\n  --self-test            run headless simulation checks\n  --benchmark            time deterministic process sorting and lookup\n  --benchmark-sync       time deterministic process-to-drop updates\n  --help                 show this help\n"
	.align 8
.LC80:
	.string	"unexpected positional argument"
	.section	.rodata.str1.1
.LC82:
	.string	"resize self-test failed"
.LC88:
	.string	"fade self-test failed"
.LC89:
	.string	"kernel_rain: self-test passed"
.LC90:
	.string	"benchmark lookup failed"
	.section	.rodata.str1.8
	.align 8
.LC91:
	.string	"sort+lookup: %.6f s, checksum=%llu\n"
	.align 8
.LC93:
	.string	"sync benchmark produced wrong drop count"
	.section	.rodata.str1.1
.LC94:
	.string	"sync: %.6f s, drops=%zu\n"
.LC95:
	.string	"cannot initialize terminal"
.LC96:
	.string	"cannot read /proc/stat"
.LC97:
	.string	"cpu"
.LC98:
	.string	"memory"
.LC101:
	.string	"io"
.LC102:
	.string	"/proc/pressure/%s"
	.section	.rodata.str1.8
	.align 8
.LC103:
	.string	"some avg10=%lf %*s %*s total=%llu"
	.align 8
.LC105:
	.string	"Enlarge terminal: width >= %d, height >= 4"
	.align 8
.LC109:
	.string	"CPU %3.0f%% %s | proc %3d | switch %.0f/s | fork %.0f/s | disk %.1f MB/s | net %.1f MB/s"
	.align 8
.LC110:
	.string	"%dx%d LEDs | q quit | space pause | r relearn%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB121:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$15, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.L703(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2040, %rsp
	.cfi_def_cfa_offset 2096
	movl	%edi, (%rsp)
	movl	$6, %edi
	movq	%rsi, 8(%rsp)
	leaq	.LC62(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 2024(%rsp)
	xorl	%eax, %eax
	call	*setlocale@GOTPCREL(%rip)
	movsd	.LC50(%rip), %xmm4
	movq	$0, 72(%rsp)
	movl	$0, 16(%rsp)
	movl	$0, 64(%rsp)
	movl	$0, 24(%rsp)
	movl	$30, 176(%rsp)
	movl	$0, 52(%rsp)
	movl	$60, 56(%rsp)
	movl	$30, 40(%rsp)
	movsd	%xmm4, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L700:
	xorl	%r8d, %r8d
	movq	8(%rsp), %rsi
	movl	(%rsp), %edi
	leaq	long_options.0(%rip), %rcx
	leaq	.LC62(%rip), %rdx
	call	*getopt_long@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L1086
	subl	$66, %eax
	cmpl	$49, %eax
	ja	.L701
	movslq	(%r14,%rax,4), %rax
	addq	%r14, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L703:
	.long	.L714-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L713-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L712-.L703
	.long	.L935-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L710-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L709-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L708-.L703
	.long	.L707-.L703
	.long	.L706-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L701-.L703
	.long	.L705-.L703
	.long	.L701-.L703
	.long	.L704-.L703
	.long	.L702-.L703
	.section	.text.startup
.L702:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	leaq	448(%rsp), %rsi
	movq	%rax, %rbx
	movl	$0, (%rax)
	call	*strtoull@GOTPCREL(%rip)
	movl	(%rbx), %r9d
	movq	%rax, 72(%rsp)
	testl	%r9d, %r9d
	jne	.L727
	movq	optarg(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L727
	movq	448(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L727
	cmpb	$45, %al
	jne	.L700
.L727:
	leaq	.LC76(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L704:
	movq	optarg(%rip), %rdi
	leaq	.LC64(%rip), %rsi
	call	positive_int
	movl	%eax, 56(%rsp)
	jmp	.L700
.L705:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rbx
	leaq	448(%rsp), %rsi
	movq	%rax, %rbp
	movl	$0, (%rax)
	movq	%rbx, %rdi
	call	*strtod@GOTPCREL(%rip)
	movl	0(%rbp), %r10d
	movapd	%xmm0, %xmm7
	movsd	%xmm0, 32(%rsp)
	testl	%r10d, %r10d
	jne	.L715
	cmpb	$0, (%rbx)
	je	.L715
	movq	448(%rsp), %rax
	cmpb	$0, (%rax)
	jne	.L715
	andpd	.LC66(%rip), %xmm0
	movsd	.LC67(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L715
	pxor	%xmm0, %xmm0
	comisd	%xmm7, %xmm0
	jb	.L700
.L715:
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	xorl	%eax, %eax
	leaq	.LC68(%rip), %rcx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L706:
	movq	stdout(%rip), %rdi
	leaq	.LC79(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%edi, %edi
	call	*exit@GOTPCREL(%rip)
.L707:
	movq	optarg(%rip), %rdi
	call	*strdup@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L735
	leaq	448(%rsp), %r12
	leaq	.LC69(%rip), %rbp
	movq	%rax, 80(%rsp)
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	*strtok_r@GOTPCREL(%rip)
	movq	80(%rsp), %rdi
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L719
	xorl	%r15d, %r15d
	leaq	.LC70(%rip), %r13
	jmp	.L725
.L1088:
	orl	$1, %r15d
.L721:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	*strtok_r@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1087
.L725:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L1088
	leaq	.LC71(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L722
	orl	$2, %r15d
	jmp	.L721
.L708:
	movq	optarg(%rip), %rdi
	leaq	.LC65(%rip), %rsi
	call	positive_int
	movl	%eax, 176(%rsp)
	jmp	.L700
.L709:
	movq	optarg(%rip), %rdi
	leaq	.LC63(%rip), %rsi
	call	positive_int
	movl	%eax, 40(%rsp)
	jmp	.L700
.L710:
	movl	$1, 16(%rsp)
	jmp	.L700
.L712:
	movq	optarg(%rip), %rdi
	leaq	.LC77(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L700
	leaq	.LC78(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L713:
	movl	$1, 52(%rsp)
	jmp	.L700
.L722:
	leaq	.LC72(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L723
	orl	$4, %r15d
	jmp	.L721
.L723:
	leaq	.LC73(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L724
	orl	$8, %r15d
	jmp	.L721
.L1087:
	movq	80(%rsp), %rdi
	call	*free@GOTPCREL(%rip)
	jmp	.L700
.L935:
	movl	$1, 24(%rsp)
	jmp	.L700
.L714:
	movl	$1, 64(%rsp)
	jmp	.L700
.L1086:
	movl	(%rsp), %eax
	cmpl	optind(%rip), %eax
	jne	.L1089
	cmpl	$0, 24(%rsp)
	jne	.L1090
	cmpl	$0, 64(%rsp)
	jne	.L1091
	cmpl	$0, 16(%rsp)
	jne	.L1092
	call	*initscr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L1093
	call	*cbreak@GOTPCREL(%rip)
	call	*noecho@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	$1, %esi
	call	*keypad@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	$1, %esi
	call	*nodelay@GOTPCREL(%rip)
	xorl	%edi, %edi
	call	*curs_set@GOTPCREL(%rip)
	call	*has_colors@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L1094
.L793:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*getmaxx@GOTPCREL(%rip)
	movl	52(%rsp), %esi
	testl	%esi, %esi
	jne	.L1095
.L794:
	leaq	320(%rsp), %rax
	movq	72(%rsp), %r8
	movl	56(%rsp), %edx
	movl	%r15d, %ecx
	movl	40(%rsp), %esi
	movq	%rax, %rdi
	movq	%rax, 64(%rsp)
	call	rain_init
	leaq	992(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 56(%rsp)
	call	telemetry_init
	testl	%eax, %eax
	je	.L1096
	leaq	.LC97(%rip), %rdx
	leaq	.LC98(%rip), %rax
	movq	%rax, %xmm6
	movq	%rdx, %xmm3
	leaq	272(%rsp), %rax
	punpcklqdq	%xmm6, %xmm3
	movq	%rax, %rdi
	movq	%rax, 128(%rsp)
	movaps	%xmm3, 144(%rsp)
	call	sampler_init
	call	monotonic_seconds
	leaq	192(%rsp), %rax
	movapd	%xmm0, %xmm5
	addsd	32(%rsp), %xmm5
	movq	%rax, 168(%rsp)
	movsd	%xmm0, 72(%rsp)
	movsd	%xmm5, 8(%rsp)
.L797:
	movq	168(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L810
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	52(%rsp), %esi
	movq	stdscr(%rip), %rdi
	cvtsi2sdq	192(%rsp), %xmm1
	cvtsi2sdq	200(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	testl	%esi, %esi
	jne	.L1097
.L800:
	call	*wgetch@GOTPCREL(%rip)
	movl	%eax, %edx
	andl	$-33, %edx
	cmpl	$81, %edx
	je	.L804
	cmpl	$27, %eax
	je	.L804
	cmpl	$32, %eax
	je	.L1098
	cmpl	$114, %eax
	je	.L1099
.L806:
	movsd	(%rsp), %xmm6
	comisd	8(%rsp), %xmm6
	jnb	.L1100
.L807:
	movl	16(%rsp), %ebp
	testl	%ebp, %ebp
	je	.L875
.L842:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %r13d
	call	*getmaxx@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebp
	call	*werase@GOTPCREL(%rip)
	movl	336(%rsp), %r14d
	leal	(%r14,%r14), %ecx
	cmpl	$3, %r13d
	jle	.L958
	cmpl	%ecx, %ebp
	jl	.L958
	movl	340(%rsp), %r15d
	leal	-2(%r13), %eax
	movl	%eax, 88(%rsp)
	cmpl	%r15d, %eax
	cmovg	%r15d, %eax
	movl	%eax, %r12d
	testl	%r14d, %r14d
	jle	.L909
	movq	320(%rsp), %rax
	xorl	%edx, %edx
	movl	%r13d, 96(%rsp)
	movl	%r12d, %r13d
	movl	%r14d, 104(%rsp)
	movl	%r15d, 112(%rsp)
	movq	%rax, %r14
	movl	%edx, %r15d
	movl	%ebx, 136(%rsp)
	jmp	.L908
.L910:
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	je	.L1101
.L908:
	movq	(%r14), %r12
	testq	%r12, %r12
	je	.L910
	movl	388(%r12), %r8d
	testl	%r8d, %r8d
	je	.L910
	movl	384(%r12), %ebx
	subl	$1, %ebx
	js	.L910
	movslq	%ebx, %rbx
	movl	%ebp, 40(%rsp)
	movl	%ecx, 72(%rsp)
	movq	%rbx, %rbp
	movq	%r12, %rbx
	movl	%r15d, 24(%rsp)
	movq	%r14, 80(%rsp)
	jmp	.L922
.L1102:
	cmpb	$0, 1(%r14)
	jne	.L961
.L911:
	subq	$1, %rbp
	testl	%ebp, %ebp
	js	.L1085
.L922:
	movq	256(%rbx,%rbp,8), %r14
	testq	%r14, %r14
	je	.L911
	cmpb	$32, (%r14)
	je	.L1102
.L961:
	cvttsd2sil	400(%rbx), %eax
	subl	%ebp, %eax
	movl	%eax, %r15d
	js	.L911
	cmpl	%eax, %r13d
	jle	.L911
	movl	384(%rbx), %eax
	movsd	416(%rbx), %xmm1
	testl	%ebp, %ebp
	je	.L913
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movsd	.LC106(%rip), %xmm6
	cvtsi2sdl	%ebp, %xmm0
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm2, %xmm0
	comisd	%xmm0, %xmm6
	ja	.L914
	movsd	.LC107(%rip), %xmm5
	comisd	%xmm1, %xmm5
	ja	.L911
.L915:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$8, %r9d
	orl	$1048576, %r9d
	movl	%r9d, %r12d
.L917:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	movl	%r12d, %esi
	call	*wattr_on@GOTPCREL(%rip)
	movl	24(%rsp), %edx
	movq	stdscr(%rip), %rdi
	movl	%r15d, %esi
	call	*wmove@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L921
	movq	stdscr(%rip), %rdi
	movl	$-1, %edx
	movq	%r14, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L921:
	subq	$1, %rbp
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	%r12d, %esi
	call	*wattr_off@GOTPCREL(%rip)
	testl	%ebp, %ebp
	jns	.L922
.L1085:
	movl	24(%rsp), %r15d
	movq	80(%rsp), %r14
	movl	72(%rsp), %ecx
	movl	40(%rsp), %ebp
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	jne	.L908
.L1101:
	movl	96(%rsp), %r13d
	movl	104(%rsp), %r14d
	movl	112(%rsp), %r15d
	movl	136(%rsp), %ebx
.L909:
	movq	328(%rsp), %rax
	testq	%rax, %rax
	je	.L906
.L905:
	cmpl	$1, 392(%rax)
	movq	248(%rax), %rax
	sbbl	$-1, %ebx
	testq	%rax, %rax
	jne	.L905
.L906:
	leaq	1504(%rsp), %r10
	movsd	.LC45(%rip), %xmm1
	movsd	.LC108(%rip), %xmm0
	leaq	.LC109(%rip), %r8
	movq	%r10, %rdi
	movl	$512, %ecx
	movl	$2, %edx
	movl	$512, %esi
	mulsd	1144(%rsp), %xmm0
	pushq	%rax
	.cfi_def_cfa_offset 2104
	movl	$5, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 2112
	movsd	1192(%rsp), %xmm4
	movsd	1184(%rsp), %xmm3
	movsd	1176(%rsp), %xmm2
	divsd	%xmm1, %xmm4
	movq	%r10, 40(%rsp)
	leaq	1200(%rsp), %r9
	divsd	%xmm1, %xmm3
	movsd	1168(%rsp), %xmm1
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	.cfi_def_cfa_offset 2104
	leaq	.LC62(%rip), %rax
	popq	%rcx
	.cfi_def_cfa_offset 2096
	leaq	.LC61(%rip), %rdx
	cmpl	$0, 16(%rsp)
	movl	%r14d, %r9d
	movl	$256, %ecx
	cmovne	%rdx, %rax
	movl	$256, %esi
	movl	$2, %edx
	leaq	1248(%rsp), %r12
	leaq	.LC110(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 2104
	movq	%r12, %rdi
	xorl	%eax, %eax
	pushq	%r15
	.cfi_def_cfa_offset 2112
	call	*__snprintf_chk@GOTPCREL(%rip)
	movl	104(%rsp), %esi
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	call	*wmove@GOTPCREL(%rip)
	popq	%rsi
	.cfi_def_cfa_offset 2104
	popq	%rdi
	.cfi_def_cfa_offset 2096
	addl	$1, %eax
	je	.L925
	movq	24(%rsp), %rsi
	movq	stdscr(%rip), %rdi
	leal	-1(%rbp), %edx
	call	*waddnstr@GOTPCREL(%rip)
.L925:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	leal	-1(%r13), %esi
	call	*wmove@GOTPCREL(%rip)
	addl	$1, %eax
	je	.L926
	movq	stdscr(%rip), %rdi
	leal	-1(%rbp), %edx
	movq	%r12, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L926:
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
.L903:
	pxor	%xmm0, %xmm0
	movsd	.LC44(%rip), %xmm1
	movl	$1, %edi
	leaq	384(%rsp), %rsi
	cvtsi2sdl	176(%rsp), %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L810
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movsd	24(%rsp), %xmm1
	cvtsi2sdq	384(%rsp), %xmm2
	cvtsi2sdq	392(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm2, %xmm0
	subsd	(%rsp), %xmm0
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L927
	cvttsd2siq	%xmm1, %rax
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 24(%rsp)
	movq	%rax, 448(%rsp)
	call	*floor@GOTPCREL(%rip)
	movsd	24(%rsp), %xmm1
	leaq	448(%rsp), %rdi
	xorl	%esi, %esi
	subsd	%xmm0, %xmm1
	mulsd	.LC20(%rip), %xmm1
	cvttsd2siq	%xmm1, %rax
	movq	%rax, 456(%rsp)
	call	*nanosleep@GOTPCREL(%rip)
.L927:
	movsd	(%rsp), %xmm4
	movsd	%xmm4, 72(%rsp)
	jmp	.L797
.L913:
	movsd	.LC107(%rip), %xmm4
	comisd	%xmm1, %xmm4
	ja	.L1103
	call	*has_colors@GOTPCREL(%rip)
	negb	%al
	sbbl	%r9d, %r9d
	andl	$768, %r9d
	orl	$2097152, %r9d
	movl	%r9d, %r12d
	jmp	.L917
	.p2align 4,,10
	.p2align 3
.L914:
	movsd	.LC107(%rip), %xmm6
	comisd	%xmm1, %xmm6
	jbe	.L1071
	movsd	.LC86(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L915
	jmp	.L911
.L1103:
	movsd	.LC86(%rip), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L1085
.L1071:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$9, %r9d
	movl	%r9d, %r12d
	jmp	.L917
.L958:
	xorl	%edi, %edi
	leaq	.LC105(%rip), %rdx
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	*mvprintw@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
	jmp	.L903
.L1097:
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebp
	call	*getmaxx@GOTPCREL(%rip)
	movl	52(%rsp), %esi
	cmpl	$1, %eax
	jle	.L801
	subl	$1, %eax
	sarl	%eax
	movl	%eax, %esi
.L801:
	movl	$3, %eax
	cmpl	%eax, %ebp
	cmovge	%ebp, %eax
	movl	%eax, %edx
	subl	$2, %edx
	cmpl	%esi, 336(%rsp)
	jne	.L802
	cmpl	%edx, 340(%rsp)
	je	.L1079
.L802:
	movq	64(%rsp), %rdi
	call	rain_resize
.L1079:
	movq	stdscr(%rip), %rdi
	jmp	.L800
.L1124:
	movsd	32(%rsp), %xmm3
	addsd	(%rsp), %xmm3
	movl	180(%rsp), %ebx
	movsd	%xmm3, 8(%rsp)
.L875:
	movslq	336(%rsp), %r13
	testl	%r13d, %r13d
	jle	.L842
	imulq	$40, %r13, %r13
	movsd	.LC47(%rip), %xmm1
	movsd	(%rsp), %xmm0
	subsd	72(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	320(%rsp), %r12
	movsd	%xmm0, 24(%rsp)
	addq	%r12, %r13
	jmp	.L900
.L884:
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	384(%rbp), %xmm2
	cvtsi2sdl	%r14d, %xmm0
	subsd	%xmm2, %xmm1
	comisd	%xmm0, %xmm1
	jb	.L878
.L889:
	movq	240(%rbp), %rax
	movq	%rax, (%r12)
	testq	%rax, %rax
	je	.L1104
.L888:
	movabsq	$-4658895280553007687, %rdi
	movq	16(%r12), %rdx
	movabsq	$495873782388, %r8
	xorq	360(%rsp), %r8
	movabsq	$-7723592293110705685, %rsi
	leaq	-1(%rdx), %rax
	movq	%rax, 16(%r12)
	movq	8(%rbp), %rcx
	movq	$0, 240(%rbp)
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movq	%r8, %rcx
	shrq	$30, %rcx
	imulq	%rsi, %rax
	xorq	%r8, %rcx
	imulq	%rdi, %rcx
	movq	%rcx, %r8
	shrq	$27, %r8
	xorq	%r8, %rcx
	imulq	%rsi, %rcx
	movq	%rcx, %r8
	shrq	$31, %r8
	xorq	%r8, %rcx
	movl	0(%rbp), %r8d
	xorq	%r8, %rcx
	xorq	%rax, %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rcx, %rax
	js	.L890
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L891:
	mulsd	.LC83(%rip), %xmm0
	mulsd	.LC84(%rip), %xmm0
	divsd	.LC87(%rip), %xmm0
	addsd	.LC56(%rip), %xmm0
	movq	%xmm0, %r14
	testl	%r15d, %r15d
	je	.L1105
	movq	.LC2(%rip), %rax
	movl	$0, 388(%rbp)
	movq	%rax, 400(%rbp)
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L896
	movq	%rbp, 240(%rax)
.L897:
	movq	%rbp, 8(%r12)
	movq	%rdx, 16(%r12)
.L898:
	movq	%r14, 24(%r12)
.L878:
	addq	$40, %r12
	cmpq	%r12, %r13
	je	.L842
.L900:
	movq	(%r12), %rbp
	testq	%rbp, %rbp
	je	.L878
	movl	388(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L879
	movl	32(%r12), %r10d
	testl	%r10d, %r10d
	jne	.L880
	movabsq	$-4658895280553007687, %rsi
	movq	8(%rbp), %rdx
	movabsq	$495873782388, %rdi
	xorq	360(%rsp), %rdi
	movabsq	$-7723592293110705685, %rcx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movq	%rdi, %rdx
	shrq	$30, %rdx
	imulq	%rcx, %rax
	xorq	%rdi, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rdi
	shrq	$31, %rdi
	xorq	%rdi, %rdx
	movl	0(%rbp), %edi
	xorq	%rdi, %rdx
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	js	.L881
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L882:
	mulsd	.LC83(%rip), %xmm0
	movl	$1, 32(%r12)
	mulsd	.LC84(%rip), %xmm0
	movsd	%xmm0, 24(%r12)
.L880:
	movsd	24(%r12), %xmm0
	pxor	%xmm1, %xmm1
	subsd	24(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%r12)
	ja	.L878
	movl	$1, 388(%rbp)
.L879:
	movsd	24(%rsp), %xmm1
	mulsd	408(%rbp), %xmm1
	addsd	400(%rbp), %xmm1
	movl	392(%rbp), %r15d
	movl	340(%rsp), %r14d
	movsd	%xmm1, 400(%rbp)
	testl	%r15d, %r15d
	jne	.L884
	movsd	24(%rsp), %xmm0
	movsd	%xmm1, 40(%rsp)
	xorpd	.LC99(%rip), %xmm0
	divsd	.LC104(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	pxor	%xmm3, %xmm3
	movsd	40(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdl	384(%rbp), %xmm3
	mulsd	416(%rbp), %xmm0
	cvtsi2sdl	%r14d, %xmm2
	subsd	%xmm3, %xmm1
	movsd	%xmm0, 416(%rbp)
	comisd	%xmm2, %xmm1
	jnb	.L889
	movsd	.LC86(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L889
	jmp	.L878
.L890:
	movq	%rax, %rcx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L891
.L1105:
	movq	328(%rsp), %rax
	testq	%rax, %rax
	je	.L893
	leaq	328(%rsp), %rdx
	cmpq	%rbp, %rax
	jne	.L894
	jmp	.L895
	.p2align 4,,10
	.p2align 3
.L1107:
	cmpq	%rbp, %rax
	je	.L1106
.L894:
	movq	%rax, %rdx
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L1107
.L893:
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	jmp	.L898
.L1104:
	xorl	%r9d, %r9d
	movq	%r9, 8(%r12)
	jmp	.L888
.L1100:
	leaq	448(%rsp), %rbp
	movq	%rbp, %rdi
	call	read_counters
	testl	%eax, %eax
	je	.L809
	leaq	208(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L810
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	208(%rsp), %xmm1
	cvtsi2sdq	216(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC42(%rip), %xmm1
	movsd	%xmm0, 24(%rsp)
	subsd	1040(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	448(%rsp), %rax
	movq	992(%rsp), %rdx
	movq	1000(%rsp), %rcx
	movq	456(%rsp), %rsi
	movsd	%xmm0, 8(%rsp)
	cmpq	%rdx, %rax
	jb	.L811
	subq	%rdx, %rax
	xorl	%edx, %edx
	cmpq	%rcx, %rsi
	jnb	.L929
.L812:
	testq	%rax, %rax
	je	.L813
	movsd	.LC44(%rip), %xmm1
	testq	%rdx, %rdx
	js	.L814
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L815:
	testq	%rax, %rax
	js	.L816
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
.L817:
	divsd	%xmm2, %xmm0
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 1144(%rsp)
.L813:
	movdqa	464(%rsp), %xmm4
	movq	56(%rsp), %r14
	xorl	%r13d, %r13d
	leaq	752(%rsp), %rax
	movdqa	480(%rsp), %xmm5
	movq	%rax, 40(%rsp)
	leaq	512(%rsp), %r15
	leaq	1152(%rsp), %r12
	movdqa	1008(%rsp), %xmm6
	movaps	%xmm4, 512(%rsp)
	movdqa	1024(%rsp), %xmm7
	movaps	%xmm5, 528(%rsp)
	movaps	%xmm6, 752(%rsp)
	movaps	%xmm7, 768(%rsp)
	jmp	.L823
.L1109:
	movl	$1, 72(%r14)
	movsd	%xmm0, 56(%r14)
.L822:
	addq	$8, %r13
	addq	$24, %r14
	cmpq	$32, %r13
	je	.L1108
.L823:
	movq	40(%rsp), %rsi
	movq	(%r15,%r13), %rax
	pxor	%xmm0, %xmm0
	movq	(%rsi,%r13), %rdx
	cmpq	%rdx, %rax
	jb	.L818
	subq	%rdx, %rax
	js	.L819
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L818:
	divsd	8(%rsp), %xmm0
	movsd	%xmm0, (%r12,%r13)
	call	*log1p@GOTPCREL(%rip)
	cmpl	$0, 72(%r14)
	je	.L1109
	movsd	%xmm0, 80(%rsp)
	movsd	8(%rsp), %xmm0
	xorpd	.LC99(%rip), %xmm0
	divsd	.LC100(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	56(%r14), %xmm2
	movsd	80(%rsp), %xmm1
	movsd	.LC44(%rip), %xmm3
	movsd	.LC44(%rip), %xmm4
	subsd	%xmm2, %xmm1
	subsd	%xmm0, %xmm3
	movapd	%xmm1, %xmm0
	movapd	%xmm3, %xmm1
	subsd	%xmm3, %xmm4
	mulsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm1, %xmm2
	addsd	64(%r14), %xmm0
	mulsd	%xmm4, %xmm0
	unpcklpd	%xmm0, %xmm2
	addsd	.LC43(%rip), %xmm0
	movups	%xmm2, 56(%r14)
	call	*sqrt@GOTPCREL(%rip)
	jmp	.L822
.L811:
	cmpq	%rcx, %rsi
	jb	.L813
	xorl	%eax, %eax
.L929:
	subq	%rcx, %rsi
	movq	%rsi, %rdx
	jmp	.L812
.L1098:
	xorl	$1, 16(%rsp)
	jmp	.L806
.L1106:
	addq	$248, %rdx
.L895:
	movq	248(%rbp), %rax
	movq	%rax, (%rdx)
	jmp	.L893
.L881:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L882
.L896:
	movq	%rbp, (%r12)
	jmp	.L897
.L809:
	movsd	32(%rsp), %xmm7
	addsd	(%rsp), %xmm7
	movsd	%xmm7, 8(%rsp)
	jmp	.L807
.L1099:
	movq	56(%rsp), %rdi
	call	telemetry_init
	testl	%eax, %eax
	je	.L804
	movq	128(%rsp), %r15
	movq	%r15, %rdi
	call	sampler_destroy
	movq	%r15, %rdi
	call	sampler_init
	movsd	32(%rsp), %xmm6
	addsd	(%rsp), %xmm6
	xorl	%ecx, %ecx
	movl	%ecx, 376(%rsp)
	movsd	%xmm6, 8(%rsp)
	jmp	.L806
.L819:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L818
.L1108:
	movsd	24(%rsp), %xmm4
	movq	56(%rsp), %rdi
	movl	$12, %ecx
	movq	%rbp, %rsi
	rep movsl
	leaq	1184(%rsp), %rdi
	movsd	%xmm4, 1040(%rsp)
	call	read_temperature.constprop.0
	leaq	240(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L810
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%rbp, %rdi
	cvtsi2sdq	240(%rsp), %xmm1
	cvtsi2sdq	248(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %r12
	call	read_process_table
	movq	448(%rsp), %rax
	movq	%r12, %xmm0
	movq	456(%rsp), %r14
	subsd	296(%rsp), %xmm0
	movsd	.LC42(%rip), %xmm1
	movq	%rax, 104(%rsp)
	movq	%r14, 96(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movq	272(%rsp), %r8
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm0, 304(%rsp)
	testq	%r14, %r14
	je	.L830
	imulq	$240, 96(%rsp), %r10
	movq	104(%rsp), %rax
	movq	280(%rsp), %r11
	movq	%rax, %rcx
	addq	%rax, %r10
	testq	%r11, %r11
	je	.L1059
.L828:
	movl	(%rcx), %r9d
	movq	%r11, %rdi
	xorl	%esi, %esi
	jmp	.L835
.L1110:
	jge	.L833
.L945:
	movq	%rdx, %rdi
.L832:
	cmpq	%rdi, %rsi
	jnb	.L1067
.L835:
	leaq	(%rsi,%rdi), %rdx
	shrq	%rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	cmpl	(%rax), %r9d
	jne	.L1110
	movq	8(%rax), %r14
	cmpq	%r14, 8(%rcx)
	jne	.L1111
	movq	152(%rcx), %rdx
	movq	152(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L933
	subq	%rsi, %rdx
	movq	%rdx, 200(%rcx)
.L933:
	movdqu	176(%rax), %xmm7
	movdqu	176(%rcx), %xmm0
	movl	192(%rcx), %edx
	psubq	%xmm7, %xmm0
	movups	%xmm0, 224(%rcx)
	testl	%edx, %edx
	je	.L1067
	cmpl	$0, 192(%rax)
	je	.L1067
	movq	160(%rcx), %rdx
	movq	160(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L840
	subq	%rsi, %rdx
	movq	%rdx, 208(%rcx)
.L840:
	movq	168(%rcx), %rdx
	movq	168(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L1067
	subq	%rax, %rdx
	movq	%rdx, 216(%rcx)
.L1067:
	addq	$240, %rcx
	cmpq	%rcx, %r10
	jne	.L828
.L830:
	movq	%r8, %rdi
	call	*free@GOTPCREL(%rip)
	movq	464(%rsp), %rax
	movdqa	448(%rsp), %xmm6
	movq	%r12, 296(%rsp)
	cmpl	$0, 16(%rsp)
	movq	%rax, 288(%rsp)
	movaps	%xmm6, 272(%rsp)
	je	.L1112
	movsd	32(%rsp), %xmm6
	addsd	(%rsp), %xmm6
	movsd	%xmm6, 8(%rsp)
	jmp	.L842
	.p2align 4,,10
	.p2align 3
.L1111:
	jb	.L945
.L833:
	leaq	1(%rdx), %rsi
	jmp	.L832
.L804:
	call	*endwin@GOTPCREL(%rip)
	movq	128(%rsp), %rdi
	call	sampler_destroy
	movq	64(%rsp), %rdi
	call	rain_destroy
.L771:
	movq	2024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1113
	addq	$2040, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L701:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC79(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L1059:
	addq	$240, %rcx
	cmpq	%rcx, %r10
	jne	.L1059
	jmp	.L830
.L1095:
	movl	%esi, 40(%rsp)
	cmpl	$1, %eax
	jle	.L795
	subl	$1, %eax
	sarl	%eax
	movl	%eax, 40(%rsp)
.L795:
	movl	$3, %eax
	cmpl	%eax, %ebx
	cmovl	%eax, %ebx
	leal	-2(%rbx), %eax
	movl	%eax, 56(%rsp)
	jmp	.L794
.L719:
	call	*free@GOTPCREL(%rip)
	leaq	.LC75(%rip), %rdi
	call	die
.L1092:
	movl	$8, %ecx
	movl	$60, %edx
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	leaq	448(%rsp), %r13
	movl	$30, %esi
	xorl	%r12d, %r12d
	movl	$1, %r8d
	movq	%r13, %rdi
	leaq	240(%rsp), %r14
	call	rain_init
	movl	64(%rsp), %eax
	movl	$6, %ecx
	xorl	%edx, %edx
	movq	%r14, %rdi
	movdqa	.LC92(%rip), %xmm0
	rep stosl
	leaq	752(%rsp), %rdi
	movl	$60, %ecx
	rep stosl
	movq	%rbp, %rdi
	movq	%r13, %rbp
	movq	%rdx, %r13
	jmp	.L785
	.p2align 4,,10
	.p2align 3
.L783:
	movdqa	768(%rsp), %xmm6
	addq	$1, %r12
	movdqa	784(%rsp), %xmm7
	movl	%r15d, 752(%rsp)
	movq	$1, 760(%rsp)
	movdqa	752(%rsp), %xmm5
	movdqa	800(%rsp), %xmm4
	movups	%xmm6, 16(%rdi,%rbx)
	movdqa	816(%rsp), %xmm3
	movdqa	848(%rsp), %xmm6
	movups	%xmm5, (%rdi,%rbx)
	movdqa	832(%rsp), %xmm5
	movups	%xmm7, 32(%rdi,%rbx)
	movdqa	864(%rsp), %xmm7
	movups	%xmm4, 48(%rdi,%rbx)
	movdqa	880(%rsp), %xmm4
	movups	%xmm3, 64(%rdi,%rbx)
	movups	%xmm5, 80(%rdi,%rbx)
	movdqa	912(%rsp), %xmm5
	movups	%xmm6, 96(%rdi,%rbx)
	movdqa	944(%rsp), %xmm6
	movups	%xmm7, 112(%rdi,%rbx)
	movdqa	960(%rsp), %xmm7
	movb	$83, 896(%rsp)
	movdqa	896(%rsp), %xmm3
	movups	%xmm4, 128(%rdi,%rbx)
	movups	%xmm3, 144(%rdi,%rbx)
	movups	%xmm5, 160(%rdi,%rbx)
	movups	%xmm0, 176(%rdi,%rbx)
	movups	%xmm6, 192(%rdi,%rbx)
	movups	%xmm7, 208(%rdi,%rbx)
	movq	%r12, 248(%rsp)
	movaps	%xmm0, 928(%rsp)
	movdqa	976(%rsp), %xmm4
	movups	%xmm4, 224(%rdi,%rbx)
	addq	$240, %rbx
	cmpq	$4096, %r12
	je	.L1114
.L785:
	leal	1(%r12), %r15d
	cmpq	%r13, %r12
	jne	.L783
	testq	%r12, %r12
	je	.L939
	movq	%r12, %rsi
	leaq	(%r12,%r12), %r13
	salq	$4, %rsi
	subq	%r12, %rsi
	salq	$5, %rsi
.L784:
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L735
	movq	%rax, 240(%rsp)
	movdqa	.LC92(%rip), %xmm0
	movq	%r13, 256(%rsp)
	jmp	.L783
.L939:
	movl	$30720, %esi
	movl	$128, %r13d
	jmp	.L784
.L1114:
	movq	%rbp, %r13
	movq	%rdi, %rbp
	xorl	%ebx, %ebx
	call	monotonic_seconds
	leaq	983040(%rbp), %r12
	movsd	%xmm0, (%rsp)
.L786:
	movq	%rbp, %rax
.L787:
	addq	$1, 152(%rax)
	addq	$240, %rax
	movq	$1, -40(%rax)
	cmpq	%r12, %rax
	jne	.L787
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	addq	$1000, %rbx
	call	rain_sync.constprop.0.isra.0
	cmpq	$8000, %rbx
	jne	.L786
	movq	456(%rsp), %rdx
	xorl	%eax, %eax
	jmp	.L789
.L790:
	movq	248(%rdx), %rdx
	addq	$1, %rax
.L789:
	testq	%rdx, %rdx
	jne	.L790
	cmpq	$4096, %rax
	jne	.L1115
	call	monotonic_seconds
	movl	$4096, %edx
	subsd	(%rsp), %xmm0
	leaq	.LC94(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	rain_destroy
	jmp	.L771
.L1090:
	leaq	384(%rsp), %rbx
	movl	$8, %ecx
	movl	$1, %r8d
	xorl	%ebp, %ebp
	movq	%rbx, %rdi
	movl	$60, %edx
	movl	$1, %esi
	movl	$128, %r14d
	leaq	208(%rsp), %r12
	leaq	512(%rsp), %r13
	call	rain_init
	xorl	%eax, %eax
	movl	$6, %ecx
	movq	%r12, %rdi
	rep stosl
	movl	$60, %ecx
	movq	%r13, %rdi
	movdqa	.LC81(%rip), %xmm0
	rep stosl
	movb	$83, 656(%rsp)
	movq	$1, 520(%rsp)
	movaps	%xmm0, 688(%rsp)
.L736:
	movl	24(%rsp), %eax
	movq	216(%rsp), %r15
	movl	%eax, 512(%rsp)
	cmpq	224(%rsp), %r15
	je	.L1116
.L733:
	imulq	$240, %r15, %rax
	addl	$1, 24(%rsp)
	leaq	1(%r15), %r8
	movq	%r13, %rsi
	movq	%r8, 216(%rsp)
	movl	$60, %ecx
	addq	%rbp, %rax
	movq	%rax, %rdi
	movl	24(%rsp), %eax
	rep movsl
	cmpl	$5, %eax
	jne	.L736
	movq	%r8, %rsi
	leaq	identity_compare(%rip), %rcx
	movl	$240, %edx
	movq	%rbp, %rdi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	rain_sync.constprop.0.isra.0
	movq	384(%rsp), %rax
	movl	$60, %edx
	movq	%rbx, %rdi
	movl	$3, %esi
	movq	(%rax), %r14
	movq	.LC58(%rip), %rax
	movl	$1, 388(%r14)
	movq	%rax, 400(%r14)
	call	rain_resize
	movq	384(%rsp), %rax
	cmpq	(%rax), %r14
	jne	.L737
	cmpl	$0, 388(%r14)
	je	.L737
	movsd	.LC58(%rip), %xmm6
	ucomisd	400(%r14), %xmm6
	jp	.L737
	jne	.L737
	cmpq	$2, 16(%rax)
	jne	.L737
	cmpq	$1, 56(%rax)
	jne	.L737
	cmpq	$1, 96(%rax)
	jne	.L737
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	rain_destroy
	movl	$1, %r8d
	movl	$60, %edx
	movq	%rbx, %rdi
	movl	$8, %ecx
	movl	$1, %esi
	call	rain_init
	xorl	%eax, %eax
	movl	$6, %ecx
	movq	%r12, %rdi
	rep stosl
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$1, 512(%rsp)
	call	table_add
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$2, 512(%rsp)
	call	table_add
	xorl	%edx, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	rain_sync.constprop.0.isra.0
	movq	384(%rsp), %rax
	movl	$60, %ecx
	xorl	%edx, %edx
	movq	208(%rsp), %r13
	movq	(%rax), %r15
	leaq	240(%r13), %rsi
	movq	%r13, %rdi
	movl	$1, 388(%r15)
	movq	$0x000000000, 400(%r15)
	movl	$1, 32(%rax)
	rep movsl
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	$1, 216(%rsp)
	call	rain_sync.constprop.0.isra.0
	movl	400(%rsp), %eax
	movq	384(%rsp), %r14
	testl	%eax, %eax
	jle	.L740
	movslq	%eax, %r12
	movl	$20, 8(%rsp)
	imulq	$40, %r12, %r12
	movq	%rbx, 16(%rsp)
	addq	%r14, %r12
.L741:
	movq	%r14, %rbx
	jmp	.L765
.L1120:
	comisd	%xmm1, %xmm0
	jb	.L743
.L754:
	movq	240(%rbp), %rax
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L1117
.L753:
	movabsq	$495873782388, %r10
	movq	16(%rbx), %rsi
	movabsq	$-4658895280553007687, %r9
	leaq	-1(%rsi), %rax
	movq	%rax, 16(%rbx)
	movq	8(%rbp), %rdi
	xorq	424(%rsp), %r10
	movq	$0, 240(%rbp)
	movq	%rdi, %rax
	movq	%r10, %r8
	shrq	$30, %rax
	shrq	$30, %r8
	xorq	%rdi, %rax
	xorq	%r10, %r8
	imulq	%r9, %rax
	imulq	%r9, %r8
	movq	%rax, %rdi
	movq	%r8, %r10
	shrq	$27, %rdi
	shrq	$27, %r10
	xorq	%rdi, %rax
	movabsq	$-7723592293110705685, %rdi
	xorq	%r10, %r8
	imulq	%rdi, %rax
	imulq	%rdi, %r8
	movq	%r8, %r10
	shrq	$31, %r10
	xorq	%r10, %r8
	movl	0(%rbp), %r10d
	xorq	%r10, %r8
	xorq	%rax, %r8
	shrq	$31, %rax
	xorq	%rax, %r8
	movq	%r8, %rax
	shrq	$30, %rax
	xorq	%r8, %rax
	imulq	%r9, %rax
	movq	%rax, %r8
	shrq	$27, %r8
	xorq	%r8, %rax
	imulq	%rdi, %rax
	movq	%rax, %rdi
	shrq	$31, %rdi
	xorq	%rax, %rdi
	js	.L755
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdi, %xmm0
.L756:
	mulsd	.LC83(%rip), %xmm0
	mulsd	.LC84(%rip), %xmm0
	divsd	.LC87(%rip), %xmm0
	addsd	.LC56(%rip), %xmm0
	testl	%ecx, %ecx
	je	.L1118
	movq	.LC2(%rip), %rax
	movl	$0, 388(%rbp)
	movq	%rax, 400(%rbp)
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L761
	movq	%rbp, 240(%rax)
.L762:
	movq	%rbp, 8(%rbx)
	movq	%rsi, 16(%rbx)
.L763:
	movsd	%xmm0, 24(%rbx)
.L743:
	addq	$40, %rbx
	cmpq	%rbx, %r12
	je	.L1119
.L765:
	movq	(%rbx), %rbp
	testq	%rbp, %rbp
	je	.L743
	movl	388(%rbp), %r8d
	movsd	.LC47(%rip), %xmm2
	testl	%r8d, %r8d
	jne	.L744
	movl	32(%rbx), %edi
	testl	%edi, %edi
	je	.L745
	movsd	24(%rbx), %xmm0
.L746:
	movsd	.LC47(%rip), %xmm2
	pxor	%xmm1, %xmm1
	subsd	%xmm2, %xmm0
	movsd	%xmm2, (%rsp)
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rbx)
	ja	.L743
	movl	$1, 388(%rbp)
	movsd	(%rsp), %xmm2
.L744:
	mulsd	408(%rbp), %xmm2
	pxor	%xmm1, %xmm1
	movsd	400(%rbp), %xmm0
	cvtsi2sdl	384(%rbp), %xmm1
	movl	392(%rbp), %ecx
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 400(%rbp)
	subsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	404(%rsp), %xmm1
	testl	%ecx, %ecx
	jne	.L1120
	movsd	.LC85(%rip), %xmm2
	mulsd	416(%rbp), %xmm2
	comisd	%xmm1, %xmm0
	movsd	%xmm2, 416(%rbp)
	jnb	.L754
	movsd	.LC86(%rip), %xmm3
	comisd	%xmm2, %xmm3
	ja	.L754
	jmp	.L743
.L1116:
	testq	%r15, %r15
	leaq	(%r15,%r15), %rcx
	movq	%rbp, %rdi
	cmove	%r14, %rcx
	imulq	$240, %rcx, %rsi
	movq	%rcx, (%rsp)
	call	*realloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L735
	movq	(%rsp), %rcx
	movq	%rax, 208(%rsp)
	movq	%rax, %rbp
	movq	%rcx, 224(%rsp)
	jmp	.L733
	.p2align 4,,10
	.p2align 3
.L745:
	movabsq	$-4658895280553007687, %rdi
	movq	8(%rbp), %rcx
	movabsq	$495873782388, %r8
	xorq	424(%rsp), %r8
	movabsq	$-7723592293110705685, %rsi
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movq	%r8, %rcx
	shrq	$30, %rcx
	imulq	%rsi, %rax
	xorq	%r8, %rcx
	imulq	%rdi, %rcx
	movq	%rcx, %r8
	shrq	$27, %r8
	xorq	%r8, %rcx
	imulq	%rsi, %rcx
	movq	%rcx, %r8
	shrq	$31, %r8
	xorq	%r8, %rcx
	movl	0(%rbp), %r8d
	xorq	%r8, %rcx
	xorq	%rax, %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rcx, %rax
	js	.L747
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L748:
	mulsd	.LC83(%rip), %xmm0
	movl	$1, 32(%rbx)
	mulsd	.LC84(%rip), %xmm0
	jmp	.L746
.L755:
	movq	%rdi, %rax
	andl	$1, %edi
	pxor	%xmm0, %xmm0
	shrq	%rax
	orq	%rdi, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L756
.L1118:
	movq	392(%rsp), %rax
	testq	%rax, %rax
	je	.L758
	leaq	392(%rsp), %rcx
	cmpq	%rax, %rbp
	jne	.L759
	jmp	.L760
	.p2align 4,,10
	.p2align 3
.L1122:
	cmpq	%rbp, %rax
	je	.L1121
.L759:
	movq	%rax, %rcx
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L1122
.L758:
	movsd	%xmm0, (%rsp)
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	movsd	(%rsp), %xmm0
	jmp	.L763
.L1117:
	movq	$0, 8(%rbx)
	jmp	.L753
.L1119:
	subl	$1, 8(%rsp)
	jne	.L741
	movq	16(%rsp), %rbx
.L740:
	cmpq	(%r14), %r15
	je	.L766
	movq	392(%rsp), %rax
	jmp	.L767
.L768:
	movq	248(%rax), %rax
.L767:
	testq	%rax, %rax
	je	.L1123
	cmpl	$1, (%rax)
	jne	.L768
	cmpq	$1, 8(%rax)
	jne	.L768
.L766:
	leaq	.LC88(%rip), %rdi
	call	die
.L1121:
	addq	$248, %rcx
.L760:
	movq	248(%rbp), %rax
	movq	%rax, (%rcx)
	jmp	.L758
.L761:
	movq	%rbp, (%rbx)
	jmp	.L762
.L747:
	movq	%rax, %rcx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L748
.L1123:
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	rain_destroy
	leaq	.LC89(%rip), %rdi
	call	*puts@GOTPCREL(%rip)
	jmp	.L771
.L737:
	leaq	.LC82(%rip), %rdi
	call	die
.L814:
	movq	%rdx, %rcx
	andl	$1, %edx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L815
.L810:
	leaq	.LC19(%rip), %rdi
	call	die
.L1113:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L1112:
	movq	1008(%rsp), %rcx
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	leaq	.LC101(%rip), %rax
	movq	%rax, 768(%rsp)
	movsd	.LC2(%rip), %xmm0
	xorl	%eax, %eax
	leaq	1248(%rsp), %r12
	movdqa	144(%rsp), %xmm4
	movq	%rcx, 88(%rsp)
	movq	%rax, 80(%rsp)
	movl	%ebx, %eax
	movq	%r13, %rbx
	movaps	%xmm4, 752(%rsp)
	movl	%eax, %r13d
	movsd	%xmm0, 8(%rsp)
.L847:
	movq	40(%rsp), %rax
	movl	$2, %edx
	movl	$64, %ecx
	movq	%r12, %rdi
	leaq	.LC102(%rip), %r8
	movl	$64, %esi
	movq	(%rax,%rbx,8), %r9
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC4(%rip), %rsi
	movq	%r12, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L846
	leaq	1504(%rsp), %r8
	movl	$512, %esi
	movq	%rax, 160(%rsp)
	movq	%r8, %rdi
	movq	%r8, 136(%rsp)
	call	*fgets@GOTPCREL(%rip)
	movq	160(%rsp), %rdi
	movq	%rax, 112(%rsp)
	call	*fclose@GOTPCREL(%rip)
	movq	112(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L846
	xorl	%eax, %eax
	movq	136(%rsp), %rdi
	movq	%rbp, %rcx
	leaq	384(%rsp), %rdx
	leaq	.LC103(%rip), %rsi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$2, %eax
	jne	.L846
	movq	448(%rsp), %rsi
	addq	%rsi, 80(%rsp)
	movsd	384(%rsp), %xmm0
	comisd	8(%rsp), %xmm0
	jbe	.L846
	leal	2(%rbx), %r14d
	movsd	%xmm0, 8(%rsp)
.L846:
	addq	$1, %rbx
	cmpq	$3, %rbx
	jne	.L847
	movsd	8(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	movq	88(%rsp), %rcx
	movl	%r13d, %ebx
	comisd	%xmm1, %xmm0
	jb	.L848
	movsd	.LC84(%rip), %xmm1
	movl	$1, %edx
	ucomisd	%xmm0, %xmm1
	cmova	%edx, %r14d
.L848:
	xorl	%eax, %eax
	cmpl	$0, 376(%rsp)
	movq	%rax, 88(%rsp)
	je	.L850
	movq	368(%rsp), %rdx
	cmpq	%rdx, %rcx
	jb	.L850
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, 88(%rsp)
.L850:
	movq	%rcx, 368(%rsp)
	movq	328(%rsp), %rdx
	movl	$1, 376(%rsp)
	jmp	.L851
.L852:
	xorl	%eax, %eax
	movl	%eax, 392(%rdx)
	movq	248(%rdx), %rdx
.L851:
	testq	%rdx, %rdx
	jne	.L852
	movq	80(%rsp), %rax
	movl	$1000000, %ecx
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movq	104(%rsp), %rbp
	movl	%ebx, 180(%rsp)
	divq	%rcx
	movq	%r13, 80(%rsp)
	movq	%rbp, %r13
	movq	%rax, 160(%rsp)
.L853:
	movq	96(%rsp), %rsi
	cmpq	%rsi, 80(%rsp)
	je	.L1124
	movq	328(%rsp), %rbx
	movq	8(%r13), %rdx
	movl	0(%r13), %eax
	testq	%rbx, %rbx
	je	.L854
	movq	%rbx, %rbp
	jmp	.L857
.L855:
	movq	248(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L854
.L857:
	cmpl	0(%rbp), %eax
	jne	.L855
	cmpq	8(%rbp), %rdx
	jne	.L855
	movsd	.LC44(%rip), %xmm7
	movl	$60, %ecx
	movq	%rbp, %rdi
	movq	%r13, %rsi
	rep movsl
	movsd	%xmm7, 8(%rsp)
	movsd	%xmm7, 416(%rbp)
.L931:
	movsd	24(%rsp), %xmm0
	movq	%r15, %rcx
	movl	%r14d, %edx
	movq	%r13, %rsi
	movq	344(%rsp), %rbx
	movl	$1, 392(%rbp)
	movq	%rbx, %rdi
	call	semantic_keys.isra.0
	cmpl	$0, 488(%rbp)
	je	.L864
	movl	440(%rbp), %eax
	cmpl	%eax, 512(%rsp)
	je	.L864
	addq	$1, 640(%rbp)
.L864:
	movdqu	224(%r13), %xmm0
	pxor	%xmm2, %xmm2
	movq	232(%r13), %rax
	movdqu	648(%rbp), %xmm6
	movdqa	%xmm0, %xmm1
	movq	%rax, %r12
	psrlq	$63, %xmm1
	negq	%r12
	psubq	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	cmovs	%rax, %r12
	addq	656(%rbp), %r12
	pxor	%xmm2, %xmm1
	psubq	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rbx, %xmm2
	paddq	%xmm6, %xmm1
	movups	%xmm1, 648(%rbp)
	movaps	%xmm1, 112(%rsp)
	movapd	%xmm2, %xmm0
	movsd	%xmm2, 104(%rsp)
	divsd	.LC53(%rip), %xmm0
	call	*lround@GOTPCREL(%rip)
	movq	640(%rbp), %rdx
	movl	$1, %ecx
	movdqa	112(%rsp), %xmm1
	testq	%rax, %rax
	movq	88(%rsp), %r8
	movq	64(%rsp), %rsi
	movq	%rbp, %rdi
	cmovne	%rax, %rcx
	movq	152(%r13), %rax
	movq	%rdx, 752(%rsp)
	xorl	%edx, %edx
	movdqa	%xmm1, %xmm0
	movq	%r12, 784(%rsp)
	divq	%rcx
	movq	40(%rsp), %rcx
	psrlq	$4, %xmm0
	movq	%r15, %rdx
	movq	%xmm0, 768(%rsp)
	movq	%rax, 760(%rsp)
	movq	168(%r13), %rax
	addq	160(%r13), %rax
	shrq	$16, %rax
	movq	%rax, 776(%rsp)
	movq	160(%rsp), %rax
	movq	%rax, 792(%rsp)
	call	update_semantics.constprop.0
	movsd	104(%rsp), %xmm2
	mulsd	24(%rsp), %xmm2
	movsd	.LC42(%rip), %xmm1
	movapd	%xmm2, %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	200(%rbp), %rax
	movsd	%xmm0, 104(%rsp)
	testq	%rax, %rax
	js	.L865
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L866:
	movsd	8(%rsp), %xmm1
	divsd	104(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	.LC42(%rip), %xmm1
	movq	%xmm0, %r12
	movsd	24(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	216(%rbp), %rax
	movapd	%xmm0, %xmm1
	addq	208(%rbp), %rax
	js	.L867
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L868:
	divsd	%xmm1, %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	divsd	.LC54(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 184(%rsp)
	movsd	24(%rsp), %xmm0
	mulsd	.LC111(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	424(%rbp), %xmm2
	movsd	184(%rsp), %xmm1
	movsd	%xmm0, 112(%rsp)
	movq	%r12, %xmm0
	movsd	%xmm2, 136(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm3
	movsd	136(%rsp), %xmm2
	movapd	%xmm0, %xmm1
	movapd	%xmm3, %xmm5
	subsd	112(%rsp), %xmm5
	subsd	%xmm2, %xmm1
	movapd	%xmm5, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 424(%rbp)
	movq	%xmm0, %r12
	pxor	%xmm0, %xmm0
	cvtsi2sdq	176(%rbp), %xmm0
	addsd	%xmm3, %xmm0
	call	*log2@GOTPCREL(%rip)
	movq	184(%rbp), %rax
	movsd	%xmm0, 112(%rsp)
	movsd	8(%rsp), %xmm0
	testq	%rax, %rax
	jle	.L869
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L869:
	call	*log2@GOTPCREL(%rip)
	movsd	.LC56(%rip), %xmm1
	movsd	%xmm0, 136(%rsp)
	movsd	24(%rsp), %xmm0
	addsd	432(%rbp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	movsd	.LC56(%rip), %xmm5
	movsd	%xmm0, 432(%rbp)
	comisd	%xmm0, %xmm5
	ja	.L870
	movq	%r12, %xmm0
	mulsd	.LC57(%rip), %xmm0
	call	*round@GOTPCREL(%rip)
	movsd	112(%rsp), %xmm1
	movl	$6, %eax
	movl	$3, %ecx
	mulsd	.LC48(%rip), %xmm1
	cvttsd2sil	%xmm1, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	cvttsd2sil	136(%rsp), %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	leal	6(%rdx,%rax), %edx
	cvttsd2sil	%xmm0, %eax
	addl	%eax, %edx
	movl	$16, %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movslq	384(%rbp), %rax
	cmpl	%eax, %edx
	je	.L870
	movq	$0x000000000, 432(%rbp)
	jle	.L871
	leal	1(%rax), %edx
	leaq	.LC52(%rip), %rsi
	movl	%edx, 384(%rbp)
	movq	%rsi, 256(%rbp,%rax,8)
.L870:
	movsd	24(%rsp), %xmm0
	movl	352(%rsp), %edx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	record_history.isra.0
	movq	200(%r13), %rax
	testq	%rax, %rax
	js	.L872
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L873:
	movsd	8(%rsp), %xmm1
	divsd	104(%rsp), %xmm0
	addq	$240, %r13
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	mulsd	.LC58(%rip), %xmm0
	addq	$1, 80(%rsp)
	addsd	.LC59(%rip), %xmm0
	movsd	%xmm0, 408(%rbp)
	jmp	.L853
.L735:
	leaq	.LC1(%rip), %rdi
	call	die
.L724:
	movq	80(%rsp), %rdi
	call	*free@GOTPCREL(%rip)
	leaq	.LC74(%rip), %rdi
	call	die
.L1094:
	call	*start_color@GOTPCREL(%rip)
	call	*use_default_colors@GOTPCREL(%rip)
	movl	$2, %esi
	movl	$1, %edi
	cmpl	$1, %eax
	sbbl	%ebx, %ebx
	movl	%ebx, %edx
	call	*init_pair@GOTPCREL(%rip)
	movl	%ebx, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	*init_pair@GOTPCREL(%rip)
	movl	%ebx, %edx
	movl	$7, %esi
	movl	$3, %edi
	call	*init_pair@GOTPCREL(%rip)
	jmp	.L793
.L1091:
	movl	$240, %esi
	movl	$4096, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L735
	call	monotonic_seconds
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	leaq	identity_compare(%rip), %rbp
	movsd	%xmm0, (%rsp)
	leaq	983040(%r13), %r14
.L773:
	imull	$137, %ebx, %ecx
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L774:
	movl	%ecx, %edx
	movq	%rbx, 8(%rax)
	addq	$240, %rax
	addl	$2053, %ecx
	andl	$4095, %edx
	addl	$1, %edx
	movl	%edx, -240(%rax)
	cmpq	%rax, %r14
	jne	.L774
	movq	%r13, %rdi
	movq	%rbp, %rcx
	movl	$240, %edx
	movl	$4096, %esi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L780:
	addl	$1, %edi
	movl	$4096, %esi
	xorl	%ecx, %ecx
	jmp	.L779
	.p2align 4,,10
	.p2align 3
.L1126:
	jge	.L777
.L938:
	movq	%rdx, %rsi
	cmpq	%rsi, %rcx
	jnb	.L1125
.L779:
	leaq	(%rcx,%rsi), %rdx
	shrq	%rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%r13, %rax
	cmpl	(%rax), %edi
	jne	.L1126
	movq	8(%rax), %rax
	cmpq	%rbx, %rax
	jne	.L1127
	movslq	%edi, %rax
	addq	%rax, %r12
	cmpl	$4096, %edi
	jne	.L780
	addq	$1, %rbx
	cmpq	$128, %rbx
	jne	.L773
	call	monotonic_seconds
	movq	%r12, %rdx
	subsd	(%rsp), %xmm0
	leaq	.LC91(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	jmp	.L771
	.p2align 4,,10
	.p2align 3
.L1127:
	cmpq	%rax, %rbx
	jb	.L938
.L777:
	leaq	1(%rdx), %rcx
	cmpq	%rsi, %rcx
	jb	.L779
.L1125:
	leaq	.LC90(%rip), %rdi
	call	die
.L1089:
	leaq	.LC80(%rip), %rdi
	call	die
.L1115:
	leaq	.LC93(%rip), %rdi
	call	die
.L1096:
	call	*endwin@GOTPCREL(%rip)
	leaq	.LC96(%rip), %rdi
	call	die
.L816:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm2, %xmm2
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm2
	addsd	%xmm2, %xmm2
	jmp	.L817
.L1093:
	leaq	.LC95(%rip), %rdi
	call	die
.L867:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L868
.L865:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L866
.L872:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L873
.L871:
	subl	$1, %eax
	leaq	.LC52(%rip), %rsi
	movl	%eax, 384(%rbp)
	cltq
	movq	%rsi, 256(%rbp,%rax,8)
	jmp	.L870
.L854:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L735
	movq	%rax, %rdi
	movl	$60, %ecx
	pxor	%xmm0, %xmm0
	movq	%r13, %rsi
	rep movsl
	movq	.LC2(%rip), %rax
	movq	%rax, 400(%rbp)
	movq	.LC44(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	%rax, 416(%rbp)
	cvtsi2sdq	176(%r13), %xmm0
	addsd	.LC44(%rip), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC48(%rip), %xmm0
	movq	184(%r13), %rax
	cvttsd2sil	%xmm0, %r12d
	movsd	.LC44(%rip), %xmm0
	testq	%rax, %rax
	jle	.L858
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L858:
	call	*log2@GOTPCREL(%rip)
	movl	$3, %edx
	movq	360(%rsp), %rdi
	movabsq	$-4658895280553007687, %rsi
	cvttsd2sil	%xmm0, %eax
	movq	%rbp, 328(%rsp)
	movq	%rdi, %rcx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movl	$6, %edx
	cmpl	%edx, %r12d
	cmovg	%edx, %r12d
	movq	8(%r13), %rdx
	shrq	$30, %rcx
	xorq	%rdi, %rcx
	imulq	%rsi, %rcx
	leal	6(%rax,%r12), %eax
	movl	%eax, 384(%rbp)
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	movq	%rcx, %rdi
	imulq	%rsi, %rax
	shrq	$27, %rdi
	xorq	%rdi, %rcx
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movabsq	$-7723592293110705685, %rdx
	imulq	%rdx, %rcx
	imulq	%rdx, %rax
	movq	%rcx, %rdi
	shrq	$31, %rdi
	xorq	%rcx, %rdi
	movl	0(%r13), %ecx
	movq	%rbx, 248(%rbp)
	xorq	%rcx, %rdi
	movq	%rdi, %rcx
	xorq	%rax, %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rcx, %rax
	movq	320(%rsp), %rcx
	movq	%rax, 664(%rbp)
	movq	8(%r13), %r8
	leaq	.LC52(%rip), %rax
	movq	%rax, 256(%rbp)
	movq	%rax, 264(%rbp)
	movq	%rax, 272(%rbp)
	movq	%rax, 280(%rbp)
	movq	%rax, 288(%rbp)
	movq	%rax, 296(%rbp)
	movq	%rax, 304(%rbp)
	movq	%rax, 312(%rbp)
	movq	%rax, 320(%rbp)
	movq	%rax, 328(%rbp)
	movq	%rax, 336(%rbp)
	movq	%rax, 344(%rbp)
	movq	%rax, 352(%rbp)
	movq	%rax, 360(%rbp)
	movq	%rax, 368(%rbp)
	movq	%rax, 376(%rbp)
	movq	%r8, %rax
	shrq	$30, %rax
	xorq	%r8, %rax
	imulq	%rsi, %rax
	movq	%rax, %r8
	shrq	$27, %r8
	xorq	%r8, %rax
	imulq	%rdx, %rax
	xorq	%rax, %rdi
	shrq	$31, %rax
	xorl	%r8d, %r8d
	orq	$-1, %r11
	xorq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$30, %rax
	xorq	%rdi, %rax
	imulq	%rsi, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	movslq	336(%rsp), %rsi
	imulq	%rdx, %rax
	movq	%rsi, %rdi
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rsi
	movq	%rdx, %rbx
	movl	%edx, %esi
	jmp	.L859
.L861:
	leal	(%r8,%rbx), %eax
	cltd
	idivl	%edi
	movslq	%edx, %rax
	imulq	$40, %rax, %rax
	movq	16(%rcx,%rax), %rax
	cmpq	%r11, %rax
	jb	.L860
	movl	%esi, %edx
	movq	%r11, %rax
.L860:
	addl	$1, %r8d
	movl	%edx, %esi
	movq	%rax, %r11
.L859:
	cmpl	%r8d, %edi
	jg	.L861
	movslq	%esi, %rax
	xorl	%r12d, %r12d
	imulq	$40, %rax, %rax
	movq	%r12, 240(%rbp)
	addq	%rax, %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L862
	movq	%rbp, 240(%rax)
.L863:
	addq	$1, 16(%rcx)
	movq	%rbp, 8(%rcx)
	jmp	.L931
.L862:
	movq	%rbp, (%rcx)
	jmp	.L863
	.cfi_endproc
.LFE121:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	CSWTCH.148, @object
	.size	CSWTCH.148, 16
CSWTCH.148:
	.long	6
	.long	17
	.long	18
	.long	19
	.section	.rodata.str1.1
.LC112:
	.string	"fill"
.LC113:
	.string	"glyphs"
.LC114:
	.string	"seed"
.LC115:
	.string	"source"
.LC116:
	.string	"self-test"
.LC117:
	.string	"benchmark"
.LC118:
	.string	"benchmark-sync"
.LC119:
	.string	"help"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	long_options.0, @object
	.size	long_options.0, 416
long_options.0:
	.quad	.LC112
	.long	0
	.zero	4
	.quad	0
	.long	70
	.zero	4
	.quad	.LC63
	.long	1
	.zero	4
	.quad	0
	.long	99
	.zero	4
	.quad	.LC64
	.long	1
	.zero	4
	.quad	0
	.long	114
	.zero	4
	.quad	.LC65
	.long	1
	.zero	4
	.quad	0
	.long	102
	.zero	4
	.quad	.LC68
	.long	1
	.zero	4
	.quad	0
	.long	112
	.zero	4
	.quad	.LC113
	.long	1
	.zero	4
	.quad	0
	.long	103
	.zero	4
	.quad	.LC114
	.long	1
	.zero	4
	.quad	0
	.long	115
	.zero	4
	.quad	.LC115
	.long	1
	.zero	4
	.quad	0
	.long	83
	.zero	4
	.quad	.LC116
	.long	0
	.zero	4
	.quad	0
	.long	84
	.zero	4
	.quad	.LC117
	.long	0
	.zero	4
	.quad	0
	.long	66
	.zero	4
	.quad	.LC118
	.long	0
	.zero	4
	.quad	0
	.long	89
	.zero	4
	.quad	.LC119
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.section	.rodata.str1.1
.LC120:
	.string	"\350\265\260"
.LC121:
	.string	"\343\201\235"
.LC122:
	.string	"\343\202\275"
.LC123:
	.string	"R"
.LC124:
	.string	"\347\234\240"
.LC125:
	.string	"\343\201\277"
.LC126:
	.string	"\343\203\237"
.LC127:
	.string	"S"
.LC128:
	.string	"\345\276\205"
.LC129:
	.string	"\343\201\276"
.LC130:
	.string	"\343\203\236"
.LC131:
	.string	"D"
.LC132:
	.string	"\346\255\242"
.LC133:
	.string	"\343\201\250"
.LC134:
	.string	"\343\203\210"
.LC135:
	.string	"T"
.LC136:
	.string	"\347\265\202"
.LC137:
	.string	"\343\201\227"
.LC138:
	.string	"\343\202\267"
.LC139:
	.string	"Z"
.LC140:
	.string	"\344\270\215"
.LC141:
	.string	"\343\201\265"
.LC142:
	.string	"\343\203\225"
.LC143:
	.string	"?"
.LC144:
	.string	"\351\235\231"
.LC145:
	.string	"\343\201\233"
.LC146:
	.string	"\343\202\273"
.LC147:
	.string	"0"
.LC148:
	.string	"\344\275\216"
.LC149:
	.string	"\343\201\246"
.LC150:
	.string	"\343\203\206"
.LC151:
	.string	"L"
.LC152:
	.string	"\344\270\255"
.LC153:
	.string	"\343\201\241"
.LC154:
	.string	"\343\203\201"
.LC155:
	.string	"M"
.LC156:
	.string	"\351\253\230"
.LC157:
	.string	"\343\201\223"
.LC158:
	.string	"\343\202\263"
.LC159:
	.string	"H"
.LC160:
	.string	"\345\242\227"
.LC161:
	.string	"\343\201\236"
.LC162:
	.string	"\343\202\276"
.LC163:
	.string	"+"
.LC164:
	.string	"\346\270\233"
.LC165:
	.string	"\343\201\222"
.LC166:
	.string	"\343\202\262"
.LC167:
	.string	"-"
.LC168:
	.string	"\345\256\232"
.LC169:
	.string	"\343\201\230"
.LC170:
	.string	"\343\202\270"
.LC171:
	.string	"="
.LC172:
	.string	"\347\204\241"
.LC173:
	.string	"\343\202\200"
.LC174:
	.string	"\343\203\240"
.LC175:
	.string	"\350\252\255"
.LC176:
	.string	"\343\202\210"
.LC177:
	.string	"\343\203\250"
.LC178:
	.string	"\346\233\270"
.LC179:
	.string	"\343\201\213"
.LC180:
	.string	"\343\202\253"
.LC181:
	.string	"W"
.LC182:
	.string	"\345\217\214"
.LC183:
	.string	"B"
.LC184:
	.string	"\347\256\227"
.LC185:
	.string	"\343\201\225"
.LC186:
	.string	"\343\202\265"
.LC187:
	.string	"C"
.LC188:
	.string	"\346\206\266"
.LC189:
	.string	"\343\201\212"
.LC190:
	.string	"\343\202\252"
.LC191:
	.string	"\345\205\245"
.LC192:
	.string	"\343\201\253"
.LC193:
	.string	"\343\203\213"
.LC194:
	.string	"I"
.LC195:
	.string	"\347\224\237"
.LC196:
	.string	"N"
.LC197:
	.string	"\346\225\243"
.LC198:
	.string	"X"
.LC199:
	.string	"\345\210\207"
.LC200:
	.string	"\343\201\215"
.LC201:
	.string	"\343\202\255"
	.section	.data.rel.ro.local
	.align 32
	.type	symbols, @object
	.size	symbols, 736
symbols:
	.quad	.LC120
	.quad	.LC121
	.quad	.LC122
	.quad	.LC123
	.quad	.LC124
	.quad	.LC125
	.quad	.LC126
	.quad	.LC127
	.quad	.LC128
	.quad	.LC129
	.quad	.LC130
	.quad	.LC131
	.quad	.LC132
	.quad	.LC133
	.quad	.LC134
	.quad	.LC135
	.quad	.LC136
	.quad	.LC137
	.quad	.LC138
	.quad	.LC139
	.quad	.LC140
	.quad	.LC141
	.quad	.LC142
	.quad	.LC143
	.quad	.LC144
	.quad	.LC145
	.quad	.LC146
	.quad	.LC147
	.quad	.LC148
	.quad	.LC149
	.quad	.LC150
	.quad	.LC151
	.quad	.LC152
	.quad	.LC153
	.quad	.LC154
	.quad	.LC155
	.quad	.LC156
	.quad	.LC157
	.quad	.LC158
	.quad	.LC159
	.quad	.LC160
	.quad	.LC161
	.quad	.LC162
	.quad	.LC163
	.quad	.LC164
	.quad	.LC165
	.quad	.LC166
	.quad	.LC167
	.quad	.LC168
	.quad	.LC169
	.quad	.LC170
	.quad	.LC171
	.quad	.LC172
	.quad	.LC173
	.quad	.LC174
	.quad	.LC147
	.quad	.LC175
	.quad	.LC176
	.quad	.LC177
	.quad	.LC123
	.quad	.LC178
	.quad	.LC179
	.quad	.LC180
	.quad	.LC181
	.quad	.LC182
	.quad	.LC121
	.quad	.LC122
	.quad	.LC183
	.quad	.LC184
	.quad	.LC185
	.quad	.LC186
	.quad	.LC187
	.quad	.LC188
	.quad	.LC189
	.quad	.LC190
	.quad	.LC155
	.quad	.LC191
	.quad	.LC192
	.quad	.LC193
	.quad	.LC194
	.quad	.LC195
	.quad	.LC145
	.quad	.LC146
	.quad	.LC196
	.quad	.LC197
	.quad	.LC185
	.quad	.LC186
	.quad	.LC198
	.quad	.LC199
	.quad	.LC200
	.quad	.LC201
	.quad	.LC127
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	-1074790400
	.align 8
.LC20:
	.long	0
	.long	1104006501
	.align 8
.LC39:
	.long	0
	.long	1083129856
	.align 8
.LC42:
	.long	-755914244
	.long	1062232653
	.align 8
.LC43:
	.long	1202590843
	.long	1065646817
	.align 8
.LC44:
	.long	0
	.long	1072693248
	.align 8
.LC45:
	.long	0
	.long	1093567616
	.align 8
.LC46:
	.long	0
	.long	1064304640
	.align 8
.LC47:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC48:
	.long	0
	.long	1071644672
	.align 8
.LC50:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC53:
	.long	0
	.long	1076101120
	.align 8
.LC54:
	.long	-1155666488
	.long	1076601226
	.align 8
.LC55:
	.long	-175270496
	.long	1068038260
	.align 8
.LC56:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC57:
	.long	0
	.long	1074266112
	.align 8
.LC58:
	.long	0
	.long	1076363264
	.align 8
.LC59:
	.long	0
	.long	1075838976
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC66:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC67:
	.long	-1
	.long	2146435071
	.section	.rodata.cst16
	.align 16
.LC81:
	.quad	1
	.quad	1
	.section	.rodata.cst8
	.align 8
.LC83:
	.long	0
	.long	1005584384
	.align 8
.LC84:
	.long	0
	.long	1075052544
	.align 8
.LC85:
	.long	619545122
	.long	1072446826
	.align 8
.LC86:
	.long	0
	.long	1070596096
	.align 8
.LC87:
	.long	0
	.long	1075314688
	.section	.rodata.cst16
	.align 16
.LC92:
	.quad	16
	.quad	1
	.align 16
.LC99:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC100:
	.long	0
	.long	1078362112
	.align 8
.LC104:
	.long	-1717986918
	.long	1072273817
	.align 8
.LC106:
	.long	-858993459
	.long	1071434956
	.align 8
.LC107:
	.long	0
	.long	1072168960
	.align 8
.LC108:
	.long	0
	.long	1079574528
	.align 8
.LC111:
	.long	0
	.long	-1076887552
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
