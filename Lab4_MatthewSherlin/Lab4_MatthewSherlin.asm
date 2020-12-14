# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# November 15, 2020

.data
	prompt1: .asciiz "Spelling out a positive integer program.\n"
	prompt2: .asciiz "Enter an integer: "
	zero: .asciiz "Zero "
	one: .asciiz "One "
	two: .asciiz "Two "
	three: .asciiz "Three "
	four: .asciiz "Four "
	five: .asciiz "Five "
	six: .asciiz "Six "
	seven: .asciiz "Seven "
	eight: .asciiz "Eight "
	nine: .asciiz "Nine "
	messageError: .asciiz "Invalid entry"
.text

li $v0, 4		#reading the first prompt
la $a0, prompt1
syscall

li $v0, 4		#reading the second prompt
la $a0, prompt2
syscall

li $v0, 5		#entering user input
syscall
move $t0, $v0		#moving user input into saved register

li $t9, 10		#setting the divisor to 10 
li $t8, -1		#getting offset for digits
 
blt $t0, $zero, error	#case for where input is less than zero or equal to only one zero
beq $t0, $zero, one0	#case for when input is equal to only one zero
   
while:			#create while loop while the input isn't zero
bne $t0,$0, loop1
beq $t2,$0,end		#when the quotient is equal to zero, branch to the end of loop1

loop1: 			#loop in order to find the digits to print out
div $t0,$t9
mflo $t3		#quotient stored into t3
mfhi $t2		#remainder stored into t2

add $t0,$t3,$zero		
addi $t8,$t8,1  	#add one to digit count
addi $sp,$sp,4		#add word onto stack pointer for each of the digits
sw $t2,0($sp)		#store remainder onto current word in the stack
j while

end:
lw $t2,0($sp)		
  
loop2:   
beq $t8,$0,exit		#if there are zero digits left, exit
addi $sp,$sp,-4		#get rid of last word on stack
lw $t2,0($sp)		#load next word to find the number inside it
addi $t8,$t8,-1		#subtract from the digit count
   
labe1:
bne $t2,1,label2	#branch to next number if it is not equal (same for all)
li $v0, 4
la $a0,one		#read the number prompt out
syscall
j loop2

label2:
bne $t2,2,label3
li $v0, 4
la $a0,two
syscall
j loop2

label3:
bne $t2,3,label4
li $v0, 4
la $a0, three
syscall
j loop2

label4:
bne $t2,4,label5
li $v0, 4
la $a0,four
syscall
j loop2
   
label5:
bne $t2,5,label6
li $v0, 4
la $a0,five
syscall
j loop2
   
label6:
bne $t2,6,label7
li $v0, 4
la $a0,six
syscall
j loop2
   
label7:
bne $t2,7,label8
li $v0, 4
la $a0,seven
syscall
j loop2  
   
label8:
bne $t2,8,label9
li $v0, 4
la $a0,eight
syscall
j loop2

label9:
bne $t2,9,label0
li $v0, 4
la $a0,nine
syscall
j loop2

label0:   
li $v0, 4
la $a0,zero
syscall
j loop2
   
one0:			#case if the value is a single 0 or equal to zero (000 for example)
li $v0, 4	
la $a0, zero
syscall
j exit
 
error:			#error case if number is negative
li $v0, 4	
la $a0, messageError
syscall

exit:
li $v0, 10              #terminate program run and exit
syscall 
