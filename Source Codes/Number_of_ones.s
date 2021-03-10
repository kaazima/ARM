	AREA data, DATA, READONLY
input DCB 2_01010110

	AREA pgm, CODE, READONLY
	ldr r0, =input
	ldr r1, [r0]
loop cmp r2, #5 					   ; To clear carry bit of CPSR each time
	lsrs r1, r1, #1
	addcs r5, r5, #1
	cmp r1, #0
	bne loop
e b e
	end