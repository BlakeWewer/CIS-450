	.file	"test2.c"
	.text
.globl _h
	.def	_h;	.scl	2;	.type	32;	.endef
_h:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	addl	$1, 8(%ebp)
	movl	12(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -4(%ebp)
	movl	20(%ebp), %eax
	movl	16(%ebp), %edx
	leal	(%edx,%eax), %eax
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	leal	(%edx,%eax), %eax
	addl	16(%ebp), %eax
	addl	20(%ebp), %eax
	addl	24(%ebp), %eax
	addl	-4(%ebp), %eax
	leave
	ret
.globl _g
	.def	_g;	.scl	2;	.type	32;	.endef
_g:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	leal	(%edx,%eax), %eax
	addl	16(%ebp), %eax
	addl	-4(%ebp), %eax
	addl	-8(%ebp), %eax
	leave
	ret
.globl _f
	.def	_f;	.scl	2;	.type	32;	.endef
_f:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$36, %esp
	movl	-8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_g
	movl	%eax, -4(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_h
	movl	%eax, -8(%ebp)
	leave
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
	movl	20(%esp), %eax
	movl	%eax, 8(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_f
	leave
	ret
