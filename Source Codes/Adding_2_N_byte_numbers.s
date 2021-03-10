	AREA dat1, DATA, READONLY
src1 DCB 0xF5, 0x0A, 0x12, 0x71
src2 DCB 0x23, 0xA1, 0x00, 0x6F
n DCB 0x04

	AREA dat2, DATA, READWRITE
result DCB 0x00
	
	AREA pgm, CODE, READONLY
	ldr r0, =src1
	ldr r1, =src2
	ldr r2, =n
	ldr r3, =result
	ldr r4, [r2]					
loop ldrb r5, [r0], #1
	ldrb r6, [r1], #1
	add r7, r5, r6			
	add	r7, r7, r8			; Adding with carry
	tst r7, #0x0100				; To check for the 9th bit
	moveq r8, #0				; Zero flag is set
	movne r8, #1				; ZF=0 => r8 contains the carry 	   
	strb r7, [r3], #1
	sub r4, r4, #1
	cmp r4, #0
	bne loop				
e b e
	end