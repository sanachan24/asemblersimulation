.data
prompt: .asciiz "ingresa un número"
result_msg: .asciiz "numero mayor:"
newline: .asciiz "\n"

.text 
main: 
 li $t0, 0
 li $t1, 5
 li $t2, -2147483648

read_loop:
 bge $t0, $t1, done 
 li $v0, 4
 la $a0, prompt
 syscall
 
 li $v0, 5
 syscall
 move $t3, $v0
 bgt $t3, $t2, update_max
 j next
 
update_max:
 move $t2, $t3
 
next:
 addi $t0, $t0, 1
 j read_loop
 
done:
 li $v0, 4
 la $a0, result_msg
 syscall 
 
 li $v0, 1
 move $a0, $t2
 syscall 
 
 li $v0, 4
 la $a0, newline
 syscall 
 
 li $v0, 10
 syscall 