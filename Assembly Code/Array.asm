.386
.model flat, c
.stack 100h
INCLUDELIB msvcrt.lib
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
msg1fmt byte 0Ah,"%s",0
msg2fmt byte 0Ah,"%s",0Ah,0Ah,0
msg3fmt byte "    %d",0Ah,0Ah,0
in1fmt byte "%d",0
msg1 byte "Enter the number of integers to be input: ",0
msg2 byte "Enter an integer: ",0
msg3 byte "Check no:",0
msg4 byte "No data entered.",0
msg5 byte "Found!",0
msg6 byte "Not Found!",0
n sdword ?
chk sdword ?
arry sdword 20 dup(?)

.code
main proc
INVOKE printf, ADDR msg1fmt, ADDR msg1
INVOKE scanf, ADDR in1fmt, ADDR n
mov ecx,n
mov ebx,0
if01:	cmp ecx,0
		jle then01
		for01:	nop
				push ecx
				INVOKE printf, ADDR msg1fmt, ADDR msg2
				INVOKE scanf, ADDR in1fmt, ADDR arry[ebx]
				pop ecx
				add ebx,4
				loop for01
		INVOKE printf, ADDR msg1fmt, ADDR msg3
		INVOKE scanf, ADDR in1fmt, ADDR chk
		mov ecx,n
		mov ebx,0
		for02:	nop
				mov eax,chk
				if02:   cmp arry[ebx],eax
						je then02
						add ebx,4
						loop for02
		INVOKE printf, ADDR msg2fmt, ADDR msg6
		jmp endif02
		then02: INVOKE printf, ADDR msg2fmt, ADDR msg5
		endif02: nop
jmp endif01
then01:	INVOKE printf, ADDR msg2fmt, ADDR msg4
endif01:	nop
ret
main endp
end