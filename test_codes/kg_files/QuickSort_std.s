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
		la $t2, QS_Init
		sw $t2, 12($t0)
		la $t2, QS_Print
		sw $t2, 8($t0)
		la $t2, QS_Sort
		sw $t2, 4($t0)
		la $t2, QS_Start
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
		.globl QS_Start
QS_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 20
		sw $s0, 8($sp)
		sw $s1, 4($sp)
		sw $s2, 0($sp)
		move $s0, $a0
		move $t0, $a1
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 12($t2)
		move $a0, $t1
		move $a1, $t0
		jalr $t3
		move $s1, $v0
		move $s2, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $s2, $s1
		li $t0, 9999
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $t0, 8($s0)
		li $t1, 1
		sub $s2, $t0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		li $t1, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $s2
		jalr $t2
		move $s1, $v0
		move $s2, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		move $s2, $s0
		li $t0, 0
		move $v0, $t0
		lw $s0, 8($sp)
		lw $s1, 4($sp)
		lw $s2, 0($sp)
		addu $sp, $sp, 20
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl QS_Sort
QS_Sort:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 28
		sw $s0, 16($sp)
		sw $s1, 12($sp)
		sw $s2, 8($sp)
		sw $s3, 4($sp)
		sw $s4, 0($sp)
		move $s0, $a0
		move $t0, $a1
		move $s1, $a2
		li $t1, 0
		slt $t2, $t0, $s1
		beqz $t2, L2
		lw $t2, 4($s0)
		li $v1, 4
		mul $t3, $s1, $v1
		lw $t2, 4($s0)
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
		move $t3, $t2
		li $v1, 1
		sub $s2, $t0, $v1
		move $t2, $s1
		li $t4, 1
L5:		nop
		beqz $t4, L6
		li $t5, 1
L7:		nop
		beqz $t5, L8
		li $v1, 1
		add $s2, $s2, $v1
		lw $t6, 4($s0)
		li $v1, 4
		mul $t7, $s2, $v1
		lw $t6, 4($s0)
		lw $t8, 0($t6)
		li $t9, 1
		slt $s3, $t7, $t8
		sub $t8, $t9, $s3
		beqz $t8, L9
L9:		nop
		li $t8, 4
		move $t9, $t8
		add $t8, $t7, $t9
		move $t7, $t8
		add $t8, $t6, $t7
		lw $t6, 0($t8)
		move $t7, $t6
		li $t6, 1
		slt $t8, $t7, $t3
		sub $t9, $t6, $t8
		beqz $t9, L10
		li $t5, 0
		b L11
L10:		nop
		li $t5, 1
L11:		nop
		b L7
L8:		nop
		li $t5, 1
L12:		nop
		beqz $t5, L13
		li $v1, 1
		sub $t2, $t2, $v1
		lw $t6, 4($s0)
		li $v1, 4
		mul $t8, $t2, $v1
		lw $t6, 4($s0)
		lw $t9, 0($t6)
		li $s3, 1
		slt $s4, $t8, $t9
		sub $t9, $s3, $s4
		beqz $t9, L14
L14:		nop
		li $t9, 4
		move $s3, $t9
		add $t9, $t8, $s3
		move $t8, $t9
		add $t9, $t6, $t8
		lw $t6, 0($t9)
		move $t7, $t6
		li $t6, 1
		slt $t8, $t3, $t7
		sub $t7, $t6, $t8
		beqz $t7, L15
		li $t5, 0
		b L16
L15:		nop
		li $t5, 1
L16:		nop
		b L12
L13:		nop
		lw $t5, 4($s0)
		li $v1, 4
		mul $t6, $s2, $v1
		lw $t5, 4($s0)
		lw $t7, 0($t5)
		li $t8, 1
		slt $t9, $t6, $t7
		sub $t7, $t8, $t9
		beqz $t7, L17
L17:		nop
		li $t7, 4
		move $t8, $t7
		add $t7, $t6, $t8
		move $t6, $t7
		add $t7, $t5, $t6
		lw $t5, 0($t7)
		move $t1, $t5
		li $t5, 1
		li $v1, 4
		mul $t6, $t5, $v1
		add $t5, $s0, $t6
		lw $t7, 0($t5)
		li $v1, 4
		mul $t5, $s2, $v1
		li $t8, 1
		li $v1, 4
		mul $t6, $t8, $v1
		add $t8, $s0, $t6
		lw $t7, 0($t8)
		lw $t6, 0($t7)
		li $t8, 1
		slt $t9, $t5, $t6
		sub $t6, $t8, $t9
		beqz $t6, L18
L18:		nop
		li $t6, 4
		move $t8, $t6
		add $t6, $t5, $t8
		move $t5, $t6
		add $t6, $t7, $t5
		lw $t5, 4($s0)
		li $v1, 4
		mul $t7, $t2, $v1
		lw $t5, 4($s0)
		lw $t8, 0($t5)
		li $t9, 1
		slt $s3, $t7, $t8
		sub $t8, $t9, $s3
		beqz $t8, L19
L19:		nop
		li $t8, 4
		move $t9, $t8
		add $t8, $t7, $t9
		move $t7, $t8
		add $t8, $t5, $t7
		lw $t5, 0($t8)
		sw $t5, 0($t6)
		li $t5, 1
		li $v1, 4
		mul $t6, $t5, $v1
		add $t5, $s0, $t6
		lw $t7, 0($t5)
		li $v1, 4
		mul $t5, $t2, $v1
		li $t8, 1
		li $v1, 4
		mul $t6, $t8, $v1
		add $t8, $s0, $t6
		lw $t7, 0($t8)
		lw $t6, 0($t7)
		li $t8, 1
		slt $t9, $t5, $t6
		sub $t6, $t8, $t9
		beqz $t6, L20
L20:		nop
		li $t6, 4
		move $t8, $t6
		add $t6, $t5, $t8
		move $t5, $t6
		add $t6, $t7, $t5
		sw $t1, 0($t6)
		li $t5, 1
		add $t6, $s2, $t5
		slt $t5, $t2, $t6
		beqz $t5, L21
		li $t4, 0
		b L22
L21:		nop
		li $t4, 1
L22:		nop
		b L5
L6:		nop
		li $t3, 1
		li $v1, 4
		mul $t4, $t3, $v1
		add $t3, $s0, $t4
		lw $t5, 0($t3)
		li $v1, 4
		mul $t3, $t2, $v1
		li $t2, 1
		li $v1, 4
		mul $t4, $t2, $v1
		add $t2, $s0, $t4
		lw $t5, 0($t2)
		lw $t2, 0($t5)
		li $t4, 1
		slt $t6, $t3, $t2
		sub $t2, $t4, $t6
		beqz $t2, L23
L23:		nop
		li $t2, 4
		move $t4, $t2
		add $t2, $t3, $t4
		move $t3, $t2
		add $t2, $t5, $t3
		lw $t3, 4($s0)
		li $v1, 4
		mul $t4, $s2, $v1
		lw $t3, 4($s0)
		lw $t5, 0($t3)
		li $t6, 1
		slt $t7, $t4, $t5
		sub $t5, $t6, $t7
		beqz $t5, L24
L24:		nop
		li $t5, 4
		move $t6, $t5
		add $t5, $t4, $t6
		move $t4, $t5
		add $t5, $t3, $t4
		lw $t3, 0($t5)
		sw $t3, 0($t2)
		li $t2, 1
		li $v1, 4
		mul $t3, $t2, $v1
		add $t2, $s0, $t3
		lw $t4, 0($t2)
		li $v1, 4
		mul $t2, $s2, $v1
		li $t5, 1
		li $v1, 4
		mul $t3, $t5, $v1
		add $t5, $s0, $t3
		lw $t4, 0($t5)
		lw $t3, 0($t4)
		li $t5, 1
		slt $t6, $t2, $t3
		sub $t3, $t5, $t6
		beqz $t3, L25
L25:		nop
		li $t3, 4
		move $t5, $t3
		add $t3, $t2, $t5
		move $t2, $t3
		add $t3, $t4, $t2
		lw $t2, 4($s0)
		li $v1, 4
		mul $t4, $s1, $v1
		lw $t2, 4($s0)
		lw $t5, 0($t2)
		li $t6, 1
		slt $t7, $t4, $t5
		sub $t5, $t6, $t7
		beqz $t5, L26
L26:		nop
		li $t5, 4
		move $t6, $t5
		add $t5, $t4, $t6
		move $t4, $t5
		add $t5, $t2, $t4
		lw $t2, 0($t5)
		sw $t2, 0($t3)
		li $t2, 1
		li $v1, 4
		mul $t3, $t2, $v1
		add $t2, $s0, $t3
		lw $t4, 0($t2)
		li $v1, 4
		mul $t2, $s1, $v1
		li $t5, 1
		li $v1, 4
		mul $t3, $t5, $v1
		add $t5, $s0, $t3
		lw $t4, 0($t5)
		lw $t3, 0($t4)
		li $t5, 1
		slt $t6, $t2, $t3
		sub $t3, $t5, $t6
		beqz $t3, L27
L27:		nop
		li $t3, 4
		move $t5, $t3
		add $t3, $t2, $t5
		move $t2, $t3
		add $t3, $t4, $t2
		sw $t1, 0($t3)
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 4($t2)
		li $t2, 1
		sub $t4, $s2, $t2
		move $a0, $t1
		move $a1, $t0
		move $a2, $t4
		jalr $t3
		move $s3, $v0
		move $t0, $s3
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		li $t1, 1
		add $t3, $s2, $t1
		move $a0, $t0
		move $a1, $t3
		move $a2, $s1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		b L3
L2:		nop
		li $t0, 0
L3:		nop
		li $t0, 0
		move $v0, $t0
		lw $s0, 16($sp)
		lw $s1, 12($sp)
		lw $s2, 8($sp)
		lw $s3, 4($sp)
		lw $s4, 0($sp)
		addu $sp, $sp, 28
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl QS_Print
QS_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		li $t1, 0
L28:		nop
		lw $t2, 8($t0)
		slt $t3, $t1, $t2
		beqz $t3, L29
		lw $t2, 4($t0)
		li $v1, 4
		mul $t3, $t1, $v1
		lw $t2, 4($t0)
		lw $t4, 0($t2)
		li $t5, 1
		slt $t6, $t3, $t4
		sub $t4, $t5, $t6
		beqz $t4, L30
L30:		nop
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
		b L28
L29:		nop
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl QS_Init
QS_Init:
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
L31:		nop
		li $t4, 1
		add $t5, $t1, $t4
		li $t4, 4
		move $t6, $t4
		mul $t4, $t5, $t6
		slt $t5, $t3, $t4
		beqz $t5, L32
		add $t4, $t2, $t3
		li $t5, 0
		sw $t5, 0($t4)
		li $v1, 4
		add $t3, $t3, $v1
		b L31
L32:		nop
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
		beqz $t1, L33
L33:		nop
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
		beqz $t1, L34
L34:		nop
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
		beqz $t1, L35
L35:		nop
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
		beqz $t1, L36
L36:		nop
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
		beqz $t1, L37
L37:		nop
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
		beqz $t1, L38
L38:		nop
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
		beqz $t1, L39
L39:		nop
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
		beqz $t1, L40
L40:		nop
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
		beqz $t1, L41
L41:		nop
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
		beqz $t0, L42
L42:		nop
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

