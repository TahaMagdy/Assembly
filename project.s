    .data
        size:.word  0
        p1:.asciiz "Enter the size of array: "
        p2:.asciiz "Enter your elements: \n"
        p3:.asciiz "Enter the n     umber [to get # occurrences]: "
        p4:.asciiz "number of occurrences : \n  "
        message: .asciiz "MM\n"
        array: .space 60 #(4*15)


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
la $t4, array
li $t8, 0 # setting t8 as a counter = 0
li $t7, 0 # setting t7 as an index
li $t6, 0 # setting t6 as temp to hold the use input
loop: 
    # if the counter == size go to end segment
    beq     $t8, $t9, end 

    # loop body

    # 1* reading a number from the user
    li $v0, 6
    syscall

    # store the user input in t6
    mov.s $f6, $f0


    # 2* add the number to the array
    add $t5, $t7, $t4
    sw $t6, ($t5)


    # 3* upating index
    addi $t7, $t7, 4


#   # (TEST) printing  the user input
#   move    $s0, $t6
#   li      $v0, 1
#   move    $a0, $s0
#   syscall
     

    # increase the counter by 1
    add     $t8, $t8, 1 
    # jump on the firt instruction of the loop
    j loop


end:
    # END PROGRAM
    li $v0, 10
    syscall


