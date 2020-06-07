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
		la $t2, BT_Start
		sw $t2, 0($t0)
		sw $t0, 0($t1)
		move $t0, $t1
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		move $a0, $t0
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
		.globl BT_Start
BT_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 16
		sw $s0, 4($sp)
		sw $s1, 0($sp)
		li $a0, 80
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 28
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Tree_RecPrint
		sw $t2, 76($t0)
		la $t2, Tree_Print
		sw $t2, 72($t0)
		la $t2, Tree_Search
		sw $t2, 68($t0)
		la $t2, Tree_RemoveLeft
		sw $t2, 64($t0)
		la $t2, Tree_RemoveRight
		sw $t2, 60($t0)
		la $t2, Tree_Remove
		sw $t2, 56($t0)
		la $t2, Tree_Delete
		sw $t2, 52($t0)
		la $t2, Tree_Insert
		sw $t2, 48($t0)
		la $t2, Tree_Compare
		sw $t2, 44($t0)
		la $t2, Tree_SetHas_Right
		sw $t2, 40($t0)
		la $t2, Tree_SetHas_Left
		sw $t2, 36($t0)
		la $t2, Tree_GetHas_Left
		sw $t2, 32($t0)
		la $t2, Tree_GetHas_Right
		sw $t2, 28($t0)
		la $t2, Tree_SetKey
		sw $t2, 24($t0)
		la $t2, Tree_GetKey
		sw $t2, 20($t0)
		la $t2, Tree_GetLeft
		sw $t2, 16($t0)
		la $t2, Tree_GetRight
		sw $t2, 12($t0)
		la $t2, Tree_SetLeft
		sw $t2, 8($t0)
		la $t2, Tree_SetRight
		sw $t2, 4($t0)
		la $t2, Tree_Init
		sw $t2, 0($t0)
		li $t2, 4
L2:		nop
		li $t3, 28
		slt $t4, $t2, $t3
		beqz $t4, L3
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L2
L3:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 16
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 72($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		li $t0, 100000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 8
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 72($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 24
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 4
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 12
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 20
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 28
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 48($t1)
		li $t1, 14
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 72($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 68($t1)
		li $t1, 24
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
		lw $t2, 68($t1)
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
		lw $t2, 68($t1)
		li $t1, 16
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
		lw $t2, 68($t1)
		li $t1, 50
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
		lw $t2, 68($t1)
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
		lw $t2, 52($t1)
		li $t1, 12
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 72($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 68($t1)
		li $t1, 12
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
		li $t0, 0
		move $v0, $t0
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addu $sp, $sp, 16
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Init
Tree_Init:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 12($t0)
		li $t1, 0
		sw $t1, 16($t0)
		li $t1, 0
		sw $t1, 20($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_SetRight
Tree_SetRight:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 8($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_SetLeft
Tree_SetLeft:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 4($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_GetRight
Tree_GetRight:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		lw $t1, 8($t0)
		move $v0, $t1
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_GetLeft
Tree_GetLeft:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		lw $t1, 4($t0)
		move $v0, $t1
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_GetKey
Tree_GetKey:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		lw $t1, 12($t0)
		move $v0, $t1
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_SetKey
Tree_SetKey:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 12($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_GetHas_Right
Tree_GetHas_Right:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		lw $t1, 20($t0)
		move $v0, $t1
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_GetHas_Left
Tree_GetHas_Left:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		lw $t1, 16($t0)
		move $v0, $t1
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_SetHas_Left
Tree_SetHas_Left:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 16($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_SetHas_Right
Tree_SetHas_Right:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		sw $t1, 20($t0)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Compare
Tree_Compare:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a1
		move $t1, $a2
		li $t2, 0
		li $v1, 1
		add $t3, $t1, $v1
		slt $t4, $t0, $t1
		beqz $t4, L4
		li $t2, 0
		b L5
L4:		nop
		li $t1, 1
		slt $t4, $t0, $t3
		sub $t0, $t1, $t4
		beqz $t0, L6
		li $t2, 0
		b L7
L6:		nop
		li $t2, 1
L7:		nop
L5:		nop
		move $v0, $t2
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Insert
Tree_Insert:
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
		move $s1, $a1
		li $a0, 80
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 28
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Tree_RecPrint
		sw $t2, 76($t0)
		la $t2, Tree_Print
		sw $t2, 72($t0)
		la $t2, Tree_Search
		sw $t2, 68($t0)
		la $t2, Tree_RemoveLeft
		sw $t2, 64($t0)
		la $t2, Tree_RemoveRight
		sw $t2, 60($t0)
		la $t2, Tree_Remove
		sw $t2, 56($t0)
		la $t2, Tree_Delete
		sw $t2, 52($t0)
		la $t2, Tree_Insert
		sw $t2, 48($t0)
		la $t2, Tree_Compare
		sw $t2, 44($t0)
		la $t2, Tree_SetHas_Right
		sw $t2, 40($t0)
		la $t2, Tree_SetHas_Left
		sw $t2, 36($t0)
		la $t2, Tree_GetHas_Left
		sw $t2, 32($t0)
		la $t2, Tree_GetHas_Right
		sw $t2, 28($t0)
		la $t2, Tree_SetKey
		sw $t2, 24($t0)
		la $t2, Tree_GetKey
		sw $t2, 20($t0)
		la $t2, Tree_GetLeft
		sw $t2, 16($t0)
		la $t2, Tree_GetRight
		sw $t2, 12($t0)
		la $t2, Tree_SetLeft
		sw $t2, 8($t0)
		la $t2, Tree_SetRight
		sw $t2, 4($t0)
		la $t2, Tree_Init
		sw $t2, 0($t0)
		li $t2, 4
L8:		nop
		li $t3, 28
		slt $t4, $t2, $t3
		beqz $t4, L9
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L8
L9:		nop
		sw $t0, 0($t1)
		move $s2, $t1
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		move $a0, $t0
		move $a1, $s1
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		move $s3, $s0
		li $s0, 1
L10:		nop
		beqz $s0, L11
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $t0, $s4
		slt $t1, $s1, $t0
		beqz $t1, L12
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		beqz $s4, L14
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $s3, $s4
		b L15
L14:		nop
		li $s0, 0
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		li $t1, 1
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s4, $v0
		move $t0, $s4
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		move $a1, $s2
		jalr $t2
		move $s4, $v0
		move $t0, $s4
L15:		nop
		b L13
L12:		nop
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		beqz $s4, L16
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $s3, $s4
		b L17
L16:		nop
		li $s0, 0
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 40($t1)
		li $t1, 1
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s4, $v0
		move $t0, $s4
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		move $a0, $t0
		move $a1, $s2
		jalr $t2
		move $s4, $v0
		move $t0, $s4
L17:		nop
L13:		nop
		b L10
L11:		nop
		li $t0, 1
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
		.globl Tree_Delete
Tree_Delete:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 48
		sw $s0, 36($sp)
		sw $s1, 32($sp)
		sw $s2, 28($sp)
		sw $s3, 24($sp)
		sw $s4, 20($sp)
		sw $s5, 16($sp)
		sw $s6, 12($sp)
		sw $s7, 8($sp)
		move $s0, $a0
		move $v0, $a1
		sw $v0, 0($sp)
		move $s2, $s0
		move $s3, $s0
		li $s4, 1
		li $v0, 0
		sw $v0, 4($sp)
		li $s6, 1
L18:		nop
		beqz $s4, L19
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s7, $v0
		move $s5, $s7
		lw $v0, 0($sp)
		slt $t0, $v0, $s5
		beqz $t0, L20
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s7, $v0
		beqz $s7, L22
		move $s3, $s2
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s7, $v0
		move $s2, $s7
		b L23
L22:		nop
		li $s4, 0
L23:		nop
		b L21
L20:		nop
		lw $v1, 0($sp)
		slt $t0, $s5, $v1
		beqz $t0, L24
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		beqz $s5, L26
		move $s3, $s2
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $s2, $s5
		b L27
L26:		nop
		li $s4, 0
L27:		nop
		b L25
L24:		nop
		beqz $s6, L28
		li $s5, 0
		li $s7, 1
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		sub $t0, $s7, $s1
		beqz $t0, L32
		li $s1, 1
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s7, $v0
		sub $t0, $s1, $s7
		beqz $t0, L32
		li $s5, 1
L32:		nop
		beqz $s5, L30
		li $t0, 1
		b L31
L30:		nop
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 56($t1)
		move $a0, $t0
		move $a1, $s3
		move $a2, $s2
		jalr $t2
		move $s1, $v0
		move $t0, $s1
L31:		nop
		b L29
L28:		nop
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 56($t1)
		move $a0, $t0
		move $a1, $s3
		move $a2, $s2
		jalr $t2
		move $s1, $v0
		move $t0, $s1
L29:		nop
		li $v0, 1
		sw $v0, 4($sp)
		li $s4, 0
L25:		nop
L21:		nop
		li $s6, 0
		b L18
L19:		nop
		lw $v1, 4($sp)
		move $v0, $v1
		lw $s0, 36($sp)
		lw $s1, 32($sp)
		lw $s2, 28($sp)
		lw $s3, 24($sp)
		lw $s4, 20($sp)
		lw $s5, 16($sp)
		lw $s6, 12($sp)
		lw $s7, 8($sp)
		addu $sp, $sp, 48
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Remove
Tree_Remove:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 24
		sw $s0, 12($sp)
		sw $s1, 8($sp)
		sw $s2, 4($sp)
		sw $s3, 0($sp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $a2
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		beqz $s3, L33
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 64($t1)
		move $a0, $t0
		move $a1, $s1
		move $a2, $s2
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		b L34
L33:		nop
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		beqz $s3, L35
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 60($t1)
		move $a0, $t0
		move $a1, $s1
		move $a2, $s2
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		b L36
L35:		nop
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $s3, $s2
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 44($t2)
		move $a0, $t1
		move $a1, $s3
		move $a2, $t0
		jalr $t3
		move $s2, $v0
		beqz $s2, L37
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		lw $t1, 24($s0)
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		li $t1, 0
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		b L38
L37:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		lw $t1, 24($s0)
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 40($t1)
		li $t1, 0
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
L38:		nop
L36:		nop
L34:		nop
		li $t0, 1
		move $v0, $t0
		lw $s0, 12($sp)
		lw $s1, 8($sp)
		lw $s2, 4($sp)
		lw $s3, 0($sp)
		addu $sp, $sp, 24
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_RemoveRight
Tree_RemoveRight:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 36
		sw $s0, 24($sp)
		sw $s1, 20($sp)
		sw $s2, 16($sp)
		sw $s3, 12($sp)
		sw $s4, 8($sp)
		sw $s5, 4($sp)
		sw $s6, 0($sp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $a2
L39:		nop
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		beqz $s3, L40
		move $s3, $s2
		lw $t0, 0($s3)
		lw $s4, 24($t0)
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $t0, $s5
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $a0, $s3
		move $a1, $s5
		jalr $s4
		move $s6, $v0
		move $t0, $s6
		move $s1, $s2
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $s2, $s3
		b L39
L40:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		lw $t1, 24($s0)
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 40($t1)
		li $t1, 0
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		li $t0, 1
		move $v0, $t0
		lw $s0, 24($sp)
		lw $s1, 20($sp)
		lw $s2, 16($sp)
		lw $s3, 12($sp)
		lw $s4, 8($sp)
		lw $s5, 4($sp)
		lw $s6, 0($sp)
		addu $sp, $sp, 36
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_RemoveLeft
Tree_RemoveLeft:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 36
		sw $s0, 24($sp)
		sw $s1, 20($sp)
		sw $s2, 16($sp)
		sw $s3, 12($sp)
		sw $s4, 8($sp)
		sw $s5, 4($sp)
		sw $s6, 0($sp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $a2
L41:		nop
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		beqz $s3, L42
		move $s3, $s2
		lw $t0, 0($s3)
		lw $s4, 24($t0)
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $t0, $s5
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $a0, $s3
		move $a1, $s5
		jalr $s4
		move $s6, $v0
		move $t0, $s6
		move $s1, $s2
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $s2, $s3
		b L41
L42:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		lw $t1, 24($s0)
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		li $t1, 0
		move $a0, $t0
		move $a1, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		li $t0, 1
		move $v0, $t0
		lw $s0, 24($sp)
		lw $s1, 20($sp)
		lw $s2, 16($sp)
		lw $s3, 12($sp)
		lw $s4, 8($sp)
		lw $s5, 4($sp)
		lw $s6, 0($sp)
		addu $sp, $sp, 36
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Search
Tree_Search:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 32
		sw $s0, 20($sp)
		sw $s1, 16($sp)
		sw $s2, 12($sp)
		sw $s3, 8($sp)
		sw $s4, 4($sp)
		sw $s5, 0($sp)
		move $t0, $a0
		move $s0, $a1
		move $s1, $t0
		li $s2, 1
		li $s3, 0
L43:		nop
		beqz $s2, L44
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $s5, $s4
		slt $t0, $s0, $s5
		beqz $t0, L45
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		beqz $s4, L47
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $s1, $s4
		b L48
L47:		nop
		li $s2, 0
L48:		nop
		b L46
L45:		nop
		slt $t0, $s5, $s0
		beqz $t0, L49
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		beqz $s4, L51
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $s1, $s4
		b L52
L51:		nop
		li $s2, 0
L52:		nop
		b L50
L49:		nop
		li $s3, 1
		li $s2, 0
L50:		nop
L46:		nop
		b L43
L44:		nop
		move $v0, $s3
		lw $s0, 20($sp)
		lw $s1, 16($sp)
		lw $s2, 12($sp)
		lw $s3, 8($sp)
		lw $s4, 4($sp)
		lw $s5, 0($sp)
		addu $sp, $sp, 32
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_Print
Tree_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		move $t0, $a0
		move $t1, $t0
		move $t2, $t0
		lw $t0, 0($t2)
		lw $t3, 76($t0)
		move $a0, $t2
		move $a1, $t1
		jalr $t3
		move $s0, $v0
		move $t0, $s0
		li $t0, 1
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 12
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_RecPrint
Tree_RecPrint:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 32
		sw $s0, 20($sp)
		sw $s1, 16($sp)
		sw $s2, 12($sp)
		sw $s3, 8($sp)
		sw $s4, 4($sp)
		sw $s5, 0($sp)
		move $s0, $a0
		move $s1, $a1
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		beqz $s2, L53
		move $s2, $s0
		lw $t0, 0($s2)
		lw $s3, 76($t0)
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		jalr $t2
		move $s4, $v0
		move $a0, $s2
		move $a1, $s4
		jalr $s3
		move $s5, $v0
		move $t0, $s5
		b L54
L53:		nop
		li $t0, 1
L54:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $a0, $s2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		beqz $s2, L55
		move $s2, $s0
		lw $t0, 0($s2)
		lw $s0, 76($t0)
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s2
		move $a1, $s1
		jalr $s0
		move $s3, $v0
		move $t0, $s3
		b L56
L55:		nop
		li $t0, 1
L56:		nop
		li $t0, 1
		move $v0, $t0
		lw $s0, 20($sp)
		lw $s1, 16($sp)
		lw $s2, 12($sp)
		lw $s3, 8($sp)
		lw $s4, 4($sp)
		lw $s5, 0($sp)
		addu $sp, $sp, 32
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

