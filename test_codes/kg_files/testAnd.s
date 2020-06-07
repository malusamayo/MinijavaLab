		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 1
		move $t1, $t0
		beqz $t1, L2
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
		la $t2, T_test
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
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		beqz $s0, L2
		li $t0, 1
		b L3
L2:		li $t0, 0
L3:		nop
		move $t1, $t0
		move $t0, $t1
		beqz $t0, L0
		li $t0, 1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		b L1
L0:		nop
		li $t0, 2
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
L1:		nop
		addu $sp, $sp, 8
		lw $ra, -4($sp)
		j $ra

		.text
		.globl T_test
T_test:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 10
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

