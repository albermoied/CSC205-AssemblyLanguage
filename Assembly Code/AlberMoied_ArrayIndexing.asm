.386
.model flat,c
.stack 100h
INCLUDELIB msvcrt.lib

printf PROTO arg1:ptr Byte, printlist:VARARG
scanf PROTO arg2:ptr Byte, inputlist:VARARG

.data
	n sdword 6
	numarry sdword 1,2,3,4,5,6
	msg1fmt byte 0Ah,0
	in1fmt byte "%d",0
	msg2fmt byte "%d",0


.code

main proc
	call OUTPUT
	INVOKE printf,ADDR msg1fmt
	call reverse
	call OUTPUT
	INVOKE printf,ADDR msg1fmt
ret 
main endp


OUTPUT proc
	mov ecx,n
	mov ebx,0
	.repeat
	push ecx
	INVOKE printf,ADDR msg2fmt,numarry[ebx]
	pop ecx
	add ebx,4
	.untilcxz	
	ret
OUTPUT endp

reverse proc
	mov ecx,n
	sar ecx,1
	lea esi,numarry+0
	mov edi,esi
	mov eax,n
	dec eax
	sal eax,2
	add edi,eax
	.repeat
	mov eax,[esi]
	xchg eax,[edi]
	mov [esi],eax
	add esi,4
	sub edi,4
	.untilcxz
ret
reverse endp
end