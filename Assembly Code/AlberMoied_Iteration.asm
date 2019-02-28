.386
.model flat,c
.stack 100h
INCLUDELIB msvcrt.lib

printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
outfmt Byte "%s",0
out2fmt Byte "%s",0Ah,0
infmt Byte "%d",0
out1 Byte "Enter a non-negative digit: ",0
out2 Byte "*",0
d sdword ?
i sdword 1
j sdword 1

.code
main proc
INVOKE printf, ADDR outfmt, ADDR out1
INVOKE scanf, ADDR infmt, ADDR d
mov eax,d
mov i,eax
while01:	cmp i,0
			jle endwhile01
			mov eax,i
			mov j,eax
while02:	cmp j,1
			jle endwhile02
			INVOKE printf, ADDR outfmt, ADDR out2
			dec j
			jmp while02
endwhile02: nop
			INVOKE printf, ADDR out2fmt, ADDR out2
			dec i
			jmp while01
endwhile01: nop
ret
main endp
end