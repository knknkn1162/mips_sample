  .text
  .globl main
main:
  li $a0, 3
  jal fact
  add $a0, $v0, $zero
  li $v0, 1
  syscall
  li $v0, 10
  syscall
fact:
  addi $sp, $sp, -8
  sw $ra, 4($sp)
  sw $a0, ($sp)
  slti $t0, $a0, 1
  beq $t0, $zero, L1
  addi $v0, $zero, 1
  # pull up because no longer use 4($sp) or ($sp)
  addi $sp, $sp, 8
  jr $ra
L1:
  addi $a0, $a0, -1
  jal fact
  lw $a0, ($sp)
  lw $ra, 4($sp)
  addi $sp, $sp, 8
  mul $v0, $a0, $v0
  jr $ra
