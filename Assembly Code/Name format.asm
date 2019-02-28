.386
.model flat, c
.stack 100h
INCLUDELIB msvcrt.lib
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
outfmt byte "%s",0Ah,0
name1 byte "Abe Lincoln"
name2 byte 12 dup (?)

.code
main proc
INVOKE printf, ADDR outfmt, ADDR name1
mov al,' '
mov ecx, lengthof name1
lea edi,name1
repne scasb
push ecx
mov esi,edi
lea edi,name2
rep movsb
mov al,','
stosb
mov al,' '
stosb
mov ecx,lengthof name2
pop eax
sub ecx,eax
dec ecx
lea esi,name1
rep movsb
INVOKE printf, ADDR outfmt, ADDR name2
ret
main endp
end