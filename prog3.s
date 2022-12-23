#I pledge on my honor that I have not
#given or received any unauthorized
#on this assignment/examination
#TerpLogin ID: aghone
#UID: 117932324
#Section: 0205

#sets the global variables of the
#program 
	.data
number:	.word 0
result:	.word 0

	.text
main:	li $v0, 5	#scanf to set 
	syscall		#number variable
	move $t1, $v0	#
	sw $t1, number	#
	
	lw $a0, number	#loads the argument
			#of the function
	
	jal cat 	#jumps the function
	
	sw $v0, result	#saves the result of
			#the function to the 
			#result variable

	lw $a0, result	#prints result 
	li $v0, 1	#
	syscall		#

	li $a0, 10	#prints the 
	li $v0, 11	#newline
	syscall		#

	li $v0, 10	#ends the program 
	syscall		#


cat:	sub $sp, $sp, 8	#prologue 
	sw $ra, 8($sp)	#
	sw $fp, 4($sp)	#
	add $fp, $sp, 8	#

	li $v0, 1	#sets the base case
			#if the if statement
			#goes into the statement
			#v0 will be changed since
			#then the function is not
			#in the base case 

	beqz $a0, ret	#checks if the function
			#is at the base case 

	move $fp, $a0 	  #saves the arugment
	
	addi $a0, $a0, -1 #decrements the arg
	
	jal cat		  #calls the function
			  #again until the base
			  #case is met the rest
			  #of the code is only
			  #executed once the code
			  #starts going back up the
			  #stack
	
	li $t2, 2	  #the calculation to get the
	mul $t8, $fp, $t2 #answer 
	addi $t8, $t8, -1 #
	mul $t8, $t8, $t2 #
	mul $t8, $t8, $v0 #
	addi $t4, $fp, 1  #
	div $t8, $t4	  #
	mflo $v0 	  #
	

ret:	lw $ra, 8($sp)	#epilogue of the function
	lw $fp, 4($sp)  #
	add $sp, $sp, 8 #
	jr $ra		#


