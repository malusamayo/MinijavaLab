		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 44
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
		move $v0, $t0
		sw $v0, 4($sp)
		lw $v1, 4($sp)
		move $t0, $v1
		move $t1, $t0
		li $t0, 4
		li $t2, 1
		li $t3, 1
		add $t4, $t2, $t3
		mul $t2, $t0, $t4
		add $t0, $t1, $t2
		move $t1, $t0
		li $t0, 7
		lw $v1, 4($sp)
		move $t2, $v1
		move $t3, $t2
		lw $t2, 0($t3)
		move $t3, $t2
		move $t2, $t3
		add $t3, $t0, $t2
		sw $t3, 0($t1)
		lw $v1, 4($sp)
		move $t0, $v1
		move $t1, $t0
		li $t2, 4
		li $t3, 1
		li $t4, 1
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t0, $t1, $t3
		move $t1, $t0
		lw $t0, 0($t1)
		move $t1, $t0
		move $t0, $t1
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
		li $t2, 4
		li $t3, 1
		li $t4, 1
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t1, $t0, $t3
		move $t0, $t1
		lw $t1, 0($t0)
		move $t0, $t1
		move $t1, $t0
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
		move $s1, $t0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s2, $t1
		move $s3, $t0
		move $t0, $s1
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
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s4, $v0
		li $s5, 2
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 10
		li $t3, 20
		li $t4, 30
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s6, $v0
		move $a0, $s3
		move $a1, $s4
		move $a2, $s5
		move $a3, $s6
		jalr $s2
		move $t1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s2, $t1
		move $s3, $t0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s4, $t1
		move $s5, $t0
		li $s6, 100
		li $s7, 200
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 1000
		li $t3, 2000
		li $t4, 3000
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s0, $v0
		move $a0, $s5
		move $a1, $s6
		move $a2, $s7
		move $a3, $s0
		jalr $s4
		move $v0, $v0
		sw $v0, 0($sp)
		li $s0, 2
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 10
		li $t3, 20
		li $t4, 30
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s1, $v0
		move $a0, $s3
		lw $v1, 0($sp)
		move $a1, $v1
		move $a2, $s0
		move $a3, $s1
		jalr $s2
		move $t1, $v0
		li $t0, 12
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
		move $t0, $t1
		li $t3, 0
		sw $t3, 8($t0)
		move $t0, $t2
		la $t2, A_call
		sw $t2, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 0($t0)
		move $t0, $t2
		move $t2, $t0
		move $t0, $t1
		li $t1, 1
		li $t3, 2
		li $t4, 3
		lw $v1, 4($sp)
		move $t5, $v1
		move $t6, $t5
		li $t7, 4
		li $t8, 1
		li $t9, 1
		add $s0, $t8, $t9
		mul $t8, $t7, $s0
		add $t5, $t6, $t8
		move $t6, $t5
		lw $t5, 0($t6)
		move $t6, $t5
		move $t5, $t6
		lw $v1, 4($sp)
		move $t6, $v1
		move $t7, $t6
		lw $t6, 0($t7)
		move $t7, $t6
		move $t6, $t7
		slt $t7, $t5, $t6
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		sw $t7 -12($sp)
		jalr $t2
		move $s0, $v0
		li $t0, 2
		slt $t1, $s0, $t0
		beqz $t1, L0
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
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 0($t0)
		move $t0, $t2
		move $s0, $t0
		move $s1, $t1
		li $t0, 12
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
		move $t0, $t1
		li $t3, 0
		sw $t3, 8($t0)
		move $t0, $t2
		la $t2, A_call
		sw $t2, 0($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 0($t0)
		move $t0, $t2
		move $t2, $t0
		move $t0, $t1
		li $t1, 4
		li $t3, 3
		li $t4, 2
		li $t5, 1
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		sw $t5 -12($sp)
		jalr $t2
		move $s2, $v0
		lw $v1, 4($sp)
		move $t0, $v1
		move $t1, $t0
		li $t2, 4
		li $t3, 1
		li $t4, 1
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t0, $t1, $t3
		move $t1, $t0
		lw $t0, 0($t1)
		move $t1, $t0
		move $t0, $t1
		lw $v1, 4($sp)
		move $t1, $v1
		move $t2, $t1
		lw $t1, 0($t2)
		move $t2, $t1
		move $t1, $t2
		move $a0, $s1
		move $a1, $s2
		move $a2, $t0
		move $a3, $t1
		jalr $s0
		move $s3, $v0
		move $a0, $s3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		b L1
L0:		nop
L1:		nop
		addu $sp, $sp, 44
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Test_run_test
Test_run_test:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
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
		.globl A_call
A_call:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t3, $t1
		sw $t3, 4($t2)
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
		addu $sp, $sp, 12
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

