.sect .text; .sect .rom; .sect .data; .sect .bss
.extern _fact
.sect .text
_fact:
push ebp
mov ebp,esp
push esi
mov edx,8(ebp)
dec edx
mov esi,edx
cmp 8(ebp),0
je I1_3
test esi,esi
jne I1_4
I1_3:
mov (_ans),1
jmp I1_1
I1_4:
push esi
call _fact
pop ecx
mov edx,esi
inc edx
imul edx,(_ans)
mov (_ans),edx
I1_1:
pop esi
leave
ret
.extern _main
_main:
push ebp
mov ebp,esp
push 3
call _fact
pop ecx
push (_ans)
push I_1
call _printf
pop ecx
pop ecx
xor eax,eax
leave
ret
.sect .rom
I_1:
.data4	1936618337
.data4	544367991
.data4	1680154685
.extern _ans
.data4	10
.sect .bss
.comm _ans,4
.sect .text
