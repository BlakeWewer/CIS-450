	.file	"var.c"
	.comm	_ret, 1, 0
.globl _x
	.data
	.align 4
_x:
	.long	100
.lcomm _si,4,4
	.align 4
_sj:
	.long	23
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$116, %esp
	call	___main
	movl	_i.1238, %eax
	testl	%eax, %eax
	jns	L2
	movzwl	98(%esp), %edx
	movswl	96(%esp), %eax
	addl	%eax, %edx
	movsbl	95(%esp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 104(%esp)
	jmp	L4
L2:
	movl	_sj, %edx
	movl	$0, %eax
	subl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	_si, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, 100(%esp)
	jmp	L4
L5:
	movzwl	_y.1234, %eax
	subl	$3, %eax
	movb	%al, 111(%esp)
	movl	_sj, %eax
	addl	$1, %eax
	movl	%eax, _sj
L4:
	movl	_sj, %eax
	testl	%eax, %eax
	jg	L5
	movzwl	_y.1234, %eax
	cwtl
	movl	%eax, 76(%esp)
	movl	_x, %eax
	movl	%eax, 60(%esp)
	movzbl	111(%esp), %edi
	movsbl	95(%esp), %esi
	movzwl	98(%esp), %ebx
	movswl	96(%esp), %ecx
	movl	_i.1238, %edx
	movl	76(%esp), %eax
	movl	%eax, 36(%esp)
	movl	60(%esp), %eax
	movl	%eax, 32(%esp)
	movl	100(%esp), %eax
	movl	%eax, 28(%esp)
	movl	88(%esp), %eax
	movl	%eax, 24(%esp)
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	104(%esp), %eax
	movl	%eax, (%esp)
	call	_test
	movb	%al, _ret
	movl	$0, %eax
	addl	$116, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%ebp, %esp
	popl	%ebp
	ret
.globl _test
	.def	_test;	.scl	2;	.type	32;	.endef
_test:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$68, %esp
	movl	16(%ebp), %esi
	movl	20(%ebp), %ebx
	movl	24(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	44(%ebp), %eax
	movw	%si, -60(%ebp)
	movw	%bx, -64(%ebp)
	movb	%cl, -68(%ebp)
	movb	%dl, -72(%ebp)
	movw	%ax, -76(%ebp)
	movl	$1, -12(%ebp)
	movl	$2, -16(%ebp)
	movw	$3, -18(%ebp)
	movw	$4, -20(%ebp)
	movb	$5, -21(%ebp)
	movb	$6, -22(%ebp)
	movl	$7, -28(%ebp)
	movl	$8, -32(%ebp)
	movl	$9, -36(%ebp)
	movw	$10, -38(%ebp)
	movb	$11, -39(%ebp)
	movb	$12, -40(%ebp)
	movl	$13, -44(%ebp)
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	-28(%ebp), %eax
	leal	(%edx,%eax), %eax
	addl	$68, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.lcomm _i.1238,4,4
	.data
	.align 2
_y.1234:
	.word	99
