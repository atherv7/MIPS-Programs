#I pledge on my honor that I have not
#given or recieved any unauthorized
#assistance on this assignment/examination
#TerpLogin ID: aghone
#UID: 117932324
#Section: 0205

#sets the global variables 
	.data
number:	.word 0
result:	.word 0

	.text
main:	li $v0, 5	#scanf to set number
	syscall		#
	move $t1, $v0	#
	sw $t1, number	#

	jal cat 	#jumps to the function

	sw, $t2, result	#sets the answer of the
			#function to the result
			#variable

	lw $a0 result	#prints result 
	li $v0 1	#
	syscall		#

	li $a0 10	#prints the 
	li $v0 11	#newline
	syscall		#

	li $v0 10	#ends the program 
	syscall		#

#the catalan function 
cat:	sub $sp, $sp, 8	#prologue of the function	
	sw $ra, 8($sp)	#
	sw $fp, 4($sp)	#
	add $fp, $sp, 8	#
	
	li $t2, -1 	#ans variable
	lw $t3, number 	#n variable

	bltz $t3, end	#the if-statement 
	li $t2, 1	#sets ans to 1
	li $t4, 1 	#i variable
	
loop:	bgt $t4, $t3, end #the while loop condition
	
	li $t8, 2	  #the calculation
	mul $t5, $t8, $t4 #
	li $t8, 1	  #
	sub $t5, $t5, $t8 #
	li $t8, 2	  #
	mul $t5, $t5, $t8 #
	mul $t5, $t5, $t2 #
	li $t8, 1 	  #
	add $t6, $t4, $t8 #
	div $t5, $t6	  #
	mflo $t2	  #
	addi $t4, $t4, 1  #
	j loop 		  #

end:	lw $ra, 8($sp)	#epilogue of the function
	lw $fp, 4($sp)	#
	add $sp, $sp, 8	#
	jr $ra 		#
	
	 
