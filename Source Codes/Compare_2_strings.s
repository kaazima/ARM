	AREA dat1, DATA, READONLY
string1 DCB "blade\0"
string2 DCB "blame\0"

	AREA dat2, DATA, READWRITE
len1 DCD 0x00
len2 DCD 0x00

	AREA pgm, CODE, READONLY
	ldr r0, =string1
	ldr r1, =string2
	ldr r2, =len1
	ldr r3, =len2
	
	; Length of string1
loop1 ldrb r4, [r0], #1
	cmp r4, #"\0"
	addne r5, r5, #1
	bne loop1
	str r5, [r2]

	; Length of string2
	mov r5, #0
loop2 ldrb r4, [r1], #1
	cmp r4, #"\0"
	addne r5, r5, #1
	bne loop2
	str r5, [r3]

	; Comparing both the lengths
	ldr r4, [r2]
	ldr r5, [r3] 
	cmp r4, r5
	beq point
	movcs r6, #0x01						    ; Greater
	movcc r7, #0x01							; Smaller
	bne exit

	; If both the strings have same length
point ldr r0, =string1
	ldr r1, =string2
loop3 ldrb r4, [r0], #1
	ldrb r5, [r1], #1
	cmp r4, r5
	movcs r6, #0x01		  					; Greater
	moveq r6, #0x00							; Equal
	movcc r7, #0x01							; Smaller
	bne exit
	cmp r4, #"\0"
	bne loop3 
	mov r8, #0x01							; Equal

exit 
e b e
	end