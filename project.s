    .data
        size:.word  0
        p1:.asciiz "Enter the size of array: "
        p2:.asciiz "Enter your elements: \n"
        p3:.asciiz "Enter the n     umber [to get # occurrences]: "
        p4:.asciiz "number of occurrences : \n  "
        message: .asciiz "MM\n"


    .text
    .globl main

main:
    # printf("Enter the size of array: ");
    li $v0, 4    
    la $a0, p1
    syscall


    # scanf("%f",$size);
    li $v0, 5
    syscall

    # storing the size in $t9
    move $t9, $v0


#   # printing size (testing)
#   move $s0, $t9
#   li $v0, 1
#   move $a0, $s0
#   syscall

# Reading the elements
li $t8, 0 # setting counter = 0
loop: 
    # if the counter == size go to end segment
    beq     $t8, $t9, end 

    # loop body

    # printing an integer
    # put the value of $t0 into $s0, to prepare to print $t0
    move    $s0, $t8
    li      $v0, 1
    move    $a0, $s0
    syscall
     

    # increase the counter by 1
    add     $t8, $t8, 1 
    # jump on the firt instruction of the loop
    j loop


end:
    # END PROGRAM
    li $v0, 10
    syscall


