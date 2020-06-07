		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 4
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 12
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, A_B_C_D
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, A_B_C_D_
		sw $t3, 4($t0)
		move $t0, $t2
		la $t2, A_B_C_D__
		sw $t2, 8($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s0, $v0
		move $a0, $s0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 8
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_B_C_D
A_B_C_D:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_B_C_D_
A_B_C_D_:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_B_C_D__
A_B_C_D__:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 2
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

