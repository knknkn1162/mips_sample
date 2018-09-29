  .text
  .globl main
main:
  li $s0, 1
  li $s1, 5
Loop:
  blt $s1, $s0, Exit
  addi $s0, 1
  li $v0, 1
  addi $a0, $s0, 0
  syscall
  li $v0, 11
  li $a0, 0x0a
  syscall
  j Loop
Exit:
  li $v0, 10
  syscall
