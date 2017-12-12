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




    # END PROGRAM
    li $v0, 10
    syscall
