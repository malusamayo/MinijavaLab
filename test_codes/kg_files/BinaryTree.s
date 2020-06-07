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
		la $t2, BT_Start
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
		li $t0, 28
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 80
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
		move $t0, $t1
		li $t3, 0
		sw $t3, 12($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 16($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 20($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 24($t0)
		move $t0, $t2
		la $t3, Tree_Delete
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Tree_SetHas_Left
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Tree_RemoveLeft
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Tree_GetKey
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Tree_SetRight
		sw $t3, 16($t0)
		move $t0, $t2
		la $t3, Tree_GetLeft
		sw $t3, 20($t0)
		move $t0, $t2
		la $t3, Tree_GetRight
		sw $t3, 24($t0)
		move $t0, $t2
		la $t3, Tree_Remove
		sw $t3, 28($t0)
		move $t0, $t2
		la $t3, Tree_SetLeft
		sw $t3, 32($t0)
		move $t0, $t2
		la $t3, Tree_Insert
		sw $t3, 36($t0)
		move $t0, $t2
		la $t3, Tree_Print
		sw $t3, 40($t0)
		move $t0, $t2
		la $t3, Tree_Init
		sw $t3, 44($t0)
		move $t0, $t2
		la $t3, Tree_GetHas_Right
		sw $t3, 48($t0)
		move $t0, $t2
		la $t3, Tree_GetHas_Left
		sw $t3, 52($t0)
		move $t0, $t2
		la $t3, Tree_RemoveRight
		sw $t3, 56($t0)
		move $t0, $t2
		la $t3, Tree_Search
		sw $t3, 60($t0)
		move $t0, $t2
		la $t3, Tree_SetKey
		sw $t3, 64($t0)
		move $t0, $t2
		la $t3, Tree_Compare
		sw $t3, 68($t0)
		move $t0, $t2
		la $t3, Tree_SetHas_Right
		sw $t3, 72($t0)
		move $t0, $t2
		la $t2, Tree_RecPrint
		sw $t2, 76($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 44($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 16
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 40($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t3, $v0
		li $t0, 100000000
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
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 8
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 40($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 24
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 4
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 12
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 20
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 28
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 14
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 40($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 24
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 12
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 16
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 50
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 12
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 12
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 40($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 60($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 12
		move $a0, $t1
		move $a1, $t0
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
		move $t2, $t0
		move $t3, $t1
		sw $t3, 24($t2)
		move $t1, $t0
		li $t2, 0
		sw $t2, 20($t1)
		move $t1, $t0
		li $t0, 0
		sw $t0, 8($t1)
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
		move $t2, $t0
		move $t0, $t1
		sw $t0, 16($t2)
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
		move $t2, $t0
		move $t0, $t1
		sw $t0, 4($t2)
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
		move $t1, $t0
		lw $t0, 16($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
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
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
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
		move $t1, $t0
		lw $t0, 24($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
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
		move $t2, $t0
		move $t0, $t1
		sw $t0, 24($t2)
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
		move $t1, $t0
		lw $t0, 8($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
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
		move $t1, $t0
		lw $t0, 20($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
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
		move $t2, $t0
		move $t0, $t1
		sw $t0, 20($t2)
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
		move $t2, $t0
		move $t0, $t1
		sw $t0, 8($t2)
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
		move $t3, $t1
		li $t4, 1
		add $t5, $t3, $t4
		move $t3, $t0
		move $t4, $t1
		slt $t1, $t3, $t4
		beqz $t1, L0
		li $t2, 0
		b L1
L0:		nop
		li $t1, 1
		move $t3, $t0
		move $t0, $t5
		slt $t4, $t3, $t0
		sub $t0, $t1, $t4
		beqz $t0, L2
		li $t2, 0
		b L3
L2:		nop
		li $t2, 1
L3:		nop
L1:		nop
		move $t0, $t2
		move $v0, $t0
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
		li $t0, 28
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 80
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
		move $t0, $t1
		li $t3, 0
		sw $t3, 12($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 16($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 20($t0)
		move $t0, $t1
		li $t3, 0
		sw $t3, 24($t0)
		move $t0, $t2
		la $t3, Tree_Delete
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Tree_SetHas_Left
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Tree_RemoveLeft
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Tree_GetKey
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Tree_SetRight
		sw $t3, 16($t0)
		move $t0, $t2
		la $t3, Tree_GetLeft
		sw $t3, 20($t0)
		move $t0, $t2
		la $t3, Tree_GetRight
		sw $t3, 24($t0)
		move $t0, $t2
		la $t3, Tree_Remove
		sw $t3, 28($t0)
		move $t0, $t2
		la $t3, Tree_SetLeft
		sw $t3, 32($t0)
		move $t0, $t2
		la $t3, Tree_Insert
		sw $t3, 36($t0)
		move $t0, $t2
		la $t3, Tree_Print
		sw $t3, 40($t0)
		move $t0, $t2
		la $t3, Tree_Init
		sw $t3, 44($t0)
		move $t0, $t2
		la $t3, Tree_GetHas_Right
		sw $t3, 48($t0)
		move $t0, $t2
		la $t3, Tree_GetHas_Left
		sw $t3, 52($t0)
		move $t0, $t2
		la $t3, Tree_RemoveRight
		sw $t3, 56($t0)
		move $t0, $t2
		la $t3, Tree_Search
		sw $t3, 60($t0)
		move $t0, $t2
		la $t3, Tree_SetKey
		sw $t3, 64($t0)
		move $t0, $t2
		la $t3, Tree_Compare
		sw $t3, 68($t0)
		move $t0, $t2
		la $t3, Tree_SetHas_Right
		sw $t3, 72($t0)
		move $t0, $t2
		la $t2, Tree_RecPrint
		sw $t2, 76($t0)
		move $t0, $t1
		move $s2, $t0
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 44($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s1
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $s3, $s0
		li $s0, 1
L4:		move $t0, $s0
		beqz $t0, L5
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $t0, $s1
		move $t1, $s4
		slt $t2, $t0, $t1
		beqz $t2, L6
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		beqz $s4, L8
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		b L9
L8:		nop
		li $s0, 0
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 1
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 32($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s2
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
L9:		nop
		b L7
L6:		nop
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		beqz $s4, L10
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		b L11
L10:		nop
		li $s0, 0
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 72($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 1
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s2
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
L11:		nop
L7:		nop
		b L4
L5:		nop
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
		subu $sp, $sp, 44
		sw $s0, 32($sp)
		sw $s1, 28($sp)
		sw $s2, 24($sp)
		sw $s3, 20($sp)
		sw $s4, 16($sp)
		sw $s5, 12($sp)
		sw $s6, 8($sp)
		sw $s7, 4($sp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $s0
		move $s3, $s0
		li $s4, 1
		li $v0, 0
		sw $v0, 0($sp)
		li $s6, 1
L12:		move $t0, $s4
		beqz $t0, L13
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s7, $v0
		move $t0, $s1
		move $t1, $s7
		slt $t2, $t0, $t1
		beqz $t2, L14
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		beqz $s5, L16
		move $s3, $s2
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		b L17
L16:		nop
		li $s4, 0
L17:		nop
		b L15
L14:		nop
		move $t0, $s7
		move $t1, $s1
		slt $t2, $t0, $t1
		beqz $t2, L18
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		beqz $s5, L20
		move $s3, $s2
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		b L21
L20:		nop
		li $s4, 0
L21:		nop
		b L19
L18:		nop
		move $t0, $s6
		beqz $t0, L22
		li $s5, 1
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s7, $v0
		sub $t0, $s5, $s7
		beqz $t0, L26
		li $s5, 1
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s7, $v0
		sub $t0, $s5, $s7
		beqz $t0, L26
		li $t0, 1
		b L27
L26:		li $t0, 0
L27:		nop
		move $t1, $t0
		move $t0, $t1
		beqz $t0, L24
		li $t0, 1
		b L25
L24:		nop
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 28($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s3
		move $t3, $s2
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		jalr $t2
		move $t0, $v0
L25:		nop
		b L23
L22:		nop
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 28($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s3
		move $t3, $s2
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		jalr $t2
		move $t0, $v0
L23:		nop
		li $v0, 1
		sw $v0, 0($sp)
		li $s4, 0
L19:		nop
L15:		nop
		li $s6, 0
		b L12
L13:		nop
		lw $v1, 0($sp)
		move $t0, $v1
		move $v0, $t0
		lw $s0, 32($sp)
		lw $s1, 28($sp)
		lw $s2, 24($sp)
		lw $s3, 20($sp)
		lw $s4, 16($sp)
		lw $s5, 12($sp)
		lw $s6, 8($sp)
		lw $s7, 4($sp)
		addu $sp, $sp, 44
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
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		beqz $s3, L28
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s1
		move $t3, $s2
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		jalr $t2
		move $t4, $v0
		b L29
L28:		nop
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		beqz $s3, L30
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 56($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s1
		move $t3, $s2
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		jalr $t2
		move $t4, $v0
		b L31
L30:		nop
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		lw $t1, 0($t0)
		move $t0, $t1
		lw $t1, 12($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $s3
		move $a0, $t0
		jalr $t1
		move $s3, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 68($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s2
		move $t3, $s3
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		jalr $t2
		move $s2, $v0
		beqz $s2, L32
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 32($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		lw $t3, 12($t0)
		move $t0, $t3
		move $t3, $t0
		move $a0, $t1
		move $a1, $t3
		jalr $t2
		move $t4, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t4, $v0
		b L33
L32:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		lw $t3, 12($t0)
		move $t0, $t3
		move $t3, $t0
		move $a0, $t1
		move $a1, $t3
		jalr $t2
		move $t4, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 72($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t4, $v0
L33:		nop
L31:		nop
L29:		nop
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
		subu $sp, $sp, 32
		sw $s0, 20($sp)
		sw $s1, 16($sp)
		sw $s2, 12($sp)
		sw $s3, 8($sp)
		sw $s4, 4($sp)
		sw $s5, 0($sp)
		move $s0, $a0
		move $s1, $a1
		move $s2, $a2
L34:		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		beqz $s3, L35
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 64($t1)
		move $t1, $t2
		move $s3, $t1
		move $s4, $t0
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		move $t0, $s5
		lw $t1, 0($t0)
		move $t0, $t1
		lw $t1, 12($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $s5
		move $a0, $t0
		jalr $t1
		move $s5, $v0
		move $a0, $s4
		move $a1, $s5
		jalr $s3
		move $t0, $v0
		move $s1, $s2
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		b L34
L35:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		lw $t3, 12($t0)
		move $t0, $t3
		move $t3, $t0
		move $a0, $t1
		move $a1, $t3
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 72($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t0, $v0
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

		.text
		.globl Tree_RemoveLeft
Tree_RemoveLeft:
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
		move $s2, $a2
L36:		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		beqz $s3, L37
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 64($t1)
		move $t1, $t2
		move $s3, $t1
		move $s4, $t0
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		move $t0, $s5
		lw $t1, 0($t0)
		move $t0, $t1
		lw $t1, 12($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $s5
		move $a0, $t0
		jalr $t1
		move $s5, $v0
		move $a0, $s4
		move $a1, $s5
		jalr $s3
		move $t0, $v0
		move $s1, $s2
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		b L36
L37:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 32($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		lw $t3, 12($t0)
		move $t0, $t3
		move $t3, $t0
		move $a0, $t1
		move $a1, $t3
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t0, $v0
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
L38:		move $t0, $s2
		beqz $t0, L39
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $t0, $s0
		move $t1, $s4
		slt $t2, $t0, $t1
		beqz $t2, L40
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s5, $v0
		beqz $s5, L42
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s1, $v0
		b L43
L42:		nop
		li $s2, 0
L43:		nop
		b L41
L40:		nop
		move $t0, $s4
		move $t1, $s0
		slt $t2, $t0, $t1
		beqz $t2, L44
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		beqz $s4, L46
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s1, $v0
		b L47
L46:		nop
		li $s2, 0
L47:		nop
		b L45
L44:		nop
		li $s3, 1
		li $s2, 0
L45:		nop
L41:		nop
		b L38
L39:		nop
		move $t0, $s3
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

		.text
		.globl Tree_Print
Tree_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		move $t2, $t0
		move $t0, $t2
		lw $t3, 0($t0)
		move $t0, $t3
		lw $t3, 76($t0)
		move $t0, $t3
		move $t3, $t0
		move $t0, $t2
		move $t2, $t1
		move $a0, $t0
		move $a1, $t2
		jalr $t3
		move $t1, $v0
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Tree_RecPrint
Tree_RecPrint:
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
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 52($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		beqz $s2, L48
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 76($t1)
		move $t1, $t2
		move $s2, $t1
		move $s3, $t0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s3
		move $a1, $s4
		jalr $s2
		move $t0, $v0
		b L49
L48:		nop
		li $t0, 1
L49:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		move $a0, $s2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 48($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		beqz $s2, L50
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 76($t1)
		move $t1, $t2
		move $s0, $t1
		move $s2, $t0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s1, $v0
		move $a0, $s2
		move $a1, $s1
		jalr $s0
		move $t0, $v0
		b L51
L50:		nop
		li $t0, 1
L51:		nop
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

