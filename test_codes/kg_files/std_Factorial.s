		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 4
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
		move $t3, $v0
		move $a0, $t3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 4
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
		move $s0, $a0
		move $s1, $a1
		li $t0, 1
		slt $t1, $s1, $t0
		beqz $t1, L2
		li $s2, 1
		b L3
L2:		nop
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 1
		sub $t3, $s1, $t1
		move $a0, $t0
		move $a1, $t3
		jalr $t2
		move $t1, $v0
		mul $t0, $s1, $t1
		move $s2, $t0
L3:		nop
		move $v0, $s2
		lw $s0, 8($sp)
		lw $s1, 4($sp)
		lw $s2, 0($sp)
		addu $sp, $sp, 20
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

