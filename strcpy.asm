  .text
  .globl main
main:
  la $a1, hello
  la $a0, goodbye
  jal strcpy
  li $v0, 4
  ;la $a0, ($a0)
  syscall
  li $v0, 10
  syscall
strcpy:
  addi $sp, $sp, -4
  sw $s0, ($sp)
  li $s0, 0
L1:
  add $t1, $s0, $a1
  lbu $t2, 0($t1)
  add $t3, $s0, $a0
  sb $t2, 0($t3)
  beq $t2, $zero, L2
  addi $s0, $s0, 1
  j L1
L2:
  # restore
  lw $s0, 0($sp)
  addi $sp, $sp, 4
  jr $ra
  
  .data
hello: .asciiz "Hello!\n"
goodbye: .space 10
