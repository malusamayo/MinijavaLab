		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 56
		li $t0, 4
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 4
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, Test_run_test
		sw $t2, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $v0, $t1
		sw $v0, 8($sp)
		move $v0, $t0
		sw $v0, 0($sp)
		li $t0, 1
		li $t3, 2
		li $t4, 3
		li $t5, 4
		li $t6, 5
		li $t7, 6
		li $t8, 7
		li $t9, 8
		li $s0, 9
		li $s1, 10
		li $s2, 11
		li $s3, 12
		li $s4, 13
		li $s5, 14
		li $s6, 15
		li $v0, 16
		sw $v0, 4($sp)
		li $v0, 17
		sw $v0, 16($sp)
		li $v0, 18
		sw $v0, 12($sp)
		li $t2, 4
		move $a0, $t2
		li $v0, 9
		syscall
		move $s7, $v0
		move $t2, $s7
		li $t1, 19
		sw $t1, 0($t2)
		move $t1, $s7
		move $t2, $t1
		lw $v1, 0($sp)
		move $a0, $v1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		sw $t5 -12($sp)
		sw $t6 -16($sp)
		sw $t7 -20($sp)
		sw $t8 -24($sp)
		sw $t9 -28($sp)
		sw $s0 -32($sp)
		sw $s1 -36($sp)
		sw $s2 -40($sp)
		sw $s3 -44($sp)
		sw $s4 -48($sp)
		sw $s5 -52($sp)
		sw $s6 -56($sp)
		lw $v1, 4($sp)
		sw $v1 -60($sp)
		lw $v1, 16($sp)
		sw $v1 -64($sp)
		lw $v1, 12($sp)
		sw $v1 -68($sp)
		sw $t2 -72($sp)
		lw $v1, 8($sp)
		jalr $v1
		move $t1, $v0
		addu $sp, $sp, 56
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Test_run_test
Test_run_test:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 112
		sw $s0, 36($sp)
		sw $s1, 32($sp)
		sw $s2, 28($sp)
		sw $s3, 24($sp)
		sw $s4, 20($sp)
		sw $s5, 16($sp)
		sw $s6, 12($sp)
		sw $s7, 8($sp)
		move $t0, $a1
		move $t1, $a2
		move $t2, $a3
		lw $t3, 100($sp)
		lw $t4, 96($sp)
		lw $t5, 92($sp)
		lw $t6, 88($sp)
		lw $t7, 84($sp)
		lw $t8, 80($sp)
		lw $t9, 76($sp)
		lw $s0, 72($sp)
		lw $s1, 68($sp)
		lw $s2, 64($sp)
		lw $s3, 60($sp)
		lw $s4, 56($sp)
		lw $s5, 52($sp)
		lw $s6, 48($sp)
		lw $v0, 44($sp)
		sw $v0, 0($sp)
		lw $v0, 40($sp)
		sw $v0, 4($sp)
		move $s7, $t0
		move $a0, $s7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t2
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t3
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t4
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t5
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t6
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t7
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t8
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t9
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s2
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s3
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s4
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s5
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s6
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 0($sp)
		move $t0, $v1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 0($t0)
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
		lw $s0, 36($sp)
		lw $s1, 32($sp)
		lw $s2, 28($sp)
		lw $s3, 24($sp)
		lw $s4, 20($sp)
		lw $s5, 16($sp)
		lw $s6, 12($sp)
		lw $s7, 8($sp)
		addu $sp, $sp, 112
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

