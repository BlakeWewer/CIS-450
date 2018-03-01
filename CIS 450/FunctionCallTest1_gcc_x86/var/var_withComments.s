	.file	"var.c"
	.comm	_ret, 1, 0	; allocation 1 byte and name the area _ret
				; the name is exported
				; the last "0" specify the alignment
.globl _x
	.data
	.align 4
_x:
	.long	100
.lcomm _si,4,4			; allocate 4 bytes at 4-byte boundary 
				; and name the area _si
				; the name is not exported
	.align 4
_sj:
	.long	23
	.def	___main;	.scl	2;	.type	32;	.endef
				; ___main is a special function to do necessary
				; initialization 
				; https://gcc.gnu.org/onlinedocs/gccint/Collect2.html  
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
;	int main(int argc, char **argv, char **envp) {
;		unsigned char uc;
;		short s;
;		char c;
;		unsigned short us;
;		unsigned int ui;
;		long l;
;		unsigned long ul;

_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp	; -16: 0XFFF0   set the lowest 4 bits to 0
				; align at 8-byte boundary
				; $-16 : immediate addressing (constant 16)
	pushl	%edi		; save the non-destructive registers used
	pushl	%esi		; in the function
	pushl	%ebx
	subl	$116, %esp	; allocate areas for the local variables and	
				; the parameters for the functions to call
				; 116 = 29 * 4
	call	___main		; do necessary initialization
;		if (i < 0) {

	movl	_i.1238, %eax	; _i.1238: internal static variable i
	testl	%eax, %eax	; testl: performs logican AND, but does not
				; the result in the destination register
	jns	L2		; jns: jump if sign bit is not set
				;   == jge  (L2 is at the beginning of ELSE)
;		ui = us + s - c;
	movzwl	98(%esp), %edx	; 98(%esp): us
	movswl	96(%esp), %eax	; 96(%esp): s
	addl	%eax, %edx
	movsbl	95(%esp), %eax	; 95(%esp): c
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 104(%esp)	; 104(%esp): ui
	jmp	L4		; L4: right after the IF statement
;		} else {
L2:				; at the beginning of ELSE
;		ul = si - sj * 2;	
	movl	_sj, %edx	
	movl	$0, %eax
	subl	%edx, %eax	; eax <- eax - edx (eax <- -sj)
	addl	%eax, %eax	; eax <- (-sj) * 2		
	movl	%eax, %edx
	movl	_si, %eax
	leal	(%edx,%eax), %eax ; eax <- (edx + eax)
	movl	%eax, 100(%esp)	; 100(%esp) : ul
	jmp	L4		; L4: right after the IF statement
L5:	
;	{			; the body of the WHILE statement
;		uc = y - 3;
	movzwl	_y.1234, %eax
	subl	$3, %eax
	movb	%al, 111(%esp)	; 111(%esp) : uc
;		sj++;
	movl	_sj, %eax
	addl	$1, %eax
	movl	%eax, _sj
;	}
L4:				; right after the IF statement
;		while(sj > 0) goto L5
	movl	_sj, %eax
	testl	%eax, %eax
	jg	L5		; jg: jump if greater than (if true)
;		ret = test(ui, i, s, us, c, uc, l, ul, x, y);
	movzwl	_y.1234, %eax
	cwtl				; cwtl: convert word to long
					;  eax <- sign extended ax
					; eax <- sign extended y
	movl	%eax, 76(%esp)		; 76(%esp): temporary area to store
					; sign extended y
	movl	_x, %eax		
	movl	%eax, 60(%esp)		; 60(%esp): temporary area to store x
	movzbl	111(%esp), %edi		; 111(%esp): uc
	movsbl	95(%esp), %esi		; 95(%esp): c
	movzwl	98(%esp), %ebx		; 98(%esp): us
	movswl	96(%esp), %ecx		; 96(%esp): s
	movl	_i.1238, %edx		
	movl	76(%esp), %eax		; 76(%esp): temporary area to store y
	movl	%eax, 36(%esp)		; (equivalent to) push sign extended y 
	movl	60(%esp), %eax		; 60(%esp): temporary area to store x
	movl	%eax, 32(%esp)		; push x
	movl	100(%esp), %eax		; 100(%esp): ul
	movl	%eax, 28(%esp)		; push ul
	movl	88(%esp), %eax		; 88(%esp): l
	movl	%eax, 24(%esp)		; push l
	movl	%edi, 20(%esp)		; push zero extended uc
	movl	%esi, 16(%esp)		; push sign extended c
	movl	%ebx, 12(%esp)		; push zero extended us
	movl	%ecx, 8(%esp)		; push sign extended s
	movl	%edx, 4(%esp)		; push i
	movl	104(%esp), %eax		; 104(%esp): ui
	movl	%eax, (%esp)		; push ui
	call	_test
	movb	%al, _ret
;		return 0;
	movl	$0, %eax
;	}
	addl	$116, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%ebp, %esp
	popl	%ebp
	ret
.globl _test
	.def	_test;	.scl	2;	.type	32;	.endef
;	void test(unsigned int ui, int i, short s, unsigned short us,
;			char c, unsigned char uc, long l, unsigned long ul,
;			int x, short y) {
_test:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$68, %esp
	movl	16(%ebp), %esi	; 16(%ebp): sign extended s
	movl	20(%ebp), %ebx	; 20(%ebp): zero extended us
	movl	24(%ebp), %ecx	; 24(%ebp): signe extended c
	movl	28(%ebp), %edx	; 28(%ebp): zero extended uc
	movl	44(%ebp), %eax	; 44(%ebp): y
	movw	%si, -60(%ebp)	; -60(%ebp): 2-byte temporary area to store s
	movw	%bx, -64(%ebp)	; -64(%ebp): 2-byte temporary area to store us
	movb	%cl, -68(%ebp)	; -68(%ebp): 1-byte temporary area to store c
	movb	%dl, -72(%ebp)	; -72(%ebp): 1-byte temporary area to store uc
	movw	%ax, -76(%ebp)	; -76(%ebp): 2-byte temporary area to store y
;		ui = 1;
	movl	$1, -12(%ebp)	; -12(%ebp): temporary area for ui
;		i = 2;
	movl	$2, -16(%ebp)	; -16(%ebp): temporary area for i
;		s = 3;
	movw	$3, -18(%ebp)	; -18(%ebp): temporary area for s
; 		us = 4;
	movw	$4, -20(%ebp)	; -20(%ebp): temporary area for us
;		c = 5;
	movb	$5, -21(%ebp)	; -21(%ebp): temporary area for c
;		uc = 6;
	movb	$6, -22(%ebp)	; -22(%ebp): temporary area for uc
;		l = 7;
	movl	$7, -28(%ebp)	; -28(%ebp): temporary area for l
;		ul = 8;
	movl	$8, -32(%ebp)	; -32(%ebp): temporary area for ul
;		x = 9;
	movl	$9, -36(%ebp)	; -34(%ebp): temporary area for x
;		y = 10;
	movw	$10, -38(%ebp)	; -38(%ebp): temporary area for y
;		c1 = 11;
	movb	$11, -39(%ebp)	; -39(%ebp): temporary area for c1
;		c2 = 12;
	movb	$12, -40(%ebp)	; -40(%ebp): temporary area for c2
;		i1 = 13;
	movl	$13, -44(%ebp)	; -44(%ebp): temporary area for i1
;		return ui * 2 + l;
	movl	-12(%ebp), %eax	; -12(%ebp): temporary area for ui
	leal	(%eax,%eax), %edx
	movl	-28(%ebp), %eax	; -28(%ebp): temporary area for l
	leal	(%edx,%eax), %eax
;	}
	addl	$68, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.lcomm _i.1238,4,4		; in bss
	.data
	.align 2
_y.1234:
	.word	99		; in data
