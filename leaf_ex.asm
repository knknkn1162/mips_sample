  .text
  .globl main
main:
  li $a0, 1
  li $a1, 2
  li $a2, 3
  li $a3, 4
  jal leaf_example
  add $a0, $v0, $zero
  li $v0, 1
  syscall
  li $v0, 10
  syscall

leaf_example:
  addi, $sp, $sp, -12
  # save local variable
  sw $t1, 8($sp)
  sw $t0, 4($sp)
  sw $s0, ($sp)
  add $t0, $a0, $a1
  add $t1, $a2, $a3
  sub $s0, $t0, $t1
  add $v0, $s0, $zero
  # restore local variable
  lw $s0, ($sp)
  lw $t0, 4($sp)
  lw $t1, 8($sp)
  addi $sp, $sp, 12
  jr $ra
