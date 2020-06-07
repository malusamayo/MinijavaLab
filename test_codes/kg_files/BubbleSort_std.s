		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $a0, 16
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 12
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, BBS_Init
		sw $t2, 12($t0)
		la $t2, BBS_Print
		sw $t2, 8($t0)
		la $t2, BBS_Sort
		sw $t2, 4($t0)
		la $t2, BBS_Start
		sw $t2, 0($t0)
		li $t2, 4
L0:		nop
		li $t3, 12
		slt $t4, $t2, $t3
		beqz $t4, L1
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L0
L1:		nop
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
		.globl BBS_Start
BBS_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 16
		sw $s0, 4($sp)
		sw $s1, 0($sp)
		move $s0, $a0
		move $t0, $a1
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 12($t2)
		move $a0, $t1
		move $a1, $t0
		jalr $t3
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		li $t0, 99999
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		li $t0, 0
		move $v0, $t0
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addu $sp, $sp, 16
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl BBS_Sort
BBS_Sort:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		move $t0, $a0
		lw $t1, 8($t0)
		li $t2, 1
		sub $t3, $t1, $t2
		li $t1, 0
		li $v1, 1
		sub $t2, $t1, $v1
L2:		nop
		slt $t1, $t2, $t3
		beqz $t1, L3
		li $t1, 1
L4:		nop
		li $t4, 1
		add $t5, $t3, $t4
		slt $t4, $t1, $t5
		beqz $t4, L5
		li $v1, 1
		sub $t4, $t1, $v1
		lw $t5, 4($t0)
		li $v1, 4
		mul $t6, $t4, $v1
		lw $t5, 4($t0)
		lw $t4, 0($t5)
		li $t7, 1
		slt $t8, $t6, $t4
		sub $t4, $t7, $t8
		beqz $t4, L6
L6:		nop
		li $t4, 4
		move $t7, $t4
		add $t4, $t6, $t7
		move $t6, $t4
		add $t4, $t5, $t6
		lw $t5, 0($t4)
		move $t4, $t5
		lw $t5, 4($t0)
		li $v1, 4
		mul $t6, $t1, $v1
		lw $t5, 4($t0)
		lw $t7, 0($t5)
		li $t8, 1
		slt $t9, $t6, $t7
		sub $t7, $t8, $t9
		beqz $t7, L7
L7:		nop
		li $t7, 4
		move $t8, $t7
		add $t7, $t6, $t8
		move $t6, $t7
		add $t7, $t5, $t6
		lw $t5, 0($t7)
		move $t6, $t5
		slt $t5, $t6, $t4
		beqz $t5, L8
		li $v1, 1
		sub $t4, $t1, $v1
		lw $t5, 4($t0)
		li $v1, 4
		mul $t6, $t4, $v1
		lw $t5, 4($t0)
		lw $t7, 0($t5)
		li $t8, 1
		slt $t9, $t6, $t7
		sub $t7, $t8, $t9
		beqz $t7, L10
L10:		nop
		li $t7, 4
		move $t8, $t7
		add $t7, $t6, $t8
		move $t6, $t7
		add $t7, $t5, $t6
		lw $t5, 0($t7)
		move $t6, $t5
		li $t5, 1
		li $v1, 4
		mul $t7, $t5, $v1
		add $t5, $t0, $t7
		lw $t8, 0($t5)
		li $v1, 4
		mul $t5, $t4, $v1
		li $t4, 1
		li $v1, 4
		mul $t7, $t4, $v1
		add $t4, $t0, $t7
		lw $t8, 0($t4)
		lw $t4, 0($t8)
		li $t7, 1
		slt $t9, $t5, $t4
		sub $t4, $t7, $t9
		beqz $t4, L11
L11:		nop
		li $t4, 4
		move $t7, $t4
		add $t4, $t5, $t7
		move $t5, $t4
		add $t4, $t8, $t5
		lw $t5, 4($t0)
		li $v1, 4
		mul $t7, $t1, $v1
		lw $t5, 4($t0)
		lw $t8, 0($t5)
		li $t9, 1
		slt $s0, $t7, $t8
		sub $t8, $t9, $s0
		beqz $t8, L12
L12:		nop
		li $t8, 4
		move $t9, $t8
		add $t8, $t7, $t9
		move $t7, $t8
		add $t8, $t5, $t7
		lw $t5, 0($t8)
		sw $t5, 0($t4)
		li $t4, 1
		li $v1, 4
		mul $t5, $t4, $v1
		add $t4, $t0, $t5
		lw $t7, 0($t4)
		li $v1, 4
		mul $t4, $t1, $v1
		li $t8, 1
		li $v1, 4
		mul $t5, $t8, $v1
		add $t8, $t0, $t5
		lw $t7, 0($t8)
		lw $t5, 0($t7)
		li $t8, 1
		slt $t9, $t4, $t5
		sub $t5, $t8, $t9
		beqz $t5, L13
L13:		nop
		li $t5, 4
		move $t8, $t5
		add $t5, $t4, $t8
		move $t4, $t5
		add $t5, $t7, $t4
		sw $t6, 0($t5)
		b L9
L8:		nop
		li $t4, 0
L9:		nop
		li $v1, 1
		add $t1, $t1, $v1
		b L4
L5:		nop
		li $v1, 1
		sub $t3, $t3, $v1
		b L2
L3:		nop
		li $t0, 0
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 12
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
L14:		nop
		lw $t2, 8($t0)
		slt $t3, $t1, $t2
		beqz $t3, L15
		lw $t2, 4($t0)
		li $v1, 4
		mul $t3, $t1, $v1
		lw $t2, 4($t0)
		lw $t4, 0($t2)
		li $t5, 1
		slt $t6, $t3, $t4
		sub $t4, $t5, $t6
		beqz $t4, L16
L16:		nop
		li $t4, 4
		move $t5, $t4
		add $t4, $t3, $t5
		move $t3, $t4
		add $t4, $t2, $t3
		lw $t2, 0($t4)
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $v1, 1
		add $t1, $t1, $v1
		b L14
L15:		nop
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
		sw $t1, 8($t0)
		li $v1, 1
		add $t2, $t1, $v1
		li $t3, 4
		mul $t4, $t2, $t3
		move $a0, $t4
		li $v0, 9
		syscall
		move $t2, $v0
		li $t3, 4
L17:		nop
		li $t4, 1
		add $t5, $t1, $t4
		li $t4, 4
		move $t6, $t4
		mul $t4, $t5, $t6
		slt $t5, $t3, $t4
		beqz $t5, L18
		add $t4, $t2, $t3
		li $t5, 0
		sw $t5, 0($t4)
		li $v1, 4
		add $t3, $t3, $v1
		b L17
L18:		nop
		li $t3, 4
		mul $t4, $t1, $t3
		sw $t4, 0($t2)
		sw $t2, 4($t0)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 0
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L19
L19:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 20
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L20
L20:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 7
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 2
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L21
L21:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 12
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 3
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L22
L22:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 18
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 4
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L23
L23:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 2
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 5
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L24
L24:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 11
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 6
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L25
L25:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 6
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 7
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L26
L26:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 9
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 8
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t1, 0($t3)
		li $t2, 1
		slt $t5, $t4, $t1
		sub $t1, $t2, $t5
		beqz $t1, L27
L27:		nop
		li $t1, 4
		move $t2, $t1
		add $t1, $t4, $t2
		move $t2, $t1
		add $t1, $t3, $t2
		li $t2, 19
		sw $t2, 0($t1)
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		li $t1, 9
		li $v1, 4
		mul $t4, $t1, $v1
		li $t1, 1
		li $v1, 4
		mul $t2, $t1, $v1
		add $t1, $t0, $t2
		lw $t3, 0($t1)
		lw $t0, 0($t3)
		li $t1, 1
		slt $t2, $t4, $t0
		sub $t0, $t1, $t2
		beqz $t0, L28
L28:		nop
		li $t0, 4
		move $t1, $t0
		add $t0, $t4, $t1
		move $t1, $t0
		add $t0, $t3, $t1
		li $t1, 5
		sw $t1, 0($t0)
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

