	AREA dat1, DATA, READONLY
string DCB "Magnifera Indica\0"

	AREA dat2, DATA, READWRITE
len DCD 0x00
destination DCB 0x00

	AREA pgm, CODE, READONLY
	ldr r0, =string
	ldr r1, =len
	ldr r2, =destination
	
	; Length of string
loop1 ldrb r3, [r0], #1
	cmp r3, #"\0"
	addne r4, r4, #1
	bne loop1
	str r4, [r1]
	mov r5, #"z"
	ldr r0, =string

	; Replacing 'a' with 'z'
loop2 ldrb r3, [r0], #1
	ldrb r4, [r2]
	cmp r3, #"a"
	streqb r5, [r2], #1
	strneb r3, [r2], #1
	cmp r3, #"\0"
	bne loop2 
e b e
	end