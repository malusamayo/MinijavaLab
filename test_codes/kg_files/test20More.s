		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 144
		li $t0, 8
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
		move $t0, $t1
		li $t3, 0
		sw $t3, 4($t0)
		move $t0, $t2
		la $t2, Test_run_test
		sw $t2, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		move $t2, $t0
		lw $t3, 0($t2)
		move $t2, $t3
		lw $t3, 0($t2)
		move $t2, $t3
		move $v0, $t2
		sw $v0, 56($sp)
		move $v0, $t0
		sw $v0, 52($sp)
		li $v0, 1
		sw $v0, 44($sp)
		li $v0, 2
		sw $v0, 36($sp)
		li $v0, 3
		sw $v0, 32($sp)
		li $v0, 4
		sw $v0, 28($sp)
		li $v0, 5
		sw $v0, 40($sp)
		li $v0, 6
		sw $v0, 48($sp)
		li $v0, 7
		sw $v0, 104($sp)
		li $v0, 8
		sw $v0, 100($sp)
		li $v0, 9
		sw $v0, 96($sp)
		li $v0, 10
		sw $v0, 92($sp)
		li $v0, 11
		sw $v0, 88($sp)
		li $v0, 12
		sw $v0, 84($sp)
		li $v0, 13
		sw $v0, 80($sp)
		li $v0, 14
		sw $v0, 76($sp)
		li $v0, 15
		sw $v0, 72($sp)
		li $v0, 16
		sw $v0, 68($sp)
		li $v0, 17
		sw $v0, 64($sp)
		li $v0, 18
		sw $v0, 60($sp)
		li $t0, 24
		move $a0, $t0
		li $v0, 9
		syscall
		move $v0, $v0
		sw $v0, 24($sp)
		lw $v1, 24($sp)
		move $t0, $v1
		li $t2, 19
		sw $t2, 0($t0)
		lw $v1, 24($sp)
		move $t0, $v1
		li $t2, 20
		sw $t2, 4($t0)
		lw $v1, 24($sp)
		move $t0, $v1
		li $t2, 21
		sw $t2, 8($t0)
		lw $v1, 24($sp)
		move $t0, $v1
		li $t2, 22
		sw $t2, 12($t0)
		lw $v1, 24($sp)
		move $t0, $v1
		li $t2, 23
		sw $t2, 16($t0)
		lw $v1, 24($sp)
		move $v0, $v1
		sw $v0, 20($sp)
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 100
		li $t3, 200
		li $t4, 300
		li $t5, 400
		li $t6, 500
		li $t7, 600
		li $t8, 700
		li $t9, 800
		li $s7, 900
		li $s2, 1000
		li $s6, 1100
		li $s3, 1200
		li $s4, 1300
		li $v0, 1400
		sw $v0, 0($sp)
		li $v0, 1500
		sw $v0, 8($sp)
		li $v0, 1600
		sw $v0, 4($sp)
		li $v0, 1700
		sw $v0, 16($sp)
		li $v0, 1800
		sw $v0, 12($sp)
		li $s0, 24
		move $a0, $s0
		li $v0, 9
		syscall
		move $s1, $v0
		move $s0, $s1
		li $s5, 1900
		sw $s5, 0($s0)
		move $s0, $s1
		li $s5, 2000
		sw $s5, 4($s0)
		move $s0, $s1
		li $s5, 2100
		sw $s5, 8($s0)
		move $s0, $s1
		li $s5, 2200
		sw $s5, 12($s0)
		move $s0, $s1
		li $s5, 2300
		sw $s5, 16($s0)
		move $s0, $s1
		li $s5, 2400
		sw $s5, 20($s0)
		move $s0, $s1
		move $s1, $s0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		sw $t5 -12($sp)
		sw $t6 -16($sp)
		sw $t7 -20($sp)
		sw $t8 -24($sp)
		sw $t9 -28($sp)
		sw $s7 -32($sp)
		sw $s2 -36($sp)
		sw $s6 -40($sp)
		sw $s3 -44($sp)
		sw $s4 -48($sp)
		lw $v1, 0($sp)
		sw $v1 -52($sp)
		lw $v1, 8($sp)
		sw $v1 -56($sp)
		lw $v1, 4($sp)
		sw $v1 -60($sp)
		lw $v1, 16($sp)
		sw $v1 -64($sp)
		lw $v1, 12($sp)
		sw $v1 -68($sp)
		sw $s1 -72($sp)
		jalr $t2
		move $s0, $v0
		lw $v0, 20($sp)
		sw $s0, 20($v0)
		lw $v1, 24($sp)
		move $t0, $v1
		move $t1, $t0
		lw $v1, 52($sp)
		move $a0, $v1
		lw $v1, 44($sp)
		move $a1, $v1
		lw $v1, 36($sp)
		move $a2, $v1
		lw $v1, 32($sp)
		move $a3, $v1
		lw $v1, 28($sp)
		sw $v1 -12($sp)
		lw $v1, 40($sp)
		sw $v1 -16($sp)
		lw $v1, 48($sp)
		sw $v1 -20($sp)
		lw $v1, 104($sp)
		sw $v1 -24($sp)
		lw $v1, 100($sp)
		sw $v1 -28($sp)
		lw $v1, 96($sp)
		sw $v1 -32($sp)
		lw $v1, 92($sp)
		sw $v1 -36($sp)
		lw $v1, 88($sp)
		sw $v1 -40($sp)
		lw $v1, 84($sp)
		sw $v1 -44($sp)
		lw $v1, 80($sp)
		sw $v1 -48($sp)
		lw $v1, 76($sp)
		sw $v1 -52($sp)
		lw $v1, 72($sp)
		sw $v1 -56($sp)
		lw $v1, 68($sp)
		sw $v1 -60($sp)
		lw $v1, 64($sp)
		sw $v1 -64($sp)
		lw $v1, 60($sp)
		sw $v1 -68($sp)
		sw $t1 -72($sp)
		lw $v1, 56($sp)
		jalr $v1
		move $t0, $v0
		addu $sp, $sp, 144
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Test_run_test
Test_run_test:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 116
		sw $s0, 40($sp)
		sw $s1, 36($sp)
		sw $s2, 32($sp)
		sw $s3, 28($sp)
		sw $s4, 24($sp)
		sw $s5, 20($sp)
		sw $s6, 16($sp)
		sw $s7, 12($sp)
		move $v0, $a0
		sw $v0, 8($sp)
		move $t1, $a1
		move $t2, $a2
		move $t3, $a3
		lw $t4, 104($sp)
		lw $t5, 100($sp)
		lw $t6, 96($sp)
		lw $t7, 92($sp)
		lw $t8, 88($sp)
		lw $t9, 84($sp)
		lw $s0, 80($sp)
		lw $s1, 76($sp)
		lw $s2, 72($sp)
		lw $s3, 68($sp)
		lw $s4, 64($sp)
		lw $s5, 60($sp)
		lw $s6, 56($sp)
		lw $s7, 52($sp)
		lw $v0, 48($sp)
		sw $v0, 0($sp)
		lw $v0, 44($sp)
		sw $v0, 4($sp)
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
		move $t0, $s7
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
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 4($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 8($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 12($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 16($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $t1, 20($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 4($sp)
		move $t0, $v1
		lw $v1, 4($sp)
		move $t1, $v1
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		lw $v1, 4($sp)
		move $t1, $v1
		lw $t3, 12($t1)
		move $t1, $t3
		move $t3, $t1
		mul $t1, $t2, $t3
		sw $t1, 20($t0)
		lw $v1, 8($sp)
		move $t0, $v1
		li $t1, 1241
		li $t2, 4
		li $t3, 1
		move $t4, $t1
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		move $a0, $t3
		li $v0, 9
		syscall
		move $t2, $v0
		move $t3, $t2
		move $t4, $t1
		sw $t4, 0($t3)
		move $t1, $t2
		move $t2, $t1
		sw $t2, 4($t0)
		lw $v1, 8($sp)
		move $t0, $v1
		lw $t1, 4($t0)
		move $t0, $t1
		li $t1, 4
		li $t2, 1
		lw $v1, 8($sp)
		move $t3, $v1
		lw $t4, 4($t3)
		move $t3, $t4
		move $t4, $t3
		move $t3, $t4
		lw $t4, 0($t3)
		move $t3, $t4
		move $t4, $t3
		li $t3, 1
		sub $t5, $t4, $t3
		add $t3, $t2, $t5
		mul $t2, $t1, $t3
		add $t1, $t0, $t2
		move $t0, $t1
		li $t1, 100
		sw $t1, 0($t0)
		lw $v1, 8($sp)
		move $t0, $v1
		lw $t1, 4($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		li $t2, 4
		li $t3, 1
		lw $v1, 8($sp)
		move $t4, $v1
		lw $t5, 4($t4)
		move $t4, $t5
		move $t5, $t4
		move $t4, $t5
		lw $t5, 0($t4)
		move $t4, $t5
		move $t5, $t4
		li $t4, 1
		sub $t6, $t5, $t4
		add $t4, $t3, $t6
		mul $t3, $t2, $t4
		add $t1, $t0, $t3
		move $t0, $t1
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
		lw $s0, 40($sp)
		lw $s1, 36($sp)
		lw $s2, 32($sp)
		lw $s3, 28($sp)
		lw $s4, 24($sp)
		lw $s5, 20($sp)
		lw $s6, 16($sp)
		lw $s7, 12($sp)
		addu $sp, $sp, 116
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

