		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $a0, 4
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 4
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Fac_ComputeFac
		sw $t2, 0($t0)
		sw $t0, 0($t1)
		move $t0, $t1
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 10
		move $a0, $t0
		move $a1, $t1
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
		.globl Fac_ComputeFac
Fac_ComputeFac:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 20
		sw $s0, 8($sp)
		sw $s1, 4($sp)
		sw $s2, 0($sp)
		move $t0, $a0
		move $s0, $a1
		li $t1, 1
		slt $t2, $s0, $t1
		beqz $t2, L2
		li $s1, 1
		b L3
L2:		nop
		move $t1, $t0
		lw $t0, 0($t1)
		lw $t2, 0($t0)
		li $t0, 1
		sub $t3, $s0, $t0
		move $a0, $t1
		move $a1, $t3
		jalr $t2
		move $s2, $v0
		mul $t0, $s0, $s2
		move $s1, $t0
L3:		nop
		move $v0, $s1
		lw $s0, 8($sp)
		lw $s1, 4($sp)
		lw $s2, 0($sp)
		addu $sp, $sp, 20
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

