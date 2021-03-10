; Storing a value in memory
	AREA dat1, DATA, READONLY		  ; can initialise but can't modify
source DCD 0xABCD
	
	AREA dat2, DATA, READWRITE		  ; can't initialise but can modify	
dest DCD 0x00

	AREA pgm, CODE, READONLY
	ldr r0, =source				      ; pseudo instruction
	ldr r1, =dest
	ldr r2, [r0]
	str r2, [r1]
e b e
	end