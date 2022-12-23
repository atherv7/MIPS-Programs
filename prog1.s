#I pledge on my honor that I have
#given or recieved any unauthorized
#assistance on this assignment/examination
#UID: 117932324
#TerpLogin ID: aghone
#Section: 0205
	.text 
main:	li $v0, 5	#scanf
	syscall		#
	move $t1, $v0	#
	sw $t1, n 	#

	lw $t0 n	

	bnez $t0 state2	#checks if n==0
	j in	#if true goes inside statement
	
state2:	blez $t0 out 	#second condition 
	li $t5 10	#	
	div $t0 $t5	#
	mfhi $t1	#
	beqz $t1 out	#

in:	li $t7 0	#sets ans = 0
	sw $t7 ans	#
	lw $t1 ans	#
	
loop:	lw $t0 n 	#the loop in the main
	blez $t0 out	#function 
	lw $t1 ans	#
	li $t7 10	#
	mul $t8 $t1 $t7	#
	div $t0 $t7	#
	mfhi $t6	#
	add $t1 $t6 $t8	#
	sw $t1 ans	#
	div $t0 $t7	#
	mflo $t7	#
	sw $t7 n	#
	j loop 		#

out:	lw $a0 ans	#prints ans 
	li $v0 1	#
	syscall		#

	li $a0 10	#prints the 
	li $v0 11	#newline
	syscall		#

	li $v0 10	#ends the 
	syscall		#program 

#sets the global variables 
	.data
n:	.word 0
ans:	.word -1 
