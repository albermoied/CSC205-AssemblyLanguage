.listall
.386
.model flat,c
.stack 100h
INCLUDELIB msvcrt.lib

printf PROTO arg1:PTR Byte, printlist:VARARG
scanf PROTO arg2:PTR Byte, inputlist:VARARG

.data
msg1fmt byte 0Ah,"%s%d",0Ah,0Ah,0
msg2fmt byte "%s",0
in1fmt byte "%d",0
msg2 byte "Enter an integer: ",0
msg1 byte "The contents of the accumulator are: ",0
temp sdword ?
three sdword 3
five sdword 5
a sdword ?
b sdword ?

.code
LOADACC macro operand
		mov eax,operand
		endm
STOREACC macro operand
		 mov operand,eax
		 endm
ADDACC  macro operand
		add eax,operand
		endm
SUBACC  macro operand
		sub eax,operand
		endm
MULTACC macro operand
		push ebx
		push ecx
		mov ebx, eax
		mov eax, 0
		mov ecx, operand
		.if		ecx<0
				neg ecx
		.endif
		.while	ecx>0
				add eax, ebx
				dec ecx	
		.endw
		.if   operand<0
			  neg eax
		.endif
		pop ecx
		pop ebx
		endm
DIVACC	macro operand
		push ebx
		push ecx
		mov ebx, eax
		mov eax, 0
		mov ecx, operand
		.if	ecx<0
			neg ecx
		.endif
		.while  ecx>0
			sub ebx, operand
			inc eax
			dec ecx
			.endw
		.if operand<0
		neg eax
		.endif
		pop ecx
		pop ebx
		endm

main proc
	 call INACC
	 ADDACC 10
	 STOREACC a
	 LOADACC 7
	 SUBACC 5
	 ADDACC a
	 call OUTACC
     ret
main endp

INACC proc
	  push ebx
	  push ecx
	  INVOKE printf, ADDR msg2fmt, ADDR msg2
	  INVOKE scanf, ADDR in1fmt, ADDR temp
	  mov eax,temp
	  pop ecx
	  pop ebx
	  ret
INACC endp
OUTACC proc
	   push eax
	   push ebx
	   push ecx
	   mov temp,eax
	   INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
	   pop ecx
	   pop ebx
	   pop eax
	   ret
OUTACC endp
end