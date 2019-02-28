.386
.model flat, c
.stack 100h
INCLUDELIB msvcrt.lib
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
inpfmt byte "%d",0   
outfmt byte 0Ah,"%s",0
outfmt1 byte 0Ah,"%d%s%d%s%d", 0Ah, 0Ah,0
out1 byte "Enter a number: ",0
out2 byte "Enter a larger number: ",0
out3 byte "Enter an even larger number: ",0
out4 byte " < ",0
out5 byte " > ",0
num1 sdword ?
num2 sdword ?
num3 sdword ?


.code
main proc
INVOKE printf, ADDR outfmt, ADDR out1
INVOKE scanf, ADDR inpfmt, ADDR num1
INVOKE printf, ADDR outfmt, ADDR out2
INVOKE scanf, ADDR inpfmt, ADDR num2
INVOKE printf, ADDR outfmt, ADDR out3
INVOKE scanf, ADDR inpfmt, ADDR num3
INVOKE printf, ADDR outfmt1, num1, ADDR out4, num2, ADDR out4, num3
mov eax, num3
mov ebx, num1
mov num3, ebx
mov num1, eax
INVOKE printf, ADDR outfmt1, num1, ADDR out5, num2, ADDR out5, num3
ret
main endp
end