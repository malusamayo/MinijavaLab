		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 24
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, A_print
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, A_change
		sw $t2, 4($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 0($t0)
		move $t0, $t2
		move $t2, $t0
		move $t0, $t1
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 4($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 8($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, A_print
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, D_change
		sw $t2, 4($t0)
		move $t0, $t1
		move $s1, $t0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 10
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s0, $v0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 4($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 8($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, A_print
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, D_change
		sw $t2, 4($t0)
		move $t0, $t1
		move $s1, $t0
		li $t0, 24
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 4($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 8($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 12($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 16($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 20($t0)
		move $t0, $t2
		la $t3, A_print
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, C_change
		sw $t2, 4($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $s1
		move $t2, $t0
		lw $t3, 0($t2)
		move $t2, $t3
		lw $t3, 4($t2)
		move $t2, $t3
		move $s2, $t2
		move $s3, $t0
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 100
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s4, $v0
		move $a0, $s3
		move $a1, $s4
		jalr $s2
		move $s0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 24
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_change
A_change:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t0, $t1
		sw $t0, 4($t2)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_print
A_print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl B_change
B_change:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t3, $t1
		li $t4, 1
		add $t5, $t3, $t4
		sw $t5, 8($t2)
		move $t2, $t0
		move $t0, $t1
		sw $t0, 12($t2)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl C_change
C_change:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t3, $t1
		sw $t3, 16($t2)
		move $t2, $t0
		move $t3, $t0
		lw $t0, 16($t3)
		move $t3, $t0
		move $t0, $t3
		move $t3, $t1
		add $t1, $t0, $t3
		sw $t1, 20($t2)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl D_change
D_change:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t0, $t1
		sw $t0, 12($t2)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

