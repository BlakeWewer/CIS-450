.sect .text; .sect .rom; .sect .data; .sect .bss
.extern _x
.sect .data
_x:
.data4	100
_sj:
.extern _main
.data4	23
.sect .text
_main:
push ebp
mov ebp,esp
sub	esp,20
.sect .data
I_1:
.data4	99
.sect .bss
.comm I_2,4
.sect .text
cmp (I_2),0
jns I1_4
movsx eax,-4(ebp)
movzx edx,-8(ebp)
add eax,edx
movsxb ebx,-5(ebp)
sub ebx,eax
neg ebx
mov -12(ebp),ebx
jmp I1_7
I1_4:
mov edx,(_sj)
sal edx,1
sub edx,(_si)
neg edx
mov -20(ebp),edx
I1_7:
! kill cc
cmp (_sj),0
jle I1_6
movsx eax,(I_1)
sub eax,3
movb -1(ebp),al
inc (_sj)
jmp I1_7
I1_6:
movsx eax,(I_1)
movsxb ebx,-5(ebp)
movsx ecx,-4(ebp)
push eax
push (_x)
push -20(ebp)
push -16(ebp)
movzxb eax,-1(ebp)
push eax
push ebx
movzx eax,-8(ebp)
push eax
push ecx
push (I_2)
push -12(ebp)
call _test
add esp,40
movb (_ret),al
xor eax,eax
leave
ret
.sect .bss
.comm _si,4
.extern _ret
.comm _ret,4
.sect .text
