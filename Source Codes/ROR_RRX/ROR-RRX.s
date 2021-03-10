	AREA pgm, CODE, READONLY

	mov r0, #3				 
	ROR r1, r0, #1			 ;ROR

	mov r5, #3
	cmp r5, #1 			     ;Set carry flag

	mov r2, #4
	RRX r3, r2				 ;RRX

	mov r0, #2
	mov r1, r0, ROR #1		 ;ROR

	mov r5, #3
	cmp r5, #1 				 ;Set carry flag

	mov r2, #4
	mov r3, r2, RRX			 ;RRX
e b e
	end