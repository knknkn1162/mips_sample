  .text
  .globl main
main:
  li $s0, 3
  li $s1, 4
  li $s3, 1
  li $s4, 2
  bne $s0, $s1, Else
  j Exit
Else:
  add $s2, $s3, $s4
  li $v0, 1
  add $a0, $zero, $s2
  syscall
Exit:
  li $v0, 10
  syscall
