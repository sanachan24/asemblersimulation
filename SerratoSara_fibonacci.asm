.data
prompt: .asciiz "Cuantos numeros tendra la serie fibonacci:"
result_msg: .asciiz "serie fibonacci:"
sum_msg:.asciiz "la suma es:"
max_msg: .asciiz "numero mayor:"
newline: .asciiz "\n"

.text
maim:
 li $t0, 0
 li $t1, 0
 li $t2, 1
 li $t3, 0
 li $t4, 0
 li $t5, 0

 li $v0, 4
 la $a0, prompt
 syscall 
 
 li $v0, 5
 syscall 
 move $t3, $v0

 move $t5, $t1
 addi $t0, $t0, 1

generate_fibonacci:
 bge $t0, $t3, print_results
 li $v0, 1
 move $a0, $t1
 syscall 
 add $t4, $t4, $t1
 bgt $t1, $t5, update_max
 j next
 
update_max:
 move $t5, $t1
 
next:
 add $t6, $t1, $t2
 move $t1, $t2
 move $t2, $t6
 addi $t0, $t0, 1
 j generate_fibonacci
 
print_results:
 li $v0, 4
 la $a0, newline 
 syscall 
 
 li $v0, 4
 la $a0, result_msg
 syscall 
 li $t0, 0
 move $t1, $t1
 move $t2, $t2
 
print_series:
 bge $t0, $t3, print_sum
 li $v0, 1
 move $a0, $t1
 syscall 
 
 li $v0, 4
 la $a0, newline
 syscall
 
 addi $t0, $t0, 1
 j print_series
 
print_sum:
 li $v0, 4
 la $a0, sum_msg
 syscall 
 
 li $v0, 1
 move $a0, $t4
 syscall
  
 li $v0, 4
 la $a0, newline
 syscall 
 
 li $v0, 4
 la $a0, max_msg
 syscall 
 
 li $v0, 1
 move $a0, $t5
 syscall 
 
 li $v0, 4
 la $a0, newline 
 syscall 
 
 li $v0, 10
 syscall 

 
 