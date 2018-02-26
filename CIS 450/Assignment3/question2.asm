; Listing generated by Microsoft (R) Optimizing Compiler Version 19.12.25834.0 

	TITLE	c:\K-State\cis450\runs\2018S\Assignment3\Question2\trace1.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

; comments starting with "MM:" are my comments
; MM: note that 4-byte variables are all "int"
PUBLIC	_j
_DATA	SEGMENT
COMM	_i:DWORD
_DATA	ENDS
_BSS	SEGMENT
_y	DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_j	DD	01eH
?k@?1??trace_me1@@9@9 DD 02H				; `trace_me1'::`2'::k
	; MM: this is an internal static int variable named "k" declared in trace_me1
$SG7350	DB	'%d', 09H, '%d', 09H, '%d', 09H, '%d', 09H, '%d', 0aH, 00H
	; MM: string "%d\t%d\t%d\t%d\t%d\n"
$SG7359	DB	'%d', 09H, '%d', 09H, '%d', 0aH, 00H
	; MM: string "%d\t%d\t%d\n"
_DATA	ENDS
PUBLIC	_trace_me2
PUBLIC	_trace_me1
PUBLIC	_main
_BSS	SEGMENT
_x	DW	01H DUP (?)
_BSS	ENDS
; Function compile flags: /Odtp
; File c:\k-state\cis450\runs\2018s\assignment3\question2\trace1.c
_TEXT	SEGMENT
_main	PROC
  00000	55		 push	 ebp
  00001	8b ec		 mov	 ebp, esp
  00003	6a 03		 push	 3
  00005	6a 04		 push	 4
  00007	e8 00 00 00 00	 call	 _trace_me1
  0000c	83 c4 08	 add	 esp, 8
  0000f	a1 00 00 00 00	 mov	 eax, DWORD PTR _i
  00014	50		 push	 eax
  00015	8b 0d 00 00 00
	00		 mov	 ecx, DWORD PTR _y
  0001b	51		 push	 ecx
  0001c	0f bf 15 00 00
	00 00		 movsx	 edx, WORD PTR _x
  00023	52		 push	 edx
  00024	68 00 00 00 00	 push	 OFFSET $SG7359	
	; MM: $SG7359 represents the address of a string defined above (line 27)
	; "OFFSET" is a legacy pseudo instruction from the old 286 architecture
	; Here, the push operation pushes the starting address of the character
	; array holding the string
  00029	e8 00 00 00 00	 call	 _printf
  0002e	83 c4 10	 add	 esp, 16			; 00000010H
  00031	33 c0		 xor	 eax, eax
  00033	5d		 pop	 ebp
  00034	c3		 ret	 0
_main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\k-state\cis450\runs\2018s\assignment3\question2\trace1.c
_TEXT	SEGMENT
_n$ = -1						; size = 1
_a$ = 8							; size = 4
_b$ = 12						; size = 4
_trace_me1 PROC
  00000	55		 push	 ebp
  00001	8b ec		 mov	 ebp, esp
  00003	51		 push	 ecx
  00004	0f bf 05 00 00
	00 00		 movsx	 eax, WORD PTR _x
  0000b	83 c0 01	 add	 eax, 1
  0000e	66 a3 00 00 00
	00		 mov	 WORD PTR _x, ax
  00014	8b 4d 08	 mov	 ecx, DWORD PTR _a$[ebp]
  00017	03 4d 0c	 add	 ecx, DWORD PTR _b$[ebp]
  0001a	88 4d ff	 mov	 BYTE PTR _n$[ebp], cl
  0001d	83 7d 08 00	 cmp	 DWORD PTR _a$[ebp], 0
  00021	7e 44		 jle	 SHORT $LN2@trace_me1
  00023	8b 15 00 00 00
	00		 mov	 edx, DWORD PTR _i
  00029	83 c2 01	 add	 edx, 1
  0002c	89 15 00 00 00
	00		 mov	 DWORD PTR _i, edx
  00032	a1 00 00 00 00	 mov	 eax, DWORD PTR ?k@?1??trace_me1@@9@9
  00037	0f af 05 00 00
	00 00		 imul	 eax, DWORD PTR ?k@?1??trace_me1@@9@9
	; MM: imul   eax <- eax * k
  0003e	a3 00 00 00 00	 mov	 DWORD PTR ?k@?1??trace_me1@@9@9, eax
  00043	8b 4d 0c	 mov	 ecx, DWORD PTR _b$[ebp]
  00046	d1 e1		 shl	 ecx, 1
	; MM: "shl  ecx, 1" : shift ecx one bit to the left
  00048	51		 push	 ecx
  00049	8b 55 08	 mov	 edx, DWORD PTR _a$[ebp]
  0004c	83 ea 01	 sub	 edx, 1
  0004f	52		 push	 edx
  00050	e8 00 00 00 00	 call	 _trace_me2
  00055	83 c4 08	 add	 esp, 8
  00058	a1 00 00 00 00	 mov	 eax, DWORD PTR _i
  0005d	83 e8 01	 sub	 eax, 1
  00060	a3 00 00 00 00	 mov	 DWORD PTR _i, eax
  00065	eb 2b		 jmp	 SHORT $LN1@trace_me1
$LN2@trace_me1:
  00067	8b 4d 08	 mov	 ecx, DWORD PTR _a$[ebp]
  0006a	51		 push	 ecx
  0006b	8b 15 00 00 00
	00		 mov	 edx, DWORD PTR ?k@?1??trace_me1@@9@9
  00071	52		 push	 edx
  00072	0f b6 45 ff	 movzx	 eax, BYTE PTR _n$[ebp]
  00076	50		 push	 eax
  00077	8b 0d 00 00 00
	00		 mov	 ecx, DWORD PTR _j
  0007d	51		 push	 ecx
  0007e	8b 15 00 00 00
	00		 mov	 edx, DWORD PTR _i
  00084	52		 push	 edx
  00085	68 00 00 00 00	 push	 OFFSET $SG7350
  0008a	e8 00 00 00 00	 call	 _printf
  0008f	83 c4 18	 add	 esp, 24			; 00000018H
$LN1@trace_me1:
	; MM: this function does not return a value
  00092	8b e5		 mov	 esp, ebp
  00094	5d		 pop	 ebp
  00095	c3		 ret	 0
_trace_me1 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\k-state\cis450\runs\2018s\assignment3\question2\trace1.c
_TEXT	SEGMENT
_v$ = 8							; size = 1
_w$ = 12						; size = 1
_trace_me2 PROC
  00000	55		 push	 ebp
  00001	8b ec		 mov	 ebp, esp
  00003	a1 00 00 00 00	 mov	 eax, DWORD PTR _y
  00008	83 c0 01	 add	 eax, 1
  0000b	a3 00 00 00 00	 mov	 DWORD PTR _y, eax
  00010	0f be 4d 08	 movsx	 ecx, BYTE PTR _v$[ebp]
  00014	85 c9		 test	 ecx, ecx ; MM  "test"'s effect here is the same as "cmp"'s
  00016	7e 21		 jle	 SHORT $LN1@trace_me2
  00018	8a 55 08	 mov	 dl, BYTE PTR _v$[ebp]
  0001b	80 ea 01	 sub	 dl, 1
  0001e	88 55 08	 mov	 BYTE PTR _v$[ebp], dl
  00021	0f b6 45 0c	 movzx	 eax, BYTE PTR _w$[ebp]
  00025	83 e8 01	 sub	 eax, 1
  00028	50		 push	 eax
  00029	0f be 4d 08	 movsx	 ecx, BYTE PTR _v$[ebp]
  0002d	83 e9 02	 sub	 ecx, 2
  00030	51		 push	 ecx
  00031	e8 00 00 00 00	 call	 _trace_me1
  00036	83 c4 08	 add	 esp, 8
$LN1@trace_me2:
	; MM: this function does not return a value
  00039	5d		 pop	 ebp
  0003a	c3		 ret	 0
_trace_me2 ENDP
_TEXT	ENDS
END
