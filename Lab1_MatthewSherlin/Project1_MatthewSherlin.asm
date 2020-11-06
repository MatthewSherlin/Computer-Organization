# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# October 15, 2020

.data
	prompt1: .asciiz "Computation for f = g - (f + 5) with user input."
	prompt2: .asciiz "\nEnter a value for f: "
	prompt3: .asciiz "Enter a value for g: "
	message: .asciiz "Answer for f = g - (f + 5): "
	space: .asciiz "\n"

.text

li $v0, 4		#reading the first prompt
la $a0, prompt1
syscall

li $s3, 3		# s3 is the 3 to end loop
li $t6, 0 		# t6 is the counter (i)	
loop:
beq $t6, $s3, end 	# if t6 == 3 (s3) we are done


li $v0, 4		#reading the second prompt
la $a0, prompt2
syscall

li $v0, 5		#entering user input
syscall

move $t0, $v0		#moving user input into temporary register

li $v0, 4		#reading the third prompt
la $a0, prompt3
syscall

li $v0, 5		#entering user input
syscall

move $s1, $v0		#moving user input into saved register

addi $t3, $t0, 5	#temp for (f+5)
sub $t4, $s1, $t3	#subtracting g - (f+5)

li $v0, 4		#reading the final message
la $a0, message
syscall

li $v0, 1		#displaying final answer
move $a0, $t4
syscall

li $v0, 4		#adding spacing for cleanliness of text
la $a0, space
syscall


addi $t6, $t6, 1 	# add 1 to t1
j loop 			# jump back to the top
end:
