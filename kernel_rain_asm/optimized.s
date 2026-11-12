	.file	"main_optimized.c"
	.text
	.p2align 4
	.type	semantic_keys, @function
semantic_keys:
.LFB108:
	.cfi_startproc
	movq	%rdi, %rcx
	movzbl	144(%rdi), %edi
	movq	%rdx, %rax
	leal	-68(%rdi), %edx
	cmpb	$48, %dl
	ja	.L2
	leaq	.L4(%rip), %rdi
	movzbl	%dl, %edx
	movslq	(%rdi,%rdx,4), %rdx
	addq	%rdi, %rdx
	notrack jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L8-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L6-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L16-.L4
	.long	.L6-.L4
	.long	.L3-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L5-.L4
	.long	.L2-.L4
	.long	.L5-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L3-.L4
	.text
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$5, %edx
.L7:
	movsd	.LC0(%rip), %xmm1
	movl	%edx, (%rax)
	movl	$6, %edx
	comisd	%xmm0, %xmm1
	ja	.L9
	movsd	.LC1(%rip), %xmm1
	movl	$7, %edx
	comisd	%xmm0, %xmm1
	ja	.L9
	movsd	.LC2(%rip), %xmm1
	xorl	%edx, %edx
	ucomisd	%xmm0, %xmm1
	setbe	%dl
	addl	$8, %edx
.L9:
	movq	224(%rcx), %rdi
	movl	%edx, 4(%rax)
	movl	$10, %edx
	cmpq	$16, %rdi
	jg	.L11
	xorl	%edx, %edx
	cmpq	$-17, %rdi
	setg	%dl
	addl	$11, %edx
.L11:
	movl	%edx, 8(%rax)
	movl	192(%rcx), %edi
	movl	$5, %edx
	testl	%edi, %edi
	je	.L12
	movq	216(%rcx), %rdx
	cmpq	$1, %rdx
	sbbl	%edx, %edx
	andl	$-2, %edx
	cmpq	$0, 208(%rcx)
	jne	.L30
	addl	$15, %edx
	.p2align 4,,10
	.p2align 3
.L12:
	cmpq	$0, 232(%rcx)
	movl	%edx, 12(%rax)
	movl	$10, %edx
	jg	.L14
	sete	%dl
	movzbl	%dl, %edx
	addl	$11, %edx
.L14:
	movl	%edx, 16(%rax)
	leal	-1(%rsi), %edx
	movl	$5, %ecx
	cmpl	$3, %edx
	ja	.L15
	leaq	CSWTCH.124(%rip), %rcx
	movl	(%rcx,%rdx,4), %ecx
.L15:
	movl	%ecx, 20(%rax)
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$3, %edx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$4, %edx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L8:
	movl	$2, %edx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L30:
	addl	$16, %edx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$1, %edx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%edx, %edx
	jmp	.L7
	.cfi_endproc
.LFE108:
	.size	semantic_keys, .-semantic_keys
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
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
	leaq	.LC3(%rip), %rdx
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
.LC4:
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
	je	.L34
	movq	%rax, %r14
	testl	%r15d, %r15d
	jle	.L49
	testl	%ebp, %ebp
	jg	.L127
	xorl	%ecx, %ecx
.L38:
	movslq	%ecx, %rax
	movsd	.LC5(%rip), %xmm0
	leaq	(%rax,%rax,4), %rax
	leaq	0(%r13,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L59:
	movl	%ecx, %eax
	cltd
	idivl	%ebp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L50
	movq	240(%rax), %rsi
	movq	%rsi, (%rdi)
	testq	%rsi, %rsi
	je	.L128
.L51:
	subq	$1, 16(%rdi)
	movq	$0, 240(%rax)
.L50:
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r14,%rdx,8), %rsi
	testq	%rax, %rax
	jne	.L58
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rax, 240(%r8)
.L123:
	movq	%rax, 8(%rsi)
	movq	(%rdi), %rax
	addq	$1, %rdx
	movq	%rdx, 16(%rsi)
	testq	%rax, %rax
	je	.L52
	movq	240(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L129
.L57:
	subq	$1, 16(%rdi)
	movq	$0, 240(%rax)
.L58:
	movq	16(%rsi), %rdx
	testq	%rdx, %rdx
	je	.L53
	movl	388(%rax), %r8d
	testl	%r8d, %r8d
	je	.L53
	movl	$0, 388(%rax)
	movsd	%xmm0, 400(%rax)
.L53:
	movq	$0, 240(%rax)
	movq	8(%rsi), %r8
	testq	%r8, %r8
	jne	.L130
	movq	%rax, (%rsi)
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L52:
	addl	$1, %ecx
	addq	$40, %rdi
	cmpl	%r15d, %ecx
	jl	.L59
.L49:
	cmpl	%ebp, %r15d
	jge	.L37
.L138:
	movsd	.LC5(%rip), %xmm0
	leaq	40(%r14), %r9
	cmpl	$1, %ebp
	jle	.L37
	.p2align 4,,10
	.p2align 3
.L124:
	movq	16(%r14), %rsi
	movq	%r9, %rax
	movl	$1, %edx
	xorl	%r15d, %r15d
	xorl	%r11d, %r11d
	movq	%rsi, %r10
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L132:
	movslq	%r11d, %r8
	leaq	(%r8,%r8,4), %r8
	leaq	(%r14,%r8,8), %r8
	cmpq	%r10, %rcx
	jb	.L78
.L133:
	movslq	%r15d, %rcx
	addl	$1, %edx
	addq	$40, %rax
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%r14,%rcx,8), %rdi
	cmpl	%edx, %ebp
	je	.L131
.L63:
	movq	16(%rax), %rcx
	movq	%rax, %rdi
	cmpq	%rcx, %rsi
	jnb	.L132
	movq	%rcx, %rsi
	movq	%rax, %r8
	movl	%edx, %r11d
	cmpq	%r10, %rcx
	jnb	.L133
.L78:
	movl	%edx, %r15d
	addl	$1, %edx
	movq	%rcx, %r10
	addq	$40, %rax
	cmpl	%edx, %ebp
	jne	.L63
.L131:
	movq	%rsi, %rax
	subq	%r10, %rax
	cmpq	$1, %rax
	jbe	.L37
	movq	(%r8), %r15
	xorl	%ecx, %ecx
	movq	240(%r15), %r11
	movq	%r15, %r10
	movq	%r11, %rax
	testq	%r11, %r11
	jne	.L66
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%rdx, %rax
.L66:
	movl	392(%rax), %edx
	testl	%edx, %edx
	movq	240(%rax), %rdx
	cmovne	%r10, %rcx
	movq	%rax, %r10
	testq	%rdx, %rdx
	jne	.L80
	movq	8(%r8), %rdx
	testq	%rcx, %rcx
	je	.L68
	movq	240(%rcx), %rax
	movq	240(%rax), %r10
	movq	%r10, 240(%rcx)
	cmpq	%rdx, %rax
	je	.L75
.L70:
	movq	8(%rdi), %rcx
	subq	$1, %rsi
	movq	%rsi, 16(%r8)
	movq	16(%rdi), %rdx
	movl	$0, 388(%rax)
	movq	$0, 240(%rax)
	movsd	%xmm0, 400(%rax)
	testq	%rcx, %rcx
	je	.L71
	movq	%rax, 240(%rcx)
.L126:
	movq	%rax, 8(%rdi)
	leaq	1(%rdx), %rax
	movq	%rax, 16(%rdi)
	testq	%rdx, %rdx
	jne	.L124
	movq	$0x000000000, 24(%rdi)
	movl	$1, 32(%rdi)
	cmpl	$1, %ebp
	jg	.L124
.L37:
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
.L127:
	.cfi_restore_state
	cmpl	%ebp, %r15d
	movl	%ebp, %r8d
	leaq	24(%rax), %rdi
	movq	%r13, %rsi
	movsd	.LC5(%rip), %xmm0
	cmovle	%r15d, %r8d
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L48:
	movl	%ecx, %eax
	cltd
	idivl	%ebp
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L39
	movq	240(%rax), %r9
	movq	%r9, (%rsi)
	testq	%r9, %r9
	je	.L135
.L40:
	subq	$1, 16(%rsi)
	movq	$0, 240(%rax)
.L39:
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%r14,%rdx,8), %r9
	testq	%rax, %rax
	jne	.L47
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rax, 240(%r10)
.L122:
	movq	%rax, 8(%r9)
	movq	(%rsi), %rax
	addq	$1, %rdx
	movq	%rdx, 16(%r9)
	testq	%rax, %rax
	je	.L41
	movq	240(%rax), %rdx
	movq	%rdx, (%rsi)
	testq	%rdx, %rdx
	je	.L136
.L46:
	subq	$1, 16(%rsi)
	movq	$0, 240(%rax)
.L47:
	movq	16(%r9), %rdx
	testq	%rdx, %rdx
	je	.L42
	movl	388(%rax), %r10d
	testl	%r10d, %r10d
	je	.L42
	movl	$0, 388(%rax)
	movsd	%xmm0, 400(%rax)
.L42:
	movq	$0, 240(%rax)
	movq	8(%r9), %r10
	testq	%r10, %r10
	jne	.L137
	movq	%rax, (%r9)
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L81:
	movq	%rax, %r15
.L68:
	movq	%r11, %rax
	movq	240(%r11), %r11
	cmpq	%rax, %rdx
	jne	.L81
	movq	%r11, 240(%r15)
	movq	%r15, %rcx
.L75:
	movq	%rcx, 8(%r8)
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L129:
	movq	$0, 8(%rdi)
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L136:
	movq	$0, 8(%rsi)
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L41:
	movsd	24(%rsi), %xmm1
	movl	32(%rsi), %eax
	addl	$1, %ecx
	addq	$40, %rsi
	addq	$40, %rdi
	movsd	%xmm1, -40(%rdi)
	movl	%eax, -32(%rdi)
	cmpl	%ecx, %r8d
	jg	.L48
	cmpl	%ecx, %r15d
	jg	.L38
	cmpl	%ebp, %r15d
	jge	.L37
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L71:
	movq	%rax, (%rdi)
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L135:
	movq	$0, 8(%rsi)
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L128:
	movq	$0, 8(%rdi)
	jmp	.L51
.L134:
	movq	8(%r8), %rdx
	jmp	.L68
.L34:
	leaq	.LC4(%rip), %rdi
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
	je	.L142
	.p2align 4,,10
	.p2align 3
.L143:
	movq	%rbx, %rdi
	movq	248(%rbx), %rbx
	call	*free@GOTPCREL(%rip)
	testq	%rbx, %rbx
	jne	.L143
.L142:
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
.LC7:
	.string	"r"
.LC8:
	.string	"/proc/stat"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
	.string	"cpu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
	.section	.rodata.str1.1
.LC10:
	.string	"ctxt %llu"
.LC11:
	.string	"processes %llu"
.LC12:
	.string	"/proc/diskstats"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"%u %u %63s %llu %llu %llu %llu %llu %llu %llu"
	.section	.rodata.str1.1
.LC14:
	.string	"nvme"
.LC15:
	.string	"/proc/net/dev"
	.section	.rodata.str1.8
	.align 8
.LC16:
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
	leaq	.LC7(%rip), %rsi
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
	leaq	.LC8(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L150
	leaq	288(%rsp), %rbx
	movq	%rax, %r12
	movq	%rax, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	testq	%rax, %rax
	je	.L226
	leaq	216(%rsp), %rax
	movaps	%xmm0, 144(%rsp)
	leaq	144(%rsp), %rdx
	movq	%rbx, %rdi
	movaps	%xmm0, 160(%rsp)
	leaq	152(%rsp), %rcx
	leaq	.LC9(%rip), %rsi
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
	jle	.L226
	movq	0(%rbp), %xmm0
	movl	%eax, %edx
	shrl	%edx
	movdqa	%xmm0, %xmm1
	movdqa	160(%rsp), %xmm0
	paddq	144(%rsp), %xmm0
	cmpl	$2, %edx
	je	.L154
	paddq	176(%rsp), %xmm0
	cmpl	$3, %edx
	je	.L155
	paddq	192(%rsp), %xmm0
	cmpl	$4, %edx
	je	.L155
	paddq	208(%rsp), %xmm0
.L155:
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	paddq	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	testb	$1, %al
	je	.L227
	andl	$-2, %eax
	cltq
	movq	144(%rsp,%rax,8), %xmm1
	paddq	%xmm1, %xmm0
.L227:
	movq	176(%rsp), %xmm1
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
.L158:
	paddq	%xmm1, %xmm0
.L157:
	movq	%xmm0, 8(%rbp)
	leaq	56(%rsp), %r13
	leaq	.LC10(%rip), %r15
	leaq	.LC11(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L159:
	movq	%r12, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L228
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L160
	movq	56(%rsp), %rax
	movq	%rax, 16(%rbp)
.L160:
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L159
	movq	56(%rsp), %rax
	movq	%rax, 24(%rbp)
	jmp	.L159
	.p2align 4,,10
	.p2align 3
.L228:
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
	leaq	.LC7(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L164
	.p2align 4,,10
	.p2align 3
.L163:
	movq	%r13, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L229
	leaq	56(%rsp), %rax
	leaq	4(%rsp), %rcx
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	leaq	224(%rsp), %r12
	pushq	%rax
	.cfi_def_cfa_offset 1400
	leaq	.LC13(%rip), %rsi
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
	jne	.L163
	xorl	%r14d, %r14d
	movq	%r12, %rdi
	cmpl	$1701672558, 224(%rsp)
	setne	%r14b
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %r15
	testl	%r14d, %r14d
	je	.L168
	testq	%rax, %rax
	je	.L163
	xorl	%r12d, %r12d
	cmpb	$115, 224(%rsp)
	jne	.L191
.L230:
	cmpb	$100, 225(%rsp)
	jne	.L191
.L173:
	call	*__ctype_b_loc@GOTPCREL(%rip)
	movzbl	223(%rsp,%r15), %edx
	movq	(%rax), %rax
	testb	$4, 1(%rax,%rdx,2)
	jne	.L176
.L171:
	testl	%r12d, %r12d
	je	.L163
.L176:
	movq	56(%rsp), %rax
	addq	24(%rsp), %rax
	salq	$9, %rax
	addq	%rax, 32(%rbp)
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%r12, %rdi
	movl	$112, %esi
	xorl	%r12d, %r12d
	call	*strchr@GOTPCREL(%rip)
	testq	%rax, %rax
	sete	%r12b
	testq	%r15, %r15
	je	.L171
	cmpb	$115, 224(%rsp)
	je	.L230
.L191:
	cmpb	$118, 224(%rsp)
	jne	.L192
	cmpb	$100, 225(%rsp)
	je	.L173
	.p2align 4,,10
	.p2align 3
.L192:
	cmpb	$120, 224(%rsp)
	jne	.L171
	cmpb	$118, 225(%rsp)
	jne	.L171
	cmpb	$100, 226(%rsp)
	je	.L173
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L229:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
.L164:
	leaq	.LC7(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L185
	leaq	.LC16(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L178:
	movq	%r12, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L231
	movl	$58, %esi
	movq	%rbx, %rdi
	call	*strchr@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L178
	movb	$0, (%rax)
	call	*__ctype_b_loc@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movq	(%rax), %rsi
	movzbl	288(%rsp), %eax
	testb	$32, 1(%rsi,%rax,2)
	je	.L180
	.p2align 4,,10
	.p2align 3
.L181:
	movzbl	1(%rdx), %ecx
	addq	$1, %rdx
	testb	$32, 1(%rsi,%rcx,2)
	jne	.L181
.L180:
	cmpb	$108, (%rdx)
	jne	.L193
	cmpb	$111, 1(%rdx)
	jne	.L193
	cmpb	$0, 2(%rdx)
	je	.L178
	.p2align 4,,10
	.p2align 3
.L193:
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
	jne	.L178
	movq	128(%rsp), %rax
	addq	64(%rsp), %rax
	addq	%rax, 40(%rbp)
	jmp	.L178
	.p2align 4,,10
	.p2align 3
.L231:
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L185:
	movl	$1, %eax
.L149:
	movq	1320(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L232
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
.L226:
	.cfi_restore_state
	movq	%r12, %rdi
	call	*fclose@GOTPCREL(%rip)
.L150:
	xorl	%eax, %eax
	jmp	.L149
.L154:
	movdqa	%xmm0, %xmm2
	psrldq	$8, %xmm2
	paddq	%xmm2, %xmm0
	paddq	%xmm1, %xmm0
	cmpl	$4, %eax
	je	.L233
	movq	176(%rsp), %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
	jmp	.L158
.L233:
	movq	%xmm0, 0(%rbp)
	movq	168(%rsp), %xmm0
	jmp	.L157
.L232:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE81:
	.size	read_counters, .-read_counters
	.section	.rodata.str1.1
.LC17:
	.string	"/proc/%d/stat"
.LC18:
	.string	" \n"
.LC19:
	.string	"/proc/%d/io"
.LC20:
	.string	"read_bytes: %llu"
.LC21:
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
	leaq	.LC17(%rip), %r8
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
	leaq	.LC7(%rip), %rsi
	movq	%r13, %rdi
	call	*fopen@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L237
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
	je	.L237
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
	jne	.L237
	cmpq	%rdx, %r15
	jnb	.L237
	cmpb	$32, 1(%rdx)
	je	.L264
.L237:
	xorl	%eax, %eax
.L234:
	movq	4376(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L265
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
.L264:
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
	jnb	.L238
	testb	$4, %al
	jne	.L266
	testl	%ecx, %ecx
	jne	.L267
.L239:
	leaq	32(%rsp), %r14
	movb	$0, 16(%rbp,%rax)
	movl	$22, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	leaq	.LC18(%rip), %rsi
	movq	$0, 16(%rsp)
	rep stosq
	leaq	16(%rsp), %rax
	leaq	2(%rdx), %rdi
	movq	%rax, (%rsp)
	movq	%rax, %rdx
	call	*strtok_r@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L237
	movl	$1, %r15d
	.p2align 4,,10
	.p2align 3
.L242:
	xorl	%edi, %edi
	movq	%rax, -8(%r14,%r15,8)
	movq	(%rsp), %rdx
	leaq	.LC18(%rip), %rsi
	call	*strtok_r@GOTPCREL(%rip)
	movq	%r15, %rdi
	testq	%rax, %rax
	setne	%sil
	cmpl	$21, %r15d
	setle	%dl
	addq	$1, %r15
	testb	%dl, %sil
	jne	.L242
	cmpl	$22, %edi
	jne	.L237
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
	leaq	.LC19(%rip), %r8
	movl	$2, %edx
	movq	%rax, 176(%rbp)
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	leaq	.LC7(%rip), %rsi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L247
	movl	$0, 12(%rsp)
	leaq	24(%rsp), %r12
	leaq	.LC20(%rip), %r15
	movl	$0, (%rsp)
	leaq	.LC21(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L243:
	movq	%r13, %rdx
	movl	$4096, %esi
	movq	%rbx, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L268
	xorl	%eax, %eax
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L244
	movq	24(%rsp), %rax
	movl	$1, (%rsp)
	movq	%rax, 160(%rbp)
.L244:
	xorl	%eax, %eax
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$1, %eax
	jne	.L243
	movq	24(%rsp), %rax
	movl	$1, 12(%rsp)
	movq	%rax, 168(%rbp)
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L238:
	movl	%eax, %ecx
	movq	-8(%rsi,%rcx), %rdi
	movq	%rdi, -8(%r8,%rcx)
	leal	-1(%rax), %ecx
	movq	%r8, %rdi
	shrl	$3, %ecx
	rep movsq
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L267:
	movzbl	1(%r15), %edi
	movb	%dil, 16(%rbp)
	testb	$2, %cl
	je	.L239
	movzwl	-2(%rsi,%rcx), %esi
	movw	%si, -2(%r8,%rcx)
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L268:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
	movl	(%rsp), %eax
	movl	12(%rsp), %ebx
	andl	%ebx, %eax
	movl	%eax, 192(%rbp)
.L247:
	movl	$1, %eax
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L266:
	movl	1(%r15), %edi
	movl	%edi, 16(%rbp)
	movl	-4(%rsi,%rcx), %esi
	movl	%esi, -4(%r8,%rcx)
	jmp	.L239
.L265:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE86:
	.size	read_process, .-read_process
	.section	.rodata.str1.1
.LC22:
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
	jne	.L273
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	(%rsp), %xmm1
	cvtsi2sdq	8(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L274
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L273:
	.cfi_restore_state
	leaq	.LC22(%rip), %rdi
	call	die
.L274:
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
	je	.L276
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L276:
	movq	8(%rsi), %rdx
	xorl	%eax, %eax
	cmpq	%rdx, 8(%rdi)
	je	.L275
	sbbl	%eax, %eax
	orl	$1, %eax
.L275:
	ret
	.cfi_endproc
.LFE87:
	.size	identity_compare, .-identity_compare
	.section	.rodata.str1.1
.LC24:
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
	jne	.L282
	cmpb	$0, (%rbx)
	je	.L282
	movq	(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L282
	leaq	-1(%rax), %rdx
	cmpq	$2147483646, %rdx
	ja	.L282
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L286
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
.L282:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L286:
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
	leaq	.LC4(%rip), %rdi
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
	je	.L295
.L290:
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
.L295:
	.cfi_restore_state
	testq	%rax, %rax
	leaq	(%rax,%rax), %r12
	movl	$128, %eax
	movq	(%rdi), %rdi
	cmove	%rax, %r12
	imulq	$240, %r12, %rsi
	call	*realloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L296
	movq	%rax, 0(%rbp)
	movq	%r12, 16(%rbp)
	jmp	.L290
.L296:
	call	table_add.part.0
	.cfi_endproc
.LFE88:
	.size	table_add, .-table_add
	.section	.rodata.str1.1
.LC25:
	.string	"/sys/class/hwmon"
.LC26:
	.string	"hwmon"
.LC27:
	.string	"/sys/class/hwmon/%s/name"
.LC28:
	.string	"%63s"
.LC29:
	.string	"k10temp"
.LC30:
	.string	"coretemp"
.LC31:
	.string	"zenpower"
.LC32:
	.string	"/sys/class/hwmon/%s"
.LC33:
	.string	"temp"
.LC34:
	.string	"_input"
.LC35:
	.string	"%s/%s"
.LC36:
	.string	"%ld"
.LC37:
	.string	"%s"
.LC38:
	.string	"\n"
.LC39:
	.string	"Tdie"
.LC40:
	.string	"Tctl"
.LC41:
	.string	"Package id"
.LC43:
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
	leaq	.LC25(%rip), %rdi
	call	*opendir@GOTPCREL(%rip)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L297
	movl	$2147483647, 36(%rsp)
	leaq	.LC33(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L299:
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L352
.L313:
	leaq	19(%rax), %rbx
	movl	$5, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rbx, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L299
	pxor	%xmm0, %xmm0
	movq	%rbx, %r9
	leaq	192(%rsp), %rbp
	movl	$4096, %ecx
	movaps	%xmm0, 64(%rsp)
	leaq	.LC27(%rip), %r8
	movl	$2, %edx
	movq	%rbp, %rdi
	movaps	%xmm0, 80(%rsp)
	movl	$4096, %esi
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC7(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L299
	leaq	64(%rsp), %r12
	movq	%rax, %rdi
	leaq	.LC28(%rip), %rsi
	xorl	%eax, %eax
	movq	%r12, %rdx
	call	*__isoc99_fscanf@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	%eax, %r14d
	call	*fclose@GOTPCREL(%rip)
	cmpl	$1, %r14d
	jne	.L299
	leaq	.LC29(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L301
	leaq	.LC30(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L301
	leaq	.LC31(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L299
.L301:
	leaq	4288(%rsp), %rax
	movq	%rbx, %r9
	movl	$4096, %ecx
	movl	$2, %edx
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	movl	$4096, %esi
	leaq	.LC32(%rip), %r8
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	movq	%rbx, %rdi
	call	*opendir@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L299
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L302:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L353
.L311:
	leaq	19(%rax), %r13
	movl	$4, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	*strncmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L302
	leaq	.LC34(%rip), %rsi
	movq	%r13, %rdi
	call	*strstr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L302
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
	leaq	.LC35(%rip), %r8
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	.cfi_def_cfa_offset 12568
	popq	%rcx
	.cfi_def_cfa_offset 12560
	cmpl	$4095, %eax
	jg	.L302
	leaq	.LC7(%rip), %rsi
	movq	%rbp, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L302
	movq	%rax, %rdi
	movq	24(%rsp), %rdx
	xorl	%eax, %eax
	leaq	.LC36(%rip), %rsi
	call	*__isoc99_fscanf@GOTPCREL(%rip)
	movq	%r13, %rdi
	movl	%eax, %r14d
	call	*fclose@GOTPCREL(%rip)
	cmpl	$1, %r14d
	jne	.L302
	movq	56(%rsp), %rax
	addq	$20000, %rax
	cmpq	$170000, %rax
	ja	.L302
	pxor	%xmm0, %xmm0
	movl	$4096, %esi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	8384(%rsp), %r13
	movaps	%xmm0, 128(%rsp)
	leaq	.LC37(%rip), %rdx
	movq	%r13, %rdi
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	call	*snprintf@GOTPCREL(%rip)
	leaq	.LC34(%rip), %rsi
	movq	%r13, %rdi
	call	*strstr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L304
	movl	$1650551903, (%rax)
	movl	$7103842, 3(%rax)
.L304:
	movq	%r13, %rdi
	leaq	.LC7(%rip), %rsi
	leaq	128(%rsp), %r14
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L305
	movq	%rax, %rdx
	movl	$64, %esi
	movq	%r14, %rdi
	call	*fgets@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L306
	leaq	.LC38(%rip), %rsi
	movq	%r14, %rdi
	call	*strcspn@GOTPCREL(%rip)
	movb	$0, 128(%rsp,%rax)
.L306:
	movq	%r13, %rdi
	call	*fclose@GOTPCREL(%rip)
.L305:
	leaq	.LC39(%rip), %rsi
	movq	%r14, %rdi
	call	*strcmp@GOTPCREL(%rip)
	movl	%eax, %r13d
	testl	%eax, %eax
	je	.L307
	leaq	.LC40(%rip), %rsi
	movq	%r14, %rdi
	movl	$1, %r13d
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L307
	movl	$10, %edx
	leaq	.LC41(%rip), %rsi
	movq	%r14, %rdi
	movl	$2, %r13d
	call	*strncmp@GOTPCREL(%rip)
	cmpl	$1, %eax
	sbbl	$-1, %r13d
.L307:
	cmpl	%r13d, 36(%rsp)
	jle	.L302
	cmpb	$0, 128(%rsp)
	pxor	%xmm0, %xmm0
	movq	%r14, %r9
	movq	40(%rsp), %rdi
	cvtsi2sdq	56(%rsp), %xmm0
	cmove	%r12, %r9
	leaq	.LC43(%rip), %r8
	movq	$-1, %rcx
	movl	$2, %edx
	movl	$64, %esi
	movl	$1, %eax
	divsd	.LC42(%rip), %xmm0
	call	*__snprintf_chk@GOTPCREL(%rip)
	movl	%r13d, 36(%rsp)
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L311
	.p2align 4,,10
	.p2align 3
.L353:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	8(%rsp), %rdi
	call	*readdir@GOTPCREL(%rip)
	testq	%rax, %rax
	jne	.L313
.L352:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L351
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
.L351:
	.cfi_restore_state
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L297:
	movq	12488(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L351
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	384(%rdi), %r14d
	cmpl	$6, %r14d
	jle	.L354
	movq	%rdi, %rbx
	movl	%esi, %r13d
	movapd	%xmm0, %xmm3
	movslq	%edx, %r12
	comisd	.LC0(%rip), %xmm1
	movapd	%xmm1, %xmm2
	movl	$17, %ebp
	jb	.L396
	movq	208(%rbx), %rax
	testq	%rax, %rax
	js	.L358
.L400:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L359:
	divsd	%xmm3, %xmm0
	movsd	%xmm2, 8(%rsp)
	movsd	.LC45(%rip), %xmm1
	movsd	%xmm3, (%rsp)
	divsd	.LC46(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm2
	movsd	(%rsp), %xmm3
	movapd	%xmm0, %xmm4
	comisd	%xmm2, %xmm0
	ja	.L377
	movq	216(%rbx), %rax
	movapd	%xmm2, %xmm4
	testq	%rax, %rax
	js	.L361
.L401:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L362:
	divsd	%xmm3, %xmm0
	movsd	%xmm4, (%rsp)
	movsd	.LC45(%rip), %xmm1
	divsd	.LC46(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm4
	movapd	%xmm0, %xmm3
	comisd	%xmm4, %xmm0
	ja	.L378
	movapd	%xmm4, %xmm3
.L363:
	movq	224(%rbx), %r15
	pxor	%xmm0, %xmm0
	movsd	%xmm3, (%rsp)
	movsd	.LC45(%rip), %xmm1
	cvtsi2sdq	%r15, %xmm0
	mulsd	.LC47(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm3
	movapd	%xmm0, %xmm2
	comisd	%xmm3, %xmm0
	ja	.L379
	movapd	%xmm3, %xmm2
.L364:
	negq	%r15
	pxor	%xmm0, %xmm0
	movsd	%xmm2, (%rsp)
	movsd	.LC45(%rip), %xmm1
	cvtsi2sdq	%r15, %xmm0
	mulsd	.LC47(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	(%rsp), %xmm2
	comisd	%xmm2, %xmm0
	ja	.L380
	cmpq	$0, 232(%rbx)
	movapd	%xmm2, %xmm0
	jle	.L397
.L366:
	movsd	.LC45(%rip), %xmm5
	movl	$20, %eax
	ucomisd	%xmm0, %xmm5
	cmova	%rax, %rbp
.L368:
	leal	-1(%r14), %eax
	cmpl	$7, %r14d
	je	.L369
	leal	-8(%r14), %edx
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
.L369:
	movabsq	$-7046029254386353131, %rax
	addq	664(%rbx), %rax
	movq	%rax, %rdx
	movq	%rax, 664(%rbx)
	shrq	$30, %rdx
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
	xorl	%edx, %edx
	divq	%r12
	movslq	%edx, %rcx
	testb	$1, %r13b
	je	.L383
	leal	-1(%rdx), %eax
	testl	%edx, %edx
	je	.L371
	testb	$2, %r13b
	je	.L384
.L402:
	leal	-1(%rax), %edx
	testl	%eax, %eax
	je	.L398
	testb	$4, %r13b
	je	.L386
.L403:
	leal	-1(%rdx), %eax
	testl	%edx, %edx
	je	.L399
.L373:
	andl	$8, %r13d
	je	.L374
	movl	$3, %ecx
	testl	%eax, %eax
	je	.L371
.L374:
	salq	$5, %rbp
	leaq	symbols(%rip), %rax
	movq	24(%rax,%rbp), %rax
.L375:
	movq	%rax, 304(%rbx)
.L354:
	addq	$24, %rsp
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
.L396:
	.cfi_restore_state
	movq	208(%rbx), %rax
	movl	$6, %ebp
	pxor	%xmm2, %xmm2
	testq	%rax, %rax
	jns	.L400
.L358:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L359
	.p2align 4,,10
	.p2align 3
.L377:
	movq	216(%rbx), %rax
	movl	$14, %ebp
	testq	%rax, %rax
	jns	.L401
.L361:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L380:
	cmpq	$0, 232(%rbx)
	movl	$11, %ebp
	jg	.L366
.L397:
	je	.L368
	movsd	.LC45(%rip), %xmm6
	movl	$21, %eax
	ucomisd	%xmm0, %xmm6
	cmova	%rax, %rbp
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L379:
	movl	$10, %ebp
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L378:
	movl	$15, %ebp
	jmp	.L363
	.p2align 4,,10
	.p2align 3
.L383:
	movl	%edx, %eax
	testb	$2, %r13b
	jne	.L402
.L384:
	movl	%eax, %edx
	testb	$4, %r13b
	jne	.L403
.L386:
	movl	%edx, %eax
	jmp	.L373
.L398:
	movl	$1, %ecx
.L371:
	leaq	(%rcx,%rbp,4), %rdx
	leaq	symbols(%rip), %rax
	movq	(%rax,%rdx,8), %rax
	jmp	.L375
.L399:
	movl	$2, %ecx
	jmp	.L371
	.cfi_endproc
.LFE135:
	.size	record_history.isra.0, .-record_history.isra.0
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
	je	.L415
	movq	8(%r13), %rsi
	movq	%rax, %rbp
	testq	%rsi, %rsi
	je	.L410
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
.L409:
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
	jmp	.L414
	.p2align 4,,10
	.p2align 3
.L416:
	addq	$1, %rax
.L414:
	andq	%rcx, %rax
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rbp, %rdx
	cmpb	$0, 8(%rdx)
	jne	.L416
	movq	%rsi, (%rdx)
	addq	$1, %r12
	movb	$1, 8(%rdx)
	movq	248(%rsi), %rsi
	testq	%rsi, %rsi
	jne	.L409
.L406:
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
.L410:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L406
.L415:
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
	je	.L421
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
.L421:
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
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rbx)
	call	read_temperature.constprop.0
	movl	$1, %eax
	jmp	.L422
.L431:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L432:
	leaq	.LC22(%rip), %rdi
	call	die
	.cfi_endproc
.LFE84:
	.size	telemetry_init, .-telemetry_init
	.section	.rodata.str1.1
.LC48:
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
	leaq	.LC48(%rip), %rdi
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
	je	.L442
	movq	$0, 8(%rsp)
	movq	%rax, %rbx
	xorl	%r13d, %r13d
	leaq	24(%rsp), %rbp
	movq	$0, (%rsp)
	.p2align 4,,10
	.p2align 3
.L435:
	movq	%rbx, %rdi
	call	*readdir@GOTPCREL(%rip)
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L448
	call	*__errno_location@GOTPCREL(%rip)
	leaq	19(%r15), %rdi
	movl	$10, %edx
	movq	%rbp, %rsi
	movq	%rax, %r14
	movl	$0, (%rax)
	call	*strtol@GOTPCREL(%rip)
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jne	.L435
	movq	24(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L435
	leaq	-1(%rax), %rdx
	cmpq	$2147483646, %rdx
	ja	.L435
	leaq	32(%rsp), %rsi
	movl	%eax, %edi
	call	read_process
	testl	%eax, %eax
	je	.L435
	movq	8(%rsp), %rax
	cmpq	%rax, %r13
	je	.L449
.L438:
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
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L448:
	movq	%rbx, %rdi
	call	*closedir@GOTPCREL(%rip)
	movq	(%rsp), %rdi
	movl	$240, %edx
	movq	%r13, %rsi
	leaq	identity_compare(%rip), %rcx
	call	*qsort@GOTPCREL(%rip)
.L434:
	movq	(%rsp), %rax
	movq	%r13, 8(%r12)
	movq	%rax, (%r12)
	movq	8(%rsp), %rax
	movq	%rax, 16(%r12)
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L450
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
.L449:
	.cfi_restore_state
	testq	%r13, %r13
	jne	.L451
	movq	$128, 8(%rsp)
	movl	$30720, %esi
.L439:
	movq	(%rsp), %rdi
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.L438
	call	table_add.part.0
	.p2align 4,,10
	.p2align 3
.L451:
	movq	%r13, %rsi
	leaq	(%r13,%r13), %rax
	salq	$4, %rsi
	movq	%rax, 8(%rsp)
	subq	%r13, %rsi
	salq	$5, %rsi
	jmp	.L439
.L442:
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%r13d, %r13d
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	jmp	.L434
.L450:
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
	jne	.L456
	pxor	%xmm1, %xmm1
	movq	.LC49(%rip), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	32(%rsp), %xmm1
	cvtsi2sdq	40(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	movq	%rax, 32(%rbx)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rbx)
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L457
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L456:
	.cfi_restore_state
	leaq	.LC22(%rip), %rdi
	call	die
.L457:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE90:
	.size	sampler_init, .-sampler_init
	.p2align 4
	.type	update_semantics.constprop.0, @function
update_semantics.constprop.0:
.LFB136:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r10
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
	movl	488(%rdi), %eax
	movq	%rsi, %rbx
	movq	%rcx, %rsi
	testl	%eax, %eax
	jne	.L485
	movq	8(%rdi), %rdx
	movl	(%rdi), %r13d
	movslq	%r9d, %rbp
	movabsq	$-4658895280553007687, %r11
	movabsq	$-7723592293110705685, %rcx
	movl	$1, 488(%rdi)
	movq	664(%rdi), %r14
	movabsq	$-5853766786057164379, %r12
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movabsq	$-7046029254386353131, %rdx
	imulq	%rcx, %rax
	addq	%r14, %rdx
	xorq	%rax, %r13
	shrq	$31, %rax
	xorq	%rax, %r13
	movl	(%r10), %eax
	movl	%eax, 440(%rdi)
	movq	(%rsi), %rax
	movq	%rdx, 664(%rdi)
	movq	%rax, 496(%rdi)
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 464(%rdi)
	movq	72(%rbx), %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorq	%r13, %rax
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorq	%rax, %rdx
	imulq	%r11, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r12
	movl	4(%r10), %eax
	movl	%eax, 444(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	movabsq	$4354685564936845354, %rdx
	addq	$8000, %r15
	addq	%r14, %rdx
	movq	%r15, 592(%rdi)
	movq	8(%rsi), %rax
	movq	%rdx, 664(%rdi)
	movq	%rax, 504(%rdi)
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rax, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movq	72(%rbx), %rax
	movl	%edx, 468(%rdi)
	movq	%rax, %rdx
	shrq	$30, %rax
	xorq	$1, %rdx
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	xorq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r12
	movl	8(%r10), %eax
	movl	%eax, 448(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 600(%rdi)
	movq	16(%rsi), %rax
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
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 472(%rdi)
	movq	72(%rbx), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$2, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	xorq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r12
	movl	12(%r10), %eax
	movl	%eax, 452(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 608(%rdi)
	movq	24(%rsi), %rax
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
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 476(%rdi)
	movq	72(%rbx), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$3, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	xorq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r12
	movl	16(%r10), %eax
	movl	%eax, 456(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 616(%rdi)
	movq	32(%rsi), %rax
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
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movl	%edx, 480(%rdi)
	movq	72(%rbx), %rdx
	movq	%rdx, %r15
	movq	%rdx, %rax
	xorq	$4, %r15
	shrq	$30, %rax
	xorq	%r15, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	xorq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r15
	shrq	$31, %r15
	xorq	%rax, %r15
	movq	%r15, %rax
	mulq	%r12
	movl	20(%r10), %eax
	movl	%eax, 460(%rdi)
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %r15
	addq	$8000, %r15
	movq	%r15, 624(%rdi)
	movq	40(%rsi), %rax
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
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rbp
	movq	72(%rbx), %rbp
	movq	%rbp, %rax
	shrq	$30, %rax
	movl	%edx, 484(%rdi)
	movq	%rbp, %rdx
	xorq	$5, %rdx
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rax, %rdx
	xorq	%r13, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r11, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rax, %rcx
	movq	%rcx, %rax
	mulq	%r12
	shrq	$14, %rdx
	imulq	$24000, %rdx, %rdx
	subq	%rdx, %rcx
	addq	$8000, %rcx
	movq	%rcx, 632(%rdi)
.L485:
	movl	64(%rbx), %eax
	movl	%eax, %r14d
	movl	%eax, %r12d
	movl	%eax, %r13d
	shrl	$3, %r14d
	andl	$2, %r12d
	andl	$4, %r13d
	andl	$1, %r14d
	testb	$1, %al
	je	.L532
	testq	%r8, %r8
	jne	.L462
	leaq	symbols(%rip), %rbp
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L463:
	leal	1(%rdx), %eax
	cltd
	idivl	%r9d
	movl	%edx, 464(%rdi,%r8)
	movslq	(%r10,%r8), %rax
	movq	$0, 544(%rdi,%r8,2)
	movq	(%rsi,%r8,2), %rcx
.L464:
	movl	%eax, 440(%rdi,%r8)
	movq	%rcx, 496(%rdi,%r8,2)
	leal	-1(%rdx), %ecx
	testl	%edx, %edx
	je	.L465
	testl	%r12d, %r12d
	je	.L495
	subl	$2, %edx
	testl	%ecx, %ecx
	je	.L533
	testl	%r13d, %r13d
	je	.L497
.L542:
	leal	-1(%rdx), %ecx
	testl	%edx, %edx
	je	.L534
.L467:
	movq	%rax, %rdx
	salq	$5, %rdx
	movq	24(%rbp,%rdx), %rdx
	testl	%ecx, %ecx
	jne	.L468
	testb	%r14b, %r14b
	jne	.L535
.L468:
	movq	%rdx, 256(%rdi,%r8,2)
	addq	$4, %r8
	cmpq	$24, %r8
	je	.L458
.L469:
	movslq	(%r10,%r8), %rax
	movl	464(%rdi,%r8), %edx
	cmpl	%eax, 440(%rdi,%r8)
	jne	.L463
	movq	(%rsi,%r8,2), %rcx
	cmpq	%rcx, 496(%rdi,%r8,2)
	jne	.L463
	jmp	.L464
	.p2align 4,,10
	.p2align 3
.L462:
	leaq	440(%rdi), %r11
	leaq	256(%rdi), %rbx
	movq	%r10, %rcx
	addq	$464, %rdi
	leaq	symbols(%rip), %rbp
	jmp	.L484
	.p2align 4,,10
	.p2align 3
.L473:
	leal	1(%r10), %eax
	cltd
	idivl	%r9d
	movslq	%edx, %r10
	movl	%r10d, 24(%r11)
	movslq	(%rcx), %rax
	movq	$0, 288(%rbx)
	movq	(%rsi), %rdx
.L472:
	movl	%eax, (%r11)
	movq	%rdx, 240(%rbx)
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L480
	testl	%r12d, %r12d
	je	.L536
	subl	$2, %r10d
	testl	%edx, %edx
	je	.L537
	testl	%r13d, %r13d
	je	.L538
.L479:
	leal	-1(%r10), %edx
	testl	%r10d, %r10d
	je	.L539
.L482:
	movq	%rax, %r10
	salq	$5, %r10
	movq	24(%rbp,%r10), %r10
	testl	%edx, %edx
	jne	.L477
	testb	%r14b, %r14b
	jne	.L540
.L477:
	addq	$4, %r11
	movq	%r10, (%rbx)
	addq	$4, %rcx
	addq	$8, %rbx
	addq	$8, %rsi
	cmpq	%r11, %rdi
	je	.L458
.L484:
	movslq	(%rcx), %rax
	movslq	24(%r11), %r10
	cmpl	(%r11), %eax
	jne	.L473
	movq	240(%rbx), %rdx
	cmpq	%rdx, (%rsi)
	jne	.L473
	movq	288(%rbx), %r15
	movq	336(%rbx), %rdx
	addq	%r8, %r15
	movq	%rdx, -8(%rsp)
	movq	%r15, 288(%rbx)
	cmpq	%rdx, %r15
	jb	.L474
	leal	1(%r10), %eax
	cltd
	idivl	%r9d
	movslq	%edx, %r10
	movq	-8(%rsp), %rdx
	movl	%r10d, 24(%r11)
	leaq	(%rdx,%rdx), %rax
	cmpq	%rax, %r15
	jnb	.L541
	subq	%rdx, %r15
	movslq	(%rcx), %rax
	movq	%r15, 288(%rbx)
	movq	(%rsi), %rdx
	jmp	.L472
	.p2align 4,,10
	.p2align 3
.L458:
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
	.p2align 4,,10
	.p2align 3
.L536:
	.cfi_restore_state
	movl	%edx, %r10d
	testl	%r13d, %r13d
	jne	.L479
.L538:
	movl	%r10d, %edx
	jmp	.L482
	.p2align 4,,10
	.p2align 3
.L495:
	movl	%ecx, %edx
	testl	%r13d, %r13d
	jne	.L542
.L497:
	movl	%edx, %ecx
	jmp	.L467
	.p2align 4,,10
	.p2align 3
.L532:
	leaq	440(%rdi), %r11
	leaq	256(%rdi), %rbx
	movq	%r10, %rcx
	addq	$464, %rdi
	leaq	symbols(%rip), %rbp
	jmp	.L461
	.p2align 4,,10
	.p2align 3
.L486:
	leal	1(%r15), %eax
	cltd
	idivl	%r9d
	movl	%edx, 24(%r11)
	movl	%edx, %r15d
	movslq	(%rcx), %rdx
	movq	$0, 288(%rbx)
	movq	(%rsi), %rax
.L488:
	movl	%edx, (%r11)
	movq	%rax, 240(%rbx)
	testl	%r12d, %r12d
	je	.L502
	leal	-1(%r15), %eax
	testl	%r15d, %r15d
	je	.L543
	testl	%r13d, %r13d
	je	.L504
.L546:
	leal	-1(%rax), %r10d
	testl	%eax, %eax
	je	.L544
.L493:
	movq	%rdx, %rax
	salq	$5, %rax
	movq	24(%rbp,%rax), %rax
	testl	%r10d, %r10d
	jne	.L494
	testb	%r14b, %r14b
	jne	.L545
.L494:
	addq	$4, %r11
	movq	%rax, (%rbx)
	addq	$4, %rcx
	addq	$8, %rbx
	addq	$8, %rsi
	cmpq	%rdi, %r11
	je	.L458
.L461:
	movslq	(%rcx), %rdx
	movl	24(%r11), %r15d
	cmpl	%edx, (%r11)
	jne	.L486
	movq	(%rsi), %rax
	cmpq	%rax, 240(%rbx)
	jne	.L486
	testq	%r8, %r8
	je	.L488
	movq	288(%rbx), %r10
	movq	336(%rbx), %rax
	addq	%r8, %r10
	movq	%rax, -8(%rsp)
	movq	%r10, 288(%rbx)
	cmpq	%rax, %r10
	jb	.L531
	leal	1(%r15), %eax
	cltd
	idivl	%r9d
	movl	%edx, 24(%r11)
	movl	%edx, %r15d
	movq	-8(%rsp), %rdx
	leaq	(%rdx,%rdx), %rax
	cmpq	%rax, %r10
	jnb	.L490
	subq	%rdx, %r10
	movslq	(%rcx), %rdx
	movq	%r10, 288(%rbx)
	movq	(%rsi), %rax
	jmp	.L488
	.p2align 4,,10
	.p2align 3
.L502:
	movl	%r15d, %eax
	testl	%r13d, %r13d
	jne	.L546
.L504:
	movl	%eax, %r10d
	jmp	.L493
.L533:
	movl	$1, %edx
.L465:
	movslq	%edx, %rdx
	leaq	(%rdx,%rax,4), %rax
	movq	0(%rbp,%rax,8), %rdx
	jmp	.L468
.L537:
	movl	$1, %r10d
.L480:
	leaq	(%r10,%rax,4), %rax
	movq	0(%rbp,%rax,8), %r10
	jmp	.L477
.L474:
	movq	(%rsi), %rdx
	jmp	.L472
.L490:
	movq	%r10, %rax
	xorl	%edx, %edx
	divq	-8(%rsp)
	movq	%rdx, 288(%rbx)
	movslq	(%rcx), %rdx
.L531:
	movq	(%rsi), %rax
	jmp	.L488
.L543:
	movl	$1, %eax
.L492:
	leaq	(%rax,%rdx,4), %rax
	movq	0(%rbp,%rax,8), %rax
	jmp	.L494
.L534:
	movl	$2, %edx
	jmp	.L465
.L539:
	movl	$2, %r10d
	jmp	.L480
.L544:
	movl	$2, %eax
	jmp	.L492
.L535:
	movl	$3, %edx
	jmp	.L465
.L545:
	movl	$3, %eax
	jmp	.L492
.L540:
	movl	$3, %r10d
	jmp	.L480
.L541:
	movq	%r15, %rax
	movq	%rdx, %r15
	xorl	%edx, %edx
	divq	%r15
	movslq	(%rcx), %rax
	movq	%rdx, 288(%rbx)
	movq	(%rsi), %rdx
	jmp	.L472
	.cfi_endproc
.LFE136:
	.size	update_semantics.constprop.0, .-update_semantics.constprop.0
	.section	.rodata.str1.8
	.align 8
.LC52:
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
	je	.L548
	leaq	8(%rdi), %rdx
	cmpq	%rsi, %rax
	jne	.L549
	jmp	.L550
	.p2align 4,,10
	.p2align 3
.L570:
	cmpq	%rax, %rbx
	je	.L569
.L549:
	movq	%rax, %rdx
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L570
.L548:
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
	jmp	.L568
	.p2align 4,,10
	.p2align 3
.L552:
	addq	$1, %rax
	andq	%rdi, %rax
.L568:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rsi, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L551
	cmpb	$1, %cl
	jne	.L552
	cmpq	(%rdx), %rbx
	jne	.L552
	movb	$2, 8(%rdx)
	movdqu	32(%r8), %xmm0
	paddq	.LC51(%rip), %xmm0
	movq	$0, (%rdx)
	movhlps	%xmm0, %xmm1
	movups	%xmm0, 32(%r8)
	movq	%xmm1, %rax
	salq	$2, %rax
	cmpq	%rax, %r9
	jb	.L571
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	*free@GOTPCREL(%rip)
.L569:
	.cfi_restore_state
	addq	$248, %rdx
.L550:
	movq	248(%rbx), %rax
	movq	%rax, (%rdx)
	jmp	.L548
.L571:
	movq	%r8, %rdi
	movq	%r9, %rsi
	call	index_rebuild
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	*free@GOTPCREL(%rip)
.L551:
	.cfi_restore_state
	leaq	.LC52(%rip), %rdi
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
	jnb	.L587
.L573:
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
	je	.L574
	movq	%r8, %rsi
	.p2align 4,,10
	.p2align 3
.L577:
	cmpb	$2, %cl
	jne	.L575
	cmpq	%r8, %rsi
	cmove	%rax, %rsi
.L575:
	addq	$1, %rax
	andq	%r9, %rax
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r10, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	jne	.L577
	cmpq	%r8, %rsi
	je	.L574
	subq	$1, 40(%rbp)
	salq	$4, %rsi
	leaq	(%r10,%rsi), %rdx
.L574:
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
.L587:
	.cfi_restore_state
	leaq	(%r8,%r8), %rsi
	movq	%rbp, %rdi
	call	index_rebuild
	movq	24(%rbp), %r8
	movq	32(%rbp), %rdi
	jmp	.L573
	.cfi_endproc
.LFE98:
	.size	index_insert, .-index_insert
	.section	.rodata.str1.1
.LC53:
	.string	" "
	.text
	.p2align 4
	.type	rain_sync.constprop.0.isra.0, @function
rain_sync.constprop.0.isra.0:
.LFB138:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	xorl	%edi, %edi
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	88(%r15), %ecx
	movq	.LC62(%rip), %xmm4
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movq	%rdi, 40(%rsp)
	punpcklqdq	%xmm4, %xmm4
	movaps	%xmm4, 64(%rsp)
	testl	%ecx, %ecx
	je	.L589
	movq	80(%r15), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	cmpq	%rax, %rdx
	cmovb	%rdi, %rcx
	movq	%rcx, 40(%rsp)
.L589:
	pxor	%xmm1, %xmm1
	movq	%rdx, 80(%r15)
	cvtsi2sdq	56(%r15), %xmm1
	movl	$1, 88(%r15)
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
	divsd	.LC54(%rip), %xmm0
	call	*lround@GOTPCREL(%rip)
	movsd	(%rsp), %xmm1
	movl	$1, %edx
	movsd	.LC49(%rip), %xmm0
	testq	%rax, %rax
	mulsd	%xmm1, %xmm0
	cmovne	%rax, %rdx
	movsd	.LC55(%rip), %xmm1
	movq	%rdx, 48(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movl	64(%r15), %eax
	movsd	%xmm0, 56(%rsp)
	movl	%eax, %edx
	movl	%eax, %edi
	andl	$2, %edx
	andl	$1, %edi
	cmpl	$1, %edx
	movl	%eax, %edx
	sbbl	$-1, %edi
	andl	$4, %edx
	cmpl	$1, %edx
	sbbl	$-1, %edi
	andl	$8, %eax
	cmpl	$1, %eax
	movq	8(%r15), %rax
	sbbl	$-1, %edi
	testq	%rax, %rax
	je	.L596
	.p2align 4,,10
	.p2align 3
.L593:
	movl	$0, 392(%rax)
	movq	248(%rax), %rax
	testq	%rax, %rax
	jne	.L593
.L596:
	xorl	%ebp, %ebp
	cmpq	$0, 8(%r12)
	je	.L588
	movl	%edi, 28(%rsp)
	.p2align 4,,10
	.p2align 3
.L594:
	movq	%rbp, %rbx
	movq	72(%r15), %rdi
	movabsq	$-4658895280553007687, %rcx
	salq	$4, %rbx
	subq	%rbp, %rbx
	movq	%rdi, %rsi
	salq	$4, %rbx
	addq	(%r12), %rbx
	shrq	$30, %rsi
	movq	8(%rbx), %r11
	xorq	%rdi, %rsi
	movl	(%rbx), %r9d
	imulq	%rcx, %rsi
	movq	%r11, %rdx
	shrq	$30, %rdx
	xorq	%r11, %rdx
	movq	%rsi, %rdi
	imulq	%rcx, %rdx
	shrq	$27, %rdi
	xorq	%rdi, %rsi
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	movabsq	$-7723592293110705685, %rax
	imulq	%rax, %rsi
	imulq	%rax, %rdx
	movq	%rsi, %r13
	shrq	$31, %r13
	xorq	%rsi, %r13
	movl	%r9d, %esi
	xorq	%r13, %rsi
	xorq	%rdx, %rsi
	shrq	$31, %rdx
	xorq	%rdx, %rsi
	movq	%rsi, %rdx
	shrq	$30, %rdx
	xorq	%rsi, %rdx
	movq	24(%r15), %rsi
	imulq	%rcx, %rdx
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
	je	.L597
	movq	16(%r15), %r8
	xorl	%ecx, %ecx
	jmp	.L600
	.p2align 4,,10
	.p2align 3
.L598:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rdi, %rax
	cmpq	%rcx, %rsi
	je	.L597
.L600:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L597
	cmpb	$1, %r10b
	jne	.L598
	movq	(%rdx), %r14
	cmpl	(%r14), %r9d
	jne	.L598
	cmpq	8(%r14), %r11
	jne	.L598
	movdqu	(%rbx), %xmm6
	movq	.LC45(%rip), %rax
	movups	%xmm6, (%r14)
	movdqu	16(%rbx), %xmm7
	movq	%rax, 16(%rsp)
	movups	%xmm7, 16(%r14)
	movdqu	32(%rbx), %xmm6
	movups	%xmm6, 32(%r14)
	movdqu	48(%rbx), %xmm7
	movups	%xmm7, 48(%r14)
	movdqu	64(%rbx), %xmm3
	movups	%xmm3, 64(%r14)
	movdqu	80(%rbx), %xmm4
	movups	%xmm4, 80(%r14)
	movdqu	96(%rbx), %xmm5
	movups	%xmm5, 96(%r14)
	movdqu	112(%rbx), %xmm6
	movups	%xmm6, 112(%r14)
	movdqu	128(%rbx), %xmm7
	movups	%xmm7, 128(%r14)
	movdqu	144(%rbx), %xmm3
	movups	%xmm3, 144(%r14)
	movdqu	160(%rbx), %xmm4
	movups	%xmm4, 160(%r14)
	movdqu	176(%rbx), %xmm5
	movups	%xmm5, 176(%r14)
	movdqu	192(%rbx), %xmm6
	movups	%xmm6, 192(%r14)
	movdqu	208(%rbx), %xmm7
	movups	%xmm7, 208(%r14)
	movdqu	224(%rbx), %xmm3
	movups	%xmm3, 224(%r14)
	movq	%rax, 416(%r14)
.L624:
	movq	200(%rbx), %rax
	movl	$1, 392(%r14)
	testq	%rax, %rax
	js	.L611
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L612:
	leaq	80(%rsp), %r11
	movl	$1, %esi
	movq	%rbx, %rdi
	divsd	56(%rsp), %xmm0
	movq	%r11, %rdx
	movsd	%xmm0, (%rsp)
	call	semantic_keys
	movl	488(%r14), %eax
	testl	%eax, %eax
	movq	640(%r14), %rax
	je	.L614
	movl	440(%r14), %edi
	cmpl	%edi, 80(%rsp)
	je	.L614
	addq	$1, %rax
	movq	%rax, 640(%r14)
.L614:
	pxor	%xmm1, %xmm1
	movq	%rax, 112(%rsp)
	xorl	%edx, %edx
	movl	28(%rsp), %r9d
	movq	40(%rsp), %r8
	leaq	112(%rsp), %rcx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movdqu	224(%rbx), %xmm0
	movdqu	648(%r14), %xmm4
	movq	$0, 152(%rsp)
	movdqa	%xmm0, %xmm2
	psrlq	$63, %xmm2
	psubq	%xmm2, %xmm1
	pxor	%xmm1, %xmm0
	psubq	%xmm1, %xmm0
	paddq	%xmm4, %xmm0
	movups	%xmm0, 648(%r14)
	movq	152(%rbx), %rax
	movdqa	%xmm0, %xmm1
	psrlq	$4, %xmm1
	movhps	%xmm0, 144(%rsp)
	divq	48(%rsp)
	movq	%xmm1, 128(%rsp)
	movq	%r11, %rdx
	movq	%rax, 120(%rsp)
	movq	168(%rbx), %rax
	addq	160(%rbx), %rax
	xorl	%ebx, %ebx
	shrq	$16, %rax
	movq	%rax, 136(%rsp)
	call	update_semantics.constprop.0
	movq	216(%r14), %rax
	addq	208(%r14), %rax
	jne	.L653
.L615:
	movsd	16(%rsp), %xmm1
	movsd	(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	%rbx, %xmm1
	movsd	424(%r14), %xmm2
	movsd	%xmm0, 8(%rsp)
	movsd	%xmm2, 32(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movsd	32(%rsp), %xmm2
	movq	176(%r14), %rax
	subsd	%xmm2, %xmm0
	mulsd	.LC57(%rip), %xmm0
	movq	%rax, %rdi
	shrq	$40, %rdi
	addsd	%xmm0, %xmm2
	movsd	%xmm2, 424(%r14)
	jne	.L618
	leaq	1(%rax), %rbx
	bsrq	%rbx, %rbx
	sarl	%ebx
.L619:
	movq	184(%r14), %rax
	movl	$1, %r13d
	movabsq	$1099511627775, %rdx
	testq	%rax, %rax
	cmovg	%rax, %r13
	cmpq	%rdx, %rax
	jg	.L620
	bsrq	%r13, %r13
.L621:
	movsd	.LC49(%rip), %xmm0
	movsd	.LC58(%rip), %xmm1
	movsd	%xmm2, 16(%rsp)
	addsd	432(%r14), %xmm0
	call	*fmin@GOTPCREL(%rip)
	movsd	.LC58(%rip), %xmm5
	movsd	%xmm0, 432(%r14)
	comisd	%xmm0, %xmm5
	ja	.L622
	movsd	16(%rsp), %xmm2
	mulsd	.LC59(%rip), %xmm2
	movapd	%xmm2, %xmm0
	call	*round@GOTPCREL(%rip)
	movl	$6, %eax
	cmpl	%eax, %ebx
	cvttsd2sil	%xmm0, %edx
	cmovg	%eax, %ebx
	movl	$3, %eax
	cmpl	%eax, %r13d
	cmovg	%eax, %r13d
	leal	6(%rbx,%r13), %eax
	addl	%edx, %eax
	movl	$16, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	384(%r14), %rdx
	cmpl	%edx, %eax
	je	.L622
	movq	$0x000000000, 432(%r14)
	jle	.L623
	leal	1(%rdx), %eax
	movl	%eax, 384(%r14)
	leaq	.LC53(%rip), %rax
	movq	%rax, 256(%r14,%rdx,8)
.L622:
	movl	64(%r15), %esi
	movl	28(%rsp), %edx
	movq	%r14, %rdi
	addq	$1, %rbp
	movsd	.LC49(%rip), %xmm0
	movsd	(%rsp), %xmm1
	call	record_history.isra.0
	movsd	8(%rsp), %xmm0
	mulsd	.LC60(%rip), %xmm0
	addsd	.LC61(%rip), %xmm0
	movsd	%xmm0, 408(%r14)
	cmpq	8(%r12), %rbp
	jb	.L594
.L588:
	movq	168(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L654
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
.L611:
	.cfi_restore_state
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L612
	.p2align 4,,10
	.p2align 3
.L620:
	pxor	%xmm0, %xmm0
	movsd	%xmm2, 16(%rsp)
	cvtsi2sdq	%r13, %xmm0
	call	*log2@GOTPCREL(%rip)
	movsd	16(%rsp), %xmm2
	cvttsd2sil	%xmm0, %r13d
	jmp	.L621
	.p2align 4,,10
	.p2align 3
.L618:
	pxor	%xmm0, %xmm0
	movsd	%xmm2, 32(%rsp)
	cvtsi2sdq	%rax, %xmm0
	addsd	16(%rsp), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC2(%rip), %xmm0
	movsd	32(%rsp), %xmm2
	cvttsd2sil	%xmm0, %ebx
	jmp	.L619
	.p2align 4,,10
	.p2align 3
.L653:
	js	.L616
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L617:
	divsd	.LC49(%rip), %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	16(%rsp), %xmm1
	divsd	.LC56(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	%xmm0, %rbx
	jmp	.L615
	.p2align 4,,10
	.p2align 3
.L623:
	subl	$1, %edx
	leaq	.LC53(%rip), %rax
	movl	%edx, 384(%r14)
	movslq	%edx, %rdx
	movq	%rax, 256(%r14,%rdx,8)
	jmp	.L622
	.p2align 4,,10
	.p2align 3
.L616:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L617
	.p2align 4,,10
	.p2align 3
.L597:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L655
	movdqu	(%rbx), %xmm4
	movups	%xmm4, (%rax)
	movdqu	16(%rbx), %xmm4
	movups	%xmm4, 16(%rax)
	movdqu	32(%rbx), %xmm4
	movups	%xmm4, 32(%rax)
	movdqu	48(%rbx), %xmm4
	movups	%xmm4, 48(%rax)
	movdqu	64(%rbx), %xmm4
	movups	%xmm4, 64(%rax)
	movdqu	80(%rbx), %xmm4
	movups	%xmm4, 80(%rax)
	movdqu	96(%rbx), %xmm4
	movups	%xmm4, 96(%rax)
	movdqu	112(%rbx), %xmm6
	movups	%xmm6, 112(%rax)
	movdqu	128(%rbx), %xmm7
	movups	%xmm7, 128(%rax)
	movdqu	144(%rbx), %xmm3
	movups	%xmm3, 144(%rax)
	movdqu	160(%rbx), %xmm4
	movups	%xmm4, 160(%rax)
	movdqu	176(%rbx), %xmm6
	movups	%xmm6, 176(%rax)
	movdqu	192(%rbx), %xmm7
	movups	%xmm7, 192(%rax)
	movdqu	208(%rbx), %xmm3
	movups	%xmm3, 208(%rax)
	movdqu	224(%rbx), %xmm4
	movups	%xmm4, 224(%rax)
	movq	.LC5(%rip), %rax
	movq	%rax, 400(%r14)
	movq	.LC45(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	%rax, 416(%r14)
	movq	176(%rbx), %rax
	movq	%rax, %rdi
	shrq	$40, %rdi
	jne	.L602
	addq	$1, %rax
	bsrq	%rax, %rax
	movl	%eax, %esi
	sarl	%esi
.L603:
	movq	184(%rbx), %rdx
	movl	$1, %eax
	movabsq	$1099511627775, %rcx
	testq	%rdx, %rdx
	cmovg	%rdx, %rax
	cmpq	%rcx, %rdx
	jg	.L604
	bsrq	%rax, %rax
.L605:
	movl	$6, %edx
	movdqa	64(%rsp), %xmm5
	movq	%r15, %rdi
	movabsq	$-7723592293110705685, %r8
	cmpl	%edx, %esi
	movl	%edx, %ecx
	movl	$3, %edx
	cmovle	%esi, %ecx
	cmpl	%edx, %eax
	movq	%r14, %rsi
	cmovg	%edx, %eax
	movq	8(%rbx), %rdx
	leal	6(%rcx,%rax), %eax
	movl	%eax, 384(%r14)
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	movabsq	$-4658895280553007687, %rdx
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movl	(%rbx), %ecx
	movups	%xmm5, 256(%r14)
	imulq	%r8, %rax
	movups	%xmm5, 272(%r14)
	xorq	%r13, %rcx
	movups	%xmm5, 288(%r14)
	movups	%xmm5, 304(%r14)
	xorq	%rax, %rcx
	shrq	$31, %rax
	movups	%xmm5, 320(%r14)
	xorq	%rax, %rcx
	movups	%xmm5, 336(%r14)
	movq	%rcx, %rax
	movups	%xmm5, 352(%r14)
	shrq	$30, %rax
	movups	%xmm5, 368(%r14)
	xorq	%rcx, %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	imulq	%r8, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rcx, %rax
	movq	%rax, 664(%r14)
	call	index_insert
	movq	8(%r15), %rax
	movq	8(%rbx), %rcx
	movq	%r14, 8(%r15)
	movabsq	$-4658895280553007687, %rdx
	movq	72(%r15), %rsi
	movq	(%r15), %r9
	movabsq	$-7723592293110705685, %r8
	movq	%rax, 248(%r14)
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rax
	movq	%rsi, %rcx
	shrq	$30, %rcx
	imulq	%r8, %rax
	xorq	%rsi, %rcx
	imulq	%rdx, %rcx
	movq	%rcx, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rcx
	imulq	%r8, %rcx
	movq	%rcx, %rsi
	shrq	$31, %rsi
	xorq	%rsi, %rcx
	movl	(%rbx), %esi
	xorq	%rsi, %rcx
	xorq	%rax, %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$30, %rax
	xorq	%rcx, %rax
	movslq	48(%r15), %rcx
	imulq	%rax, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rax, %rdx
	imulq	%r8, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rcx
	movslq	%edx, %r11
	testl	%ecx, %ecx
	jle	.L606
	movl	%edx, %ecx
	leal	(%rsi,%rdx), %r8d
	movq	$-1, %rdi
	.p2align 4,,10
	.p2align 3
.L608:
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	leaq	(%rax,%rax,4), %rax
	movq	16(%r9,%rax,8), %rax
	cmpq	%rdi, %rax
	jnb	.L607
	movslq	%edx, %r11
	movq	%rax, %rdi
.L607:
	addl	$1, %ecx
	cmpl	%ecx, %r8d
	jne	.L608
.L606:
	movq	$0, 240(%r14)
	leaq	(%r11,%r11,4), %rax
	leaq	(%r9,%rax,8), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L609
	movq	%r14, 240(%rdx)
.L610:
	addq	$1, 16(%rax)
	movq	%r14, 8(%rax)
	jmp	.L624
.L602:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	.LC45(%rip), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC2(%rip), %xmm0
	cvttsd2sil	%xmm0, %esi
	jmp	.L603
.L604:
	pxor	%xmm0, %xmm0
	movl	%esi, (%rsp)
	cvtsi2sdq	%rax, %xmm0
	call	*log2@GOTPCREL(%rip)
	movl	(%rsp), %esi
	cvttsd2sil	%xmm0, %eax
	jmp	.L605
.L609:
	movq	%r14, (%rax)
	jmp	.L610
.L655:
	leaq	.LC4(%rip), %rdi
	call	die
.L654:
	call	*__stack_chk_fail@GOTPCREL(%rip)
	.cfi_endproc
.LFE138:
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
	leaq	.L660(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2200, %rsp
	.cfi_def_cfa_offset 2256
	movl	%edi, 8(%rsp)
	movl	$6, %edi
	movq	%rsi, 16(%rsp)
	leaq	.LC64(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 2184(%rsp)
	xorl	%eax, %eax
	call	*setlocale@GOTPCREL(%rip)
	movsd	.LC49(%rip), %xmm4
	movq	$0, 64(%rsp)
	movl	$0, 28(%rsp)
	movl	$0, 48(%rsp)
	movl	$30, 100(%rsp)
	movl	$0, 96(%rsp)
	movl	$60, 56(%rsp)
	movl	$30, 40(%rsp)
	movsd	%xmm4, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L657:
	xorl	%r8d, %r8d
	movq	16(%rsp), %rsi
	movl	8(%rsp), %edi
	leaq	long_options.0(%rip), %rcx
	leaq	.LC64(%rip), %rdx
	call	*getopt_long@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L1083
	subl	$66, %eax
	cmpl	$49, %eax
	ja	.L658
	movslq	0(%r13,%rax,4), %rax
	addq	%r13, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L660:
	.long	.L671-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L670-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L669-.L660
	.long	.L912-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L667-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L666-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L665-.L660
	.long	.L664-.L660
	.long	.L663-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L658-.L660
	.long	.L662-.L660
	.long	.L658-.L660
	.long	.L661-.L660
	.long	.L659-.L660
	.section	.text.startup
.L659:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	leaq	576(%rsp), %rsi
	movq	%rax, %rbx
	movl	$0, (%rax)
	call	*strtoull@GOTPCREL(%rip)
	movl	(%rbx), %r11d
	movq	%rax, 64(%rsp)
	testl	%r11d, %r11d
	jne	.L684
	movq	optarg(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L684
	movq	576(%rsp), %rdx
	cmpb	$0, (%rdx)
	jne	.L684
	cmpb	$45, %al
	jne	.L657
.L684:
	leaq	.LC78(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L661:
	movq	optarg(%rip), %rdi
	leaq	.LC66(%rip), %rsi
	call	positive_int
	movl	%eax, 56(%rsp)
	jmp	.L657
.L662:
	call	*__errno_location@GOTPCREL(%rip)
	movq	optarg(%rip), %rbx
	leaq	576(%rsp), %rsi
	movq	%rax, %rbp
	movl	$0, (%rax)
	movq	%rbx, %rdi
	call	*strtod@GOTPCREL(%rip)
	movl	0(%rbp), %ebp
	movapd	%xmm0, %xmm7
	movsd	%xmm0, 32(%rsp)
	testl	%ebp, %ebp
	jne	.L672
	cmpb	$0, (%rbx)
	je	.L672
	movq	576(%rsp), %rax
	cmpb	$0, (%rax)
	jne	.L672
	andpd	.LC68(%rip), %xmm0
	movsd	.LC69(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L672
	pxor	%xmm0, %xmm0
	comisd	%xmm7, %xmm0
	jb	.L657
.L672:
	movq	stderr(%rip), %rdi
	movq	%rbx, %r8
	xorl	%eax, %eax
	leaq	.LC70(%rip), %rcx
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L663:
	movq	stdout(%rip), %rdi
	leaq	.LC81(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	xorl	%edi, %edi
	call	*exit@GOTPCREL(%rip)
.L664:
	movq	optarg(%rip), %rdi
	call	*strdup@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L724
	leaq	576(%rsp), %rbp
	leaq	.LC71(%rip), %r12
	movq	%rax, 72(%rsp)
	movq	%rbp, %rdx
	movq	%r12, %rsi
	call	*strtok_r@GOTPCREL(%rip)
	movq	72(%rsp), %rdi
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L676
	movl	%r14d, 72(%rsp)
	xorl	%r15d, %r15d
	movq	%rdi, %r14
	jmp	.L682
.L1085:
	orl	$1, %r15d
.L678:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	xorl	%edi, %edi
	call	*strtok_r@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L1084
.L682:
	leaq	.LC72(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L1085
	leaq	.LC73(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L679
	orl	$2, %r15d
	jmp	.L678
.L665:
	movq	optarg(%rip), %rdi
	leaq	.LC67(%rip), %rsi
	call	positive_int
	movl	%eax, 100(%rsp)
	jmp	.L657
.L666:
	movq	optarg(%rip), %rdi
	leaq	.LC65(%rip), %rsi
	call	positive_int
	movl	%eax, 40(%rsp)
	jmp	.L657
.L667:
	movl	$1, 28(%rsp)
	jmp	.L657
.L669:
	movq	optarg(%rip), %rdi
	leaq	.LC79(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L657
	leaq	.LC80(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L670:
	movl	$1, 96(%rsp)
	jmp	.L657
.L679:
	leaq	.LC74(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L680
	orl	$4, %r15d
	jmp	.L678
.L680:
	leaq	.LC75(%rip), %rsi
	movq	%rbx, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L681
	orl	$8, %r15d
	jmp	.L678
.L1084:
	movq	%r14, %rdi
	movl	72(%rsp), %r14d
	call	*free@GOTPCREL(%rip)
	jmp	.L657
.L912:
	movl	$1, %r14d
	jmp	.L657
.L671:
	movl	$1, 48(%rsp)
	jmp	.L657
.L1083:
	movl	8(%rsp), %eax
	cmpl	optind(%rip), %eax
	jne	.L1086
	testl	%r14d, %r14d
	jne	.L1087
	cmpl	$0, 48(%rsp)
	jne	.L1088
	cmpl	$0, 28(%rsp)
	jne	.L1089
	call	*initscr@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.L1090
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
	jne	.L1091
.L767:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*getmaxx@GOTPCREL(%rip)
	movl	96(%rsp), %edi
	testl	%edi, %edi
	jne	.L1092
.L768:
	leaq	384(%rsp), %rax
	movq	64(%rsp), %r8
	movl	56(%rsp), %edx
	movl	%r15d, %ecx
	movl	40(%rsp), %esi
	movq	%rax, %rdi
	movq	%rax, 48(%rsp)
	call	rain_init
	leaq	1152(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 72(%rsp)
	call	telemetry_init
	testl	%eax, %eax
	je	.L1093
	leaq	.LC102(%rip), %rdx
	leaq	.LC103(%rip), %rax
	movq	.LC62(%rip), %xmm3
	movq	%rax, %xmm7
	movq	%rdx, %xmm4
	leaq	336(%rsp), %rax
	punpcklqdq	%xmm3, %xmm3
	punpcklqdq	%xmm7, %xmm4
	movq	%rax, %rdi
	movq	%rax, 144(%rsp)
	movaps	%xmm3, 208(%rsp)
	movaps	%xmm4, 192(%rsp)
	call	sampler_init
	call	monotonic_seconds
	leaq	256(%rsp), %rax
	movapd	%xmm0, %xmm6
	addsd	32(%rsp), %xmm6
	movq	%rax, 232(%rsp)
	movsd	%xmm0, 88(%rsp)
	movsd	%xmm6, 40(%rsp)
.L771:
	movq	232(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L784
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	96(%rsp), %r8d
	movq	stdscr(%rip), %rdi
	cvtsi2sdq	256(%rsp), %xmm1
	cvtsi2sdq	264(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rsp)
	testl	%r8d, %r8d
	jne	.L1094
.L774:
	call	*wgetch@GOTPCREL(%rip)
	movl	%eax, %edx
	andl	$-33, %edx
	cmpl	$81, %edx
	je	.L778
	cmpl	$27, %eax
	je	.L778
	cmpl	$32, %eax
	je	.L1095
	cmpl	$114, %eax
	je	.L1096
.L780:
	movsd	16(%rsp), %xmm4
	comisd	40(%rsp), %xmm4
	jnb	.L1097
.L781:
	movsd	.LC45(%rip), %xmm4
	movl	28(%rsp), %ebx
	movsd	%xmm4, 8(%rsp)
	testl	%ebx, %ebx
	je	.L856
.L816:
	movq	stdscr(%rip), %rdi
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %r13d
	call	*getmaxx@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*werase@GOTPCREL(%rip)
	movl	432(%rsp), %r14d
	leal	(%r14,%r14), %ecx
	cmpl	%ecx, %ebx
	jl	.L938
	cmpl	$3, %r13d
	jle	.L938
	movl	436(%rsp), %r15d
	leal	-2(%r13), %eax
	movl	%eax, 104(%rsp)
	cmpl	%r15d, %eax
	cmovg	%r15d, %eax
	movl	%eax, %r12d
	testl	%r14d, %r14d
	jle	.L886
	movq	384(%rsp), %rax
	xorl	%edx, %edx
	movl	%r13d, 112(%rsp)
	movl	%r12d, %r13d
	movl	%r14d, 128(%rsp)
	movl	%r15d, 136(%rsp)
	movq	%rax, %r14
	movl	%edx, %r15d
	movl	%ebx, 120(%rsp)
	jmp	.L885
.L887:
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	je	.L1098
.L885:
	movq	(%r14), %r12
	testq	%r12, %r12
	je	.L887
	movl	388(%r12), %r8d
	testl	%r8d, %r8d
	je	.L887
	movl	384(%r12), %ebx
	subl	$1, %ebx
	js	.L887
	movslq	%ebx, %rbx
	movl	%ebp, 88(%rsp)
	movl	%ecx, 64(%rsp)
	movq	%rbx, %rbp
	movq	%r12, %rbx
	movq	%r14, 80(%rsp)
	movl	%r15d, 56(%rsp)
	jmp	.L899
.L1099:
	cmpb	$0, 1(%r14)
	jne	.L941
.L888:
	subq	$1, %rbp
	testl	%ebp, %ebp
	js	.L1082
.L899:
	movq	256(%rbx,%rbp,8), %r14
	testq	%r14, %r14
	je	.L888
	cmpb	$32, (%r14)
	je	.L1099
.L941:
	cvttsd2sil	400(%rbx), %eax
	subl	%ebp, %eax
	movl	%eax, %r15d
	js	.L888
	cmpl	%eax, %r13d
	jle	.L888
	movl	384(%rbx), %eax
	movsd	416(%rbx), %xmm1
	testl	%ebp, %ebp
	je	.L890
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movsd	.LC111(%rip), %xmm6
	cvtsi2sdl	%ebp, %xmm0
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm2, %xmm0
	comisd	%xmm0, %xmm6
	ja	.L891
	movsd	.LC112(%rip), %xmm6
	comisd	%xmm1, %xmm6
	ja	.L888
.L892:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$8, %r9d
	orl	$1048576, %r9d
	movl	%r9d, %r12d
.L894:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	movl	%r12d, %esi
	call	*wattr_on@GOTPCREL(%rip)
	movl	56(%rsp), %edx
	movq	stdscr(%rip), %rdi
	movl	%r15d, %esi
	call	*wmove@GOTPCREL(%rip)
	cmpl	$-1, %eax
	je	.L898
	movq	stdscr(%rip), %rdi
	movl	$-1, %edx
	movq	%r14, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L898:
	subq	$1, %rbp
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	movl	%r12d, %esi
	call	*wattr_off@GOTPCREL(%rip)
	testl	%ebp, %ebp
	jns	.L899
.L1082:
	movl	56(%rsp), %r15d
	movq	80(%rsp), %r14
	movl	64(%rsp), %ecx
	movl	88(%rsp), %ebp
	addl	$2, %r15d
	addq	$40, %r14
	cmpl	%r15d, %ecx
	jne	.L885
.L1098:
	movl	112(%rsp), %r13d
	movl	120(%rsp), %ebx
	movl	128(%rsp), %r14d
	movl	136(%rsp), %r15d
.L886:
	movq	392(%rsp), %rax
	testq	%rax, %rax
	je	.L883
.L882:
	cmpl	$1, 392(%rax)
	movq	248(%rax), %rax
	sbbl	$-1, %ebp
	testq	%rax, %rax
	jne	.L882
.L883:
	leaq	1664(%rsp), %r10
	movsd	.LC46(%rip), %xmm1
	movsd	.LC113(%rip), %xmm0
	leaq	.LC114(%rip), %r8
	movq	%r10, %rdi
	movl	$512, %ecx
	movl	$2, %edx
	movl	$512, %esi
	mulsd	1304(%rsp), %xmm0
	pushq	%rax
	.cfi_def_cfa_offset 2264
	movl	$5, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 2272
	movsd	1352(%rsp), %xmm4
	movsd	1344(%rsp), %xmm3
	movsd	1336(%rsp), %xmm2
	divsd	%xmm1, %xmm4
	movq	%r10, 72(%rsp)
	leaq	1360(%rsp), %r9
	divsd	%xmm1, %xmm3
	movsd	1328(%rsp), %xmm1
	call	*__snprintf_chk@GOTPCREL(%rip)
	popq	%rdx
	.cfi_def_cfa_offset 2264
	leaq	.LC64(%rip), %rax
	popq	%rcx
	.cfi_def_cfa_offset 2256
	leaq	.LC63(%rip), %rdx
	cmpl	$0, 28(%rsp)
	movl	%r14d, %r9d
	movl	$256, %ecx
	cmovne	%rdx, %rax
	movl	$256, %esi
	movl	$2, %edx
	leaq	1408(%rsp), %r12
	leaq	.LC115(%rip), %r8
	pushq	%rax
	.cfi_def_cfa_offset 2264
	movq	%r12, %rdi
	xorl	%eax, %eax
	pushq	%r15
	.cfi_def_cfa_offset 2272
	call	*__snprintf_chk@GOTPCREL(%rip)
	movl	120(%rsp), %esi
	movq	stdscr(%rip), %rdi
	xorl	%edx, %edx
	call	*wmove@GOTPCREL(%rip)
	popq	%rsi
	.cfi_def_cfa_offset 2264
	popq	%rdi
	.cfi_def_cfa_offset 2256
	addl	$1, %eax
	je	.L902
	movq	56(%rsp), %rsi
	movq	stdscr(%rip), %rdi
	leal	-1(%rbx), %edx
	call	*waddnstr@GOTPCREL(%rip)
.L902:
	xorl	%edx, %edx
	movq	stdscr(%rip), %rdi
	leal	-1(%r13), %esi
	call	*wmove@GOTPCREL(%rip)
	addl	$1, %eax
	je	.L903
	movq	stdscr(%rip), %rdi
	leal	-1(%rbx), %edx
	movq	%r12, %rsi
	call	*waddnstr@GOTPCREL(%rip)
.L903:
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
.L880:
	pxor	%xmm0, %xmm0
	movsd	8(%rsp), %xmm1
	movl	$1, %edi
	leaq	480(%rsp), %rsi
	cvtsi2sdl	100(%rsp), %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L784
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	movsd	8(%rsp), %xmm1
	cvtsi2sdq	480(%rsp), %xmm2
	cvtsi2sdq	488(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm2, %xmm0
	subsd	16(%rsp), %xmm0
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L904
	cvttsd2siq	%xmm1, %rax
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	movq	%rax, 576(%rsp)
	call	*floor@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	leaq	576(%rsp), %rdi
	xorl	%esi, %esi
	subsd	%xmm0, %xmm1
	mulsd	.LC23(%rip), %xmm1
	cvttsd2siq	%xmm1, %rax
	movq	%rax, 584(%rsp)
	call	*nanosleep@GOTPCREL(%rip)
.L904:
	movsd	16(%rsp), %xmm3
	movsd	%xmm3, 88(%rsp)
	jmp	.L771
.L890:
	movsd	.LC112(%rip), %xmm4
	comisd	%xmm1, %xmm4
	ja	.L1100
	call	*has_colors@GOTPCREL(%rip)
	negb	%al
	sbbl	%r9d, %r9d
	andl	$768, %r9d
	orl	$2097152, %r9d
	movl	%r9d, %r12d
	jmp	.L894
	.p2align 4,,10
	.p2align 3
.L891:
	movsd	.LC112(%rip), %xmm4
	comisd	%xmm1, %xmm4
	jbe	.L1069
	movsd	.LC88(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L892
	jmp	.L888
.L1100:
	movsd	.LC88(%rip), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L1082
.L1069:
	call	*has_colors@GOTPCREL(%rip)
	movzbl	%al, %r9d
	sall	$9, %r9d
	movl	%r9d, %r12d
	jmp	.L894
.L938:
	xorl	%edi, %edi
	leaq	.LC110(%rip), %rdx
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	*mvprintw@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	call	*wrefresh@GOTPCREL(%rip)
	jmp	.L880
.L1094:
	call	*getmaxy@GOTPCREL(%rip)
	movq	stdscr(%rip), %rdi
	movl	%eax, %ebx
	call	*getmaxx@GOTPCREL(%rip)
	movl	96(%rsp), %esi
	cmpl	$1, %eax
	jle	.L775
	subl	$1, %eax
	sarl	%eax
	movl	%eax, %esi
.L775:
	movl	$3, %eax
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	movl	%eax, %edx
	subl	$2, %edx
	cmpl	%esi, 432(%rsp)
	jne	.L776
	cmpl	%edx, 436(%rsp)
	je	.L1076
.L776:
	movq	48(%rsp), %rdi
	call	rain_resize
.L1076:
	movq	stdscr(%rip), %rdi
	jmp	.L774
.L1114:
	movsd	32(%rsp), %xmm3
	addsd	16(%rsp), %xmm3
	movl	244(%rsp), %ebp
	movsd	%xmm3, 40(%rsp)
.L856:
	cmpl	$0, 432(%rsp)
	jle	.L816
	movsd	.LC1(%rip), %xmm1
	movsd	16(%rsp), %xmm0
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	subsd	88(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 56(%rsp)
	jmp	.L877
.L865:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	384(%rbx), %xmm0
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%r13d, %xmm0
	comisd	%xmm0, %xmm1
	jb	.L859
.L870:
	movq	240(%rbx), %rax
	movq	%rax, (%r12)
	testq	%rax, %rax
	je	.L1101
.L869:
	movq	16(%r12), %rcx
	movq	8(%rbx), %rsi
	movabsq	$-4658895280553007687, %r8
	movabsq	$495873782388, %r9
	xorq	456(%rsp), %r9
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
	js	.L871
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L872:
	mulsd	.LC85(%rip), %xmm0
	mulsd	.LC86(%rip), %xmm0
	divsd	.LC89(%rip), %xmm0
	addsd	.LC58(%rip), %xmm0
	movq	%xmm0, %r13
	testl	%edx, %edx
	je	.L873
	movq	.LC5(%rip), %rax
	movl	$0, 388(%rbx)
	movq	%rax, 400(%rbx)
	movq	8(%r12), %rax
	testq	%rax, %rax
	je	.L874
	movq	%rbx, 240(%rax)
.L875:
	movq	%rbx, 8(%r12)
	movq	%rcx, 16(%r12)
.L876:
	movq	%r13, 24(%r12)
.L859:
	addl	$1, %r15d
	addq	$40, %r14
	cmpl	432(%rsp), %r15d
	jge	.L816
.L877:
	movq	384(%rsp), %r12
	addq	%r14, %r12
	movq	(%r12), %rbx
	testq	%rbx, %rbx
	je	.L859
	movl	388(%rbx), %r11d
	testl	%r11d, %r11d
	jne	.L860
	movl	32(%r12), %r10d
	testl	%r10d, %r10d
	jne	.L861
	movabsq	$-4658895280553007687, %rsi
	movq	8(%rbx), %rdx
	movabsq	$495873782388, %rdi
	xorq	456(%rsp), %rdi
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
	js	.L862
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L863:
	mulsd	.LC85(%rip), %xmm0
	movl	$1, 32(%r12)
	mulsd	.LC86(%rip), %xmm0
	movsd	%xmm0, 24(%r12)
.L861:
	movsd	24(%r12), %xmm0
	pxor	%xmm1, %xmm1
	subsd	56(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%r12)
	ja	.L859
	movl	$1, 388(%rbx)
.L860:
	movsd	56(%rsp), %xmm1
	mulsd	408(%rbx), %xmm1
	addsd	400(%rbx), %xmm1
	movl	392(%rbx), %edx
	movl	436(%rsp), %r13d
	movsd	%xmm1, 400(%rbx)
	testl	%edx, %edx
	jne	.L865
	movl	%edx, 80(%rsp)
	movsd	56(%rsp), %xmm0
	movsd	%xmm1, 64(%rsp)
	xorpd	.LC104(%rip), %xmm0
	divsd	.LC109(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	pxor	%xmm2, %xmm2
	movsd	64(%rsp), %xmm1
	movl	80(%rsp), %edx
	cvtsi2sdl	384(%rbx), %xmm2
	mulsd	416(%rbx), %xmm0
	subsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%r13d, %xmm2
	movsd	%xmm0, 416(%rbx)
	comisd	%xmm2, %xmm1
	jnb	.L870
	movsd	.LC88(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L870
	jmp	.L859
.L871:
	movq	%rax, %rsi
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rsi
	orq	%rax, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L872
.L873:
	movq	48(%rsp), %rdi
	movq	%rbx, %rsi
	call	forget_drop
	jmp	.L876
.L1101:
	xorl	%r9d, %r9d
	movq	%r9, 8(%r12)
	jmp	.L869
.L1097:
	leaq	576(%rsp), %rbx
	movq	%rbx, %rdi
	call	read_counters
	testl	%eax, %eax
	je	.L783
	leaq	272(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L784
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	272(%rsp), %xmm1
	cvtsi2sdq	280(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC55(%rip), %xmm1
	movq	%xmm0, %r13
	subsd	1200(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movq	576(%rsp), %rax
	movq	1152(%rsp), %rdx
	movq	1160(%rsp), %rcx
	movq	584(%rsp), %rsi
	movsd	%xmm0, 40(%rsp)
	cmpq	%rdx, %rax
	jb	.L785
	subq	%rdx, %rax
	xorl	%edx, %edx
	cmpq	%rcx, %rsi
	jnb	.L906
.L786:
	testq	%rax, %rax
	je	.L787
	movsd	.LC45(%rip), %xmm3
	movsd	%xmm3, 8(%rsp)
	testq	%rdx, %rdx
	js	.L788
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L789:
	testq	%rax, %rax
	js	.L790
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L791:
	divsd	%xmm1, %xmm0
	movsd	8(%rsp), %xmm1
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	%xmm0, 1304(%rsp)
.L787:
	leaq	672(%rsp), %rax
	movq	72(%rsp), %r14
	xorl	%r15d, %r15d
	movdqa	592(%rsp), %xmm6
	movq	%rax, 80(%rsp)
	leaq	912(%rsp), %rax
	movdqa	608(%rsp), %xmm4
	leaq	1312(%rsp), %r12
	movdqa	1168(%rsp), %xmm7
	movq	%rax, 64(%rsp)
	movdqa	1184(%rsp), %xmm3
	movaps	%xmm6, 672(%rsp)
	movaps	%xmm4, 688(%rsp)
	movaps	%xmm7, 912(%rsp)
	movaps	%xmm3, 928(%rsp)
.L797:
	movq	80(%rsp), %rax
	movq	64(%rsp), %rdi
	pxor	%xmm0, %xmm0
	movq	(%rax,%r15), %rax
	movq	(%rdi,%r15), %rdx
	cmpq	%rdx, %rax
	jb	.L792
	subq	%rdx, %rax
	js	.L793
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L792:
	divsd	40(%rsp), %xmm0
	movsd	%xmm0, (%r12,%r15)
	call	*log1p@GOTPCREL(%rip)
	cmpl	$0, 72(%r14)
	jne	.L795
	movl	$1, 72(%r14)
	movsd	%xmm0, 56(%r14)
.L796:
	addq	$8, %r15
	addq	$24, %r14
	cmpq	$32, %r15
	jne	.L797
	movq	72(%rsp), %rdi
	movl	$12, %ecx
	movq	%rbx, %rsi
	movq	%r13, 1200(%rsp)
	rep movsl
	leaq	1344(%rsp), %rdi
	call	read_temperature.constprop.0
	leaq	304(%rsp), %rsi
	movl	$1, %edi
	call	*clock_gettime@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L784
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdi
	cvtsi2sdq	304(%rsp), %xmm1
	cvtsi2sdq	312(%rsp), %xmm0
	divsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %r12
	call	read_process_table
	movq	584(%rsp), %r14
	movsd	.LC55(%rip), %xmm1
	movq	%r12, %xmm0
	subsd	360(%rsp), %xmm0
	movq	576(%rsp), %r15
	movq	%r14, 136(%rsp)
	call	*fmax@GOTPCREL(%rip)
	movq	336(%rsp), %r8
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm0, 368(%rsp)
	testq	%r14, %r14
	je	.L804
	imulq	$240, 136(%rsp), %r10
	movq	344(%rsp), %r11
	movq	%r15, %rcx
	addq	%r15, %r10
	testq	%r11, %r11
	je	.L1060
.L802:
	movl	(%rcx), %r9d
	movq	%r11, %rdi
	xorl	%esi, %esi
	jmp	.L809
.L1102:
	jge	.L807
.L926:
	movq	%rdx, %rdi
.L806:
	cmpq	%rdi, %rsi
	jnb	.L1066
.L809:
	leaq	(%rdi,%rsi), %rdx
	shrq	%rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%r8, %rax
	cmpl	(%rax), %r9d
	jne	.L1102
	movq	8(%rax), %r14
	cmpq	%r14, 8(%rcx)
	jne	.L1103
	movq	152(%rcx), %rdx
	movq	152(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L910
	subq	%rsi, %rdx
	movq	%rdx, 200(%rcx)
.L910:
	movdqu	176(%rax), %xmm3
	movdqu	176(%rcx), %xmm0
	movl	192(%rcx), %esi
	psubq	%xmm3, %xmm0
	movups	%xmm0, 224(%rcx)
	testl	%esi, %esi
	je	.L1066
	cmpl	$0, 192(%rax)
	je	.L1066
	movq	160(%rcx), %rdx
	movq	160(%rax), %rsi
	cmpq	%rsi, %rdx
	jb	.L814
	subq	%rsi, %rdx
	movq	%rdx, 208(%rcx)
.L814:
	movq	168(%rcx), %rdx
	movq	168(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L1066
	subq	%rax, %rdx
	movq	%rdx, 216(%rcx)
.L1066:
	addq	$240, %rcx
	cmpq	%r10, %rcx
	jne	.L802
.L804:
	movq	%r8, %rdi
	call	*free@GOTPCREL(%rip)
	movq	592(%rsp), %rax
	movdqa	576(%rsp), %xmm7
	movq	%r12, 360(%rsp)
	cmpl	$0, 28(%rsp)
	movq	%rax, 352(%rsp)
	movaps	%xmm7, 336(%rsp)
	je	.L1104
	movsd	32(%rsp), %xmm7
	addsd	16(%rsp), %xmm7
	movsd	.LC45(%rip), %xmm4
	movsd	%xmm7, 40(%rsp)
	movsd	%xmm4, 8(%rsp)
	jmp	.L816
.L785:
	cmpq	%rcx, %rsi
	jb	.L787
	xorl	%eax, %eax
.L906:
	subq	%rcx, %rsi
	movq	%rsi, %rdx
	jmp	.L786
.L1095:
	xorl	$1, 28(%rsp)
	jmp	.L780
.L783:
	movsd	32(%rsp), %xmm6
	addsd	16(%rsp), %xmm6
	movsd	%xmm6, 40(%rsp)
	jmp	.L781
.L1096:
	movq	72(%rsp), %rdi
	call	telemetry_init
	testl	%eax, %eax
	je	.L778
	movq	144(%rsp), %rbx
	movq	%rbx, %rdi
	call	sampler_destroy
	movq	%rbx, %rdi
	call	sampler_init
	movsd	32(%rsp), %xmm3
	xorl	%edi, %edi
	addsd	16(%rsp), %xmm3
	movl	%edi, 472(%rsp)
	movsd	%xmm3, 40(%rsp)
	jmp	.L780
.L862:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L863
.L874:
	movq	%rbx, (%r12)
	jmp	.L875
	.p2align 4,,10
	.p2align 3
.L1103:
	jb	.L926
.L807:
	leaq	1(%rdx), %rsi
	jmp	.L806
.L795:
	movsd	%xmm0, 8(%rsp)
	movsd	40(%rsp), %xmm0
	xorpd	.LC104(%rip), %xmm0
	divsd	.LC105(%rip), %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	56(%r14), %xmm2
	movsd	8(%rsp), %xmm1
	movsd	.LC45(%rip), %xmm3
	movsd	.LC45(%rip), %xmm4
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
	addsd	.LC0(%rip), %xmm0
	movups	%xmm2, 56(%r14)
	call	*sqrt@GOTPCREL(%rip)
	jmp	.L796
.L793:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L792
.L778:
	call	*endwin@GOTPCREL(%rip)
	movq	144(%rsp), %rdi
	call	sampler_destroy
	movq	48(%rsp), %rdi
	call	rain_destroy
.L745:
	movq	2184(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L1105
	addq	$2200, %rsp
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
.L658:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC81(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	movl	$1, %edi
	call	*exit@GOTPCREL(%rip)
.L1060:
	addq	$240, %rcx
	cmpq	%rcx, %r10
	jne	.L1060
	jmp	.L804
.L1092:
	movl	%edi, 40(%rsp)
	cmpl	$1, %eax
	jle	.L769
	subl	$1, %eax
	sarl	%eax
	movl	%eax, 40(%rsp)
.L769:
	movl	$3, %eax
	cmpl	%eax, %ebx
	cmovl	%eax, %ebx
	leal	-2(%rbx), %eax
	movl	%eax, 56(%rsp)
	jmp	.L768
.L676:
	call	*free@GOTPCREL(%rip)
	leaq	.LC77(%rip), %rdi
	call	die
.L1089:
	movl	$8, %ecx
	movl	$60, %edx
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	leaq	576(%rsp), %r13
	movl	$30, %esi
	xorl	%r12d, %r12d
	movl	$1, %r8d
	movq	%r13, %rdi
	leaq	304(%rsp), %r14
	call	rain_init
	movl	48(%rsp), %eax
	movl	$6, %ecx
	xorl	%edx, %edx
	movq	%r14, %rdi
	movdqa	.LC97(%rip), %xmm0
	rep stosl
	leaq	912(%rsp), %rdi
	movl	$60, %ecx
	rep stosl
	movq	%rbp, %rdi
	movq	%r13, %rbp
	movq	%rdx, %r13
	jmp	.L759
	.p2align 4,,10
	.p2align 3
.L757:
	movdqa	928(%rsp), %xmm6
	addq	$1, %r12
	movdqa	944(%rsp), %xmm7
	movl	%r15d, 912(%rsp)
	movq	$1, 920(%rsp)
	movdqa	912(%rsp), %xmm5
	movdqa	960(%rsp), %xmm4
	movups	%xmm6, 16(%rdi,%rbx)
	movdqa	1024(%rsp), %xmm3
	movdqa	992(%rsp), %xmm6
	movups	%xmm5, (%rdi,%rbx)
	movdqa	976(%rsp), %xmm5
	movups	%xmm7, 32(%rdi,%rbx)
	movdqa	1008(%rsp), %xmm7
	movups	%xmm4, 48(%rdi,%rbx)
	movdqa	1040(%rsp), %xmm4
	movups	%xmm5, 64(%rdi,%rbx)
	movups	%xmm6, 80(%rdi,%rbx)
	movdqa	1072(%rsp), %xmm6
	movups	%xmm7, 96(%rdi,%rbx)
	movdqa	1104(%rsp), %xmm7
	movups	%xmm3, 112(%rdi,%rbx)
	movdqa	1120(%rsp), %xmm3
	movb	$83, 1056(%rsp)
	movdqa	1056(%rsp), %xmm5
	movups	%xmm4, 128(%rdi,%rbx)
	movups	%xmm5, 144(%rdi,%rbx)
	movups	%xmm6, 160(%rdi,%rbx)
	movups	%xmm0, 176(%rdi,%rbx)
	movups	%xmm7, 192(%rdi,%rbx)
	movups	%xmm3, 208(%rdi,%rbx)
	movq	%r12, 312(%rsp)
	movaps	%xmm0, 1088(%rsp)
	movdqa	1136(%rsp), %xmm4
	movups	%xmm4, 224(%rdi,%rbx)
	addq	$240, %rbx
	cmpq	$4096, %r12
	je	.L1106
.L759:
	leal	1(%r12), %r15d
	cmpq	%r13, %r12
	jne	.L757
	testq	%r12, %r12
	je	.L920
	movq	%r12, %rsi
	leaq	(%r12,%r12), %r13
	salq	$4, %rsi
	subq	%r12, %rsi
	salq	$5, %rsi
.L758:
	call	*realloc@GOTPCREL(%rip)
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L724
	movq	%rax, 304(%rsp)
	movdqa	.LC97(%rip), %xmm0
	movq	%r13, 320(%rsp)
	jmp	.L757
.L920:
	movl	$30720, %esi
	movl	$128, %r13d
	jmp	.L758
.L1106:
	movq	%rbp, %r13
	movq	%rdi, %rbp
	xorl	%ebx, %ebx
	call	monotonic_seconds
	leaq	983040(%rbp), %r12
	movsd	%xmm0, 8(%rsp)
.L760:
	movq	%rbp, %rax
.L761:
	addq	$1, 152(%rax)
	addq	$240, %rax
	movq	$1, -40(%rax)
	cmpq	%rax, %r12
	jne	.L761
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	addq	$1000, %rbx
	call	rain_sync.constprop.0.isra.0
	cmpq	$8000, %rbx
	jne	.L760
	movq	584(%rsp), %rdx
	xorl	%eax, %eax
	jmp	.L763
.L764:
	movq	248(%rdx), %rdx
	addq	$1, %rax
.L763:
	testq	%rdx, %rdx
	jne	.L764
	cmpq	$4096, %rax
	jne	.L1107
	call	monotonic_seconds
	movl	$4096, %edx
	subsd	8(%rsp), %xmm0
	leaq	.LC99(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%rbp, %rdi
	call	*free@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	rain_destroy
	jmp	.L745
.L1087:
	movl	$8, %ecx
	movl	$60, %edx
	movl	%r14d, %ebp
	xorl	%r13d, %r13d
	leaq	480(%rsp), %r12
	movl	$1, %r8d
	movl	$1, %esi
	movq	%r12, %rdi
	leaq	272(%rsp), %r15
	leaq	672(%rsp), %rbx
	call	rain_init
	xorl	%eax, %eax
	movl	$6, %ecx
	movq	%r15, %rdi
	rep stosl
	movl	$60, %ecx
	movq	%rbx, %rdi
	movq	%r12, 8(%rsp)
	rep stosl
	movdqa	.LC83(%rip), %xmm0
	movb	$83, 816(%rsp)
	movq	%rbx, %r12
	movq	$1, 680(%rsp)
	movaps	%xmm0, 848(%rsp)
.L693:
	movl	%ebp, 672(%rsp)
	movq	280(%rsp), %rbx
	cmpq	288(%rsp), %rbx
	je	.L1108
.L690:
	leaq	1(%rbx), %r8
	addl	$1, %ebp
	movl	$60, %ecx
	movq	%r12, %rsi
	imulq	$240, %rbx, %rax
	movq	%r8, 280(%rsp)
	addq	%r13, %rax
	movq	%rax, %rdi
	rep movsl
	cmpl	$5, %ebp
	jne	.L693
	movq	%r12, %rbx
	movq	8(%rsp), %r12
	movq	%r8, %rsi
	movl	$240, %edx
	leaq	identity_compare(%rip), %rcx
	movq	%r13, %rdi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edx, %edx
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	rain_sync.constprop.0.isra.0
	movq	480(%rsp), %rax
	movl	$60, %edx
	movq	%r12, %rdi
	movl	$3, %esi
	movq	(%rax), %rbp
	movq	.LC60(%rip), %rax
	movl	$1, 388(%rbp)
	movq	%rax, 400(%rbp)
	call	rain_resize
	movq	480(%rsp), %rax
	cmpq	(%rax), %rbp
	jne	.L694
	cmpl	$0, 388(%rbp)
	je	.L694
	movsd	.LC60(%rip), %xmm4
	ucomisd	400(%rbp), %xmm4
	jp	.L694
	jne	.L694
	movq	16(%rax), %rdi
	movq	%rdi, 16(%rsp)
	cmpq	$2, %rdi
	jne	.L694
	cmpq	$1, 56(%rax)
	jne	.L694
	cmpq	$1, 96(%rax)
	jne	.L694
	movq	%r13, %rdi
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
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$1, 672(%rsp)
	call	table_add
	movq	%rbx, %rsi
	movq	%r15, %rdi
	movl	$2, 672(%rsp)
	call	table_add
	movq	%r15, %rsi
	movq	%r12, %rdi
	xorl	%edx, %edx
	call	rain_sync.constprop.0.isra.0
	movq	480(%rsp), %rax
	movl	$60, %ecx
	xorl	%edx, %edx
	movq	272(%rsp), %r13
	movq	(%rax), %rbx
	leaq	240(%r13), %rsi
	movq	%r13, %rdi
	movl	$1, 388(%rbx)
	movq	$0x000000000, 400(%rbx)
	movl	$1, 32(%rax)
	rep movsl
	movq	%r15, %rsi
	movq	%r12, %rdi
	movq	$1, 280(%rsp)
	call	rain_sync.constprop.0.isra.0
	movl	528(%rsp), %r8d
	xorl	%edx, %edx
	movl	%r14d, 28(%rsp)
	movq	480(%rsp), %r15
	movq	%rbx, 32(%rsp)
	movl	%edx, %ebx
	movq	%r13, 40(%rsp)
	movq	%r12, %r13
	movl	%r8d, %r12d
.L697:
	testl	%r12d, %r12d
	jle	.L718
	xorl	%r14d, %r14d
	movl	%ebx, 48(%rsp)
	movl	%r12d, %ebx
	movq	%r15, %r12
	movq	%r14, %r15
	jmp	.L717
.L1111:
	comisd	%xmm1, %xmm2
	jb	.L699
.L710:
	movq	240(%rbp), %rax
	movq	%rax, (%r14)
	testq	%rax, %rax
	je	.L1109
.L709:
	movq	16(%r14), %r10
	movq	8(%rbp), %rdx
	movabsq	$-4658895280553007687, %rdi
	movabsq	$495873782388, %r11
	xorq	552(%rsp), %r11
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
	js	.L711
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L712:
	mulsd	.LC85(%rip), %xmm0
	mulsd	.LC86(%rip), %xmm0
	divsd	.LC89(%rip), %xmm0
	addsd	.LC58(%rip), %xmm0
	testl	%ecx, %ecx
	je	.L713
	movq	.LC5(%rip), %rax
	movl	$0, 388(%rbp)
	movq	%rax, 400(%rbp)
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.L714
	movq	%rbp, 240(%rax)
.L715:
	movq	%rbp, 8(%r14)
	movq	%r10, 16(%r14)
.L716:
	movsd	%xmm0, 24(%r14)
.L699:
	addq	$1, %r15
	cmpl	%r15d, %ebx
	jle	.L1110
.L717:
	leaq	(%r15,%r15,4), %rax
	leaq	(%r12,%rax,8), %r14
	movq	(%r14), %rbp
	testq	%rbp, %rbp
	je	.L699
	movl	388(%rbp), %r10d
	movsd	.LC1(%rip), %xmm2
	testl	%r10d, %r10d
	jne	.L700
	movl	32(%r14), %r9d
	testl	%r9d, %r9d
	je	.L701
	movsd	24(%r14), %xmm0
.L702:
	movsd	.LC1(%rip), %xmm2
	pxor	%xmm1, %xmm1
	subsd	%xmm2, %xmm0
	movsd	%xmm2, 8(%rsp)
	call	*fmax@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	movsd	%xmm0, 24(%r14)
	ja	.L699
	movl	$1, 388(%rbp)
	movsd	8(%rsp), %xmm2
.L700:
	pxor	%xmm1, %xmm1
	movl	392(%rbp), %ecx
	cvtsi2sdl	384(%rbp), %xmm1
	mulsd	408(%rbp), %xmm2
	addsd	400(%rbp), %xmm2
	movsd	%xmm2, 400(%rbp)
	subsd	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	cvtsi2sdl	532(%rsp), %xmm1
	movapd	%xmm2, %xmm0
	testl	%ecx, %ecx
	jne	.L1111
	movsd	.LC87(%rip), %xmm2
	mulsd	416(%rbp), %xmm2
	comisd	%xmm1, %xmm0
	movsd	%xmm2, 416(%rbp)
	jnb	.L710
	movsd	.LC88(%rip), %xmm7
	comisd	%xmm2, %xmm7
	ja	.L710
	jmp	.L699
.L1108:
	testq	%rbx, %rbx
	movl	$128, %eax
	leaq	(%rbx,%rbx), %rcx
	movq	%r13, %rdi
	cmove	%rax, %rcx
	imulq	$240, %rcx, %rsi
	movq	%rcx, 16(%rsp)
	call	*realloc@GOTPCREL(%rip)
	movq	16(%rsp), %rcx
	testq	%rax, %rax
	je	.L1112
	movq	%rax, 272(%rsp)
	movq	%rax, %r13
	movq	%rcx, 288(%rsp)
	jmp	.L690
	.p2align 4,,10
	.p2align 3
.L701:
	movabsq	$495873782388, %rdi
	movq	8(%rbp), %rdx
	xorq	552(%rsp), %rdi
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
	js	.L703
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L704:
	mulsd	.LC85(%rip), %xmm0
	movl	$1, 32(%r14)
	mulsd	.LC86(%rip), %xmm0
	jmp	.L702
.L711:
	movq	%rdx, %rax
	andl	$1, %edx
	pxor	%xmm0, %xmm0
	shrq	%rax
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L712
.L713:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movsd	%xmm0, 8(%rsp)
	call	forget_drop
	movl	528(%rsp), %ebx
	movq	480(%rsp), %r12
	movsd	8(%rsp), %xmm0
	jmp	.L716
.L1109:
	movq	$0, 8(%r14)
	jmp	.L709
.L1110:
	movq	%r12, %r15
	movl	%ebx, %r12d
	movl	48(%rsp), %ebx
	addl	$1, %ebx
	cmpl	$20, %ebx
	jne	.L697
.L718:
	movq	%r13, %r12
	movl	28(%rsp), %r14d
	movq	32(%rsp), %rbx
	movq	40(%rsp), %r13
	cmpq	(%r15), %rbx
	je	.L719
	movq	552(%rsp), %rdx
	movq	504(%rsp), %rdi
	movabsq	$-4658895280553007687, %rsi
	movabsq	$-7723592293110705685, %rcx
	movq	496(%rsp), %r9
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
	jmp	.L720
.L722:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rsi, %rax
.L720:
	cmpq	%rcx, %rdi
	je	.L721
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r9, %rdx
	movzbl	8(%rdx), %r8d
	testb	%r8b, %r8b
	je	.L721
	subb	$1, %r8b
	jne	.L722
	movq	(%rdx), %rdx
	cmpl	$1, (%rdx)
	jne	.L722
	cmpq	$1, 8(%rdx)
	jne	.L722
.L719:
	leaq	.LC90(%rip), %rdi
	call	die
.L714:
	movq	%rbp, (%r14)
	jmp	.L715
.L703:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L704
.L721:
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
.L725:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L724
	movl	%r14d, (%rax)
	movq	%rax, %rsi
	movq	%r12, %rdi
	addl	$1, %r14d
	movq	$1, 8(%rax)
	call	index_insert
	movq	488(%rsp), %rax
	movq	%rbx, 488(%rsp)
	movq	%rax, 248(%rbx)
	cmpl	$1025, %r14d
	jne	.L725
	movabsq	$-4658895280553007687, %rbx
	movl	$2, %r14d
	movabsq	$-7723592293110705685, %r15
	movabsq	$6238072747940578789, %rbp
.L730:
	movq	552(%rsp), %rdx
	movq	504(%rsp), %rdi
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
	je	.L726
	movq	496(%rsp), %r9
	xorl	%esi, %esi
	jmp	.L729
	.p2align 4,,10
	.p2align 3
.L727:
	addq	$1, %rax
	addq	$1, %rsi
	andq	%r8, %rax
	cmpq	%rsi, %rdi
	je	.L726
.L729:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r9, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L726
	cmpb	$1, %cl
	jne	.L727
	movq	(%rdx), %rdx
	cmpl	%r14d, (%rdx)
	jne	.L727
	movq	8(%rdx), %r13
	cmpq	$1, %r13
	jne	.L727
	movq	%rdx, %rsi
	movq	%r12, %rdi
	addq	$2, %r14
	call	forget_drop
	cmpq	$1026, %r14
	jne	.L730
	movq	552(%rsp), %rdx
	movq	504(%rsp), %rsi
	movabsq	$-4658895280553007687, %r11
	movabsq	$-7723592293110705685, %r10
	movq	496(%rsp), %r8
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
.L735:
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
	je	.L916
	xorl	%ebp, %ebp
	jmp	.L733
	.p2align 4,,10
	.p2align 3
.L732:
	addq	$1, %rax
	addq	$1, %rbp
	andq	%rdi, %rax
	cmpq	%rbp, %rsi
	je	.L916
.L733:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %ecx
	testb	%cl, %cl
	je	.L916
	cmpb	$1, %cl
	jne	.L732
	movq	(%rdx), %rdx
	cmpl	%r13d, (%rdx)
	jne	.L732
	cmpq	$1, 8(%rdx)
	jne	.L732
	movl	$1, %eax
.L731:
	movl	%r13d, %edx
	andl	$1, %edx
	cmpb	%al, %dl
	jne	.L1113
	addq	$1, %r13
	cmpq	$1025, %r13
	jne	.L735
	movq	%r12, 8(%rsp)
	movq	16(%rsp), %r15
	movabsq	$-4658895280553007687, %r13
	movabsq	$-7723592293110705685, %rbx
	movabsq	$6238072747940578789, %rbp
	movabsq	$-2606959012126976886, %r14
.L744:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L724
	movl	%r15d, (%rax)
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	movq	$2, 8(%rax)
	call	index_insert
	movq	488(%rsp), %rax
	movq	552(%rsp), %rdx
	movq	%r12, 488(%rsp)
	movq	504(%rsp), %rsi
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
	je	.L736
	movq	496(%rsp), %rdi
	xorl	%r9d, %r9d
	jmp	.L739
	.p2align 4,,10
	.p2align 3
.L738:
	addq	$1, %rax
	addq	$1, %r9
	andq	%rcx, %rax
	cmpq	%r9, %rsi
	je	.L737
.L739:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rdi, %rdx
	movzbl	8(%rdx), %r11d
	testb	%r11b, %r11b
	je	.L737
	cmpb	$1, %r11b
	jne	.L738
	movq	(%rdx), %rdx
	cmpl	%r15d, (%rdx)
	jne	.L738
	cmpq	$1, 8(%rdx)
	jne	.L738
.L736:
	leaq	.LC93(%rip), %rdi
	call	die
	.p2align 4,,10
	.p2align 3
.L916:
	xorl	%eax, %eax
	jmp	.L731
.L737:
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
	jmp	.L742
	.p2align 4,,10
	.p2align 3
.L740:
	addq	$1, %rax
	addq	$1, %r9
	andq	%rcx, %rax
	cmpq	%r9, %rsi
	je	.L736
.L742:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%rdi, %rdx
	movzbl	8(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L736
	cmpb	$1, %r10b
	jne	.L740
	movq	(%rdx), %rdx
	cmpl	%r15d, (%rdx)
	jne	.L740
	cmpq	$2, 8(%rdx)
	jne	.L740
	cmpq	%rdx, %r12
	jne	.L736
	addq	$2, %r15
	cmpq	$1026, %r15
	jne	.L744
	movq	8(%rsp), %rdi
	call	rain_destroy
	leaq	.LC94(%rip), %rdi
	call	*puts@GOTPCREL(%rip)
	jmp	.L745
.L726:
	leaq	.LC91(%rip), %rdi
	call	die
.L1113:
	leaq	.LC92(%rip), %rdi
	call	die
.L694:
	leaq	.LC84(%rip), %rdi
	call	die
.L1112:
	call	table_add.part.0
.L788:
	movq	%rdx, %rcx
	andl	$1, %edx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L789
.L784:
	leaq	.LC22(%rip), %rdi
	call	die
.L1105:
	call	*__stack_chk_fail@GOTPCREL(%rip)
.L1104:
	movq	1168(%rsp), %rax
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	leaq	.LC106(%rip), %rdi
	movsd	.LC5(%rip), %xmm0
	movl	%ecx, 56(%rsp)
	leaq	1408(%rsp), %r12
	movdqa	192(%rsp), %xmm7
	movq	%rdi, 928(%rsp)
	movq	%rax, 104(%rsp)
	movl	%ebp, %eax
	movq	%r13, %rbp
	movaps	%xmm7, 912(%rsp)
	movl	%eax, %r13d
	movsd	%xmm0, 8(%rsp)
.L821:
	movq	64(%rsp), %rax
	movl	$2, %edx
	movl	$64, %ecx
	movq	%r12, %rdi
	leaq	.LC107(%rip), %r8
	movl	$64, %esi
	movq	(%rax,%rbp,8), %r9
	xorl	%eax, %eax
	call	*__snprintf_chk@GOTPCREL(%rip)
	leaq	.LC7(%rip), %rsi
	movq	%r12, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L820
	leaq	1664(%rsp), %r8
	movl	$512, %esi
	movq	%rax, 128(%rsp)
	movq	%r8, %rdi
	movq	%r8, 120(%rsp)
	call	*fgets@GOTPCREL(%rip)
	movq	128(%rsp), %rdi
	movq	%rax, 112(%rsp)
	call	*fclose@GOTPCREL(%rip)
	movq	112(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L820
	xorl	%eax, %eax
	movq	120(%rsp), %rdi
	movq	%rbx, %rcx
	leaq	480(%rsp), %rdx
	leaq	.LC108(%rip), %rsi
	call	*__isoc99_sscanf@GOTPCREL(%rip)
	cmpl	$2, %eax
	jne	.L820
	movsd	480(%rsp), %xmm0
	addq	576(%rsp), %r14
	comisd	8(%rsp), %xmm0
	jbe	.L820
	leal	2(%rbp), %eax
	movsd	%xmm0, 8(%rsp)
	movl	%eax, 56(%rsp)
.L820:
	addq	$1, %rbp
	cmpq	$3, %rbp
	jne	.L821
	movsd	8(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	movq	104(%rsp), %rax
	movl	%r13d, %ebp
	comisd	%xmm1, %xmm0
	jb	.L822
	movsd	.LC86(%rip), %xmm1
	movl	$1, %edx
	ucomisd	%xmm0, %xmm1
	cmovbe	56(%rsp), %edx
	movl	%edx, 56(%rsp)
.L822:
	xorl	%edx, %edx
	cmpl	$0, 472(%rsp)
	movq	%rdx, 120(%rsp)
	je	.L824
	movq	464(%rsp), %rdx
	cmpq	%rdx, %rax
	jb	.L824
	movq	%rax, %rbx
	subq	%rdx, %rbx
	movq	%rbx, 120(%rsp)
.L824:
	pxor	%xmm1, %xmm1
	movq	%rax, 464(%rsp)
	cvtsi2sdq	440(%rsp), %xmm1
	movl	$1, 472(%rsp)
	movapd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	divsd	.LC54(%rip), %xmm0
	call	*lround@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	movl	$1, %edx
	mulsd	40(%rsp), %xmm1
	testq	%rax, %rax
	cmovne	%rax, %rdx
	movq	%rdx, 152(%rsp)
	movapd	%xmm1, %xmm0
	movsd	.LC55(%rip), %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	.LC55(%rip), %xmm1
	movsd	%xmm0, 160(%rsp)
	movsd	40(%rsp), %xmm0
	call	*fmax@GOTPCREL(%rip)
	movsd	40(%rsp), %xmm3
	mulsd	.LC116(%rip), %xmm3
	movsd	%xmm0, 168(%rsp)
	movapd	%xmm3, %xmm0
	call	*exp@GOTPCREL(%rip)
	movsd	.LC45(%rip), %xmm7
	movl	448(%rsp), %edx
	xorl	%ecx, %ecx
	xorl	%r11d, %r11d
	movsd	%xmm7, 8(%rsp)
	subsd	%xmm0, %xmm7
	movsd	%xmm7, 176(%rsp)
.L826:
	movl	%edx, %eax
	shrl	%cl, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	$-1, %r11d
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	.L826
	movl	$1000000, %ecx
	movq	%r14, %rax
	xorl	%edx, %edx
	divq	%rcx
	movq	%rax, 224(%rsp)
	movq	392(%rsp), %rax
	jmp	.L827
.L828:
	xorl	%r14d, %r14d
	movl	%r14d, 392(%rax)
	movq	248(%rax), %rax
.L827:
	testq	%rax, %rax
	jne	.L828
	xorl	%r13d, %r13d
	movl	%r11d, 240(%rsp)
	movq	%r15, %rbx
	movabsq	$-7723592293110705685, %r14
	movabsq	$-4658895280553007687, %r15
	movq	%r13, 104(%rsp)
	movl	%ebp, 244(%rsp)
	movq	%rbx, %rbp
.L829:
	movq	136(%rsp), %rbx
	cmpq	%rbx, 104(%rsp)
	je	.L1114
	movq	8(%rbp), %r13
	movq	456(%rsp), %rcx
	movl	0(%rbp), %r9d
	movq	408(%rsp), %rsi
	movq	%r13, %rax
	shrq	$30, %rax
	leaq	-1(%rsi), %rdi
	xorq	%r13, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movq	%rcx, %rdx
	shrq	$30, %rdx
	imulq	%r14, %rax
	xorq	%rcx, %rdx
	imulq	%r15, %rdx
	movq	%rdx, %rcx
	shrq	$27, %rcx
	xorq	%rcx, %rdx
	imulq	%r14, %rdx
	movq	%rdx, %r12
	shrq	$31, %r12
	xorq	%rdx, %r12
	movl	%r9d, %edx
	xorq	%r12, %rdx
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r14, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	andq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L830
	movq	400(%rsp), %r8
	xorl	%ecx, %ecx
	jmp	.L833
.L831:
	addq	$1, %rax
	addq	$1, %rcx
	andq	%rdi, %rax
	cmpq	%rcx, %rsi
	je	.L830
.L833:
	movq	%rax, %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	8(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L830
	cmpb	$1, %r10b
	jne	.L831
	movq	(%rdx), %rbx
	cmpl	(%rbx), %r9d
	jne	.L831
	cmpq	8(%rbx), %r13
	jne	.L831
	movsd	8(%rsp), %xmm7
	movl	$60, %ecx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	rep movsl
	movsd	%xmm7, 416(%rbx)
.L908:
	movq	200(%rbp), %rax
	movl	$1, 392(%rbx)
	testq	%rax, %rax
	js	.L843
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L844:
	movq	80(%rsp), %rdx
	movl	56(%rsp), %esi
	movq	%rbp, %rdi
	divsd	160(%rsp), %xmm0
	movsd	%xmm0, 112(%rsp)
	call	semantic_keys
	cmpl	$0, 488(%rbx)
	je	.L845
	movl	440(%rbx), %eax
	cmpl	%eax, 672(%rsp)
	je	.L845
	addq	$1, 640(%rbx)
.L845:
	movdqu	224(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	movq	232(%rbp), %rax
	movq	%rbx, %rdi
	movdqu	648(%rbx), %xmm3
	movl	240(%rsp), %r9d
	movdqa	%xmm0, %xmm2
	movq	%rax, %rcx
	movq	120(%rsp), %r8
	movq	48(%rsp), %rsi
	psrlq	$63, %xmm2
	negq	%rcx
	psubq	%xmm2, %xmm1
	cmovs	%rax, %rcx
	pxor	%xmm2, %xmm2
	xorl	%edx, %edx
	pxor	%xmm1, %xmm0
	movq	640(%rbx), %rax
	addq	656(%rbx), %rcx
	psubq	%xmm1, %xmm0
	movq	%rcx, 944(%rsp)
	movq	64(%rsp), %rcx
	paddq	%xmm3, %xmm0
	movq	%rax, 912(%rsp)
	movups	%xmm0, 648(%rbx)
	movq	152(%rbp), %rax
	psrlq	$4, %xmm0
	movq	%xmm0, 928(%rsp)
	divq	152(%rsp)
	movq	80(%rsp), %rdx
	movq	%rax, 920(%rsp)
	movq	168(%rbp), %rax
	addq	160(%rbp), %rax
	shrq	$16, %rax
	movq	%rax, 936(%rsp)
	movq	224(%rsp), %rax
	movq	%rax, 952(%rsp)
	call	update_semantics.constprop.0
	movq	216(%rbx), %rax
	addq	208(%rbx), %rax
	jne	.L1115
.L846:
	movsd	%xmm2, 248(%rsp)
	movsd	8(%rsp), %xmm1
	movsd	112(%rsp), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movsd	424(%rbx), %xmm3
	movsd	248(%rsp), %xmm2
	movsd	%xmm0, 128(%rsp)
	movsd	%xmm3, 184(%rsp)
	movapd	%xmm2, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movq	176(%rbx), %rax
	movsd	184(%rsp), %xmm3
	movabsq	$1099511627775, %rdi
	subsd	%xmm3, %xmm0
	mulsd	176(%rsp), %xmm0
	addsd	%xmm3, %xmm0
	movsd	%xmm0, 184(%rsp)
	movsd	%xmm0, 424(%rbx)
	cmpq	%rax, %rdi
	jb	.L849
	addq	$1, %rax
	bsrq	%rax, %rax
	movl	%eax, %r13d
	sarl	%r13d
.L850:
	movq	184(%rbx), %rdx
	movl	$1, %eax
	movabsq	$1099511627775, %rdi
	testq	%rdx, %rdx
	cmovg	%rdx, %rax
	cmpq	%rdi, %rdx
	jg	.L851
	bsrq	%rax, %rax
	movl	%eax, %r12d
.L852:
	movsd	40(%rsp), %xmm0
	movsd	.LC58(%rip), %xmm1
	addsd	432(%rbx), %xmm0
	call	*fmin@GOTPCREL(%rip)
	movsd	.LC58(%rip), %xmm3
	movsd	%xmm0, 432(%rbx)
	comisd	%xmm0, %xmm3
	ja	.L853
	movsd	184(%rsp), %xmm0
	mulsd	.LC59(%rip), %xmm0
	call	*round@GOTPCREL(%rip)
	movl	$6, %eax
	movl	$3, %edx
	cmpl	%eax, %r13d
	cmovle	%r13d, %eax
	cmpl	%edx, %r12d
	cmovg	%edx, %r12d
	leal	6(%rax,%r12), %edx
	cvttsd2sil	%xmm0, %eax
	addl	%eax, %edx
	movl	$16, %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movslq	384(%rbx), %rax
	cmpl	%eax, %edx
	je	.L853
	movq	$0x000000000, 432(%rbx)
	jle	.L854
	leal	1(%rax), %edx
	leaq	.LC53(%rip), %rdi
	movl	%edx, 384(%rbx)
	movq	%rdi, 256(%rbx,%rax,8)
.L853:
	movsd	40(%rsp), %xmm0
	movsd	112(%rsp), %xmm1
	movq	%rbx, %rdi
	addq	$240, %rbp
	movl	240(%rsp), %edx
	movl	448(%rsp), %esi
	call	record_history.isra.0
	addq	$1, 104(%rsp)
	movsd	128(%rsp), %xmm0
	mulsd	.LC60(%rip), %xmm0
	addsd	.LC61(%rip), %xmm0
	movsd	%xmm0, 408(%rbx)
	jmp	.L829
.L724:
	leaq	.LC4(%rip), %rdi
	call	die
.L681:
	movq	%r14, %rdi
	call	*free@GOTPCREL(%rip)
	leaq	.LC76(%rip), %rdi
	call	die
.L1091:
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
	jmp	.L767
.L1088:
	movl	$240, %esi
	movl	$4096, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L724
	call	monotonic_seconds
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	leaq	identity_compare(%rip), %rbx
	movsd	%xmm0, 8(%rsp)
	leaq	983040(%r13), %r14
.L747:
	imull	$137, %ebp, %ecx
	movq	%r13, %rax
	.p2align 4,,10
	.p2align 3
.L748:
	movl	%ecx, %edx
	movq	%rbp, 8(%rax)
	addq	$240, %rax
	addl	$2053, %ecx
	andl	$4095, %edx
	addl	$1, %edx
	movl	%edx, -240(%rax)
	cmpq	%r14, %rax
	jne	.L748
	movq	%r13, %rdi
	movq	%rbx, %rcx
	movl	$240, %edx
	movl	$4096, %esi
	call	*qsort@GOTPCREL(%rip)
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L754:
	addl	$1, %edi
	movl	$4096, %esi
	xorl	%ecx, %ecx
	jmp	.L753
	.p2align 4,,10
	.p2align 3
.L1117:
	jge	.L751
.L919:
	movq	%rax, %rsi
	cmpq	%rsi, %rcx
	jnb	.L1116
.L753:
	leaq	(%rcx,%rsi), %rax
	shrq	%rax
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	salq	$4, %rdx
	addq	%r13, %rdx
	cmpl	(%rdx), %edi
	jne	.L1117
	cmpq	8(%rdx), %rbp
	jne	.L1118
	movslq	%edi, %rax
	addq	%rax, %r12
	cmpl	$4096, %edi
	jne	.L754
	addq	$1, %rbp
	cmpq	$128, %rbp
	jne	.L747
	call	monotonic_seconds
	movq	%r12, %rdx
	subsd	8(%rsp), %xmm0
	leaq	.LC96(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	movq	%r13, %rdi
	call	*free@GOTPCREL(%rip)
	jmp	.L745
	.p2align 4,,10
	.p2align 3
.L1118:
	jb	.L919
.L751:
	leaq	1(%rax), %rcx
	cmpq	%rsi, %rcx
	jb	.L753
.L1116:
	leaq	.LC95(%rip), %rdi
	call	die
.L1086:
	leaq	.LC82(%rip), %rdi
	call	die
.L1107:
	leaq	.LC98(%rip), %rdi
	call	die
.L1093:
	call	*endwin@GOTPCREL(%rip)
	leaq	.LC101(%rip), %rdi
	call	die
.L790:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm1, %xmm1
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L791
.L1090:
	leaq	.LC100(%rip), %rdi
	call	die
.L851:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	call	*log2@GOTPCREL(%rip)
	cvttsd2sil	%xmm0, %r12d
	jmp	.L852
.L849:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	8(%rsp), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC2(%rip), %xmm0
	cvttsd2sil	%xmm0, %r13d
	jmp	.L850
.L1115:
	js	.L847
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L848:
	divsd	168(%rsp), %xmm0
	call	*log1p@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm1
	divsd	.LC56(%rip), %xmm0
	call	*fmin@GOTPCREL(%rip)
	pxor	%xmm1, %xmm1
	call	*fmax@GOTPCREL(%rip)
	movapd	%xmm0, %xmm2
	jmp	.L846
.L843:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L844
.L854:
	subl	$1, %eax
	leaq	.LC53(%rip), %rdi
	movl	%eax, 384(%rbx)
	cltq
	movq	%rdi, 256(%rbx,%rax,8)
	jmp	.L853
.L847:
	movq	%rax, %rdx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L848
.L830:
	movl	$672, %esi
	movl	$1, %edi
	call	*calloc@GOTPCREL(%rip)
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L724
	movq	%rax, %rdi
	movl	$60, %ecx
	movq	%rbp, %rsi
	movq	.LC5(%rip), %rax
	rep movsl
	movsd	8(%rsp), %xmm6
	movabsq	$1099511627775, %rdi
	movq	%rax, 400(%rbx)
	movq	176(%rbp), %rax
	movsd	%xmm6, 416(%rbx)
	cmpq	%rax, %rdi
	jb	.L834
	leaq	1(%rax), %r13
	bsrq	%r13, %r13
	sarl	%r13d
.L835:
	movq	184(%rbp), %rdx
	movl	$1, %eax
	movabsq	$1099511627775, %rdi
	testq	%rdx, %rdx
	cmovg	%rdx, %rax
	cmpq	%rdi, %rdx
	jg	.L836
	bsrq	%rax, %rax
.L837:
	movl	$6, %edx
	movq	48(%rsp), %rdi
	movq	%rbx, %rsi
	movdqa	208(%rsp), %xmm5
	cmpl	%edx, %r13d
	cmovg	%edx, %r13d
	movl	$3, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movq	8(%rbp), %rdx
	leal	6(%r13,%rax), %eax
	movl	%eax, 384(%rbx)
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movl	0(%rbp), %edx
	movups	%xmm5, 256(%rbx)
	imulq	%r14, %rax
	movups	%xmm5, 272(%rbx)
	xorq	%r12, %rdx
	movups	%xmm5, 288(%rbx)
	movups	%xmm5, 304(%rbx)
	xorq	%rax, %rdx
	shrq	$31, %rax
	movups	%xmm5, 320(%rbx)
	xorq	%rax, %rdx
	movups	%xmm5, 336(%rbx)
	movq	%rdx, %rax
	movups	%xmm5, 352(%rbx)
	shrq	$30, %rax
	movups	%xmm5, 368(%rbx)
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r14, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	movq	%rax, 664(%rbx)
	call	index_insert
	movq	392(%rsp), %rax
	movq	8(%rbp), %rdx
	movq	%rbx, 392(%rsp)
	movq	456(%rsp), %rsi
	movslq	432(%rsp), %rdi
	movq	%rax, 248(%rbx)
	movq	%rdx, %rax
	movq	384(%rsp), %rcx
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	movq	%rsi, %rdx
	shrq	$30, %rdx
	imulq	%r14, %rax
	xorq	%rsi, %rdx
	imulq	%r15, %rdx
	movq	%rdx, %rsi
	shrq	$27, %rsi
	xorq	%rsi, %rdx
	imulq	%r14, %rdx
	movq	%rdx, %rsi
	shrq	$31, %rsi
	xorq	%rsi, %rdx
	movl	0(%rbp), %esi
	xorl	%r8d, %r8d
	orq	$-1, %r12
	xorq	%rsi, %rdx
	movq	%rdi, %rsi
	xorq	%rax, %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	%r15, %rax
	movq	%rax, %rdx
	shrq	$27, %rdx
	xorq	%rdx, %rax
	imulq	%r14, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rdi
	movq	%rdx, %r9
	movl	%edx, %edi
	jmp	.L838
.L840:
	leal	(%r8,%r9), %eax
	cltd
	idivl	%esi
	movslq	%edx, %rax
	imulq	$40, %rax, %rax
	movq	16(%rcx,%rax), %rax
	cmpq	%r12, %rax
	jb	.L839
	movl	%edi, %edx
	movq	%r12, %rax
.L839:
	addl	$1, %r8d
	movl	%edx, %edi
	movq	%rax, %r12
.L838:
	cmpl	%r8d, %esi
	jg	.L840
	movslq	%edi, %rax
	xorl	%r12d, %r12d
	imulq	$40, %rax, %rax
	movq	%r12, 240(%rbx)
	addq	%rax, %rcx
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.L841
	movq	%rbx, 240(%rax)
.L842:
	addq	$1, 16(%rcx)
	movq	%rbx, 8(%rcx)
	jmp	.L908
.L836:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	call	*log2@GOTPCREL(%rip)
	cvttsd2sil	%xmm0, %eax
	jmp	.L837
.L841:
	movq	%rbx, (%rcx)
	jmp	.L842
.L834:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	8(%rsp), %xmm0
	call	*log2@GOTPCREL(%rip)
	mulsd	.LC2(%rip), %xmm0
	cvttsd2sil	%xmm0, %r13d
	jmp	.L835
	.cfi_endproc
.LFE124:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	CSWTCH.124, @object
	.size	CSWTCH.124, 16
CSWTCH.124:
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
.LC0:
	.long	1202590843
	.long	1065646817
	.align 8
.LC1:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC5:
	.long	0
	.long	-1074790400
	.align 8
.LC23:
	.long	0
	.long	1104006501
	.align 8
.LC42:
	.long	0
	.long	1083129856
	.align 8
.LC45:
	.long	0
	.long	1072693248
	.align 8
.LC46:
	.long	0
	.long	1093567616
	.align 8
.LC47:
	.long	0
	.long	1064304640
	.align 8
.LC49:
	.long	-1717986918
	.long	1070176665
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC51:
	.quad	-1
	.quad	1
	.section	.rodata.cst8
	.align 8
.LC54:
	.long	0
	.long	1076101120
	.align 8
.LC55:
	.long	-755914244
	.long	1062232653
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
	.quad	.LC53
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
