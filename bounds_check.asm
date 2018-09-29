  .text
  .globl main
main:
  li $s1, 1
  li $s2, 0
  sltu $t0, $s1, $s2
  beq $t0, $zero, Print
Exit:
  li $v0, 10
  syscall
Print:
  li $v0, 1
  add $a0, $t0, $zero
  syscall
  j Exit
