# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# November 6, 2020

.data
	prompt1: .asciiz "Enter an integer for the three variables, x, y and z.\nThis program will choose the two highest integers and\nprint the sum of them."
	prompt2: .asciiz "\n\nEnter a value for x: "
	prompt3: .asciiz "Enter a value for y: "
	prompt4: .asciiz "Enter a value for z: "
	message1: .asciiz "\nThe final sum is: "
	
.text

li $v0, 4		#reading the first prompt
la $a0, prompt1
syscall

li $v0, 4		#reading the second prompt
la $a0, prompt2
syscall
li $v0, 5		#entering user input
syscall
move $s0, $v0		#moving user input into saved register

li $v0, 4		#reading the third prompt
la $a0, prompt3
syscall
li $v0, 5		#entering user input
syscall
move $s1, $v0		#moving user input into saved register


li $v0, 4		#reading the fourth prompt
la $a0, prompt4
syscall
li $v0, 5		#entering user input
syscall
move $s2, $v0		#moving user input into saved register

slt $t0, $s1, $s0	#compare y < x
beq $t0, $zero, else	#if false, go to else
add $t1, $t1, $s0	#add x to sum (temp1)
slt $t0, $s1, $s2	#compare y < z
beq $t0, $zero, else2	#if false, go to else
add $t1, $t1, $s2	#add z to sum
j endif
else2:
add $t1, $t1, $s1	#add y to sum
j endif

else:
add $t1, $t1, $s1	#add y to sum (temp1)
slt $t0, $s0, $s2	#compare x < z
beq $t0, $zero, else3	#if false, go to else
add $t1, $t1, $s2	#add z to sum
j endif
else3:
add $t1, $t1, $s0	#add x to sum
j endif

endif:

li $v0, 4		#reading the final message
la $a0, message1
syscall

li $v0, 1		#displaying total
move $a0, $t1
syscall

li $v0, 10              #terminate program run and exit
syscall 



