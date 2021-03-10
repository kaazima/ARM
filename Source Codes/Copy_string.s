	AREA dat1, DATA, READONLY
string1 DCB "Amrita\0"

	AREA dat2, DATA, READWRITE
string2 DCB ""				    	; can be "" or 0x00

	AREA pgm, CODE, READONLY
	ldr r0, =string1	 		; pointer
	ldr r1, =string2
loop ldrb r2, [r0], #1
	strb r2, [r1], #1
	cmp r2, #"\0"
	bne loop

e b e						; for infinite loop
	end