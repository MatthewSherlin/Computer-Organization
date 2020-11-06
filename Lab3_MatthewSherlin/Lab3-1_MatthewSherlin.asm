# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# November 6, 2020

.data
	prompt1: .asciiz "Adding Machine Program\nEnter integer to add to total\nor enter '0' to exit program and\nprint the sum.\n\n"
	prompt2: .asciiz "Enter an integer: "
	message1: .asciiz "\nFinal value of integers: "
	message2: .asciiz "\nEnding program"
	
.text

li $v0, 4		#reading the first prompt
la $a0, prompt1
syscall

loop:
li $v0, 4		#reading the second prompt
la $a0, prompt2
syscall

li $v0, 5		#entering user input
syscall
move $t0, $v0		#moving user input into temporary register

add $t1, $t1, $t0
	
bnez $t0, loop		#if integer != 0, continue the loop

li $v0, 4		#reading the first message
la $a0, message1
syscall

li $v0, 1		#displaying total
move $a0, $t1
syscall

li $v0, 4		#reading the second message
la $a0, message2
syscall

li $v0, 10              #terminate program run and exit
syscall 
