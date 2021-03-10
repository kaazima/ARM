; Program to find the position of the first occurence of space
	AREA dat, DATA, READONLY
string DCB "Nice to meet you\0"

	AREA pgm, CODE, READONLY
	ldr r0, =string
loop ldrb r1, [r0], #1
	add r2, r2, #1
	cmp r1, #"\0"			; if no space in string
	moveq r2, #0
	beq exit
	cmp r1, #" "
	bne loop
exit 

e b e
	end