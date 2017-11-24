     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
		VMOV.F32 S10, #6		; S10 = x = 6
        VMOV.F32 S0, S10		; S0 = x <numerator>
		VMOV.F32 S1, #1			; S1 = 1 <denominator>
		VMOV.F32 S14, #1		; Counter for factorial
		VMOV.F32 S2, #1			; initial value of ans(S2)
		MOV R1, #1
		MOV R2, #20			; number of iteration
		VMOV.F32 S4, #1			; used to increment S14 by 1
		; in loop
		; S3 = S0 / S1
		; S2 = S2 + S3
		; S0 = S0 * S10
		; S1 = S1 * S14
		; loop back
while	CMP R1, R2
		IT GT
		BGT loop
		VDIV.F32 S3, S0, S1
		VADD.F32 S2, S2, S3
		VMUL.F32 S0, S0, S10
		VADD.F32 S14, S14, S4
		VMUL.F32 S1, S1, S14
		ADD R1, R1, #1
		B while
loop	B loop
	ENDFUNC

	END