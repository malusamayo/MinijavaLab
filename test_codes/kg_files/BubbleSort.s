		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $t0, 12
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 16
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
		la $t3, BBS_Print
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, BBS_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, BBS_Start
		sw $t3, 8($t0)
		move $t0, $t2
		la $t2, BBS_Sort
		sw $t2, 12($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 8($t0)
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
		.globl BBS_Start
BBS_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		move $s0, $a0
		move $t0, $a1
		move $t1, $s0
		move $t2, $t1
		lw $t3, 0($t2)
		move $t2, $t3
		lw $t3, 4($t2)
		move $t2, $t3
		move $t3, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t2
		move $a1, $t1
		jalr $t3
		move $t0, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 99999
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 0
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 12
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl BBS_Sort
BBS_Sort:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 16
		sw $s0, 4($sp)
		sw $s1, 0($sp)
		move $t0, $a0
		move $t1, $t0
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		li $t1, 1
		sub $t3, $t2, $t1
		li $t1, 0
		li $t2, 1
		sub $t4, $t1, $t2
L0:		move $t1, $t4
		move $t2, $t3
		slt $t5, $t1, $t2
		beqz $t5, L1
		li $t1, 1
L2:		move $t2, $t1
		move $t5, $t3
		li $t6, 1
		add $t7, $t5, $t6
		slt $t5, $t2, $t7
		beqz $t5, L3
		move $t2, $t1
		li $t5, 1
		sub $t6, $t2, $t5
		move $t2, $t0
		lw $t5, 4($t2)
		move $t2, $t5
		move $t5, $t2
		move $t2, $t5
		li $t7, 4
		li $t8, 1
		move $t9, $t6
		add $t6, $t8, $t9
		mul $t8, $t7, $t6
		add $t5, $t2, $t8
		move $t2, $t5
		lw $t5, 0($t2)
		move $t2, $t5
		move $t5, $t2
		move $t2, $t0
		lw $t6, 4($t2)
		move $t2, $t6
		move $t6, $t2
		move $t2, $t6
		li $t7, 4
		li $t8, 1
		move $t9, $t1
		add $s0, $t8, $t9
		mul $t8, $t7, $s0
		add $t6, $t2, $t8
		move $t2, $t6
		lw $t6, 0($t2)
		move $t2, $t6
		move $t6, $t2
		move $t2, $t6
		move $t6, $t5
		slt $t5, $t2, $t6
		beqz $t5, L4
		move $t2, $t1
		li $t5, 1
		sub $t6, $t2, $t5
		move $t2, $t0
		lw $t5, 4($t2)
		move $t2, $t5
		move $t5, $t2
		move $t2, $t5
		li $t7, 4
		li $t8, 1
		move $t9, $t6
		add $s0, $t8, $t9
		mul $t8, $t7, $s0
		add $t5, $t2, $t8
		move $t2, $t5
		lw $t5, 0($t2)
		move $t2, $t5
		move $t5, $t2
		move $t2, $t0
		lw $t7, 4($t2)
		move $t2, $t7
		li $t7, 4
		li $t8, 1
		move $t9, $t6
		add $t6, $t8, $t9
		mul $t8, $t7, $t6
		add $t6, $t2, $t8
		move $t2, $t6
		move $t6, $t0
		lw $t7, 4($t6)
		move $t6, $t7
		move $t7, $t6
		move $t6, $t7
		li $t8, 4
		li $t9, 1
		move $s0, $t1
		add $s1, $t9, $s0
		mul $t9, $t8, $s1
		add $t7, $t6, $t9
		move $t6, $t7
		lw $t7, 0($t6)
		move $t6, $t7
		move $t7, $t6
		sw $t7, 0($t2)
		move $t2, $t0
		lw $t6, 4($t2)
		move $t2, $t6
		li $t6, 4
		li $t7, 1
		move $t8, $t1
		add $t9, $t7, $t8
		mul $t7, $t6, $t9
		add $t6, $t2, $t7
		move $t2, $t6
		move $t6, $t5
		sw $t6, 0($t2)
		b L5
L4:		nop
		li $t2, 0
L5:		nop
		move $t2, $t1
		li $t5, 1
		add $t1, $t2, $t5
		b L2
L3:		nop
		move $t1, $t3
		li $t2, 1
		sub $t3, $t1, $t2
		b L0
L1:		nop
		li $t0, 0
		move $v0, $t0
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addu $sp, $sp, 16
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl BBS_Print
BBS_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		li $t1, 0
L6:		move $t2, $t1
		move $t3, $t0
		lw $t4, 8($t3)
		move $t3, $t4
		move $t4, $t3
		slt $t3, $t2, $t4
		beqz $t3, L7
		move $t2, $t0
		lw $t3, 4($t2)
		move $t2, $t3
		move $t3, $t2
		move $t2, $t3
		li $t4, 4
		li $t5, 1
		move $t6, $t1
		add $t7, $t5, $t6
		mul $t5, $t4, $t7
		add $t3, $t2, $t5
		move $t2, $t3
		lw $t3, 0($t2)
		move $t2, $t3
		move $t3, $t2
		move $a0, $t3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t2, $t1
		li $t3, 1
		add $t1, $t2, $t3
		b L6
L7:		nop
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl BBS_Init
BBS_Init:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		move $t3, $t1
		sw $t3, 8($t2)
		move $t2, $t0
		move $t3, $t1
		li $t1, 4
		li $t4, 1
		move $t5, $t3
		add $t6, $t4, $t5
		mul $t4, $t1, $t6
		move $a0, $t4
		li $v0, 9
		syscall
		move $t1, $v0
		move $t4, $t1
		move $t5, $t3
		sw $t5, 0($t4)
		move $t3, $t1
		move $t1, $t3
		sw $t1, 4($t2)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 0
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 20
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 1
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 7
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 2
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 12
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 3
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 18
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 4
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 2
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 5
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 11
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 6
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 6
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 7
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 9
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t2, 4($t1)
		move $t1, $t2
		li $t2, 4
		li $t3, 1
		li $t4, 8
		add $t5, $t3, $t4
		mul $t3, $t2, $t5
		add $t2, $t1, $t3
		move $t1, $t2
		li $t2, 19
		sw $t2, 0($t1)
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		li $t0, 4
		li $t2, 1
		li $t3, 9
		add $t4, $t2, $t3
		mul $t2, $t0, $t4
		add $t0, $t1, $t2
		move $t1, $t0
		li $t0, 5
		sw $t0, 0($t1)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

