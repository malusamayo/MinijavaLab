		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 32
		li $t0, 3
		li $t1, 4
		li $t2, 1
		move $t3, $t0
		add $t4, $t2, $t3
		mul $t2, $t1, $t4
		move $a0, $t2
		li $v0, 9
		syscall
		move $t1, $v0
		move $t2, $t1
		move $t3, $t0
		sw $t3, 0($t2)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		li $t0, 4
		li $t2, 1
		li $t3, 2
		add $t4, $t2, $t3
		mul $t2, $t0, $t4
		add $t0, $t1, $t2
		move $t1, $t0
		li $t0, 10
		sw $t0, 0($t1)
		move $t0, $s0
		move $t1, $t0
		li $t2, 4
		li $t3, 1
		li $t4, 2
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t0, $t1, $t3
		move $t1, $t0
		lw $t0, 0($t1)
		move $t1, $t0
		move $t0, $t1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t0, 0($t1)
		move $t1, $t0
		move $t0, $t1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 4
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
		move $t0, $t2
		la $t3, A_getArray
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, A_getidx
		sw $t2, 4($t0)
		move $t0, $t1
		move $s1, $t0
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
		move $s2, $v0
		move $t0, $s2
		li $t1, 4
		li $t2, 1
		li $t3, 0
		add $t4, $t2, $t3
		mul $t2, $t1, $t4
		add $s2, $t0, $t2
		move $t0, $s2
		lw $t1, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
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
		move $s2, $v0
		move $t0, $s2
		lw $s2, 0($t0)
		move $t0, $s2
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
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
		move $t0, $s0
		move $s2, $t0
		li $s3, 4
		li $s4, 1
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		add $t0, $s4, $s5
		mul $t1, $s3, $t0
		add $t0, $s2, $t1
		move $t1, $t0
		li $t0, 8
		sw $t0, 0($t1)
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
		move $s2, $v0
		move $s3, $s2
		li $s4, 4
		li $s5, 1
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s6, $v0
		add $t0, $s5, $s6
		mul $t1, $s4, $t0
		add $s2, $s3, $t1
		move $t0, $s2
		lw $t1, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		move $t0, $t1
		li $t1, 4
		li $t2, 1
		li $t3, 2
		add $t4, $t2, $t3
		mul $t2, $t1, $t4
		add $t1, $t0, $t2
		move $t0, $t1
		li $t1, 10
		sw $t1, 0($t0)
		move $s2, $s0
		move $s0, $s2
		li $s3, 4
		li $s4, 1
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s1, $v0
		add $t0, $s4, $s1
		mul $t1, $s3, $t0
		add $s2, $s0, $t1
		move $t0, $s2
		lw $t1, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 32
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_getArray
A_getArray:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 10
		li $t1, 4
		li $t2, 1
		move $t3, $t0
		add $t4, $t2, $t3
		mul $t2, $t1, $t4
		move $a0, $t2
		li $v0, 9
		syscall
		move $t1, $v0
		move $t2, $t1
		move $t3, $t0
		sw $t3, 0($t2)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		move $t2, $t0
		li $t0, 4
		li $t3, 1
		li $t4, 0
		add $t5, $t3, $t4
		mul $t3, $t0, $t5
		add $t0, $t2, $t3
		move $t2, $t0
		li $t0, 1
		sw $t0, 0($t2)
		move $t0, $t1
		move $t2, $t0
		li $t0, 4
		li $t3, 1
		li $t4, 2
		add $t5, $t3, $t4
		mul $t3, $t0, $t5
		add $t0, $t2, $t3
		move $t2, $t0
		li $t0, 7
		sw $t0, 0($t2)
		move $t0, $t1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_getidx
A_getidx:
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

