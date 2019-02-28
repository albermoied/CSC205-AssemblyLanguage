.386
.model flat,c
.stack 100h
INCLUDELIB msvcrt.lib

printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
outfmt byte "%s",0
out2fmt byte "%s%s",0Ah,0
infmt byte "%s",0
out1 byte "Please enter an upper case letter (Enter @ to quit): ",0
out2 byte "The lower case form is: ",0
i byte ?
j byte ?
maskit byte 00100000b
flag byte 40h

.code
main proc
while01:		nop
				INVOKE printf, ADDR outfmt, ADDR out1
				INVOKE scanf, ADDR infmt, ADDR i
				mov al,i
				cmp al,flag
				je endwhile01
				or al, maskit
				mov j,al
				INVOKE printf, ADDR out2fmt, ADDR out2, ADDR j
				jmp while01
endwhile01:		nop
ret
main endp
end