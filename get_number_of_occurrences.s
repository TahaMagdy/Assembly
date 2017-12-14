
# TahaMagdy
# 2017-12-14

	.data
p1:         .asciiz "Enter the size of array: "
p2:         .asciiz "Enter the array elements: \n"
p3:         .asciiz "Choose the number to compute its occurrences: "
p4:         .asciiz "number of occurrences : \n"
array:      .word 60 #(4*15)

	.text
   	.globl main
main:
	# printf("Enter the size of array: ");
	li      $v0, 4      # system call code for print string     
	la      $a0, p1     # load the sentence that exist in p1
	syscall		    # evaluate system call

	
	# scanf("%d",$size);
	li      $v0, 5      # system call code for scan integer
 	syscall	            # evaluate system call
	move    $a2, $v0    # move data that scanned from $v0 to $t0

	
	# printf("Enter your elements: \n");
	li      $v0, 4      # system call code for print string
	la      $a0, p2     # load the sentence that exist in p1	
	syscall	            # evaluate system call

	
	# begin scan loop
	la      $a3, array
	move    $t9, $a2
	li      $t8, 0      # setting t8 as a counter = 0
	li      $t7, 0      # setting t7 as an index
	

	jal scan_loop       # start filling the array

	
	# printf("Enter the number [to get # occurrences]: ");
	li      $v0, 4      # system call code for print string 
	la      $a0, p3     # load the sentence that exist in p3
	syscall	            # evaluate system call

	
	# scanf("%f",$num);
	li      $v0, 6      # system call code for scan float
 	syscall             # evaluate system call
	mov.s   $f1, $f0    # move data that scanned from $f0 to $f1 

	
	jal number_of_occurance 
	
	
	# printf("number of occurrences : ");
	li      $v0, 4      # system call code for print string
	la      $a0, p4     # load the sentence that exist in p4
	syscall	            # evaluate system call

	
	li      $v0, 1      # system call code for print integer 
	move    $a0, $v1    # move data that returned from $v1 to $a0 
	syscall             # evaluate system call
	
	li      $v0, 0      # system call code for end program
	syscall             # evaluate system call
	

#   // Populating the array
scan_loop: 
        beq     $t8,    $t9, end_scan_loop 
	
        li      $v0,    6         # 1* reading a number from the user
        syscall
        mov.s   $f12,   $f0       # store the user input in $f12

        add     $t7,    $t7, $a3  # 2* adding the number to the array
        s.s     $f12,   ($t7)     # store $f12 in the address of $t5
	
        addi    $t7,    $t7, 4    # 3* upating index
        add     $t8,    $t8, 1    # increase the counter by 1 [i++]
        j scan_loop	          # jump on the firt instruction of the loop

end_scan_loop:
        jr      $ra               # go back to the main



# // Computing occurances
number_of_occurance:

        # // initialization 
        li      $t1, 0
        li      $t3, 0
        li      $t0, 0

Loop:
        // # Condition
        beq     $t3, $a2, Exit
        add     $t2, $a3, $t0
        l.s     $f8, ($t2)
        c.eq.s  $f8, $f1 

        bc1t IF_Body                            

        # // updating the index and the counter
        addi    $t0, $t0, 4              
        addi    $t3, $t3, 1
        j Loop



IF_Body:

        addi    $t1, $t1, 1
        addi    $t0, $t0, 4 
        addi    $t3, $t3, 1
        j Loop


Exit:
        add     $v1, $t1, $zero
        jr      $ra
