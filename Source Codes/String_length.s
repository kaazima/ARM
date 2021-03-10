	AREA dat1, DATA, READONLY
string DCB "Engineering\0"

	AREA dat2, DATA, READWRITE
length DCW 0x00

	AREA pgm, CODE, READONLY
	ldr r0, =string
	ldr r1, =length
loop ldrb r3, [r0], #1
	cmp r3, #"\0"
	addne r2, r2, #1
	bne loop
	str r2, [r1]

e b e
	end