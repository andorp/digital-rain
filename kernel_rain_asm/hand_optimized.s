	.file	"main_optimized.c"
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
.LFB107:
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
	movl	48(%r12), %r15d
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
	movl	%ebp, 48(%r12)
	movl	%ebx, 52(%r12)
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
.LFE107:
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
.LFB104:
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
	movq	16(%rbp), %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movl	$12, %ecx
	xorl	%eax, %eax
	rep stosq
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE104:
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
.LFB117:
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
.LFE117:
	.size	positive_int, .-positive_int
	.p2align 4
	.type	index_rebuild.part.0, @function
index_rebuild.part.0:
.LFB127:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	die
	.cfi_endproc
.LFE127:
	.size	index_rebuild.part.0, .-index_rebuild.part.0
	.set	rain_init.part.0,index_rebuild.part.0
	.set	table_add.part.0,index_rebuild.part.0
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
	je	.L266
.L261:
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
.L266:
	.cfi_restore_state
	testq	%rax, %rax
	leaq	(%rax,%rax), %r12
	movl	$128, %eax
	movq	(%rdi), %rdi
	cmove	%rax, %r12
	imulq	$240, %r12, %rsi
	call	*realloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L267
	movq	%rax, 0(%rbp)
	movq	%r12, 16(%rbp)
	jmp	.L261
.L267:
	call	table_add.part.0
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
	je	.L268
	movl	$2147483647, 36(%rsp)
	leaq	.LC30(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L270:
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L323
.L284:
	leaq	19(%rax), %rbx
	movl	$5, %edx
	leaq	.LC23(%rip), %rsi
	movq	%rbx, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L270
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
	je	.L270
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
	jne	.L270
	leaq	.LC26(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L272
	leaq	.LC27(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L272
	leaq	.LC28(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L270
.L272:
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
	je	.L270
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L273:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L324
.L282:
	leaq	19(%rax), %r13
	movl	$4, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L273
	leaq	.LC31(%rip), %rsi
	movq	%r13, %rdi
	call	*strstr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L273
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
	jg	.L273
	leaq	.LC4(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L273
	movq	%rax, %rdi
	movq	24(%rsp), %rdx
	xorl	%eax, %eax
	leaq	.LC33(%rip), %rsi
	call	*__isoc99_fscanf@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	%eax, %r14d
	call	*fclose@GOTPCREL(%rip)
	cmpl	$1, %r14d
	jne	.L273
	movq	56(%rsp), %rax
	addq	$20000, %rax
	cmpq	$170000, %rax
	ja	.L273
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
	je	.L275
	movl	$1650551903, (%rax)
	movl	$7103842, 3(%rax)
.L275:
	movq	%r13, %rdi
	leaq	.LC4(%rip), %rsi
	leaq	128(%rsp), %r14
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L276
	movq	%rax, %rdx
	movl	$64, %esi
	movq	%r14, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L277
	leaq	.LC35(%rip), %rsi
	movq	%r14, %rdi
	call	*strcspn@GOTPCREL(%rip)
	movb	$0, 128(%rsp,%rax)
.L277:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
.L276:
	leaq	.LC36(%rip), %rsi
	movq	%r14, %rdi
	call	*strcmp@GOTPCREL(%rip)
	movl	%eax, %r13d
	testl	%eax, %eax
	je	.L278
	leaq	.LC37(%rip), %rsi
	movq	%r14, %rdi
	movl	$1, %r13d
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L278
	movl	$10, %edx
	leaq	.LC38(%rip), %rsi
	movq	%r14, %rdi
	movl	$2, %r13d
	call	*strncmp@GOTPCREL(%rip)
	cmpl	$1, %eax
	sbbl	$-1, %r13d
.L278:
	cmpl	%r13d, 36(%rsp)
	jle	.L273
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
	jne	.L282
	.p2align 4,,10
	.p2align 3
.L324:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L284
.L323:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L322
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
.L322:
	.cfi_restore_state
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L268:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L322
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
.LFE134:
	.size	read_temperature.constprop.0, .-read_temperature.constprop.0
	.p2align 4
	.type	record_history.isra.0, @function
record_history.isra.0:
.LFB135:
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
	jle	.L325
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	movq	%rdi, %rbx
	movl	%edx, %ebp
	cvtsi2sdq	%rsi, %xmm0
	movsd	%xmm2, (%rsp)
	movsd	.LC42(%rip), %xmm1
	mulsd	%xmm2, %xmm0
	# Hand pass 3: clamp process rates with SSE2 instructions in place.
	maxsd	%xmm1, %xmm0
	movq	200(%rbx), %rax
	movsd	(%rsp), %xmm2
	testq	%rax, %rax
	js	.L327
	pxor	%xmm3, %xmm3
	cvtsi2sdq	%rax, %xmm3
.L328:
	divsd	%xmm0, %xmm3
	movl	$17, %r12d
	comisd	.LC43(%rip), %xmm3
	jnb	.L329
	movl	$6, %r12d
	pxor	%xmm3, %xmm3
.L329:
	movq	208(%rbx), %rax
	testq	%rax, %rax
	js	.L331
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L332:
	divsd	%xmm2, %xmm0
	movsd	%xmm3, 8(%rsp)
	movsd	.LC44(%rip), %xmm1
	movsd	%xmm2, (%rsp)
	divsd	.LC45(%rip), %xmm0
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movsd	8(%rsp), %xmm3
	movsd	(%rsp), %xmm2
	movapd	%xmm0, %xmm4
	comisd	%xmm3, %xmm0
	ja	.L353
	movq	216(%rbx), %rax
	movapd	%xmm3, %xmm4
	testq	%rax, %rax
	js	.L334
.L385:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L335:
	divsd	%xmm2, %xmm0
	movsd	%xmm4, (%rsp)
	movsd	.LC44(%rip), %xmm1
	divsd	.LC45(%rip), %xmm0
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movsd	(%rsp), %xmm4
	movapd	%xmm0, %xmm3
	comisd	%xmm4, %xmm0
	ja	.L354
	movapd	%xmm4, %xmm3
.L336:
	movq	224(%rbx), %r14
	pxor	%xmm0, %xmm0
	movsd	%xmm3, (%rsp)
	movsd	.LC44(%rip), %xmm1
	cvtsi2sdq	%r14, %xmm0
	mulsd	.LC46(%rip), %xmm0
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movsd	(%rsp), %xmm3
	movapd	%xmm0, %xmm2
	comisd	%xmm3, %xmm0
	ja	.L355
	movapd	%xmm3, %xmm2
.L337:
	negq	%r14
	pxor	%xmm0, %xmm0
	movsd	%xmm2, (%rsp)
	movsd	.LC44(%rip), %xmm1
	cvtsi2sdq	%r14, %xmm0
	mulsd	.LC46(%rip), %xmm0
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movsd	(%rsp), %xmm2
	comisd	%xmm2, %xmm0
	ja	.L356
	cmpq	$0, 232(%rbx)
	movapd	%xmm2, %xmm0
	jle	.L381
.L339:
	movsd	.LC44(%rip), %xmm5
	movl	$20, %eax
	ucomisd	%xmm0, %xmm5
	cmova	%rax, %r12
.L341:
	leal	-1(%r13), %eax
	cmpl	$7, %r13d
	je	.L342
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
.L342:
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
	je	.L346
	leal	-1(%rdx), %eax
	testq	%rdx, %rdx
	je	.L359
.L346:
	testl	%esi, %esi
	je	.L360
	leal	-1(%rax), %edx
	testl	%eax, %eax
	je	.L382
	testl	%edi, %edi
	je	.L362
.L386:
	leal	-1(%rdx), %eax
	testl	%edx, %edx
	je	.L383
.L349:
	testl	%ebp, %ebp
	je	.L350
	testl	%eax, %eax
	je	.L384
.L350:
	salq	$5, %r12
	leaq	symbols(%rip), %rax
	movq	24(%rax,%r12), %rax
.L351:
	movq	%rax, 304(%rbx)
.L325:
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
.L327:
	.cfi_restore_state
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm3, %xmm3
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm3
	addsd	%xmm3, %xmm3
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L353:
	movq	216(%rbx), %rax
	movl	$14, %r12d
	testq	%rax, %rax
	jns	.L385
.L334:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L356:
	cmpq	$0, 232(%rbx)
	movl	$11, %r12d
	jg	.L339
.L381:
	je	.L341
	movsd	.LC44(%rip), %xmm6
	movl	$21, %eax
	ucomisd	%xmm0, %xmm6
	cmova	%rax, %r12
	jmp	.L341
	.p2align 4,,10
	.p2align 3
.L355:
	movl	$10, %r12d
	jmp	.L337
	.p2align 4,,10
	.p2align 3
.L354:
	movl	$15, %r12d
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L331:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L332
	.p2align 4,,10
	.p2align 3
.L360:
	movl	%eax, %edx
	testl	%edi, %edi
	jne	.L386
.L362:
	movl	%edx, %eax
	jmp	.L349
.L359:
	xorl	%eax, %eax
.L347:
	leaq	(%rax,%r12,4), %rdx
	leaq	symbols(%rip), %rax
	movq	(%rax,%rdx,8), %rax
	jmp	.L351
.L382:
	movl	$1, %eax
	jmp	.L347
.L383:
	movl	$2, %eax
	jmp	.L347
.L384:
	movl	$3, %eax
	jmp	.L347
	.cfi_endproc
.LFE135:
	.size	record_history.isra.0, .-record_history.isra.0
	.p2align 4
	.type	semantic_keys.isra.0, @function
semantic_keys.isra.0:
.LFB136:
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
	ja	.L388
	leaq	.L390(%rip), %rdx
	movzbl	%al, %eax
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L390:
	.long	.L394-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L392-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L404-.L390
	.long	.L392-.L390
	.long	.L389-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L391-.L390
	.long	.L388-.L390
	.long	.L391-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L388-.L390
	.long	.L389-.L390
	.text
	.p2align 4,,10
	.p2align 3
.L388:
	movl	$5, %eax
.L393:
	pxor	%xmm1, %xmm1
	movl	%eax, (%rbx)
	cvtsi2sdq	%rdi, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC42(%rip), %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	200(%rbp), %rax
	testq	%rax, %rax
	js	.L395
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L396:
	divsd	%xmm0, %xmm1
	movsd	.LC43(%rip), %xmm0
	movl	$6, %eax
	comisd	%xmm1, %xmm0
	ja	.L397
	movsd	.LC47(%rip), %xmm0
	movl	$7, %eax
	comisd	%xmm1, %xmm0
	ja	.L397
	movsd	.LC48(%rip), %xmm0
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	setbe	%al
	addl	$8, %eax
.L397:
	movq	224(%rbp), %rdx
	movl	%eax, 4(%rbx)
	movl	$10, %eax
	cmpq	$16, %rdx
	jg	.L399
	xorl	%eax, %eax
	cmpq	$-17, %rdx
	setg	%al
	addl	$11, %eax
.L399:
	movl	%eax, 8(%rbx)
	movl	192(%rbp), %edx
	movl	$5, %eax
	testl	%edx, %edx
	je	.L400
	movq	216(%rbp), %rax
	cmpq	$1, %rax
	sbbl	%eax, %eax
	andl	$-2, %eax
	cmpq	$0, 208(%rbp)
	jne	.L418
	addl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L400:
	cmpq	$0, 232(%rbp)
	movl	%eax, 12(%rbx)
	movl	$10, %eax
	jg	.L402
	sete	%al
	movzbl	%al, %eax
	addl	$11, %eax
.L402:
	movl	%eax, 16(%rbx)
	leal	-1(%r12), %eax
	movl	$5, %edx
	cmpl	$3, %eax
	ja	.L403
	leaq	CSWTCH.151(%rip), %rdx
	movl	(%rdx,%rax,4), %edx
.L403:
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
.L389:
	.cfi_restore_state
	movl	$3, %eax
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L391:
	movl	$4, %eax
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L394:
	movl	$2, %eax
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L395:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm1, %xmm1
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L396
	.p2align 4,,10
	.p2align 3
.L418:
	addl	$16, %eax
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L392:
	movl	$1, %eax
	jmp	.L393
	.p2align 4,,10
	.p2align 3
.L404:
	xorl	%eax, %eax
	jmp	.L393
	.cfi_endproc
.LFE136:
	.size	semantic_keys.isra.0, .-semantic_keys.isra.0
	.p2align 4
	.type	index_rebuild, @function
index_rebuild:
.LFB96:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	movl	$16, %esi
	movq	%rbx, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	*calloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L430
	movq	8(%r13), %rsi
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L425
	movq	72(%r13), %rdx
	leaq	-1(%rbx), %rcx
	xorl	%r12d, %r12d
	movabsq	$-4658895280553007687, %r8
	movabsq	$-7723592293110705685, %rdi
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r8, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	movq	%rax, %r9
	shrq	$31, %r9
	xorq	%rax, %r9
	.p2align 4,,10
	.p2align 3
.L424:
	movq	8(%rsi), %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r8, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movl	(%rsi), %edx
	imulq	%rdi, %rax
	xorq	%r9, %rdx
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r8, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rdi, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	jmp	.L429
	.p2align 4,,10
	.p2align 3
.L431:
	addq	$1, %rax
.L429:
	andq	%rcx, %rax
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rbp, %rdx
	cmpb	$0, 8(%rdx)
	jne	.L431
	movq	%rsi, (%rdx)
	addq	$1, %r12
	movb	$1, 8(%rdx)
	movq	248(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L424
.L421:
	movq	16(%r13), %rdi
	call	*free@GOTPCREL(%rip)
	movq	%rbp, 16(%r13)
	movq	%rbx, 24(%r13)
	movq	%r12, 32(%r13)
	movq	$0, 40(%r13)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L425:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L421
.L430:
	call	index_rebuild.part.0
	.cfi_endproc
.LFE96:
	.size	index_rebuild, .-index_rebuild
	.p2align 4
	.type	rain_init, @function
rain_init:
.LFB103:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	movl	%esi, %ebp
	movl	%edx, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%ecx, %edx
	movl	$12, %ecx
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	rep stosq
	movl	%esi, 52(%rbx)
	movl	$2, %edi
	movl	%edx, 64(%rbx)
	movq	%r8, 72(%rbx)
	movl	%ebp, 48(%rbx)
	call	*sysconf@GOTPCREL(%rip)
	movl	$100, %edx
	movslq	%ebp, %rdi
	movl	$40, %esi
	testq	%rax, %rax
	cmovle	%rdx, %rax
	movq	%rax, 56(%rbx)
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L436
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rdi
	movl	$256, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	index_rebuild
.L436:
	.cfi_restore_state
	call	rain_init.part.0
	.cfi_endproc
.LFE103:
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
	jne	.L445
.L437:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L446
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L445:
	.cfi_restore_state
	movq	%rsp, %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L447
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
	jmp	.L437
.L446:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L447:
	leaq	.LC19(%rip), %rdi
	call	die
	.cfi_endproc
.LFE84:
	.size	telemetry_init, .-telemetry_init
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
	je	.L457
	movq	$0, 8(%rsp)
	movq	%rax, %rbx
	xorl	%r13d, %r13d
	leaq	24(%rsp), %rbp
	movq	$0, (%rsp)
	.p2align 4,,10
	.p2align 3
.L450:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L463
	call	*__errno_location@GOTPCREL(%rip)
	leaq	19(%r15), %rdi
	movl	$10, %edx
	movq	%rbp, %rsi
	movq	%rax, %r14
	movl	$0, (%rax)
	call	*strtol@GOTPCREL(%rip)
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jne	.L450
	movq	24(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L450
	leaq	-1(%rax), %rdx
	cmpq	$2147483646, %rdx
	ja	.L450
	leaq	32(%rsp), %rsi
	movl	%eax, %edi
	call	read_process
	testl	%eax, %eax
	je	.L450
	movq	8(%rsp), %rax
	cmpq	%rax, %r13
	je	.L464
.L453:
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
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L463:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$240, %edx
	movq	%r13, %rsi
	leaq	identity_compare(%rip), %rcx
	call	*qsort@GOTPCREL(%rip)
.L449:
	movq	(%rsp), %rax
	movq	%r13, 8(%r12)
	movq	%rax, (%r12)
	movq	8(%rsp), %rax
	movq	%rax, 16(%r12)
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L465
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
.L464:
	.cfi_restore_state
	testq	%r13, %r13
	jne	.L466
	movq	$128, 8(%rsp)
	movl	$30720, %esi
.L454:
	movq	(%rsp), %rdi
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L453
	call	table_add.part.0
	.p2align 4,,10
	.p2align 3
.L466:
	movq	%r13, %rsi
	leaq	(%r13,%r13), %rax
	salq	$4, %rsi
	movq	%rax, 8(%rsp)
	subq	%r13, %rsi
	salq	$5, %rsi
	jmp	.L454
.L457:
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	jmp	.L449
.L465:
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
	jne	.L471
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
	jne	.L472
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L471:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	die
.L472:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE90:
	.size	sampler_init, .-sampler_init
	.p2align 4
	.type	update_semantics.constprop.0, @function
update_semantics.constprop.0:
.LFB137:
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
	movl	64(%r12), %r9d
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
	jne	.L535
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
	movq	72(%r12), %rdx
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
	movq	72(%r12), %rdx
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
	movq	72(%r12), %rdx
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
	movq	72(%r12), %rdx
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
	movq	72(%r12), %rdx
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
	movq	72(%r12), %rdx
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
.L535:
	movl	-12(%rsp), %eax
	movl	%r9d, %ebp
	movl	%r9d, %r12d
	andl	$2, %ebp
	andl	$4, %r12d
	testl	%eax, %eax
	je	.L631
	shrl	$3, %r9d
	leaq	440(%rdi), %r11
	leaq	256(%rdi), %rbx
	addq	$464, %rdi
	leaq	symbols(%rip), %r13
	andl	$1, %r9d
	jmp	.L534
	.p2align 4,,10
	.p2align 3
.L524:
	leal	1(%r10), %eax
	cltd
	idivl	%r8d
	movslq	%edx, %r10
	movl	%r10d, 24(%r11)
	movslq	(%rsi), %rax
	movq	$0, 288(%rbx)
	movq	(%rcx), %rdx
.L523:
	movl	%eax, (%r11)
	movq	%rdx, 240(%rbx)
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L530
	testl	%ebp, %ebp
	je	.L632
	subl	$2, %r10d
	testl	%edx, %edx
	je	.L633
	testl	%r12d, %r12d
	je	.L634
.L529:
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L635
.L532:
	movq	%rax, %r10
	salq	$5, %r10
	movq	24(%r13,%r10), %r10
	testb	%r9b, %r9b
	je	.L527
	testl	%edx, %edx
	je	.L636
.L527:
	addq	$4, %r11
	movq	%r10, (%rbx)
	addq	$4, %rsi
	addq	$8, %rbx
	addq	$8, %rcx
	cmpq	%r11, %rdi
	je	.L473
.L534:
	movslq	(%rsi), %rax
	movslq	24(%r11), %r10
	cmpl	(%r11), %eax
	jne	.L524
	movq	(%rcx), %rdx
	cmpq	240(%rbx), %rdx
	jne	.L524
	movq	-8(%rsp), %r14
	testq	%r14, %r14
	je	.L523
	movq	336(%rbx), %r15
	addq	288(%rbx), %r14
	movq	%r14, 288(%rbx)
	cmpq	%r15, %r14
	jb	.L525
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
	jmp	.L523
	.p2align 4,,10
	.p2align 3
.L632:
	movl	%edx, %r10d
	testl	%r12d, %r12d
	jne	.L529
.L634:
	movl	%r10d, %edx
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L631:
	cmpq	$0, -8(%rsp)
	jne	.L637
	movslq	(%rsi), %rax
	movl	464(%rdi), %edx
	cmpl	%eax, 440(%rdi)
	je	.L638
.L481:
	movq	$0, 544(%rdi)
	leal	1(%rdx), %eax
	movq	(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 464(%rdi)
	movslq	(%rsi), %rax
.L482:
	movl	%eax, 440(%rdi)
	movq	%r10, 496(%rdi)
	testl	%ebp, %ebp
	je	.L544
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L639
.L483:
	testl	%r12d, %r12d
	je	.L546
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L640
.L485:
	movq	%rax, %rdx
	leaq	symbols(%rip), %r13
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L486
	testl	%r11d, %r11d
	je	.L641
.L486:
	movq	%rdx, 256(%rdi)
	movslq	4(%rsi), %rax
	movl	468(%rdi), %edx
	cmpl	444(%rdi), %eax
	je	.L642
.L487:
	movq	$0, 552(%rdi)
	leal	1(%rdx), %eax
	movq	8(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 468(%rdi)
	movslq	4(%rsi), %rax
.L488:
	movl	%eax, 444(%rdi)
	movq	%r10, 504(%rdi)
	testl	%ebp, %ebp
	je	.L548
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L643
.L489:
	testl	%r12d, %r12d
	je	.L550
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L644
.L491:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L492
	testl	%r11d, %r11d
	je	.L645
.L492:
	movq	%rdx, 264(%rdi)
	movslq	8(%rsi), %rax
	movl	472(%rdi), %edx
	cmpl	448(%rdi), %eax
	je	.L646
.L493:
	movq	$0, 560(%rdi)
	leal	1(%rdx), %eax
	movq	16(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 472(%rdi)
	movslq	8(%rsi), %rax
.L494:
	movl	%eax, 448(%rdi)
	movq	%r10, 512(%rdi)
	testl	%ebp, %ebp
	je	.L552
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L647
.L495:
	testl	%r12d, %r12d
	je	.L554
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L648
.L497:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L498
	testl	%r11d, %r11d
	je	.L649
.L498:
	movq	%rdx, 272(%rdi)
	movslq	12(%rsi), %rax
	movl	476(%rdi), %edx
	cmpl	452(%rdi), %eax
	je	.L650
.L499:
	movq	$0, 568(%rdi)
	leal	1(%rdx), %eax
	movq	24(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 476(%rdi)
	movslq	12(%rsi), %rax
.L500:
	movl	%eax, 452(%rdi)
	movq	%r10, 520(%rdi)
	testl	%ebp, %ebp
	je	.L556
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L651
.L501:
	testl	%r12d, %r12d
	je	.L558
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L652
.L503:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L504
	testl	%r11d, %r11d
	je	.L653
.L504:
	movq	%rdx, 280(%rdi)
	movslq	16(%rsi), %rax
	movl	480(%rdi), %edx
	cmpl	%eax, 456(%rdi)
	je	.L654
.L505:
	movq	$0, 576(%rdi)
	leal	1(%rdx), %eax
	movq	32(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 480(%rdi)
	movslq	16(%rsi), %rax
.L506:
	movl	%eax, 456(%rdi)
	movq	%r10, 528(%rdi)
	testl	%ebp, %ebp
	je	.L560
	leal	-1(%rdx), %r10d
	testl	%edx, %edx
	je	.L655
.L507:
	testl	%r12d, %r12d
	je	.L562
	leal	-1(%r10), %r11d
	testl	%r10d, %r10d
	je	.L656
.L509:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	$8, %r9b
	je	.L510
	testl	%r11d, %r11d
	je	.L657
.L510:
	movq	%rdx, 288(%rdi)
	movslq	20(%rsi), %rax
	movl	484(%rdi), %edx
	cmpl	460(%rdi), %eax
	je	.L511
.L513:
	movq	$0, 584(%rdi)
	leal	1(%rdx), %eax
	movq	40(%rcx), %r10
	cltd
	idivl	%r8d
	movl	%edx, 484(%rdi)
	movslq	20(%rsi), %rax
.L512:
	movl	%eax, 460(%rdi)
	movq	%r10, 536(%rdi)
	testl	%ebp, %ebp
	je	.L658
	leal	-1(%rdx), %ecx
	testl	%edx, %edx
	je	.L659
.L514:
	testl	%r12d, %r12d
	je	.L660
	leal	-1(%rcx), %esi
	testl	%ecx, %ecx
	je	.L661
.L520:
	movq	%rax, %rdx
	salq	$5, %rdx
	andl	$8, %r9d
	movq	24(%r13,%rdx), %rdx
	je	.L516
	testl	%esi, %esi
	je	.L662
.L516:
	movq	%rdx, 296(%rdi)
.L473:
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
.L633:
	.cfi_restore_state
	movl	$1, %r10d
.L530:
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L527
.L637:
	shrl	$3, %r9d
	leaq	440(%rdi), %r10
	leaq	256(%rdi), %r11
	addq	$464, %rdi
	leaq	symbols(%rip), %r13
	andl	$1, %r9d
	jmp	.L480
	.p2align 4,,10
	.p2align 3
.L536:
	leal	1(%rbx), %eax
	cltd
	idivl	%r8d
	movl	%edx, 24(%r10)
	movl	%edx, %ebx
	movslq	(%rsi), %rax
	movq	$0, 288(%r11)
	movq	(%rcx), %rdx
.L538:
	movl	%eax, (%r10)
	movq	%rdx, 240(%r11)
	testl	%ebp, %ebp
	je	.L571
	leal	-1(%rbx), %edx
	testl	%ebx, %ebx
	je	.L663
	testl	%r12d, %r12d
	je	.L573
.L666:
	leal	-1(%rdx), %ebx
	testl	%edx, %edx
	je	.L664
.L542:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%r13,%rdx), %rdx
	testb	%r9b, %r9b
	je	.L543
	testl	%ebx, %ebx
	je	.L665
.L543:
	addq	$4, %r10
	movq	%rdx, (%r11)
	addq	$4, %rsi
	addq	$8, %r11
	addq	$8, %rcx
	cmpq	%r10, %rdi
	je	.L473
.L480:
	movslq	(%rsi), %rax
	movl	24(%r10), %ebx
	cmpl	%eax, (%r10)
	jne	.L536
	movq	(%rcx), %rdx
	cmpq	%rdx, 240(%r11)
	jne	.L536
	movq	336(%r11), %r15
	movq	-8(%rsp), %r14
	addq	288(%r11), %r14
	movq	%r14, 288(%r11)
	cmpq	%r15, %r14
	jb	.L630
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
.L630:
	movq	(%rcx), %rdx
	jmp	.L538
.L525:
	movq	(%rcx), %rdx
	jmp	.L523
	.p2align 4,,10
	.p2align 3
.L571:
	movl	%ebx, %edx
	testl	%r12d, %r12d
	jne	.L666
.L573:
	movl	%edx, %ebx
	jmp	.L542
.L635:
	movl	$2, %r10d
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L527
.L636:
	movl	$3, %r10d
	leaq	(%r10,%rax,4), %rax
	movq	0(%r13,%rax,8), %r10
	jmp	.L527
.L511:
	movq	40(%rcx), %r10
	cmpq	%r10, 536(%rdi)
	jne	.L513
	jmp	.L512
.L654:
	movq	32(%rcx), %r10
	cmpq	%r10, 528(%rdi)
	jne	.L505
	jmp	.L506
.L650:
	movq	24(%rcx), %r10
	cmpq	520(%rdi), %r10
	jne	.L499
	jmp	.L500
.L646:
	movq	16(%rcx), %r10
	cmpq	%r10, 512(%rdi)
	jne	.L493
	jmp	.L494
.L642:
	movq	8(%rcx), %r10
	cmpq	504(%rdi), %r10
	jne	.L487
	jmp	.L488
.L638:
	movq	(%rcx), %r10
	cmpq	496(%rdi), %r10
	jne	.L481
	jmp	.L482
.L548:
	movl	%edx, %r10d
	jmp	.L489
.L544:
	movl	%edx, %r10d
	jmp	.L483
.L556:
	movl	%edx, %r10d
	jmp	.L501
.L552:
	movl	%edx, %r10d
	jmp	.L495
.L658:
	movl	%edx, %ecx
	jmp	.L514
.L560:
	movl	%edx, %r10d
	jmp	.L507
.L660:
	movl	%ecx, %esi
	jmp	.L520
.L562:
	movl	%r10d, %r11d
	jmp	.L509
.L558:
	movl	%r10d, %r11d
	jmp	.L503
.L554:
	movl	%r10d, %r11d
	jmp	.L497
.L550:
	movl	%r10d, %r11d
	jmp	.L491
.L546:
	movl	%r10d, %r11d
	jmp	.L485
.L663:
	movl	$1, %edx
.L541:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L543
.L664:
	movl	$2, %edx
	jmp	.L541
.L665:
	movl	$3, %edx
	jmp	.L541
.L657:
	movl	$3, %edx
.L508:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L510
.L656:
	movl	$2, %edx
	jmp	.L508
.L639:
	movl	$1, %edx
	leaq	symbols(%rip), %r13
.L484:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L486
.L659:
	movl	$1, %edx
.L518:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L516
.L662:
	movl	$3, %edx
	jmp	.L518
.L661:
	movl	$2, %edx
	jmp	.L518
.L655:
	movl	$1, %edx
	jmp	.L508
.L651:
	movl	$1, %edx
.L502:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L504
.L653:
	movl	$3, %edx
	jmp	.L502
.L652:
	movl	$2, %edx
	jmp	.L502
.L649:
	movl	$3, %edx
.L496:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L498
.L648:
	movl	$2, %edx
	jmp	.L496
.L641:
	movl	$3, %edx
	jmp	.L484
.L640:
	movl	$2, %edx
	leaq	symbols(%rip), %r13
	jmp	.L484
.L647:
	movl	$1, %edx
	jmp	.L496
.L643:
	movl	$1, %edx
.L490:
	leaq	(%rdx,%rax,4), %rax
	movq	0(%r13,%rax,8), %rdx
	jmp	.L492
.L645:
	movl	$3, %edx
	jmp	.L490
.L644:
	movl	$2, %edx
	jmp	.L490
	.cfi_endproc
.LFE137:
	.size	update_semantics.constprop.0, .-update_semantics.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"drop missing from identity index"
	.text
	.p2align 4
	.type	forget_drop, @function
forget_drop:
.LFB102:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	8(%rdi), %rax
	movq	%rdi, %r8
	movq	%rsi, %rbx
	testq	%rax, %rax
	je	.L668
	leaq	8(%rdi), %rdx
	cmpq	%rsi, %rax
	jne	.L669
	jmp	.L670
	.p2align 4,,10
	.p2align 3
.L690:
	cmpq	%rax, %rbx
	je	.L689
.L669:
	movq	%rax, %rdx
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L690
.L668:
	movq	8(%rbx), %rax
	movq	72(%r8), %rdi
	movabsq	$-4658895280553007687, %rsi
	movabsq	$-7723592293110705685, %rcx
	movq	24(%r8), %r9
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	movq	%rdi, %rax
	shrq	$30, %rax
	imulq	%rcx, %rdx
	xorq	%rdi, %rax
	imulq	%rsi, %rax
	movq	%rax, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rax
	movl	(%rbx), %edi
	imulq	%rcx, %rax
	xorq	%rdx, %rdi
	shrq	$31, %rdx
	xorq	%rdi, %rdx
	leaq	-1(%r9), %rdi
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%rsi, %rdx
	movq	16(%r8), %rsi
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%rdi, %rax
	jmp	.L688
	.p2align 4,,10
	.p2align 3
.L672:
	addq	$1, %rax
	andq	%rdi, %rax
.L688:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rsi, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L671
	cmpb	$1, %cl
	jne	.L672
	cmpq	(%rdx), %rbx
	jne	.L672
	movb	$2, 8(%rdx)
	movdqu	32(%r8), %xmm0
	paddq	.LC52(%rip), %xmm0
	movq	$0, (%rdx)
	movhlps	%xmm0, %xmm1
	movups	%xmm0, 32(%r8)
	movq	%xmm1, %rax
	salq	$2, %rax
	cmpq	%rax, %r9
	jb	.L691
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	*free@GOTPCREL(%rip)
.L689:
	.cfi_restore_state
	addq	$248, %rdx
.L670:
	movq	248(%rbx), %rax
	movq	%rax, (%rdx)
	jmp	.L668
.L691:
	movq	%r8, %rdi
	movq	%r9, %rsi
	call	index_rebuild
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	*free@GOTPCREL(%rip)
.L671:
	.cfi_restore_state
	leaq	.LC53(%rip), %rdi
	call	die
	.cfi_endproc
.LFE102:
	.size	forget_drop, .-forget_drop
	.p2align 4
	.type	index_insert, @function
index_insert:
.LFB98:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	32(%rdi), %rdi
	movq	40(%rbp), %rax
	movq	24(%rbp), %r8
	addq	%rdi, %rax
	leaq	5(%rax,%rax,4), %rdx
	leaq	0(,%r8,8), %rax
	addq	%rdx, %rdx
	subq	%r8, %rax
	cmpq	%rax, %rdx
	jnb	.L707
.L693:
	movq	8(%rbx), %rax
	movq	72(%rbp), %r9
	movabsq	$-4658895280553007687, %rsi
	movabsq	$-7723592293110705685, %rcx
	movq	16(%rbp), %r10
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	movq	%r9, %rax
	shrq	$30, %rax
	imulq	%rcx, %rdx
	xorq	%r9, %rax
	imulq	%rsi, %rax
	movq	%rax, %r9
	shrq	$27, %r9
	xorq	%r9, %rax
	movl	(%rbx), %r9d
	imulq	%rcx, %rax
	xorq	%rdx, %r9
	shrq	$31, %rdx
	xorq	%r9, %rdx
	leaq	-1(%r8), %r9
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%r9, %rax
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r10, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L694
	movq	%r8, %rsi
	.p2align 4,,10
	.p2align 3
.L697:
	cmpb	$2, %cl
	jne	.L695
	cmpq	%r8, %rsi
	cmove	%rax, %rsi
.L695:
	addq	$1, %rax
	andq	%r9, %rax
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r10, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	jne	.L697
	cmpq	%r8, %rsi
	je	.L694
	subq	$1, 40(%rbp)
	salq	$4, %rsi
	leaq	(%r10,%rsi), %rdx
.L694:
	addq	$1, %rdi
	movq	%rbx, (%rdx)
	movb	$1, 8(%rdx)
	movq	%rdi, 32(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L707:
	.cfi_restore_state
	leaq	(%r8,%r8), %rsi
	movq	%rbp, %rdi
	call	index_rebuild
	movq	24(%rbp), %r8
	movq	32(%rbp), %rdi
	jmp	.L693
	.cfi_endproc
.LFE98:
	.size	index_insert, .-index_insert
	.section	.rodata.str1.1
.LC54:
	.string	" "
	.text
	.p2align 4
	.type	rain_sync.constprop.0.isra.0, @function
rain_sync.constprop.0.isra.0:
.LFB139:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	xorl	%edi, %edi
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	88(%r14), %ecx
	movq	.LC62(%rip), %xmm5
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movq	%rdi, 56(%rsp)
	punpcklqdq	%xmm5, %xmm5
	movaps	%xmm5, 64(%rsp)
	testl	%ecx, %ecx
	je	.L709
	movq	80(%r14), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	cmpq	%rax, %rdx
	cmovb	%rdi, %rcx
	movq	%rcx, 56(%rsp)
.L709:
	movq	8(%r14), %rax
	movq	%rdx, 80(%r14)
	movl	$1, 88(%r14)
	testq	%rax, %rax
	je	.L710
	.p2align 4,,10
	.p2align 3
.L711:
	movl	$0, 392(%rax)
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L711
.L710:
	cmpq	$0, 8(%r8)
	je	.L708
	movq	%r8, 32(%rsp)
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L734:
	movq	32(%rsp), %rax
	movq	72(%r14), %rdi
	movabsq	$-4658895280553007687, %rsi
	movq	(%rax), %r13
	movq	%rdi, %rcx
	shrq	$30, %rcx
	addq	%r12, %r13
	xorq	%rdi, %rcx
	movq	8(%r13), %r11
	imulq	%rsi, %rcx
	movl	0(%r13), %r10d
	movq	%r11, %rdx
	shrq	$30, %rdx
	movq	%rcx, %rdi
	xorq	%r11, %rdx
	shrq	$27, %rdi
	imulq	%rsi, %rdx
	xorq	%rdi, %rcx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	movabsq	$-7723592293110705685, %rax
	imulq	%rax, %rcx
	imulq	%rax, %rdx
	movq	%rcx, %r15
	shrq	$31, %r15
	xorq	%rcx, %r15
	movl	%r10d, %ecx
	xorq	%r15, %rcx
	xorq	%rdx, %rcx
	shrq	$31, %rdx
	xorq	%rdx, %rcx
	movq	%rcx, %rdx
	shrq	$30, %rdx
	xorq	%rcx, %rdx
	imulq	%rsi, %rdx
	movq	24(%r14), %rsi
	leaq	-1(%rsi), %rdi
	movq	%rdx, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rdx
	imulq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L713
	movq	16(%r14), %r8
	xorl	%ecx, %ecx
	jmp	.L716
	.p2align 4,,10
	.p2align 3
.L714:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rdi, %rax
	cmpq	%rcx, %rsi
	je	.L713
.L716:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %r9d
	testb	%r9b, %r9b
	je	.L713
	cmpb	$1, %r9b
	jne	.L714
	movq	(%rdx), %rbx
	cmpl	(%rbx), %r10d
	jne	.L714
	cmpq	8(%rbx), %r11
	jne	.L714
	movdqu	0(%r13), %xmm7
	movups	%xmm7, (%rbx)
	movdqu	16(%r13), %xmm7
	movups	%xmm7, 16(%rbx)
	movdqu	32(%r13), %xmm3
	movups	%xmm3, 32(%rbx)
	movdqu	48(%r13), %xmm5
	movups	%xmm5, 48(%rbx)
	movdqu	64(%r13), %xmm6
	movups	%xmm6, 64(%rbx)
	movdqu	80(%r13), %xmm7
	movups	%xmm7, 80(%rbx)
	movdqu	96(%r13), %xmm3
	movups	%xmm3, 96(%rbx)
	movdqu	112(%r13), %xmm5
	movups	%xmm5, 112(%rbx)
	movdqu	128(%r13), %xmm6
	movups	%xmm6, 128(%rbx)
	movdqu	144(%r13), %xmm7
	movups	%xmm7, 144(%rbx)
	movdqu	160(%r13), %xmm3
	movups	%xmm3, 160(%rbx)
	movdqu	176(%r13), %xmm5
	movups	%xmm5, 176(%rbx)
	movdqu	192(%r13), %xmm6
	movups	%xmm6, 192(%rbx)
	movdqu	208(%r13), %xmm4
	movups	%xmm4, 208(%rbx)
	movsd	.LC44(%rip), %xmm4
	movdqu	224(%r13), %xmm7
	movsd	%xmm4, 8(%rsp)
	movups	%xmm7, 224(%rbx)
	movsd	%xmm4, 416(%rbx)
.L735:
	movq	56(%r14), %rax
	movsd	.LC50(%rip), %xmm0
	leaq	80(%rsp), %r15
	movq	%r13, %rsi
	movl	$1, 392(%rbx)
	movq	%r15, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	call	semantic_keys.isra.0
	movl	488(%rbx), %eax
	testl	%eax, %eax
	movq	16(%rsp), %rax
	je	.L724
	movl	440(%rbx), %esi
	cmpl	%esi, 80(%rsp)
	je	.L724
	addq	$1, 640(%rbx)
.L724:
	movdqu	224(%r13), %xmm1
	pxor	%xmm0, %xmm0
	movdqu	648(%rbx), %xmm5
	movdqa	%xmm1, %xmm2
	psrlq	$63, %xmm2
	psubq	%xmm2, %xmm0
	pxor	%xmm0, %xmm1
	psubq	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	paddq	%xmm5, %xmm1
	divsd	.LC55(%rip), %xmm0
	movups	%xmm1, 648(%rbx)
	movaps	%xmm1, 16(%rsp)
	call	*lround@GOTPCREL(%rip)
	movl	$1, %ecx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	testq	%rax, %rax
	movdqa	16(%rsp), %xmm1
	movq	56(%rsp), %r8
	movq	$0, 152(%rsp)
	movq	640(%rbx), %rdx
	cmovne	%rax, %rcx
	movq	152(%r13), %rax
	movdqa	%xmm1, %xmm0
	movhps	%xmm1, 144(%rsp)
	movq	%rdx, 112(%rsp)
	xorl	%edx, %edx
	psrlq	$4, %xmm0
	divq	%rcx
	movq	%xmm0, 128(%rsp)
	movq	%r15, %rdx
	leaq	112(%rsp), %rcx
	pxor	%xmm0, %xmm0
	movq	%rax, 120(%rsp)
	movq	168(%r13), %rax
	addq	160(%r13), %rax
	shrq	$16, %rax
	movq	%rax, 136(%rsp)
	call	update_semantics.constprop.0
	movq	56(%r14), %r15
	movsd	.LC42(%rip), %xmm1
	cvtsi2sdq	%r15, %xmm0
	mulsd	.LC50(%rip), %xmm0
	# Hand pass 4: keep finite rate clamps in registers inside rain_sync.
	maxsd	%xmm1, %xmm0
	movq	200(%rbx), %rax
	movapd	%xmm0, %xmm1
	testq	%rax, %rax
	js	.L725
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L726:
	divsd	%xmm1, %xmm0
	movsd	8(%rsp), %xmm1
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movq	216(%rbx), %rax
	movsd	%xmm0, 16(%rsp)
	addq	208(%rbx), %rax
	js	.L727
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L728:
	divsd	.LC50(%rip), %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	divsd	.LC56(%rip), %xmm0
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	movsd	424(%rbx), %xmm2
	movapd	%xmm0, %xmm1
	movsd	16(%rsp), %xmm0
	movsd	%xmm2, 40(%rsp)
	maxsd	%xmm1, %xmm0
	movsd	40(%rsp), %xmm2
	subsd	%xmm2, %xmm0
	mulsd	.LC57(%rip), %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 424(%rbx)
	movsd	%xmm2, 16(%rsp)
	# Hand pass 1: floor(log2(rss_pages + 1)) is the bit index of
	# rss_pages + 1. Above 2^40-1, retain libm's floating-point
	# rounding behavior in a cold fallback.
	movq	176(%rbx), %rax
	movq	%rax, %rcx
	shrq	$40, %rcx
	jne	.Lhand_rss_slow
	leaq	1(%rax), %rcx
	bsrq	%rcx, %rcx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ecx, %xmm0
	jmp	.Lhand_rss_done
.Lhand_rss_slow:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	8(%rsp), %xmm0
	call	*log2@GOTPCREL(%rip)
.Lhand_rss_done:
	movq	184(%rbx), %rax
	movsd	16(%rsp), %xmm2
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm2, 48(%rsp)
	testq	%rax, %rax
	jle	.Lhand_threads_zero
	movq	%rax, %rcx
	shrq	$40, %rcx
	jne	.Lhand_threads_slow
	bsrq	%rax, %rcx
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ecx, %xmm0
	jmp	.Lhand_threads_done
.Lhand_threads_slow:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	call	*log2@GOTPCREL(%rip)
	jmp	.Lhand_threads_done
.Lhand_threads_zero:
	pxor	%xmm0, %xmm0
.Lhand_threads_done:
	movsd	.LC58(%rip), %xmm1
	movsd	%xmm0, 16(%rsp)
	movsd	.LC50(%rip), %xmm0
	addsd	432(%rbx), %xmm0
	minsd	%xmm1, %xmm0
	movsd	.LC58(%rip), %xmm6
	movsd	%xmm0, 432(%rbx)
	comisd	%xmm0, %xmm6
	ja	.L730
	movsd	48(%rsp), %xmm2
	mulsd	.LC59(%rip), %xmm2
	movapd	%xmm2, %xmm0
	call	*round@GOTPCREL(%rip)
	movl	$6, %eax
	movl	$3, %ecx
	movapd	%xmm0, %xmm1
	movsd	40(%rsp), %xmm0
	mulsd	.LC48(%rip), %xmm0
	cvttsd2sil	%xmm0, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	cvttsd2sil	16(%rsp), %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	leal	6(%rdx,%rax), %eax
	cvttsd2sil	%xmm1, %edx
	addl	%edx, %eax
	movl	$16, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	384(%rbx), %rdx
	cmpl	%edx, %eax
	je	.L730
	movq	$0x000000000, 432(%rbx)
	jle	.L731
	leal	1(%rdx), %eax
	movl	%eax, 384(%rbx)
	leaq	.LC54(%rip), %rax
	movq	%rax, 256(%rbx,%rdx,8)
.L730:
	movl	64(%r14), %edx
	movsd	.LC50(%rip), %xmm0
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	record_history.isra.0
	pxor	%xmm0, %xmm0
	movsd	.LC42(%rip), %xmm1
	cvtsi2sdq	56(%r14), %xmm0
	mulsd	.LC50(%rip), %xmm0
	maxsd	%xmm1, %xmm0
	movq	200(%r13), %rax
	movapd	%xmm0, %xmm1
	testq	%rax, %rax
	js	.L732
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L733:
	divsd	%xmm1, %xmm0
	movsd	8(%rsp), %xmm1
	addq	$1, %rbp
	addq	$240, %r12
	minsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	maxsd	%xmm1, %xmm0
	mulsd	.LC60(%rip), %xmm0
	movq	32(%rsp), %rax
	addsd	.LC61(%rip), %xmm0
	movsd	%xmm0, 408(%rbx)
	cmpq	8(%rax), %rbp
	jb	.L734
.L708:
	movq	168(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L757
	addq	$184, %rsp
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
.L732:
	.cfi_restore_state
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L733
	.p2align 4,,10
	.p2align 3
.L727:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L728
	.p2align 4,,10
	.p2align 3
.L725:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L726
	.p2align 4,,10
	.p2align 3
.L731:
	subl	$1, %edx
	leaq	.LC54(%rip), %rax
	movl	%edx, 384(%rbx)
	movslq	%edx, %rdx
	movq	%rax, 256(%rbx,%rdx,8)
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L713:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L758
	movdqu	0(%r13), %xmm6
	pxor	%xmm0, %xmm0
	movups	%xmm6, (%rax)
	movdqu	16(%r13), %xmm6
	movups	%xmm6, 16(%rax)
	movdqu	32(%r13), %xmm5
	movups	%xmm5, 32(%rax)
	movdqu	48(%r13), %xmm6
	movups	%xmm6, 48(%rax)
	movdqu	64(%r13), %xmm5
	movups	%xmm5, 64(%rax)
	movdqu	80(%r13), %xmm6
	movups	%xmm6, 80(%rax)
	movdqu	96(%r13), %xmm5
	movups	%xmm5, 96(%rax)
	movdqu	112(%r13), %xmm6
	movups	%xmm6, 112(%rax)
	movdqu	128(%r13), %xmm5
	movups	%xmm5, 128(%rax)
	movdqu	144(%r13), %xmm6
	movups	%xmm6, 144(%rax)
	movdqu	160(%r13), %xmm4
	movups	%xmm4, 160(%rax)
	movdqu	176(%r13), %xmm5
	movups	%xmm5, 176(%rax)
	movdqu	192(%r13), %xmm6
	movups	%xmm6, 192(%rax)
	movdqu	208(%r13), %xmm4
	movups	%xmm4, 208(%rax)
	movdqu	224(%r13), %xmm5
	movups	%xmm5, 224(%rax)
	movq	.LC2(%rip), %rax
	movq	%rax, 400(%rbx)
	movq	.LC44(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	%rax, 416(%rbx)
	# Hand pass 2: new drops need the same integer log2 results.
	# Compute them once with BSR and skip two libm calls on the usual path.
	movq	176(%r13), %rdx
	movq	%rdx, %rcx
	shrq	$40, %rcx
	jne	.Lhand_new_rss_slow
	leaq	1(%rdx), %rcx
	bsrq	%rcx, %rcx
	movl	%ecx, %eax
	shrl	$1, %eax
	jmp	.Lhand_new_rss_done
.Lhand_new_rss_slow:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	.LC44(%rip), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC48(%rip), %xmm0
	cvttsd2sil	%xmm0, %eax
.Lhand_new_rss_done:
	movq	184(%r13), %rdx
	movl	%eax, 16(%rsp)
	testq	%rdx, %rdx
	jle	.Lhand_new_threads_zero
	movq	%rdx, %rcx
	shrq	$40, %rcx
	jne	.Lhand_new_threads_slow
	bsrq	%rdx, %rdx
	jmp	.Lhand_new_threads_done
.Lhand_new_threads_slow:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	call	*log2@GOTPCREL(%rip)
	cvttsd2sil	%xmm0, %edx
	jmp	.Lhand_new_threads_done
.Lhand_new_threads_zero:
	xorl	%edx, %edx
.Lhand_new_threads_done:
	movl	16(%rsp), %eax
	movl	0(%r13), %esi
	movq	%r14, %rdi
	movl	$3, %ecx
	movdqa	64(%rsp), %xmm3
	cmpl	%ecx, %edx
	cmovg	%ecx, %edx
	movl	$6, %ecx
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	xorq	%r15, %rsi
	leal	6(%rdx,%rax), %eax
	movq	8(%r13), %rdx
	movups	%xmm3, 256(%rbx)
	movl	%eax, 384(%rbx)
	movq	%rdx, %rax
	movups	%xmm3, 272(%rbx)
	shrq	$30, %rax
	movups	%xmm3, 288(%rbx)
	xorq	%rdx, %rax
	movups	%xmm3, 304(%rbx)
	movabsq	$-4658895280553007687, %rdx
	imulq	%rdx, %rax
	movups	%xmm3, 320(%rbx)
	movups	%xmm3, 336(%rbx)
	movups	%xmm3, 352(%rbx)
	movq	%rax, %rcx
	movups	%xmm3, 368(%rbx)
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movabsq	$-7723592293110705685, %rcx
	imulq	%rcx, %rax
	xorq	%rax, %rsi
	shrq	$31, %rax
	xorq	%rax, %rsi
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	imulq	%rcx, %rax
	movq	%rax, %rsi
	shrq	$31, %rsi
	xorq	%rsi, %rax
	movq	%rbx, %rsi
	movq	%rax, 664(%rbx)
	call	index_insert
	movq	8(%r14), %rax
	movq	8(%r13), %rsi
	movq	%rbx, 8(%r14)
	movabsq	$-4658895280553007687, %rdx
	movq	72(%r14), %rdi
	movq	(%r14), %r10
	movabsq	$-7723592293110705685, %rcx
	movq	%rax, 248(%rbx)
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%rdx, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	movq	%rdi, %rsi
	shrq	$30, %rsi
	imulq	%rcx, %rax
	xorq	%rdi, %rsi
	imulq	%rdx, %rsi
	movq	%rsi, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %rdi
	shrq	$31, %rdi
	xorq	%rdi, %rsi
	movl	0(%r13), %edi
	xorq	%rdi, %rsi
	xorq	%rax, %rsi
	shrq	$31, %rax
	xorq	%rax, %rsi
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movslq	48(%r14), %rcx
	movq	%rcx, %rsi
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rcx
	movslq	%edx, %r11
	testl	%ecx, %ecx
	jle	.L719
	movl	%edx, %ecx
	leal	(%rsi,%rdx), %r8d
	movq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L721:
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	leaq	(%rax,%rax,4), %rax
	movq	16(%r10,%rax,8), %rax
	cmpq	%rdi, %rax
	jnb	.L720
	movslq	%edx, %r11
	movq	%rax, %rdi
.L720:
	addl	$1, %ecx
	cmpl	%r8d, %ecx
	jne	.L721
.L719:
	movq	$0, 240(%rbx)
	leaq	(%r11,%r11,4), %rax
	leaq	(%r10,%rax,8), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L722
	movq	%rbx, 240(%rdx)
.L723:
	addq	$1, 16(%rax)
	movq	%rbx, 8(%rax)
	jmp	.L735
.L722:
	movq	%rbx, (%rax)
	jmp	.L723
.L758:
	leaq	.LC1(%rip), %rdi
	call	die
.L757:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE139:
	.size	rain_sync.constprop.0.isra.0, .-rain_sync.constprop.0.isra.0
	.section	.rodata.str1.1
.LC63:
	.string	" | PAUSED"
.LC64:
	.string	""
.LC65:
	.string	"columns"
.LC66:
	.string	"rows"
.LC67:
	.string	"fps"
.LC70:
	.string	"poll"
.LC71:
	.string	","
.LC72:
	.string	"kanji"
.LC73:
	.string	"hiragana"
.LC74:
	.string	"katakana"
.LC75:
	.string	"ascii"
.LC76:
	.string	"unknown glyph set"
.LC77:
	.string	"empty glyph selection"
.LC78:
	.string	"invalid seed"
.LC79:
	.string	"proc"
	.section	.rodata.str1.8
	.align 8
.LC80:
	.string	"only --source proc is supported"
	.align 8
.LC81:
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
.LC82:
	.string	"unexpected positional argument"
	.section	.rodata.str1.1
.LC84:
	.string	"resize self-test failed"
.LC90:
	.string	"fade self-test failed"
.LC91:
	.string	"index growth self-test failed"
	.section	.rodata.str1.8
	.align 8
.LC92:
	.string	"index removal self-test failed"
	.section	.rodata.str1.1
.LC93:
	.string	"PID reuse self-test failed"
.LC94:
	.string	"kernel_rain: self-test passed"
.LC95:
	.string	"benchmark lookup failed"
	.section	.rodata.str1.8
	.align 8
.LC96:
	.string	"sort+lookup: %.6f s, checksum=%llu\n"
	.align 8
.LC98:
	.string	"sync benchmark produced wrong drop count"
	.section	.rodata.str1.1
.LC99:
	.string	"sync: %.6f s, drops=%zu\n"
.LC100:
	.string	"cannot initialize terminal"
.LC101:
	.string	"cannot read /proc/stat"
.LC102:
	.string	"cpu"
.LC103:
	.string	"memory"
.LC106:
	.string	"io"
.LC107:
	.string	"/proc/pressure/%s"
	.section	.rodata.str1.8
	.align 8
.LC108:
	.string	"some avg10=%lf %*s %*s total=%llu"
	.align 8
.LC110:
	.string	"Enlarge terminal: width >= %d, height >= 4"
	.align 8
.LC114:
	.string	"CPU %3.0f%% %s | proc %3d | switch %.0f/s | fork %.0f/s | disk %.1f MB/s | net %.1f MB/s"
	.align 8
.LC115:
	.string	"%dx%d LEDs | q quit | space pause | r relearn%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB124:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$15, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r14d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.L763(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2152, %rsp
	.cfi_def_cfa_offset 2208
	movl	%edi, (%rsp)
	movl	$6, %edi
	movq	%rsi, 8(%rsp)
	leaq	.LC64(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 2136(%rsp)
	xorl	%eax, %eax
	call	*setlocale@GOTPCREL(%rip)
	movsd	.LC50(%rip), %xmm4
	movq	$0, 56(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$30, 192(%rsp)
	movl	$0, 44(%rsp)
	movl	$60, 48(%rsp)
	movl	$30, 24(%rsp)
	movsd	%xmm4, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L760:
	xorl	%r8d, %r8d
	movq	8(%rsp), %rsi
	movl	(%rsp), %edi
	leaq	long_options.0(%rip), %rcx
	leaq	.LC64(%rip), %rdx
	call	*getopt_long@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L1175
	subl	$66, %eax
	cmpl	$49, %eax
	ja	.L761
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L763:
	.long	.L774-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L773-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L772-.L763
	.long	.L1008-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L770-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L769-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L768-.L763
	.long	.L767-.L763
	.long	.L766-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L761-.L763
	.long	.L765-.L763
	.long	.L761-.L763
	.long	.L764-.L763
	.long	.L762-.L763
	.section	.text.startup
.L762:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	leaq	528(%rsp), %rsi
	movq	%rax, %rbx
	movl	$0, (%rax)
	call	*strtoull@GOTPCREL(%rip)
	movl	(%rbx), %r9d
	movq	%rax, 56(%rsp)
	testl	%r9d, %r9d
	jne	.L787
	movq	optarg(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L787
	movq	528(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L787
	cmpb	$45, %al
	jne	.L760
.L787:
	leaq	.LC78(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L764:
	movq	optarg(%rip), %rdi
	leaq	.LC66(%rip), %rsi
	call	positive_int
	movl	%eax, 48(%rsp)
	jmp	.L760
.L765:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rbx
	leaq	528(%rsp), %rsi
	movq	%rax, %rbp
	movl	$0, (%rax)
	movq	%rbx, %rdi
	call	*strtod@GOTPCREL(%rip)
	movl	0(%rbp), %r10d
	movapd	%xmm0, %xmm6
	movsd	%xmm0, 16(%rsp)
	testl	%r10d, %r10d
	jne	.L775
	cmpb	$0, (%rbx)
	je	.L775
	movq	528(%rsp), %rax
	cmpb	$0, (%rax)
	jne	.L775
	andpd	.LC68(%rip), %xmm0
	movsd	.LC69(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L775
	pxor	%xmm0, %xmm0
	comisd	%xmm6, %xmm0
	jb	.L760
.L775:
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	xorl	%eax, %eax
	leaq	.LC70(%rip), %rcx
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L766:
	movq	stdout(%rip), %rdi
	leaq	.LC81(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%edi, %edi
	call	*exit@GOTPCREL(%rip)
.L767:
	movq	optarg(%rip), %rdi
	call	*strdup@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L827
	leaq	528(%rsp), %r12
	leaq	.LC71(%rip), %rbp
	movq	%rax, 64(%rsp)
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	*strtok_r@GOTPCREL(%rip)
	movq	64(%rsp), %rdi
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L779
	movl	%r14d, 64(%rsp)
	xorl	%r15d, %r15d
	movq	%rdi, %r14
	jmp	.L785
.L1177:
	orl	$1, %r15d
.L781:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	*strtok_r@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1176
.L785:
	leaq	.LC72(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L1177
	leaq	.LC73(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L782
	orl	$2, %r15d
	jmp	.L781
.L768:
	movq	optarg(%rip), %rdi
	leaq	.LC67(%rip), %rsi
	call	positive_int
	movl	%eax, 192(%rsp)
	jmp	.L760
.L769:
	movq	optarg(%rip), %rdi
	leaq	.LC65(%rip), %rsi
	call	positive_int
	movl	%eax, 24(%rsp)
	jmp	.L760
.L770:
	movl	$1, 40(%rsp)
	jmp	.L760
.L772:
	movq	optarg(%rip), %rdi
	leaq	.LC79(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L760
	leaq	.LC80(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L773:
	movl	$1, 44(%rsp)
	jmp	.L760
.L782:
	leaq	.LC74(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L783
	orl	$4, %r15d
	jmp	.L781
.L783:
	leaq	.LC75(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L784
	orl	$8, %r15d
	jmp	.L781
.L1176:
	movq	%r14, %rdi
	movl	64(%rsp), %r14d
	call	*free@GOTPCREL(%rip)
	jmp	.L760
.L1008:
	movl	$1, %r14d
	jmp	.L760
.L774:
	movl	$1, 32(%rsp)
	jmp	.L760
.L1175:
	movl	(%rsp), %eax
	cmpl	optind(%rip), %eax
	jne	.L1178
	testl	%r14d, %r14d
	jne	.L1179
	cmpl	$0, 32(%rsp)
	jne	.L1180
	cmpl	$0, 40(%rsp)
	jne	.L1181
	call	*initscr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L1182
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
	jne	.L1183
.L870:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*getmaxx@GOTPCREL(%rip)
	movl	44(%rsp), %edi
	testl	%edi, %edi
	jne	.L1184
.L871:
	leaq	336(%rsp), %rax
	movq	56(%rsp), %r8
	movl	48(%rsp), %edx
	movl	%r15d, %ecx
	movl	24(%rsp), %esi
	movq	%rax, %rdi
	movq	%rax, 32(%rsp)
	call	rain_init
	leaq	1104(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 56(%rsp)
	call	telemetry_init
	testl	%eax, %eax
	je	.L1185
	leaq	.LC102(%rip), %rdx
	leaq	.LC103(%rip), %rax
	movq	.LC62(%rip), %xmm4
	movq	%rax, %xmm7
	movq	%rdx, %xmm5
	leaq	288(%rsp), %rax
	punpcklqdq	%xmm7, %xmm5
	punpcklqdq	%xmm4, %xmm4
	movq	%rax, %rdi
	movq	%rax, 104(%rsp)
	movaps	%xmm4, 160(%rsp)
	movaps	%xmm5, 144(%rsp)
	call	sampler_init
	call	monotonic_seconds
	leaq	208(%rsp), %rax
	movapd	%xmm0, %xmm7
	addsd	16(%rsp), %xmm7
	movq	%rax, 184(%rsp)
	movsd	%xmm0, 64(%rsp)
	movsd	%xmm7, 8(%rsp)
.L874:
	movq	184(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L887
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	44(%rsp), %esi
	movq	stdscr(%rip), %rdi
	cvtsi2sdq	208(%rsp), %xmm1
	cvtsi2sdq	216(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	testl	%esi, %esi
	jne	.L1186
.L877:
	call	*wgetch@GOTPCREL(%rip)
	movl	%eax, %edx
	andl	$-33, %edx
	cmpl	$81, %edx
	je	.L881
	cmpl	$27, %eax
	je	.L881
	cmpl	$32, %eax
	je	.L1187
	cmpl	$114, %eax
	je	.L1188
.L883:
	movsd	(%rsp), %xmm4
	comisd	8(%rsp), %xmm4
	jnb	.L1189
.L884:
	movl	40(%rsp), %ebx
	testl	%ebx, %ebx
	je	.L952
.L919:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %r13d
	call	*getmaxx@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*werase@GOTPCREL(%rip)
	movl	384(%rsp), %r14d
	leal	(%r14,%r14), %ecx
	cmpl	%ecx, %ebx
	jl	.L1035
	cmpl	$3, %r13d
	jle	.L1035
	movl	388(%rsp), %r15d
	leal	-2(%r13), %eax
	movl	%eax, 80(%rsp)
	cmpl	%r15d, %eax
	cmovg	%r15d, %eax
	movl	%eax, %r12d
	testl	%r14d, %r14d
	jle	.L982
	movq	336(%rsp), %rax
	xorl	%edx, %edx
	movl	%r13d, 88(%rsp)
	movl	%r12d, %r13d
	movl	%r14d, 112(%rsp)
	movl	%r15d, 128(%rsp)
	movq	%rax, %r14
	movl	%edx, %r15d
	movl	%ebx, 96(%rsp)
	jmp	.L981
.L983:
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	je	.L1190
.L981:
	movq	(%r14), %r12
	testq	%r12, %r12
	je	.L983
	movl	388(%r12), %r8d
	testl	%r8d, %r8d
	je	.L983
	movl	384(%r12), %ebx
	subl	$1, %ebx
	js	.L983
	movslq	%ebx, %rbx
	movl	%ebp, 72(%rsp)
	movl	%ecx, 48(%rsp)
	movq	%rbx, %rbp
	movq	%r12, %rbx
	movq	%r14, 64(%rsp)
	movl	%r15d, 24(%rsp)
	jmp	.L995
.L1191:
	cmpb	$0, 1(%r14)
	jne	.L1038
.L984:
	subq	$1, %rbp
	testl	%ebp, %ebp
	js	.L1174
.L995:
	movq	256(%rbx,%rbp,8), %r14
	testq	%r14, %r14
	je	.L984
	cmpb	$32, (%r14)
	je	.L1191
.L1038:
	cvttsd2sil	400(%rbx), %eax
	subl	%ebp, %eax
	movl	%eax, %r15d
	js	.L984
	cmpl	%eax, %r13d
	jle	.L984
	movl	384(%rbx), %eax
	movsd	416(%rbx), %xmm1
	testl	%ebp, %ebp
	je	.L986
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movsd	.LC111(%rip), %xmm7
	cvtsi2sdl	%ebp, %xmm0
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm2, %xmm0
	comisd	%xmm0, %xmm7
	ja	.L987
	movsd	.LC112(%rip), %xmm7
	comisd	%xmm1, %xmm7
	ja	.L984
.L988:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$8, %r9d
	orl	$1048576, %r9d
	movl	%r9d, %r12d
.L990:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	movl	%r12d, %esi
	call	*wattr_on@GOTPCREL(%rip)
	movl	24(%rsp), %edx
	movq	stdscr(%rip), %rdi
	movl	%r15d, %esi
	call	*wmove@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L994
	movq	stdscr(%rip), %rdi
	movl	$-1, %edx
	movq	%r14, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L994:
	subq	$1, %rbp
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	%r12d, %esi
	call	*wattr_off@GOTPCREL(%rip)
	testl	%ebp, %ebp
	jns	.L995
.L1174:
	movl	24(%rsp), %r15d
	movq	64(%rsp), %r14
	movl	48(%rsp), %ecx
	movl	72(%rsp), %ebp
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	jne	.L981
.L1190:
	movl	88(%rsp), %r13d
	movl	96(%rsp), %ebx
	movl	112(%rsp), %r14d
	movl	128(%rsp), %r15d
.L982:
	movq	344(%rsp), %rax
	testq	%rax, %rax
	je	.L979
.L978:
	cmpl	$1, 392(%rax)
	movq	248(%rax), %rax
	sbbl	$-1, %ebp
	testq	%rax, %rax
	jne	.L978
.L979:
	leaq	1616(%rsp), %r10
	movsd	.LC45(%rip), %xmm1
	movsd	.LC113(%rip), %xmm0
	leaq	.LC114(%rip), %r8
	movq	%r10, %rdi
	movl	$512, %ecx
	movl	$2, %edx
	movl	$512, %esi
	mulsd	1256(%rsp), %xmm0
	pushq	%rax
	.cfi_def_cfa_offset 2216
	movl	$5, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 2224
	movsd	1304(%rsp), %xmm4
	movsd	1296(%rsp), %xmm3
	movsd	1288(%rsp), %xmm2
	divsd	%xmm1, %xmm4
	movq	%r10, 40(%rsp)
	leaq	1312(%rsp), %r9
	divsd	%xmm1, %xmm3
	movsd	1280(%rsp), %xmm1
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	.cfi_def_cfa_offset 2216
	leaq	.LC64(%rip), %rax
	popq	%rcx
	.cfi_def_cfa_offset 2208
	leaq	.LC63(%rip), %rdx
	cmpl	$0, 40(%rsp)
	movl	%r14d, %r9d
	movl	$256, %ecx
	cmovne	%rdx, %rax
	movl	$256, %esi
	movl	$2, %edx
	leaq	1360(%rsp), %r12
	leaq	.LC115(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 2216
	movq	%r12, %rdi
	xorl	%eax, %eax
	pushq	%r15
	.cfi_def_cfa_offset 2224
	call	*__snprintf_chk@GOTPCREL(%rip)
	movl	96(%rsp), %esi
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	call	*wmove@GOTPCREL(%rip)
	popq	%rsi
	.cfi_def_cfa_offset 2216
	popq	%rdi
	.cfi_def_cfa_offset 2208
	addl	$1, %eax
	je	.L998
	movq	24(%rsp), %rsi
	movq	stdscr(%rip), %rdi
	leal	-1(%rbx), %edx
	call	*waddnstr@GOTPCREL(%rip)
.L998:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	leal	-1(%r13), %esi
	call	*wmove@GOTPCREL(%rip)
	addl	$1, %eax
	je	.L999
	movq	stdscr(%rip), %rdi
	leal	-1(%rbx), %edx
	movq	%r12, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L999:
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
.L976:
	pxor	%xmm0, %xmm0
	movsd	.LC44(%rip), %xmm1
	movl	$1, %edi
	leaq	432(%rsp), %rsi
	cvtsi2sdl	192(%rsp), %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rsp)
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L887
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movsd	24(%rsp), %xmm1
	cvtsi2sdq	432(%rsp), %xmm2
	cvtsi2sdq	440(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm2, %xmm0
	subsd	(%rsp), %xmm0
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L1000
	cvttsd2siq	%xmm1, %rax
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 24(%rsp)
	movq	%rax, 528(%rsp)
	call	*floor@GOTPCREL(%rip)
	movsd	24(%rsp), %xmm1
	leaq	528(%rsp), %rdi
	xorl	%esi, %esi
	subsd	%xmm0, %xmm1
	mulsd	.LC20(%rip), %xmm1
	cvttsd2siq	%xmm1, %rax
	movq	%rax, 536(%rsp)
	call	*nanosleep@GOTPCREL(%rip)
.L1000:
	movsd	(%rsp), %xmm6
	movsd	%xmm6, 64(%rsp)
	jmp	.L874
.L986:
	movsd	.LC112(%rip), %xmm4
	comisd	%xmm1, %xmm4
	ja	.L1192
	call	*has_colors@GOTPCREL(%rip)
	negb	%al
	sbbl	%r9d, %r9d
	andl	$768, %r9d
	orl	$2097152, %r9d
	movl	%r9d, %r12d
	jmp	.L990
	.p2align 4,,10
	.p2align 3
.L987:
	movsd	.LC112(%rip), %xmm4
	comisd	%xmm1, %xmm4
	jbe	.L1161
	movsd	.LC88(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L988
	jmp	.L984
.L1192:
	movsd	.LC88(%rip), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L1174
.L1161:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$9, %r9d
	movl	%r9d, %r12d
	jmp	.L990
.L1035:
	xorl	%edi, %edi
	leaq	.LC110(%rip), %rdx
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	*mvprintw@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
	jmp	.L976
.L1186:
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*getmaxx@GOTPCREL(%rip)
	movl	44(%rsp), %esi
	cmpl	$1, %eax
	jle	.L878
	subl	$1, %eax
	sarl	%eax
	movl	%eax, %esi
.L878:
	movl	$3, %eax
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	movl	%eax, %edx
	subl	$2, %edx
	cmpl	%esi, 384(%rsp)
	jne	.L879
	cmpl	%edx, 388(%rsp)
	je	.L1168
.L879:
	movq	32(%rsp), %rdi
	call	rain_resize
.L1168:
	movq	stdscr(%rip), %rdi
	jmp	.L877
.L1206:
	movsd	16(%rsp), %xmm6
	addsd	(%rsp), %xmm6
	movl	196(%rsp), %ebp
	movsd	%xmm6, 8(%rsp)
.L952:
	cmpl	$0, 384(%rsp)
	jle	.L919
	movsd	.LC47(%rip), %xmm1
	movsd	(%rsp), %xmm0
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	subsd	64(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 24(%rsp)
	jmp	.L973
.L961:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	384(%rbx), %xmm0
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%r13d, %xmm0
	comisd	%xmm0, %xmm1
	jb	.L955
.L966:
	movq	240(%rbx), %rax
	movq	%rax, (%r12)
	testq	%rax, %rax
	je	.L1193
.L965:
	movq	16(%r12), %rcx
	movq	8(%rbx), %rsi
	movabsq	$-4658895280553007687, %r8
	movabsq	$495873782388, %r9
	xorq	408(%rsp), %r9
	movabsq	$-7723592293110705685, %rdi
	leaq	-1(%rcx), %rax
	movq	%rax, 16(%r12)
	movq	%rsi, %rax
	movq	$0, 240(%rbx)
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%r8, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	movq	%r9, %rsi
	shrq	$30, %rsi
	imulq	%rdi, %rax
	xorq	%r9, %rsi
	imulq	%r8, %rsi
	movq	%rsi, %r9
	shrq	$27, %r9
	xorq	%r9, %rsi
	imulq	%rdi, %rsi
	movq	%rsi, %r9
	shrq	$31, %r9
	xorq	%r9, %rsi
	movl	(%rbx), %r9d
	xorq	%r9, %rsi
	xorq	%rax, %rsi
	shrq	$31, %rax
	xorq	%rax, %rsi
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%r8, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	imulq	%rdi, %rax
	movq	%rax, %rsi
	shrq	$31, %rsi
	xorq	%rsi, %rax
	js	.L967
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L968:
	mulsd	.LC85(%rip), %xmm0
	mulsd	.LC86(%rip), %xmm0
	divsd	.LC89(%rip), %xmm0
	addsd	.LC58(%rip), %xmm0
	movq	%xmm0, %r13
	testl	%edx, %edx
	je	.L969
	movq	.LC2(%rip), %rax
	movl	$0, 388(%rbx)
	movq	%rax, 400(%rbx)
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L970
	movq	%rbx, 240(%rax)
.L971:
	movq	%rbx, 8(%r12)
	movq	%rcx, 16(%r12)
.L972:
	movq	%r13, 24(%r12)
.L955:
	addl	$1, %r15d
	addq	$40, %r14
	cmpl	384(%rsp), %r15d
	jge	.L919
.L973:
	movq	336(%rsp), %r12
	addq	%r14, %r12
	movq	(%r12), %rbx
	testq	%rbx, %rbx
	je	.L955
	movl	388(%rbx), %r11d
	testl	%r11d, %r11d
	jne	.L956
	movl	32(%r12), %r10d
	testl	%r10d, %r10d
	jne	.L957
	movabsq	$-4658895280553007687, %rsi
	movq	8(%rbx), %rdx
	movabsq	$495873782388, %rdi
	xorq	408(%rsp), %rdi
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
	movl	(%rbx), %edi
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
	js	.L958
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L959:
	mulsd	.LC85(%rip), %xmm0
	movl	$1, 32(%r12)
	mulsd	.LC86(%rip), %xmm0
	movsd	%xmm0, 24(%r12)
.L957:
	movsd	24(%r12), %xmm0
	pxor	%xmm1, %xmm1
	subsd	24(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%r12)
	ja	.L955
	movl	$1, 388(%rbx)
.L956:
	movsd	24(%rsp), %xmm1
	mulsd	408(%rbx), %xmm1
	addsd	400(%rbx), %xmm1
	movl	392(%rbx), %edx
	movl	388(%rsp), %r13d
	movsd	%xmm1, 400(%rbx)
	testl	%edx, %edx
	jne	.L961
	movl	%edx, 64(%rsp)
	movsd	24(%rsp), %xmm0
	movsd	%xmm1, 48(%rsp)
	xorpd	.LC104(%rip), %xmm0
	divsd	.LC109(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	pxor	%xmm3, %xmm3
	movsd	48(%rsp), %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdl	384(%rbx), %xmm3
	mulsd	416(%rbx), %xmm0
	movl	64(%rsp), %edx
	cvtsi2sdl	%r13d, %xmm2
	subsd	%xmm3, %xmm1
	movsd	%xmm0, 416(%rbx)
	comisd	%xmm2, %xmm1
	jnb	.L966
	movsd	.LC88(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L966
	jmp	.L955
.L967:
	movq	%rax, %rsi
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rsi
	orq	%rax, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L968
.L969:
	movq	32(%rsp), %rdi
	movq	%rbx, %rsi
	call	forget_drop
	jmp	.L972
.L1193:
	xorl	%r9d, %r9d
	movq	%r9, 8(%r12)
	jmp	.L965
.L1189:
	leaq	528(%rsp), %rbx
	movq	%rbx, %rdi
	call	read_counters
	testl	%eax, %eax
	je	.L886
	leaq	224(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L887
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	224(%rsp), %xmm1
	cvtsi2sdq	232(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC42(%rip), %xmm1
	movsd	%xmm0, 24(%rsp)
	subsd	1152(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	528(%rsp), %rax
	movq	1104(%rsp), %rdx
	movq	536(%rsp), %rsi
	movq	1112(%rsp), %rcx
	movsd	%xmm0, 8(%rsp)
	cmpq	%rdx, %rax
	jb	.L888
	subq	%rdx, %rax
	xorl	%edx, %edx
	cmpq	%rcx, %rsi
	jnb	.L1002
.L889:
	testq	%rax, %rax
	je	.L890
	movsd	.LC44(%rip), %xmm1
	testq	%rdx, %rdx
	js	.L891
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L892:
	testq	%rax, %rax
	js	.L893
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rax, %xmm2
.L894:
	divsd	%xmm2, %xmm0
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 1256(%rsp)
.L890:
	leaq	864(%rsp), %rax
	movq	56(%rsp), %r14
	xorl	%r13d, %r13d
	movdqa	544(%rsp), %xmm6
	movdqa	560(%rsp), %xmm7
	movq	%rax, 48(%rsp)
	leaq	624(%rsp), %r15
	leaq	1264(%rsp), %r12
	movdqa	1120(%rsp), %xmm4
	movaps	%xmm6, 624(%rsp)
	movdqa	1136(%rsp), %xmm5
	movaps	%xmm7, 640(%rsp)
	movaps	%xmm4, 864(%rsp)
	movaps	%xmm5, 880(%rsp)
.L900:
	movq	48(%rsp), %rdi
	movq	(%r15,%r13), %rax
	pxor	%xmm0, %xmm0
	movq	(%rdi,%r13), %rdx
	cmpq	%rdx, %rax
	jb	.L895
	subq	%rdx, %rax
	js	.L896
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L895:
	divsd	8(%rsp), %xmm0
	movsd	%xmm0, (%r12,%r13)
	call	*log1p@GOTPCREL(%rip)
	cmpl	$0, 72(%r14)
	jne	.L898
	movl	$1, 72(%r14)
	movsd	%xmm0, 56(%r14)
.L899:
	addq	$8, %r13
	addq	$24, %r14
	cmpq	$32, %r13
	jne	.L900
	movsd	24(%rsp), %xmm7
	movq	56(%rsp), %rdi
	movl	$12, %ecx
	movq	%rbx, %rsi
	rep movsl
	leaq	1296(%rsp), %rdi
	movsd	%xmm7, 1152(%rsp)
	call	read_temperature.constprop.0
	leaq	256(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L887
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdi
	cvtsi2sdq	256(%rsp), %xmm1
	cvtsi2sdq	264(%rsp), %xmm0
	divsd	.LC20(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %r12
	call	read_process_table
	movq	528(%rsp), %rax
	movq	%r12, %xmm0
	movq	536(%rsp), %r14
	subsd	312(%rsp), %xmm0
	movsd	.LC42(%rip), %xmm1
	movq	%rax, 88(%rsp)
	movq	%r14, 96(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movq	288(%rsp), %r8
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm0, 320(%rsp)
	testq	%r14, %r14
	je	.L907
	imulq	$240, 96(%rsp), %r10
	movq	88(%rsp), %rax
	movq	296(%rsp), %r11
	movq	%rax, %rcx
	addq	%rax, %r10
	testq	%r11, %r11
	je	.L1152
.L905:
	movl	(%rcx), %r9d
	movq	%r11, %rdi
	xorl	%esi, %esi
	jmp	.L912
.L1194:
	jge	.L910
.L1022:
	movq	%rdx, %rdi
.L909:
	cmpq	%rdi, %rsi
	jnb	.L1158
.L912:
	leaq	(%rdi,%rsi), %rdx
	shrq	%rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	cmpl	(%rax), %r9d
	jne	.L1194
	movq	8(%rax), %r14
	cmpq	%r14, 8(%rcx)
	jne	.L1195
	movq	152(%rcx), %rdx
	movq	152(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L1006
	subq	%rsi, %rdx
	movq	%rdx, 200(%rcx)
.L1006:
	movdqu	176(%rax), %xmm6
	movdqu	176(%rcx), %xmm0
	movl	192(%rcx), %edx
	psubq	%xmm6, %xmm0
	movups	%xmm0, 224(%rcx)
	testl	%edx, %edx
	je	.L1158
	cmpl	$0, 192(%rax)
	je	.L1158
	movq	160(%rcx), %rdx
	movq	160(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L917
	subq	%rsi, %rdx
	movq	%rdx, 208(%rcx)
.L917:
	movq	168(%rcx), %rdx
	movq	168(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L1158
	subq	%rax, %rdx
	movq	%rdx, 216(%rcx)
.L1158:
	addq	$240, %rcx
	cmpq	%r10, %rcx
	jne	.L905
.L907:
	movq	%r8, %rdi
	call	*free@GOTPCREL(%rip)
	movq	544(%rsp), %rax
	movdqa	528(%rsp), %xmm5
	movq	%r12, 312(%rsp)
	cmpl	$0, 40(%rsp)
	movq	%rax, 304(%rsp)
	movaps	%xmm5, 288(%rsp)
	je	.L1196
	movsd	16(%rsp), %xmm5
	addsd	(%rsp), %xmm5
	movsd	%xmm5, 8(%rsp)
	jmp	.L919
.L888:
	cmpq	%rcx, %rsi
	jb	.L890
	xorl	%eax, %eax
.L1002:
	subq	%rcx, %rsi
	movq	%rsi, %rdx
	jmp	.L889
.L1187:
	xorl	$1, 40(%rsp)
	jmp	.L883
.L886:
	movsd	16(%rsp), %xmm6
	addsd	(%rsp), %xmm6
	movsd	%xmm6, 8(%rsp)
	jmp	.L884
.L1188:
	movq	56(%rsp), %rdi
	call	telemetry_init
	testl	%eax, %eax
	je	.L881
	movq	104(%rsp), %rbx
	movq	%rbx, %rdi
	call	sampler_destroy
	movq	%rbx, %rdi
	call	sampler_init
	movsd	16(%rsp), %xmm5
	addsd	(%rsp), %xmm5
	xorl	%ecx, %ecx
	movl	%ecx, 424(%rsp)
	movsd	%xmm5, 8(%rsp)
	jmp	.L883
.L958:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L959
.L970:
	movq	%rbx, (%r12)
	jmp	.L971
	.p2align 4,,10
	.p2align 3
.L1195:
	jb	.L1022
.L910:
	leaq	1(%rdx), %rsi
	jmp	.L909
.L898:
	movsd	%xmm0, 72(%rsp)
	movsd	8(%rsp), %xmm0
	xorpd	.LC104(%rip), %xmm0
	divsd	.LC105(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	56(%r14), %xmm2
	movsd	72(%rsp), %xmm1
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
	jmp	.L899
.L896:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L895
.L881:
	call	*endwin@GOTPCREL(%rip)
	movq	104(%rsp), %rdi
	call	sampler_destroy
	movq	32(%rsp), %rdi
	call	rain_destroy
.L848:
	movq	2136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1197
	addq	$2152, %rsp
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
.L761:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC81(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L1152:
	addq	$240, %rcx
	cmpq	%rcx, %r10
	jne	.L1152
	jmp	.L907
.L1184:
	movl	%edi, 24(%rsp)
	cmpl	$1, %eax
	jle	.L872
	subl	$1, %eax
	sarl	%eax
	movl	%eax, 24(%rsp)
.L872:
	movl	$3, %eax
	cmpl	%eax, %ebx
	cmovl	%eax, %ebx
	leal	-2(%rbx), %eax
	movl	%eax, 48(%rsp)
	jmp	.L871
.L779:
	call	*free@GOTPCREL(%rip)
	leaq	.LC77(%rip), %rdi
	call	die
.L1181:
	movl	$8, %ecx
	movl	$60, %edx
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	leaq	528(%rsp), %r13
	movl	$30, %esi
	xorl	%r12d, %r12d
	movl	$1, %r8d
	movq	%r13, %rdi
	leaq	256(%rsp), %r14
	call	rain_init
	movl	32(%rsp), %eax
	movl	$6, %ecx
	xorl	%edx, %edx
	movq	%r14, %rdi
	movdqa	.LC97(%rip), %xmm0
	rep stosl
	leaq	864(%rsp), %rdi
	movl	$60, %ecx
	rep stosl
	movq	%rbp, %rdi
	movq	%r13, %rbp
	movq	%rdx, %r13
	jmp	.L862
	.p2align 4,,10
	.p2align 3
.L860:
	movdqa	880(%rsp), %xmm6
	addq	$1, %r12
	movdqa	896(%rsp), %xmm7
	movl	%r15d, 864(%rsp)
	movq	$1, 872(%rsp)
	movdqa	864(%rsp), %xmm5
	movdqa	912(%rsp), %xmm4
	movups	%xmm6, 16(%rdi,%rbx)
	movdqa	928(%rsp), %xmm3
	movdqa	960(%rsp), %xmm6
	movups	%xmm5, (%rdi,%rbx)
	movdqa	944(%rsp), %xmm5
	movups	%xmm7, 32(%rdi,%rbx)
	movdqa	976(%rsp), %xmm7
	movups	%xmm4, 48(%rdi,%rbx)
	movdqa	992(%rsp), %xmm4
	movups	%xmm3, 64(%rdi,%rbx)
	movups	%xmm5, 80(%rdi,%rbx)
	movdqa	1024(%rsp), %xmm5
	movups	%xmm6, 96(%rdi,%rbx)
	movdqa	1056(%rsp), %xmm6
	movups	%xmm7, 112(%rdi,%rbx)
	movdqa	1072(%rsp), %xmm7
	movb	$83, 1008(%rsp)
	movdqa	1008(%rsp), %xmm3
	movups	%xmm4, 128(%rdi,%rbx)
	movups	%xmm3, 144(%rdi,%rbx)
	movups	%xmm5, 160(%rdi,%rbx)
	movups	%xmm0, 176(%rdi,%rbx)
	movups	%xmm6, 192(%rdi,%rbx)
	movups	%xmm7, 208(%rdi,%rbx)
	movq	%r12, 264(%rsp)
	movaps	%xmm0, 1040(%rsp)
	movdqa	1088(%rsp), %xmm4
	movups	%xmm4, 224(%rdi,%rbx)
	addq	$240, %rbx
	cmpq	$4096, %r12
	je	.L1198
.L862:
	leal	1(%r12), %r15d
	cmpq	%r13, %r12
	jne	.L860
	testq	%r12, %r12
	je	.L1016
	movq	%r12, %rsi
	leaq	(%r12,%r12), %r13
	salq	$4, %rsi
	subq	%r12, %rsi
	salq	$5, %rsi
.L861:
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L827
	movq	%rax, 256(%rsp)
	movdqa	.LC97(%rip), %xmm0
	movq	%r13, 272(%rsp)
	jmp	.L860
.L1016:
	movl	$30720, %esi
	movl	$128, %r13d
	jmp	.L861
.L1198:
	movq	%rbp, %r13
	movq	%rdi, %rbp
	xorl	%ebx, %ebx
	call	monotonic_seconds
	leaq	983040(%rbp), %r12
	movsd	%xmm0, (%rsp)
.L863:
	movq	%rbp, %rax
.L864:
	addq	$1, 152(%rax)
	addq	$240, %rax
	movq	$1, -40(%rax)
	cmpq	%rax, %r12
	jne	.L864
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	addq	$1000, %rbx
	call	rain_sync.constprop.0.isra.0
	cmpq	$8000, %rbx
	jne	.L863
	movq	536(%rsp), %rdx
	xorl	%eax, %eax
	jmp	.L866
.L867:
	movq	248(%rdx), %rdx
	addq	$1, %rax
.L866:
	testq	%rdx, %rdx
	jne	.L867
	cmpq	$4096, %rax
	jne	.L1199
	call	monotonic_seconds
	movl	$4096, %edx
	subsd	(%rsp), %xmm0
	leaq	.LC99(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	rain_destroy
	jmp	.L848
.L1179:
	leaq	432(%rsp), %r12
	movl	$8, %ecx
	movl	$60, %edx
	movl	$1, %r8d
	movq	%r12, %rdi
	movl	$1, %esi
	movl	%r14d, %ebp
	leaq	224(%rsp), %r15
	leaq	624(%rsp), %r13
	call	rain_init
	xorl	%eax, %eax
	movl	$6, %ecx
	movq	%r15, %rdi
	rep stosl
	movl	$60, %ecx
	movq	%r13, %rdi
	xorl	%edx, %edx
	rep stosl
	movdqa	.LC83(%rip), %xmm0
	movb	$83, 768(%rsp)
	movq	$1, 632(%rsp)
	movaps	%xmm0, 800(%rsp)
.L796:
	movl	%ebp, 624(%rsp)
	movq	232(%rsp), %rbx
	cmpq	240(%rsp), %rbx
	je	.L1200
.L793:
	leaq	1(%rbx), %r8
	addl	$1, %ebp
	movl	$60, %ecx
	movq	%r13, %rsi
	imulq	$240, %rbx, %rax
	movq	%r8, 232(%rsp)
	addq	%rdx, %rax
	movq	%rax, %rdi
	rep movsl
	cmpl	$5, %ebp
	jne	.L796
	movq	%rdx, %rbx
	movq	%r8, %rsi
	leaq	identity_compare(%rip), %rcx
	movl	$240, %edx
	movq	%rbx, %rdi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	rain_sync.constprop.0.isra.0
	movq	432(%rsp), %rax
	movl	$60, %edx
	movq	%r12, %rdi
	movl	$3, %esi
	movq	(%rax), %rbp
	movq	.LC60(%rip), %rax
	movl	$1, 388(%rbp)
	movq	%rax, 400(%rbp)
	call	rain_resize
	movq	432(%rsp), %rax
	cmpq	(%rax), %rbp
	jne	.L797
	cmpl	$0, 388(%rbp)
	je	.L797
	movsd	.LC60(%rip), %xmm6
	ucomisd	400(%rbp), %xmm6
	jp	.L797
	jne	.L797
	movq	16(%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	$2, %rdi
	jne	.L797
	cmpq	$1, 56(%rax)
	jne	.L797
	cmpq	$1, 96(%rax)
	jne	.L797
	movq	%rbx, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	rain_destroy
	movl	$1, %r8d
	movl	$60, %edx
	movq	%r12, %rdi
	movl	$8, %ecx
	movl	$1, %esi
	call	rain_init
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	$6, %ecx
	rep stosl
	movq	%r13, %rsi
	movq	%r15, %rdi
	movl	$1, 624(%rsp)
	call	table_add
	movq	%r13, %rsi
	movq	%r15, %rdi
	movl	$2, 624(%rsp)
	call	table_add
	movq	%r15, %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	call	rain_sync.constprop.0.isra.0
	movq	432(%rsp), %rax
	movl	$60, %ecx
	xorl	%edx, %edx
	movq	224(%rsp), %r13
	movq	(%rax), %rbx
	leaq	240(%r13), %rsi
	movq	%r13, %rdi
	movl	$1, 388(%rbx)
	movq	$0x000000000, 400(%rbx)
	movl	$1, 32(%rax)
	rep movsl
	movq	%r15, %rsi
	movq	%r12, %rdi
	movq	$1, 232(%rsp)
	call	rain_sync.constprop.0.isra.0
	movl	480(%rsp), %r8d
	xorl	%edx, %edx
	movl	%r14d, 40(%rsp)
	movq	432(%rsp), %r15
	movq	%rbx, 16(%rsp)
	movl	%edx, %ebx
	movq	%r13, 24(%rsp)
	movq	%r12, %r13
	movl	%r8d, %r12d
.L800:
	testl	%r12d, %r12d
	jle	.L821
	xorl	%r14d, %r14d
	movl	%ebx, 32(%rsp)
	movl	%r12d, %ebx
	movq	%r15, %r12
	movq	%r14, %r15
	jmp	.L820
.L1203:
	comisd	%xmm1, %xmm2
	jb	.L802
.L813:
	movq	240(%rbp), %rax
	movq	%rax, (%r14)
	testq	%rax, %rax
	je	.L1201
.L812:
	movq	16(%r14), %r10
	movq	8(%rbp), %rdx
	movabsq	$-4658895280553007687, %rdi
	movabsq	$495873782388, %r11
	xorq	504(%rsp), %r11
	movabsq	$-7723592293110705685, %rsi
	leaq	-1(%r10), %rax
	movq	%rax, 16(%r14)
	movq	%rdx, %rax
	movq	$0, 240(%rbp)
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rax, %rdx
	movq	%r11, %rax
	shrq	$30, %rax
	imulq	%rsi, %rdx
	xorq	%r11, %rax
	imulq	%rdi, %rax
	movq	%rax, %r11
	shrq	$27, %r11
	xorq	%r11, %rax
	imulq	%rsi, %rax
	movq	%rax, %r11
	shrq	$31, %r11
	xorq	%r11, %rax
	movl	0(%rbp), %r11d
	xorq	%r11, %rax
	xorq	%rdx, %rax
	shrq	$31, %rdx
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rdi, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rsi, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	js	.L814
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L815:
	mulsd	.LC85(%rip), %xmm0
	mulsd	.LC86(%rip), %xmm0
	divsd	.LC89(%rip), %xmm0
	addsd	.LC58(%rip), %xmm0
	testl	%ecx, %ecx
	je	.L816
	movq	.LC2(%rip), %rax
	movl	$0, 388(%rbp)
	movq	%rax, 400(%rbp)
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.L817
	movq	%rbp, 240(%rax)
.L818:
	movq	%rbp, 8(%r14)
	movq	%r10, 16(%r14)
.L819:
	movsd	%xmm0, 24(%r14)
.L802:
	addq	$1, %r15
	cmpl	%r15d, %ebx
	jle	.L1202
.L820:
	leaq	(%r15,%r15,4), %rax
	leaq	(%r12,%rax,8), %r14
	movq	(%r14), %rbp
	testq	%rbp, %rbp
	je	.L802
	movl	388(%rbp), %r8d
	movsd	.LC47(%rip), %xmm2
	testl	%r8d, %r8d
	jne	.L803
	movl	32(%r14), %edi
	testl	%edi, %edi
	je	.L804
	movsd	24(%r14), %xmm0
.L805:
	movsd	.LC47(%rip), %xmm2
	pxor	%xmm1, %xmm1
	subsd	%xmm2, %xmm0
	movsd	%xmm2, (%rsp)
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%r14)
	ja	.L802
	movl	$1, 388(%rbp)
	movsd	(%rsp), %xmm2
.L803:
	pxor	%xmm1, %xmm1
	movl	392(%rbp), %ecx
	cvtsi2sdl	384(%rbp), %xmm1
	mulsd	408(%rbp), %xmm2
	addsd	400(%rbp), %xmm2
	movsd	%xmm2, 400(%rbp)
	subsd	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	cvtsi2sdl	484(%rsp), %xmm1
	movapd	%xmm2, %xmm0
	testl	%ecx, %ecx
	jne	.L1203
	movsd	.LC87(%rip), %xmm2
	mulsd	416(%rbp), %xmm2
	comisd	%xmm1, %xmm0
	movsd	%xmm2, 416(%rbp)
	jnb	.L813
	movsd	.LC88(%rip), %xmm7
	comisd	%xmm2, %xmm7
	ja	.L813
	jmp	.L802
.L1200:
	testq	%rbx, %rbx
	movl	$128, %eax
	leaq	(%rbx,%rbx), %rcx
	movq	%rdx, %rdi
	cmove	%rax, %rcx
	imulq	$240, %rcx, %rsi
	movq	%rcx, (%rsp)
	call	*realloc@GOTPCREL(%rip)
	movq	(%rsp), %rcx
	testq	%rax, %rax
	je	.L1204
	movq	%rax, 224(%rsp)
	movq	%rax, %rdx
	movq	%rcx, 240(%rsp)
	jmp	.L793
	.p2align 4,,10
	.p2align 3
.L804:
	movabsq	$495873782388, %rdi
	movq	8(%rbp), %rdx
	xorq	504(%rsp), %rdi
	movabsq	$-4658895280553007687, %rcx
	movq	%rdi, %rsi
	movq	%rdx, %rax
	shrq	$30, %rsi
	shrq	$30, %rax
	xorq	%rdi, %rsi
	xorq	%rdx, %rax
	imulq	%rcx, %rsi
	imulq	%rcx, %rax
	movq	%rsi, %rdi
	movq	%rax, %rdx
	shrq	$27, %rdi
	shrq	$27, %rdx
	xorq	%rdi, %rsi
	xorq	%rdx, %rax
	movabsq	$-7723592293110705685, %rdx
	imulq	%rdx, %rsi
	imulq	%rdx, %rax
	movq	%rsi, %rdi
	shrq	$31, %rdi
	xorq	%rdi, %rsi
	movl	0(%rbp), %edi
	xorq	%rdi, %rsi
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
	imulq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	js	.L806
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L807:
	mulsd	.LC85(%rip), %xmm0
	movl	$1, 32(%r14)
	mulsd	.LC86(%rip), %xmm0
	jmp	.L805
.L814:
	movq	%rdx, %rax
	andl	$1, %edx
	pxor	%xmm0, %xmm0
	shrq	%rax
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L815
.L816:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movsd	%xmm0, (%rsp)
	call	forget_drop
	movl	480(%rsp), %ebx
	movsd	(%rsp), %xmm0
	movq	432(%rsp), %r12
	jmp	.L819
.L1201:
	movq	$0, 8(%r14)
	jmp	.L812
.L1202:
	movq	%r12, %r15
	movl	%ebx, %r12d
	movl	32(%rsp), %ebx
	addl	$1, %ebx
	cmpl	$20, %ebx
	jne	.L800
.L821:
	movq	%r13, %r12
	movl	40(%rsp), %r14d
	movq	16(%rsp), %rbx
	movq	24(%rsp), %r13
	cmpq	(%r15), %rbx
	je	.L822
	movq	504(%rsp), %rdx
	movq	456(%rsp), %rdi
	movabsq	$-4658895280553007687, %rsi
	movabsq	$-7723592293110705685, %rcx
	movq	448(%rsp), %r9
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
	xorq	%rax, %rdx
	movabsq	$6238072747940578788, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rsi, %rax
	leaq	-1(%rdi), %rsi
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	andq	%rsi, %rax
	jmp	.L823
.L825:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rsi, %rax
.L823:
	cmpq	%rcx, %rdi
	je	.L824
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r9, %rdx
	movzbl	8(%rdx), %r8d
	testb	%r8b, %r8b
	je	.L824
	subb	$1, %r8b
	jne	.L825
	movq	(%rdx), %rdx
	cmpl	$1, (%rdx)
	jne	.L825
	cmpq	$1, 8(%rdx)
	jne	.L825
.L822:
	leaq	.LC90(%rip), %rdi
	call	die
.L817:
	movq	%rbp, (%r14)
	jmp	.L818
.L806:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L807
.L824:
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r12, %rdi
	call	rain_destroy
	movl	$1, %r8d
	movl	$8, %ecx
	movq	%r12, %rdi
	movl	$60, %edx
	movl	$1, %esi
	call	rain_init
.L828:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L827
	movl	%r14d, (%rax)
	movq	%rax, %rsi
	movq	%r12, %rdi
	addl	$1, %r14d
	movq	$1, 8(%rax)
	call	index_insert
	movq	440(%rsp), %rax
	movq	%rbx, 440(%rsp)
	movq	%rax, 248(%rbx)
	cmpl	$1025, %r14d
	jne	.L828
	movabsq	$-4658895280553007687, %rbx
	movl	$2, %r14d
	movabsq	$-7723592293110705685, %r15
	movabsq	$6238072747940578789, %rbp
.L833:
	movq	504(%rsp), %rdx
	movq	456(%rsp), %rdi
	movq	%rdx, %rax
	leaq	-1(%rdi), %r8
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%rbx, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	xorq	%r14, %rax
	shrq	$31, %rdx
	xorq	%rdx, %rax
	xorq	%rbp, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%rbx, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r15, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%r8, %rax
	testq	%rdi, %rdi
	je	.L829
	movq	448(%rsp), %r9
	xorl	%esi, %esi
	jmp	.L832
	.p2align 4,,10
	.p2align 3
.L830:
	addq	$1, %rax
	addq	$1, %rsi
	andq	%r8, %rax
	cmpq	%rsi, %rdi
	je	.L829
.L832:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r9, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L829
	cmpb	$1, %cl
	jne	.L830
	movq	(%rdx), %rdx
	cmpl	%r14d, (%rdx)
	jne	.L830
	movq	8(%rdx), %r13
	cmpq	$1, %r13
	jne	.L830
	movq	%rdx, %rsi
	movq	%r12, %rdi
	addq	$2, %r14
	call	forget_drop
	cmpq	$1026, %r14
	jne	.L833
	movq	504(%rsp), %rdx
	movq	456(%rsp), %rsi
	movabsq	$-4658895280553007687, %r11
	movabsq	$-7723592293110705685, %r10
	movq	448(%rsp), %r8
	movabsq	$6238072747940578789, %rbx
	movq	%rdx, %rax
	leaq	-1(%rsi), %rdi
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r10, %rax
	movq	%rax, %r14
	movq	%rax, %r9
	shrq	$31, %r14
.L838:
	movq	%r9, %rax
	xorq	%r13, %rax
	xorq	%r14, %rax
	xorq	%rbx, %rax
	movq	%rax, %rdx
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
	andq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L1012
	xorl	%ebp, %ebp
	jmp	.L836
	.p2align 4,,10
	.p2align 3
.L835:
	addq	$1, %rax
	addq	$1, %rbp
	andq	%rdi, %rax
	cmpq	%rbp, %rsi
	je	.L1012
.L836:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L1012
	cmpb	$1, %cl
	jne	.L835
	movq	(%rdx), %rdx
	cmpl	%r13d, (%rdx)
	jne	.L835
	cmpq	$1, 8(%rdx)
	jne	.L835
	movl	$1, %eax
.L834:
	movl	%r13d, %edx
	andl	$1, %edx
	cmpb	%al, %dl
	jne	.L1205
	addq	$1, %r13
	cmpq	$1025, %r13
	jne	.L838
	movq	%r12, (%rsp)
	movq	8(%rsp), %r15
	movabsq	$-4658895280553007687, %r13
	movabsq	$-7723592293110705685, %rbx
	movabsq	$6238072747940578789, %rbp
	movabsq	$-2606959012126976886, %r14
.L847:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L827
	movl	%r15d, (%rax)
	movq	(%rsp), %rdi
	movq	%rax, %rsi
	movq	$2, 8(%rax)
	call	index_insert
	movq	440(%rsp), %rax
	movq	504(%rsp), %rdx
	movq	%r12, 440(%rsp)
	movq	456(%rsp), %rsi
	movq	%rax, 248(%r12)
	movq	%rdx, %rax
	shrq	$30, %rax
	leaq	-1(%rsi), %rcx
	xorq	%rdx, %rax
	imulq	%r13, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rbx, %rax
	movq	%rax, %r10
	shrq	$31, %r10
	xorq	%rax, %r10
	xorq	%r15, %r10
	movq	%r10, %rax
	xorq	%rbp, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rbx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%rcx, %rax
	testq	%rsi, %rsi
	je	.L839
	movq	448(%rsp), %rdi
	xorl	%r9d, %r9d
	jmp	.L842
	.p2align 4,,10
	.p2align 3
.L841:
	addq	$1, %rax
	addq	$1, %r9
	andq	%rcx, %rax
	cmpq	%r9, %rsi
	je	.L840
.L842:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rdi, %rdx
	movzbl	8(%rdx), %r11d
	testb	%r11b, %r11b
	je	.L840
	cmpb	$1, %r11b
	jne	.L841
	movq	(%rdx), %rdx
	cmpl	%r15d, (%rdx)
	jne	.L841
	cmpq	$1, 8(%rdx)
	jne	.L841
.L839:
	leaq	.LC93(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L1012:
	xorl	%eax, %eax
	jmp	.L834
.L840:
	xorq	%r14, %r10
	xorl	%r9d, %r9d
	movq	%r10, %rdx
	shrq	$30, %rdx
	xorq	%r10, %rdx
	imulq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%rbx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	andq	%rcx, %rax
	jmp	.L845
	.p2align 4,,10
	.p2align 3
.L843:
	addq	$1, %rax
	addq	$1, %r9
	andq	%rcx, %rax
	cmpq	%r9, %rsi
	je	.L839
.L845:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rdi, %rdx
	movzbl	8(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L839
	cmpb	$1, %r10b
	jne	.L843
	movq	(%rdx), %rdx
	cmpl	%r15d, (%rdx)
	jne	.L843
	cmpq	$2, 8(%rdx)
	jne	.L843
	cmpq	%rdx, %r12
	jne	.L839
	addq	$2, %r15
	cmpq	$1026, %r15
	jne	.L847
	movq	(%rsp), %rdi
	call	rain_destroy
	leaq	.LC94(%rip), %rdi
	call	*puts@GOTPCREL(%rip)
	jmp	.L848
.L829:
	leaq	.LC91(%rip), %rdi
	call	die
.L1205:
	leaq	.LC92(%rip), %rdi
	call	die
.L797:
	leaq	.LC84(%rip), %rdi
	call	die
.L1204:
	call	table_add.part.0
.L891:
	movq	%rdx, %rcx
	andl	$1, %edx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L892
.L887:
	leaq	.LC19(%rip), %rdi
	call	die
.L1197:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L1196:
	movq	1120(%rsp), %rcx
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	leaq	.LC106(%rip), %rax
	movq	%rax, 880(%rsp)
	movsd	.LC2(%rip), %xmm0
	xorl	%eax, %eax
	leaq	1360(%rsp), %r12
	movdqa	144(%rsp), %xmm4
	movq	%rcx, 80(%rsp)
	movq	%rax, 72(%rsp)
	movl	%ebp, %eax
	movq	%r14, %rbp
	movaps	%xmm4, 864(%rsp)
	movl	%eax, %r14d
	movsd	%xmm0, 8(%rsp)
.L924:
	movq	48(%rsp), %rax
	movl	$2, %edx
	movl	$64, %ecx
	movq	%r12, %rdi
	leaq	.LC107(%rip), %r8
	movl	$64, %esi
	movq	(%rax,%rbp,8), %r9
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC4(%rip), %rsi
	movq	%r12, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L923
	leaq	1616(%rsp), %r8
	movl	$512, %esi
	movq	%rax, 136(%rsp)
	movq	%r8, %rdi
	movq	%r8, 128(%rsp)
	call	*fgets@GOTPCREL(%rip)
	movq	136(%rsp), %rdi
	movq	%rax, 112(%rsp)
	call	*fclose@GOTPCREL(%rip)
	movq	112(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L923
	xorl	%eax, %eax
	movq	128(%rsp), %rdi
	movq	%rbx, %rcx
	leaq	432(%rsp), %rdx
	leaq	.LC108(%rip), %rsi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$2, %eax
	jne	.L923
	movq	528(%rsp), %rdi
	addq	%rdi, 72(%rsp)
	movsd	432(%rsp), %xmm0
	comisd	8(%rsp), %xmm0
	jbe	.L923
	leal	2(%rbp), %r13d
	movsd	%xmm0, 8(%rsp)
.L923:
	addq	$1, %rbp
	cmpq	$3, %rbp
	jne	.L924
	movsd	8(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	movq	80(%rsp), %rcx
	movl	%r14d, %ebp
	comisd	%xmm1, %xmm0
	jb	.L925
	movsd	.LC86(%rip), %xmm1
	movl	$1, %edx
	ucomisd	%xmm0, %xmm1
	cmova	%edx, %r13d
.L925:
	xorl	%eax, %eax
	cmpl	$0, 424(%rsp)
	movq	%rax, 80(%rsp)
	je	.L927
	movq	416(%rsp), %rdx
	cmpq	%rdx, %rcx
	jb	.L927
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, 80(%rsp)
.L927:
	movq	%rcx, 416(%rsp)
	movq	344(%rsp), %rdx
	movl	$1, 424(%rsp)
	jmp	.L928
.L929:
	xorl	%eax, %eax
	movl	%eax, 392(%rdx)
	movq	248(%rdx), %rdx
.L928:
	testq	%rdx, %rdx
	jne	.L929
	movq	72(%rsp), %rax
	movl	$1000000, %ecx
	xorl	%edx, %edx
	movl	%ebp, 196(%rsp)
	movabsq	$-4658895280553007687, %r12
	movq	88(%rsp), %rbx
	divq	%rcx
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	movq	%rax, 72(%rsp)
.L930:
	movq	96(%rsp), %rdi
	cmpq	%rdi, 72(%rsp)
	je	.L1206
	movq	8(%rbx), %r11
	movq	408(%rsp), %rsi
	movabsq	$-7723592293110705685, %rcx
	movl	(%rbx), %r10d
	movq	%r11, %rax
	shrq	$30, %rax
	xorq	%r11, %rax
	imulq	%r12, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movq	%rsi, %rdx
	shrq	$30, %rdx
	imulq	%rcx, %rax
	xorq	%rsi, %rdx
	imulq	%r12, %rdx
	movq	%rdx, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rdx
	movq	360(%rsp), %rsi
	imulq	%rcx, %rdx
	leaq	-1(%rsi), %rdi
	movq	%rdx, %r14
	shrq	$31, %r14
	xorq	%rdx, %r14
	movl	%r10d, %edx
	xorq	%r14, %rdx
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r12, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	andq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L931
	movq	352(%rsp), %r8
	xorl	%ecx, %ecx
	jmp	.L934
.L932:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rdi, %rax
	cmpq	%rcx, %rsi
	je	.L931
.L934:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %r9d
	testb	%r9b, %r9b
	je	.L931
	cmpb	$1, %r9b
	jne	.L932
	movq	(%rdx), %rbp
	cmpl	0(%rbp), %r10d
	jne	.L932
	cmpq	8(%rbp), %r11
	jne	.L932
	movsd	.LC44(%rip), %xmm5
	movl	$60, %ecx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	rep movsl
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm5, 416(%rbp)
.L1004:
	movsd	24(%rsp), %xmm0
	movq	%r15, %rcx
	movl	%r13d, %edx
	movq	%rbx, %rsi
	movq	392(%rsp), %r14
	movl	$1, 392(%rbp)
	movq	%r14, %rdi
	call	semantic_keys.isra.0
	cmpl	$0, 488(%rbp)
	je	.L941
	movl	440(%rbp), %eax
	cmpl	%eax, 624(%rsp)
	je	.L941
	addq	$1, 640(%rbp)
.L941:
	movdqu	224(%rbx), %xmm0
	pxor	%xmm2, %xmm2
	movq	232(%rbx), %rax
	movdqu	648(%rbp), %xmm6
	movdqa	%xmm0, %xmm1
	movq	%rax, %rcx
	psrlq	$63, %xmm1
	negq	%rcx
	psubq	%xmm1, %xmm2
	movdqa	%xmm0, %xmm1
	cmovs	%rax, %rcx
	addq	656(%rbp), %rcx
	pxor	%xmm2, %xmm1
	movq	%rcx, 128(%rsp)
	psubq	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%r14, %xmm2
	paddq	%xmm6, %xmm1
	movups	%xmm1, 648(%rbp)
	movaps	%xmm1, 112(%rsp)
	movapd	%xmm2, %xmm0
	movsd	%xmm2, 88(%rsp)
	divsd	.LC55(%rip), %xmm0
	call	*lround@GOTPCREL(%rip)
	movq	640(%rbp), %rdx
	movq	%rbp, %rdi
	movl	$1, %esi
	testq	%rax, %rax
	movdqa	112(%rsp), %xmm1
	movq	80(%rsp), %r8
	cmovne	%rax, %rsi
	movq	152(%rbx), %rax
	movq	%rdx, 864(%rsp)
	xorl	%edx, %edx
	movq	128(%rsp), %rcx
	movdqa	%xmm1, %xmm0
	divq	%rsi
	movq	32(%rsp), %rsi
	movq	%rcx, 896(%rsp)
	movq	48(%rsp), %rcx
	psrlq	$4, %xmm0
	movq	%r15, %rdx
	movq	%xmm0, 880(%rsp)
	movq	%rax, 872(%rsp)
	movq	168(%rbx), %rax
	addq	160(%rbx), %rax
	shrq	$16, %rax
	movq	%rax, 888(%rsp)
	movq	176(%rsp), %rax
	movq	%rax, 904(%rsp)
	call	update_semantics.constprop.0
	movsd	88(%rsp), %xmm2
	mulsd	24(%rsp), %xmm2
	movsd	.LC42(%rip), %xmm1
	movapd	%xmm2, %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	200(%rbp), %rax
	movsd	%xmm0, 88(%rsp)
	testq	%rax, %rax
	js	.L942
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L943:
	movsd	8(%rsp), %xmm1
	divsd	88(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	.LC42(%rip), %xmm1
	movsd	%xmm0, 112(%rsp)
	movsd	24(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	216(%rbp), %rax
	movapd	%xmm0, %xmm1
	addq	208(%rbp), %rax
	js	.L944
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L945:
	divsd	%xmm1, %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	divsd	.LC56(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 200(%rsp)
	movsd	24(%rsp), %xmm0
	mulsd	.LC116(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	424(%rbp), %xmm2
	movsd	200(%rsp), %xmm1
	movsd	%xmm0, 128(%rsp)
	movsd	112(%rsp), %xmm0
	movsd	%xmm2, 136(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm5
	movsd	136(%rsp), %xmm2
	movapd	%xmm0, %xmm1
	movapd	%xmm5, %xmm6
	subsd	%xmm2, %xmm1
	subsd	128(%rsp), %xmm6
	movapd	%xmm6, %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 112(%rsp)
	movsd	%xmm0, 424(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	176(%rbp), %xmm0
	addsd	%xmm5, %xmm0
	call	*log2@GOTPCREL(%rip)
	movq	184(%rbp), %rax
	movsd	%xmm0, 128(%rsp)
	movsd	8(%rsp), %xmm0
	testq	%rax, %rax
	jle	.L946
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L946:
	call	*log2@GOTPCREL(%rip)
	movsd	.LC58(%rip), %xmm1
	movsd	%xmm0, 136(%rsp)
	movsd	24(%rsp), %xmm0
	addsd	432(%rbp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	movsd	.LC58(%rip), %xmm5
	movsd	%xmm0, 432(%rbp)
	comisd	%xmm0, %xmm5
	ja	.L947
	movsd	112(%rsp), %xmm0
	mulsd	.LC59(%rip), %xmm0
	call	*round@GOTPCREL(%rip)
	movl	$6, %eax
	movl	$3, %ecx
	movapd	%xmm0, %xmm1
	movsd	128(%rsp), %xmm0
	mulsd	.LC48(%rip), %xmm0
	cvttsd2sil	%xmm0, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	cvttsd2sil	136(%rsp), %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	leal	6(%rdx,%rax), %edx
	cvttsd2sil	%xmm1, %eax
	addl	%eax, %edx
	movl	$16, %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movslq	384(%rbp), %rax
	cmpl	%eax, %edx
	je	.L947
	movq	$0x000000000, 432(%rbp)
	jle	.L948
	leal	1(%rax), %edx
	leaq	.LC54(%rip), %rdi
	movl	%edx, 384(%rbp)
	movq	%rdi, 256(%rbp,%rax,8)
.L947:
	movsd	24(%rsp), %xmm0
	movl	400(%rsp), %edx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	record_history.isra.0
	movq	200(%rbx), %rax
	testq	%rax, %rax
	js	.L949
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L950:
	movsd	8(%rsp), %xmm1
	divsd	88(%rsp), %xmm0
	addq	$240, %rbx
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	mulsd	.LC60(%rip), %xmm0
	addq	$1, 72(%rsp)
	addsd	.LC61(%rip), %xmm0
	movsd	%xmm0, 408(%rbp)
	jmp	.L930
.L827:
	leaq	.LC1(%rip), %rdi
	call	die
.L784:
	movq	%r14, %rdi
	call	*free@GOTPCREL(%rip)
	leaq	.LC76(%rip), %rdi
	call	die
.L1183:
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
	jmp	.L870
.L1180:
	movl	$240, %esi
	movl	$4096, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L827
	call	monotonic_seconds
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	leaq	identity_compare(%rip), %rbx
	movsd	%xmm0, (%rsp)
	leaq	983040(%r13), %r14
.L850:
	imull	$137, %ebp, %ecx
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L851:
	movl	%ecx, %edx
	movq	%rbp, 8(%rax)
	addq	$240, %rax
	addl	$2053, %ecx
	andl	$4095, %edx
	addl	$1, %edx
	movl	%edx, -240(%rax)
	cmpq	%r14, %rax
	jne	.L851
	movq	%r13, %rdi
	movq	%rbx, %rcx
	movl	$240, %edx
	movl	$4096, %esi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L857:
	addl	$1, %edi
	movl	$4096, %esi
	xorl	%ecx, %ecx
	jmp	.L856
	.p2align 4,,10
	.p2align 3
.L1208:
	jge	.L854
.L1015:
	movq	%rax, %rsi
	cmpq	%rsi, %rcx
	jnb	.L1207
.L856:
	leaq	(%rcx,%rsi), %rax
	shrq	%rax
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	salq	$4, %rdx
	addq	%r13, %rdx
	cmpl	(%rdx), %edi
	jne	.L1208
	cmpq	8(%rdx), %rbp
	jne	.L1209
	movslq	%edi, %rax
	addq	%rax, %r12
	cmpl	$4096, %edi
	jne	.L857
	addq	$1, %rbp
	cmpq	$128, %rbp
	jne	.L850
	call	monotonic_seconds
	movq	%r12, %rdx
	subsd	(%rsp), %xmm0
	leaq	.LC96(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	jmp	.L848
	.p2align 4,,10
	.p2align 3
.L1209:
	jb	.L1015
.L854:
	leaq	1(%rax), %rcx
	cmpq	%rsi, %rcx
	jb	.L856
.L1207:
	leaq	.LC95(%rip), %rdi
	call	die
.L1178:
	leaq	.LC82(%rip), %rdi
	call	die
.L1199:
	leaq	.LC98(%rip), %rdi
	call	die
.L1185:
	call	*endwin@GOTPCREL(%rip)
	leaq	.LC101(%rip), %rdi
	call	die
.L893:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm2, %xmm2
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm2
	addsd	%xmm2, %xmm2
	jmp	.L894
.L1182:
	leaq	.LC100(%rip), %rdi
	call	die
.L944:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L945
.L942:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L943
.L949:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L950
.L948:
	subl	$1, %eax
	leaq	.LC54(%rip), %rdi
	movl	%eax, 384(%rbp)
	cltq
	movq	%rdi, 256(%rbp,%rax,8)
	jmp	.L947
.L931:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L827
	movq	%rax, %rdi
	movl	$60, %ecx
	pxor	%xmm0, %xmm0
	movq	%rbx, %rsi
	rep movsl
	movq	.LC2(%rip), %rax
	movq	%rax, 400(%rbp)
	movq	.LC44(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	%rax, 416(%rbp)
	cvtsi2sdq	176(%rbx), %xmm0
	addsd	.LC44(%rip), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC48(%rip), %xmm0
	movq	184(%rbx), %rdx
	cvttsd2sil	%xmm0, %eax
	movsd	.LC44(%rip), %xmm0
	testq	%rdx, %rdx
	jle	.L935
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L935:
	movl	%eax, 88(%rsp)
	call	*log2@GOTPCREL(%rip)
	movl	$3, %ecx
	movl	88(%rsp), %eax
	movq	%rbp, %rsi
	cvttsd2sil	%xmm0, %edx
	movq	32(%rsp), %rdi
	movdqa	160(%rsp), %xmm3
	cmpl	%ecx, %edx
	cmovg	%ecx, %edx
	movl	$6, %ecx
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	leal	6(%rdx,%rax), %eax
	movq	8(%rbx), %rdx
	movl	%eax, 384(%rbp)
	movl	(%rbx), %ecx
	movq	%rdx, %rax
	movups	%xmm3, 256(%rbp)
	shrq	$30, %rax
	xorq	%r14, %rcx
	movups	%xmm3, 272(%rbp)
	xorq	%rdx, %rax
	movups	%xmm3, 288(%rbp)
	imulq	%r12, %rax
	movups	%xmm3, 304(%rbp)
	movups	%xmm3, 320(%rbp)
	movups	%xmm3, 336(%rbp)
	movq	%rax, %rdx
	movups	%xmm3, 352(%rbp)
	shrq	$27, %rdx
	movups	%xmm3, 368(%rbp)
	xorq	%rdx, %rax
	movabsq	$-7723592293110705685, %rdx
	imulq	%rdx, %rax
	xorq	%rax, %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%r12, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rcx, %rax
	movq	%rax, 664(%rbp)
	call	index_insert
	movq	344(%rsp), %rax
	movq	8(%rbx), %rsi
	movabsq	$-7723592293110705685, %rdx
	movq	408(%rsp), %rdi
	movq	%rbp, 344(%rsp)
	movq	%rax, 248(%rbp)
	movq	%rsi, %rax
	movq	336(%rsp), %rcx
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%r12, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	movq	%rdi, %rsi
	shrq	$30, %rsi
	imulq	%rdx, %rax
	xorq	%rdi, %rsi
	imulq	%r12, %rsi
	movq	%rsi, %rdi
	shrq	$27, %rdi
	xorq	%rdi, %rsi
	imulq	%rdx, %rsi
	movq	%rsi, %rdi
	shrq	$31, %rdi
	xorq	%rdi, %rsi
	movl	(%rbx), %edi
	orq	$-1, %r10
	xorq	%rdi, %rsi
	movslq	384(%rsp), %rdi
	xorq	%rax, %rsi
	shrq	$31, %rax
	xorq	%rax, %rsi
	movq	%rdi, %r8
	movq	%rsi, %rax
	shrq	$30, %rax
	xorq	%rsi, %rax
	imulq	%r12, %rax
	movq	%rax, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rax
	imulq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rdi
	xorl	%edi, %edi
	movq	%rdx, %r11
	movl	%edx, %esi
	jmp	.L936
.L938:
	leal	(%rdi,%r11), %eax
	cltd
	idivl	%r8d
	movslq	%edx, %rax
	imulq	$40, %rax, %rax
	movq	16(%rcx,%rax), %rax
	cmpq	%r10, %rax
	jb	.L937
	movl	%esi, %edx
	movq	%r10, %rax
.L937:
	addl	$1, %edi
	movl	%edx, %esi
	movq	%rax, %r10
.L936:
	cmpl	%edi, %r8d
	jg	.L938
	movslq	%esi, %rax
	xorl	%r14d, %r14d
	imulq	$40, %rax, %rax
	movq	%r14, 240(%rbp)
	addq	%rax, %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L939
	movq	%rbp, 240(%rax)
.L940:
	addq	$1, 16(%rcx)
	movq	%rbp, 8(%rcx)
	jmp	.L1004
.L939:
	movq	%rbp, (%rcx)
	jmp	.L940
	.cfi_endproc
.LFE124:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	CSWTCH.151, @object
	.size	CSWTCH.151, 16
CSWTCH.151:
	.long	6
	.long	17
	.long	18
	.long	19
	.section	.rodata.str1.1
.LC117:
	.string	"fill"
.LC118:
	.string	"glyphs"
.LC119:
	.string	"seed"
.LC120:
	.string	"source"
.LC121:
	.string	"self-test"
.LC122:
	.string	"benchmark"
.LC123:
	.string	"benchmark-sync"
.LC124:
	.string	"help"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	long_options.0, @object
	.size	long_options.0, 416
long_options.0:
	.quad	.LC117
	.long	0
	.zero	4
	.quad	0
	.long	70
	.zero	4
	.quad	.LC65
	.long	1
	.zero	4
	.quad	0
	.long	99
	.zero	4
	.quad	.LC66
	.long	1
	.zero	4
	.quad	0
	.long	114
	.zero	4
	.quad	.LC67
	.long	1
	.zero	4
	.quad	0
	.long	102
	.zero	4
	.quad	.LC70
	.long	1
	.zero	4
	.quad	0
	.long	112
	.zero	4
	.quad	.LC118
	.long	1
	.zero	4
	.quad	0
	.long	103
	.zero	4
	.quad	.LC119
	.long	1
	.zero	4
	.quad	0
	.long	115
	.zero	4
	.quad	.LC120
	.long	1
	.zero	4
	.quad	0
	.long	83
	.zero	4
	.quad	.LC121
	.long	0
	.zero	4
	.quad	0
	.long	84
	.zero	4
	.quad	.LC122
	.long	0
	.zero	4
	.quad	0
	.long	66
	.zero	4
	.quad	.LC123
	.long	0
	.zero	4
	.quad	0
	.long	89
	.zero	4
	.quad	.LC124
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
.LC125:
	.string	"\350\265\260"
.LC126:
	.string	"\343\201\235"
.LC127:
	.string	"\343\202\275"
.LC128:
	.string	"R"
.LC129:
	.string	"\347\234\240"
.LC130:
	.string	"\343\201\277"
.LC131:
	.string	"\343\203\237"
.LC132:
	.string	"S"
.LC133:
	.string	"\345\276\205"
.LC134:
	.string	"\343\201\276"
.LC135:
	.string	"\343\203\236"
.LC136:
	.string	"D"
.LC137:
	.string	"\346\255\242"
.LC138:
	.string	"\343\201\250"
.LC139:
	.string	"\343\203\210"
.LC140:
	.string	"T"
.LC141:
	.string	"\347\265\202"
.LC142:
	.string	"\343\201\227"
.LC143:
	.string	"\343\202\267"
.LC144:
	.string	"Z"
.LC145:
	.string	"\344\270\215"
.LC146:
	.string	"\343\201\265"
.LC147:
	.string	"\343\203\225"
.LC148:
	.string	"?"
.LC149:
	.string	"\351\235\231"
.LC150:
	.string	"\343\201\233"
.LC151:
	.string	"\343\202\273"
.LC152:
	.string	"0"
.LC153:
	.string	"\344\275\216"
.LC154:
	.string	"\343\201\246"
.LC155:
	.string	"\343\203\206"
.LC156:
	.string	"L"
.LC157:
	.string	"\344\270\255"
.LC158:
	.string	"\343\201\241"
.LC159:
	.string	"\343\203\201"
.LC160:
	.string	"M"
.LC161:
	.string	"\351\253\230"
.LC162:
	.string	"\343\201\223"
.LC163:
	.string	"\343\202\263"
.LC164:
	.string	"H"
.LC165:
	.string	"\345\242\227"
.LC166:
	.string	"\343\201\236"
.LC167:
	.string	"\343\202\276"
.LC168:
	.string	"+"
.LC169:
	.string	"\346\270\233"
.LC170:
	.string	"\343\201\222"
.LC171:
	.string	"\343\202\262"
.LC172:
	.string	"-"
.LC173:
	.string	"\345\256\232"
.LC174:
	.string	"\343\201\230"
.LC175:
	.string	"\343\202\270"
.LC176:
	.string	"="
.LC177:
	.string	"\347\204\241"
.LC178:
	.string	"\343\202\200"
.LC179:
	.string	"\343\203\240"
.LC180:
	.string	"\350\252\255"
.LC181:
	.string	"\343\202\210"
.LC182:
	.string	"\343\203\250"
.LC183:
	.string	"\346\233\270"
.LC184:
	.string	"\343\201\213"
.LC185:
	.string	"\343\202\253"
.LC186:
	.string	"W"
.LC187:
	.string	"\345\217\214"
.LC188:
	.string	"B"
.LC189:
	.string	"\347\256\227"
.LC190:
	.string	"\343\201\225"
.LC191:
	.string	"\343\202\265"
.LC192:
	.string	"C"
.LC193:
	.string	"\346\206\266"
.LC194:
	.string	"\343\201\212"
.LC195:
	.string	"\343\202\252"
.LC196:
	.string	"\345\205\245"
.LC197:
	.string	"\343\201\253"
.LC198:
	.string	"\343\203\213"
.LC199:
	.string	"I"
.LC200:
	.string	"\347\224\237"
.LC201:
	.string	"N"
.LC202:
	.string	"\346\225\243"
.LC203:
	.string	"X"
.LC204:
	.string	"\345\210\207"
.LC205:
	.string	"\343\201\215"
.LC206:
	.string	"\343\202\255"
	.section	.data.rel.ro.local
	.align 32
	.type	symbols, @object
	.size	symbols, 736
symbols:
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
	.quad	.LC175
	.quad	.LC176
	.quad	.LC177
	.quad	.LC178
	.quad	.LC179
	.quad	.LC152
	.quad	.LC180
	.quad	.LC181
	.quad	.LC182
	.quad	.LC128
	.quad	.LC183
	.quad	.LC184
	.quad	.LC185
	.quad	.LC186
	.quad	.LC187
	.quad	.LC126
	.quad	.LC127
	.quad	.LC188
	.quad	.LC189
	.quad	.LC190
	.quad	.LC191
	.quad	.LC192
	.quad	.LC193
	.quad	.LC194
	.quad	.LC195
	.quad	.LC160
	.quad	.LC196
	.quad	.LC197
	.quad	.LC198
	.quad	.LC199
	.quad	.LC200
	.quad	.LC150
	.quad	.LC151
	.quad	.LC201
	.quad	.LC202
	.quad	.LC190
	.quad	.LC191
	.quad	.LC203
	.quad	.LC204
	.quad	.LC205
	.quad	.LC206
	.quad	.LC132
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC52:
	.quad	-1
	.quad	1
	.section	.rodata.cst8
	.align 8
.LC55:
	.long	0
	.long	1076101120
	.align 8
.LC56:
	.long	-1155666488
	.long	1076601226
	.align 8
.LC57:
	.long	-175270496
	.long	1068038260
	.align 8
.LC58:
	.long	-1717986918
	.long	1071225241
	.align 8
.LC59:
	.long	0
	.long	1074266112
	.align 8
.LC60:
	.long	0
	.long	1076363264
	.align 8
.LC61:
	.long	0
	.long	1075838976
	.section	.data.rel.ro.local
	.align 8
.LC62:
	.quad	.LC54
	.section	.rodata.cst16
	.align 16
.LC68:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC69:
	.long	-1
	.long	2146435071
	.section	.rodata.cst16
	.align 16
.LC83:
	.quad	1
	.quad	1
	.section	.rodata.cst8
	.align 8
.LC85:
	.long	0
	.long	1005584384
	.align 8
.LC86:
	.long	0
	.long	1075052544
	.align 8
.LC87:
	.long	619545122
	.long	1072446826
	.align 8
.LC88:
	.long	0
	.long	1070596096
	.align 8
.LC89:
	.long	0
	.long	1075314688
	.section	.rodata.cst16
	.align 16
.LC97:
	.quad	16
	.quad	1
	.align 16
.LC104:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC105:
	.long	0
	.long	1078362112
	.align 8
.LC109:
	.long	-1717986918
	.long	1072273817
	.align 8
.LC111:
	.long	-858993459
	.long	1071434956
	.align 8
.LC112:
	.long	0
	.long	1072168960
	.align 8
.LC113:
	.long	0
	.long	1079574528
	.align 8
.LC116:
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
