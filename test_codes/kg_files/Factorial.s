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
		li $t0, 4
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, Fac_ComputeFac
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
		move $t1, $a1
		move $t2, $t1
		li $t3, 1
		slt $t4, $t2, $t3
		beqz $t4, L0
		li $s0, 1
		b L1
L0:		nop
		move $s1, $t1
		move $t2, $t0
		move $t0, $t2
		lw $t3, 0($t0)
		move $t0, $t3
		lw $t3, 0($t0)
		move $t0, $t3
		move $t3, $t0
		move $t0, $t2
		move $t2, $t1
		li $t1, 1
		sub $t4, $t2, $t1
		move $a0, $t0
		move $a1, $t4
		jalr $t3
		move $s2, $v0
		mul $s0, $s1, $s2
L1:		nop
		move $t0, $s0
		move $v0, $t0
		lw $s0, 8($sp)
		lw $s1, 4($sp)
		lw $s2, 0($sp)
		addu $sp, $sp, 20
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

