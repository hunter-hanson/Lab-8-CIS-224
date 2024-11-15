.data
    prompt1: .asciiz "Enter length: "
    prompt2: .asciiz "Enter width: "
    prompt3: .asciiz "Enter height: "
    result:  .asciiz "The volume is: "
    newline: .asciiz "\n"

.text
.globl main

main:
    # Print prompt for length
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read length
    li $v0, 5
    syscall
    move $s0, $v0  # Store length in $s0

    # Print prompt for width
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read width
    li $v0, 5
    syscall
    move $s1, $v0  # Store width in $s1

    # Print prompt for height
    li $v0, 4
    la $a0, prompt3
    syscall

    # Read height
    li $v0, 5
    syscall
    move $s2, $v0  # Store height in $s2

    # Call calculate_volume function
    move $a0, $s0  # Load length into $a0
    move $a1, $s1  # Load width into $a1
    move $a2, $s2  # Load height into $a2
    jal calculate_volume

    # Print result
    move $t0, $v0  # Store result in $t0
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall

calculate_volume:
    # Calculate volume: length * width * height
    mul $t0, $a0, $a1  # $t0 = length * width
    mul $v0, $t0, $a2  # $v0 = (length * width) * height

    jr $ra  # Return to caller