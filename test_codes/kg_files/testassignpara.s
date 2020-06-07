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
		la $t2, Animal_fun
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
		li $t2, 12
		move $a0, $t2
		li $v0, 9
		syscall
		move $s7, $v0
		move $t2, $s7
		li $t1, 19
		sw $t1, 0($t2)
		move $t1, $s7
		li $t2, 20
		sw $t2, 4($t1)
		move $t1, $s7
		li $t2, 21
		sw $t2, 8($t1)
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
		.globl Animal_fun
Animal_fun:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 72
		move $t0, $a1
		lw $t1, 0($sp)
		li $t2, 0
		beqz $t2, L0
		move $t2, $t1
		li $t3, 99
		sw $t3, 8($t2)
		b L1
L0:		nop
		li $t0, 1
L1:		nop
		move $t0, $t1
		lw $t1, 8($t0)
		move $t0, $t1
		move $t1, $t0
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 72
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

