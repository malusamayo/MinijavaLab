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
		la $t2, LS_Init
		sw $t2, 12($t0)
		la $t2, LS_Search
		sw $t2, 8($t0)
		la $t2, LS_Print
		sw $t2, 4($t0)
		la $t2, LS_Start
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
		.globl LS_Start
LS_Start:
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
		lw $t2, 4($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		li $t0, 9999
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		li $t1, 8
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		li $t1, 12
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		li $t1, 17
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		li $t1, 50
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
		li $t0, 55
		move $v0, $t0
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addu $sp, $sp, 16
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl LS_Print
LS_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		li $t1, 1
L2:		nop
		lw $t2, 8($t0)
		slt $t3, $t1, $t2
		beqz $t3, L3
		lw $t2, 4($t0)
		li $v1, 4
		mul $t3, $t1, $v1
		lw $t2, 4($t0)
		lw $t4, 0($t2)
		li $t5, 1
		slt $t6, $t3, $t4
		sub $t4, $t5, $t6
		beqz $t4, L4
L4:		nop
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
		b L2
L3:		nop
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl LS_Search
LS_Search:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		li $t2, 1
		li $t3, 0
		li $t3, 0
L5:		nop
		lw $t4, 8($t0)
		slt $t5, $t2, $t4
		beqz $t5, L6
		lw $t4, 4($t0)
		li $v1, 4
		mul $t5, $t2, $v1
		lw $t4, 4($t0)
		lw $t6, 0($t4)
		li $t7, 1
		slt $t8, $t5, $t6
		sub $t6, $t7, $t8
		beqz $t6, L7
L7:		nop
		li $t6, 4
		move $t7, $t6
		add $t6, $t5, $t7
		move $t5, $t6
		add $t6, $t4, $t5
		lw $t4, 0($t6)
		move $t5, $t4
		li $v1, 1
		add $t4, $t1, $v1
		slt $t6, $t5, $t1
		beqz $t6, L8
		li $t6, 0
		b L9
L8:		nop
		li $t6, 1
		slt $t7, $t5, $t4
		sub $t4, $t6, $t7
		beqz $t4, L10
		li $t6, 0
		b L11
L10:		nop
		li $t3, 1
		li $t3, 1
		lw $t4, 8($t0)
		move $t2, $t4
L11:		nop
L9:		nop
		li $v1, 1
		add $t2, $t2, $v1
		b L5
L6:		nop
		move $v0, $t3
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl LS_Init
LS_Init:
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
L12:		nop
		li $t4, 1
		add $t5, $t1, $t4
		li $t4, 4
		move $t6, $t4
		mul $t4, $t5, $t6
		slt $t5, $t3, $t4
		beqz $t5, L13
		add $t4, $t2, $t3
		li $t5, 0
		sw $t5, 0($t4)
		li $v1, 4
		add $t3, $t3, $v1
		b L12
L13:		nop
		li $t3, 4
		mul $t4, $t1, $t3
		sw $t4, 0($t2)
		sw $t2, 4($t0)
		li $t1, 1
		lw $t2, 8($t0)
		li $t3, 1
		add $t4, $t2, $t3
L14:		nop
		lw $t2, 8($t0)
		slt $t3, $t1, $t2
		beqz $t3, L15
		li $t2, 2
		mul $t3, $t2, $t1
		li $v1, 3
		sub $t2, $t4, $v1
		li $t5, 1
		li $v1, 4
		mul $t6, $t5, $v1
		add $t5, $t0, $t6
		lw $t7, 0($t5)
		li $v1, 4
		mul $t5, $t1, $v1
		li $t8, 1
		li $v1, 4
		mul $t6, $t8, $v1
		add $t8, $t0, $t6
		lw $t7, 0($t8)
		lw $t6, 0($t7)
		li $t8, 1
		slt $t9, $t5, $t6
		sub $t6, $t8, $t9
		beqz $t6, L16
L16:		nop
		li $t6, 4
		move $t8, $t6
		add $t6, $t5, $t8
		move $t5, $t6
		add $t6, $t7, $t5
		add $t5, $t3, $t2
		sw $t5, 0($t6)
		li $v1, 1
		add $t1, $t1, $v1
		li $v1, 1
		sub $t4, $t4, $v1
		b L14
L15:		nop
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

