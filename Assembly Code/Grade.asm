.386
.model flat, c
.stack 100h
INCLUDELIB msvcrt.lib
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
inpfmt byte "%s",0  
outfmt byte 0Ah,"%s",0Ah,0
out01 byte "Enter Your Grade: ",0
out6 byte "Excellent Work!",0
out1 byte "Good Job :)",0
out2 byte "Just Average :|",0
out3 byte "Poor:(",0
out4 byte "Fail :'(",0
out5 byte "Invalid Input!",0
inp byte ? 

.code
main proc
INVOKE printf, ADDR outfmt, ADDR out01
INVOKE scanf, ADDR inpfmt, ADDR inp
switch01:	cmp inp,'a'
			je case11
			cmp inp,'b'
			je case12
			cmp inp,'c'
			je case13
			cmp inp,'d'
			je case14
			cmp inp,'f'
			je case15
			jmp default01
case11:		INVOKE printf, ADDR outfmt, ADDR out6
			jmp endswitch01
case12:		INVOKE printf, ADDR outfmt, ADDR out1
			jmp endswitch01
case13:		INVOKE printf, ADDR outfmt, ADDR out2
			jmp endswitch01
case14:		INVOKE printf, ADDR outfmt, ADDR out3
			jmp endswitch01
case15:		INVOKE printf, ADDR outfmt, ADDR out4
			jmp endswitch01
default01:	INVOKE printf, ADDR outfmt, ADDR out5
endswitch01:nop
ret
main endp
end 