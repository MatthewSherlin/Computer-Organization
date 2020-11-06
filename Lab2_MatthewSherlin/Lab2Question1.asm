# Matthew Michael Sherlin
# Dr. Augustine Samba
# Computer Organization
# October 15, 2020

.data
	prompt1: .asciiz "If Else statement for [(x-y) >= w] with user input.\nIf (x-y) is greater or equal to w, x will be set to y.\nOtherwise, x will be set to z.\n"
	prompt2: .asciiz "\nEnter a value for w: "
	prompt3: .asciiz "Enter a value for x: "
	prompt4: .asciiz "Enter a value for y: "
	prompt5: .asciiz "Enter a value for z: "
	message1: .asciiz "\nSetting x to y."
	message2: .asciiz "\nSetting x to z. "
	message3: .asciiz "\n\nThe value of x is now: "
	
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

li $v0, 4		#reading the fifth prompt
la $a0, prompt5
syscall
li $v0, 5		#entering user input
syscall
move $s3, $v0		#moving user input into saved register

sub $t4, $s1, $s2	#subtracting
blt $t4, $s0, else	#test if x-y < if so go to else:
li $v0, 4		#read prompt
la $a0, message1
syscall
move $s1, $s2		#store value of y into x
j endif			#jump to endif
else:
li $v0, 4		#read prompt
la $a0, message2
syscall
move $s1, $s3		#store value of z into x
endif:

li $v0, 4		#reading the final message
la $a0, message3
syscall

li $v0, 1		#displaying final answer
move $a0, $s1
syscall

li $v0, 10              #terminate program run and exit
syscall 


