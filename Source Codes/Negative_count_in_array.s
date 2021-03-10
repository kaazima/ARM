; Count number of negative values in an array
	AREA dat, DATA, READONLY
data DCW 0x5404, 0xDF60, -0x005A, 0x800B
len DCW 4

	AREA pgm, CODE, READONLY
	ldr r0, =data
	ldr r1, =len
	ldr r2, [r1]
loop ldrh r3, [r0], #2
	ands r4, r3, #0x8000
	addne r5, r5, #1
	sub r2, r2, #1
	cmp r3, #0
	bne loop
e b e
	end