    .data
        size:.word  0
        p1:.asciiz "Enter the size of array: "
        p2:.asciiz "Enter your elements: \n"
        p3:.asciiz "Enter the n     umber [to get # occurrences]: "
        p4:.asciiz "number of occurrences : \n  "


    .text

main:
    # printf("Enter the size of array: ");
    li $v0, 4    
    la $a0, p1
    syscall


    # scanf("%f",$size);
    li $v0, 5
    move $t0, $v0
    syscall

