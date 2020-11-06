# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# October 29, 2020

.data
	prompt1: .asciiz "Enter two values into each register. The program will swap and print results."
	prompt2: .asciiz "\nEnter a value for x: "
	prompt3: .asciiz "Enter a value for y: "
	message1: .asciiz "\nSwapping x and y."
	message2: .asciiz "\n\nThe value of x is now: "
	message3: .asciiz "\nThe value of y is now: "
	
.text

li $v0, 4		#reading the first prompt
la $a0, prompt1
syscall

li $v0, 4		#reading the second prompt
la $a0, prompt2
syscall

li $v0, 5		#entering user input
syscall

add $s0, $zero, $v0 	#setting value to s0 without move

li $v0, 4		#reading the third prompt
la $a0, prompt3
syscall

li $v0, 5		#entering user input
syscall

add $s1, $zero, $v0 	#setting value to s1 without move

li $v0, 4		#reading the first message
la $a0, message1
syscall

add $t0, $zero, $s0	#swap s0 into temporary register
add $s0, $zero, $s1	#swap s1 into s0
add $s1, $zero, $t0	#retrieve s0 original value from temporary and place into s1

li $v0, 4		#reading the second message
la $a0, message2
syscall

li $v0, 1		#displaying final answer pt1
add $a0, $zero, $s0
syscall

li $v0, 4		#reading the final message
la $a0, message3
syscall

li $v0, 1		#displaying final answer pt2
add $a0, $zero, $s1
syscall

li $v0, 10              #terminate program run and exit
syscall 		