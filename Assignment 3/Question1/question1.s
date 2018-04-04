	.file	"question1.c"
.globl _i1
	.data
	.align 4
_i1:
	.long	5
.lcomm _i2,4,4			;	allocate 4 bytes at 4-byte boundary
						;	and name the area _i2
						;	the name is not exported
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

;		void func(int fp1, int fp2, int fp3)
;		{
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	
;		i1 = i1 - 1;
	movl	_i1, %eax
	subl	$1, %eax
	movl	%eax, _i1
	
;		if(s1 < i1)
;		{
	movzwl	_s1, %eax
	movswl	%ax, %edx
	movl	_i1, %eax
	cmpl	%eax, %edx		;	Compares %eax to %edx
	jge	L2					;	Jump to L2 if %eax is greater than or equal to %edx
	
	jmp	L3					;	L3 is the beginning of the else
;		}
	
L4:
				
	movl	8(%ebp), %eax
	movl	%eax, %edx
	
;				f1 = s1 + fp1; 
	movzwl	_s1, %eax
	leal	(%edx,%eax), %eax		; %eax <- (%edx + %eax)
	movw	%ax, -10(%ebp)			; 10(%ebp): f1
	
;				f2 = fp2 - s1;
	movl	12(%ebp), %eax			; 12(%ebp): fp2
	movl	%eax, %edx
	movzwl	_s1, %eax
	movl	%edx, %ecx
	subw	%ax, %cx
	movl	%ecx, %eax
	movw	%ax, -12(%ebp)			; -12(%ebp): f2
	
;				i2 + i2 + 1;
	movl	_i2, %eax
	addl	$1, %eax
	movl	%eax, _i2


L3:									; Beginning of if(s1 < i1) is true block

;			while(i2 < 1)
;			{
	movl	_i2, %eax
	cmpl	$1, %eax
	jle	L4							; Jump L4 if 1 is less than or equal to i2
;			}
	
;			f3 = f2 + f1 + fp3;
	movswl	-10(%ebp), %eax			; -10(%ebp): f1
	movl	%eax, %edx
	addl	16(%ebp), %edx			; 16(%ebp): fp1
	movzwl	-12(%ebp), %eax			; -12(%ebp): f2
	leal	(%edx,%eax), %eax
	movl	%eax, -16(%ebp)			; -16(%ebp): f3

;			s2 + s2 + 1;	
	movzwl	_s2, %eax
	addl	$1, %eax
	movw	%ax, _s2
	
	func(f1, f2, f3);
	movzwl	-12(%ebp), %edx			; -12(%ebp): f2
	movswl	-10(%ebp), %eax			; -10(%ebp): f1
	movl	-16(%ebp), %ecx			; -16(%ebp): f3
	movl	%ecx, 8(%esp)			; push f3
	movl	%edx, 4(%esp)			; push zero extended f2
	movl	%eax, (%esp)			; push sign extended f1
	call	_func
	
;			}
	jmp	L1							; End of if(s1 < i1) is true block


L2:									; Beginning of if(s1 < i1) is false block (else)

;			s2 = i1 + s1 + s2;
	movl	_i1, %eax
	movl	%eax, %edx
	movzwl	_s1, %eax
	addl	%eax, %edx
	movzwl	_s2, %eax
	leal	(%edx,%eax), %eax
	movw	%ax, _s2
	
;			printf("%d\11%d\11%d\11%d\12\0", i1, i2, s1, s2);	
	movzwl	_s2, %eax
	movzwl	%ax, %ebx
	movzwl	_s1, %eax
	movswl	%ax, %ecx
	movl	_i2, %edx
	movl	_i1, %eax
	movl	%ebx, 16(%esp)			; push zero extended s2
	movl	%ecx, 12(%esp)			; push sign extended s1
	movl	%edx, 8(%esp)			; push i2
	movl	%eax, 4(%esp)			; push i1
	movl	$LC0, (%esp)
	call	_printf
	
	
L1:
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	
;		}
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp			; −16: 0XFFF0 set the lowest 4 bits to 0
								; align at 8−byte boundary
								; $−16 : immediate addressing (constant 16)
	
	
	subl	$32, %esp			; allocate areas for the local variables and
								; the parameters for the functions to call
								; 32 = 8 * 4
	
;		void main(int argc, char **argv, char **envp)
	call	___main
	
;		{
;			int m1 = 8;
	movl	$8, 28(%esp)		; 28(%esp): m1
	
;			short m2 = 5;
	movw	$5, 26(%esp)		; 26(%esp): m2
	
;			func(m1, m2, 9);	
	movswl	26(%esp), %eax		; 26(%esp): m2
	movl	$9, 8(%esp)			
	movl	%eax, 4(%esp)		; push sign extended m2
	movl	28(%esp), %eax		; 28(%esp): m1
	movl	%eax, (%esp)		; push m1
	call	_func
	leave
	
;		}
	ret
	.def	_printf;	.scl	2;	.type	32;	.endef
