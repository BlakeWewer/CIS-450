	.file	"question1.c"
.globl _i1
	.data
	.align 4
_i1:
	.long	5
.lcomm _i2,4,4
.globl _s1
	.align 2
_s1:
	.word	3
.lcomm _s2,2,2
	.section .rdata,"dr" ; MM: rdata is a read only section which stores strings
LC0:
	.ascii "%d\11%d\11%d\11%d\12\0"
	.text
.globl _func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	movl	_i1, %eax
	subl	$1, %eax
	movl	%eax, _i1
	movzwl	_s1, %eax
	movswl	%ax, %edx
	movl	_i1, %eax
	cmpl	%eax, %edx
	jge	L2
	jmp	L3
L4:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	movzwl	_s1, %eax
	leal	(%edx,%eax), %eax
	movw	%ax, -10(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, %edx
	movzwl	_s1, %eax
	movl	%edx, %ecx
	subw	%ax, %cx
	movl	%ecx, %eax
	movw	%ax, -12(%ebp)
	movl	_i2, %eax
	addl	$1, %eax
	movl	%eax, _i2
L3:
	movl	_i2, %eax
	cmpl	$1, %eax
	jle	L4
	movswl	-10(%ebp), %eax
	movl	%eax, %edx
	addl	16(%ebp), %edx
	movzwl	-12(%ebp), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, -16(%ebp)
	movzwl	_s2, %eax
	addl	$1, %eax
	movw	%ax, _s2
	movzwl	-12(%ebp), %edx
	movswl	-10(%ebp), %eax
	movl	-16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_func
	jmp	L1
L2:
	movl	_i1, %eax
	movl	%eax, %edx
	movzwl	_s1, %eax
	addl	%eax, %edx
	movzwl	_s2, %eax
	leal	(%edx,%eax), %eax
	movw	%ax, _s2
	movzwl	_s2, %eax
	movzwl	%ax, %ebx
	movzwl	_s1, %eax
	movswl	%ax, %ecx
	movl	_i2, %edx
	movl	_i1, %eax
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
L1:
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$8, 28(%esp)
	movw	$5, 26(%esp)
	movswl	26(%esp), %eax
	movl	$9, 8(%esp)
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_func
	leave
	ret
	.def	_printf;	.scl	2;	.type	32;	.endef
