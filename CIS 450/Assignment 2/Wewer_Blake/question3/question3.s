	.file	"question3.c"
	.comm	c1, 1, 0
	.globl	j
	.data
	.align 4
j:
	.long	3
	.globl	m
	.align 4
m:
	.long	1
	.section .rdata,"dr"
.LC0:
	.ascii "\12%d\11%d\11%d\11%d\11%d\11%d\12\0"
	.text
	.globl	trace_me
	.def	trace_me;	.scl	2;	.type	32;	.endef
	.seh_proc	trace_me
trace_me:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movl	$3, -4(%rbp)
	movl	m(%rip), %eax
	addl	$1, %eax
	movl	%eax, m(%rip)
	cmpl	$0, 16(%rbp)
	jne	.L2
	movl	m(%rip), %eax
	movl	%eax, p.3347(%rip)
	movl	24(%rbp), %eax
	movl	%eax, o.3348(%rip)
	movl	16(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	o.3348(%rip), %edx
	movl	p.3347(%rip), %eax
	movl	-4(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	jmp	.L3
.L2:
	movl	o.3348(%rip), %eax
	addl	$1, %eax
	movl	%eax, o.3348(%rip)
	movl	p.3347(%rip), %eax
	addl	$1, %eax
	movl	%eax, p.3347(%rip)
	addl	$1, 24(%rbp)
	leaq	c1(%rip), %rax
	movzbl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %edx
	leaq	c1(%rip), %rax
	movb	%dl, (%rax)
	leaq	c1(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movl	16(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	24(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	call	trace_me
.L3:
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
.lcomm p.3347,4,4
.lcomm o.3348,4,4
	.ident	"GCC: (GNU) 6.4.0"
	.def	printf;	.scl	2;	.type	32;	.endef
