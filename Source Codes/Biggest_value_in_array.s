	AREA dat1, DATA, READONLY
array DCD 0x34, 0x0A546, 0x1000, 0x5D09
length DCD 0x04

	AREA dat2, DATA, READWRITE
biggest DCD	0x00

	AREA pgm, CODE, READONLY
	ldr r0, =array
	ldr r1, =length
	ldr r2, =biggest
	ldr r3, [r0]
	ldr r4, [r1] 
loop ldr r5, [r0], #4
	cmp r5, r3
	movcs r3, r5				; If carry is set, then r5>r3
	sub r4, r4, #1
	cmp r4, #0
	bne loop
	str r3, [r2]
e b e 
	end