		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 40
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
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s1, $t1
		move $s2, $t0
		move $t0, $s0
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
		move $s3, $v0
		li $s4, 2
		move $t0, $s0
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
		move $s5, $v0
		move $a0, $s2
		move $a1, $s3
		move $a2, $s4
		move $a3, $s5
		jalr $s1
		move $t0, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s1, $t1
		move $s2, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $s3, $t1
		move $s4, $t0
		li $s5, 100
		li $s6, 200
		move $t0, $s0
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
		move $s7, $v0
		move $a0, $s4
		move $a1, $s5
		move $a2, $s6
		move $a3, $s7
		jalr $s3
		move $v0, $v0
		sw $v0, 0($sp)
		li $s3, 2
		move $t0, $s0
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
		move $s0, $v0
		move $a0, $s2
		lw $v1, 0($sp)
		move $a1, $v1
		move $a2, $s3
		move $a3, $s0
		jalr $s1
		move $t0, $v0
		addu $sp, $sp, 40
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

