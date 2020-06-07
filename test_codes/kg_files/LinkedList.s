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
		la $t2, LL_Start
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
		.globl Element_Init
Element_Init:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t3, $a3
		move $t4, $t0
		move $t5, $t1
		sw $t5, 12($t4)
		move $t1, $t0
		move $t4, $t2
		sw $t4, 4($t1)
		move $t1, $t0
		move $t0, $t3
		sw $t0, 8($t1)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Element_GetAge
Element_GetAge:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		lw $t0, 12($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl Element_GetSalary
Element_GetSalary:
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
		.globl Element_GetMarried
Element_GetMarried:
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
		.globl Element_Equal
Element_Equal:
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
		li $s2, 1
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		li $s4, 1
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s3
		move $t3, $s0
		lw $t4, 12($t3)
		move $t3, $t4
		move $t4, $t3
		move $a0, $t1
		move $a1, $t0
		move $a2, $t4
		jalr $t2
		move $s3, $v0
		sub $t0, $s4, $s3
		beqz $t0, L0
		li $s2, 0
		b L1
L0:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		li $s4, 1
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s3
		move $t3, $s0
		lw $t4, 4($t3)
		move $t3, $t4
		move $t4, $t3
		move $a0, $t1
		move $a1, $t0
		move $a2, $t4
		jalr $t2
		move $s3, $v0
		sub $t0, $s4, $s3
		beqz $t0, L2
		li $s2, 0
		b L3
L2:		nop
		move $t0, $s0
		lw $t1, 8($t0)
		move $t0, $t1
		move $t1, $t0
		beqz $t1, L4
		li $s0, 1
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		sub $t0, $s0, $s3
		beqz $t0, L6
		li $s2, 0
		b L7
L6:		nop
		li $t0, 0
L7:		nop
		b L5
L4:		nop
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s0, $v0
		beqz $s0, L8
		li $s2, 0
		b L9
L8:		nop
		li $t0, 0
L9:		nop
L5:		nop
L3:		nop
L1:		nop
		move $t0, $s2
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
		.globl Element_Compare
Element_Compare:
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
		beqz $t1, L10
		li $t2, 0
		b L11
L10:		nop
		li $t1, 1
		move $t3, $t0
		move $t0, $t5
		slt $t4, $t3, $t0
		sub $t0, $t1, $t4
		beqz $t0, L12
		li $t2, 0
		b L13
L12:		nop
		li $t2, 1
L13:		nop
L11:		nop
		move $t0, $t2
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_Init
List_Init:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		li $t0, 1
		sw $t0, 12($t1)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_InitNew
List_InitNew:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t3, $a3
		move $t4, $t0
		move $t5, $t3
		sw $t5, 12($t4)
		move $t3, $t0
		move $t4, $t1
		sw $t4, 4($t3)
		move $t1, $t0
		move $t0, $t2
		sw $t0, 8($t1)
		li $t0, 1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_Insert
List_Insert:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t3, $v0
		li $t0, 40
		move $a0, $t0
		li $v0, 9
		syscall
		move $t4, $v0
		move $t0, $t3
		move $t5, $t4
		sw $t5, 0($t0)
		move $t0, $t3
		li $t5, 0
		sw $t5, 4($t0)
		move $t0, $t3
		li $t5, 0
		sw $t5, 8($t0)
		move $t0, $t3
		li $t5, 0
		sw $t5, 12($t0)
		move $t0, $t4
		la $t5, List_Delete
		sw $t5, 0($t0)
		move $t0, $t4
		la $t5, List_Print
		sw $t5, 4($t0)
		move $t0, $t4
		la $t5, List_Init
		sw $t5, 8($t0)
		move $t0, $t4
		la $t5, List_GetElem
		sw $t5, 12($t0)
		move $t0, $t4
		la $t5, List_GetNext
		sw $t5, 16($t0)
		move $t0, $t4
		la $t5, List_SetNext
		sw $t5, 20($t0)
		move $t0, $t4
		la $t5, List_Search
		sw $t5, 24($t0)
		move $t0, $t4
		la $t5, List_GetEnd
		sw $t5, 28($t0)
		move $t0, $t4
		la $t5, List_InitNew
		sw $t5, 32($t0)
		move $t0, $t4
		la $t4, List_Insert
		sw $t4, 36($t0)
		move $t0, $t3
		move $s0, $t0
		move $t0, $s0
		move $t3, $t0
		lw $t4, 0($t3)
		move $t3, $t4
		lw $t4, 32($t3)
		move $t3, $t4
		move $t4, $t3
		move $t3, $t0
		move $t0, $t1
		move $t1, $t2
		li $t2, 0
		move $a0, $t3
		move $a1, $t0
		move $a2, $t1
		move $a3, $t2
		jalr $t4
		move $t5, $v0
		move $t0, $s0
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 12
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_SetNext
List_SetNext:
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
		.globl List_Delete
List_Delete:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 52
		sw $s0, 40($sp)
		sw $s1, 36($sp)
		sw $s2, 32($sp)
		sw $s3, 28($sp)
		sw $s4, 24($sp)
		sw $s5, 20($sp)
		sw $s6, 16($sp)
		sw $s7, 12($sp)
		move $t0, $a0
		move $s0, $a1
		move $v0, $t0
		sw $v0, 8($sp)
		li $v0, 0
		sw $v0, 4($sp)
		li $t1, 0
		li $t2, 1
		sub $s3, $t1, $t2
		move $s4, $t0
		move $s5, $t0
		move $t1, $t0
		lw $t2, 12($t1)
		move $t1, $t2
		move $v0, $t1
		sw $v0, 0($sp)
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $s7, $t1
L14:		li $t0, 1
		lw $v1, 0($sp)
		move $t1, $v1
		sub $t2, $t0, $t1
		beqz $t2, L16
		li $t0, 1
		lw $v1, 4($sp)
		move $t1, $v1
		sub $t2, $t0, $t1
		beqz $t2, L16
		li $t0, 1
		b L17
L16:		li $t0, 0
L17:		nop
		move $t1, $t0
		move $t0, $t1
		beqz $t0, L15
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s7
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		beqz $s1, L18
		li $v0, 1
		sw $v0, 4($sp)
		move $t0, $s3
		li $t1, 0
		slt $t2, $t0, $t1
		beqz $t2, L20
		move $t0, $s4
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $v0, $v0
		sw $v0, 8($sp)
		b L21
L20:		nop
		li $t0, 0
		li $t1, 555
		sub $t2, $t0, $t1
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s5
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 20($t1)
		move $t1, $t2
		move $s1, $t1
		move $s2, $t0
		move $t0, $s4
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s6, $v0
		move $a0, $s2
		move $a1, $s6
		jalr $s1
		move $t0, $v0
		li $t0, 0
		li $t1, 555
		sub $t2, $t0, $t1
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
L21:		nop
		b L19
L18:		nop
		li $t0, 0
L19:		nop
		li $t0, 1
		lw $v1, 4($sp)
		move $t1, $v1
		sub $t2, $t0, $t1
		beqz $t2, L22
		move $s5, $s4
		move $t0, $s4
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $t0, $s4
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 28($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $v0, $v0
		sw $v0, 0($sp)
		move $t0, $s4
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
		li $s3, 1
		b L23
L22:		nop
		li $t0, 0
L23:		nop
		b L14
L15:		nop
		lw $v1, 8($sp)
		move $t0, $v1
		move $v0, $t0
		lw $s0, 40($sp)
		lw $s1, 36($sp)
		lw $s2, 32($sp)
		lw $s3, 28($sp)
		lw $s4, 24($sp)
		lw $s5, 20($sp)
		lw $s6, 16($sp)
		lw $s7, 12($sp)
		addu $sp, $sp, 52
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_Search
List_Search:
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
		li $s1, 0
		move $s2, $t0
		move $t1, $t0
		lw $t2, 12($t1)
		move $t1, $t2
		move $s3, $t1
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $s4, $t1
L24:		li $t0, 1
		move $t1, $s3
		sub $t2, $t0, $t1
		beqz $t2, L25
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 12($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s4
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s5, $v0
		beqz $s5, L26
		li $s1, 1
		b L27
L26:		nop
		li $t0, 0
L27:		nop
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 28($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
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
		move $s4, $v0
		b L24
L25:		nop
		move $t0, $s1
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
		.globl List_GetEnd
List_GetEnd:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		lw $t0, 12($t1)
		move $t1, $t0
		move $t0, $t1
		move $v0, $t0
		addu $sp, $sp, 8
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl List_GetElem
List_GetElem:
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
		.globl List_GetNext
List_GetNext:
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
		.globl List_Print
List_Print:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 24
		sw $s0, 12($sp)
		sw $s1, 8($sp)
		sw $s2, 4($sp)
		sw $s3, 0($sp)
		move $t0, $a0
		move $s0, $t0
		move $t1, $t0
		lw $t2, 12($t1)
		move $t1, $t2
		move $s1, $t1
		move $t1, $t0
		lw $t0, 4($t1)
		move $t1, $t0
		move $s2, $t1
L28:		li $t0, 1
		move $t1, $s1
		sub $t2, $t0, $t1
		beqz $t2, L29
		move $t0, $s2
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s3, $v0
		move $a0, $s3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 28($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s1, $v0
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
		move $s2, $v0
		b L28
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
		.globl LL_Start
LL_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 28
		sw $s0, 16($sp)
		sw $s1, 12($sp)
		sw $s2, 8($sp)
		sw $s3, 4($sp)
		sw $s4, 0($sp)
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 40
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
		move $t0, $t2
		la $t3, List_Delete
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, List_Print
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, List_Init
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, List_GetElem
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, List_GetNext
		sw $t3, 16($t0)
		move $t0, $t2
		la $t3, List_SetNext
		sw $t3, 20($t0)
		move $t0, $t2
		la $t3, List_Search
		sw $t3, 24($t0)
		move $t0, $t2
		la $t3, List_GetEnd
		sw $t3, 28($t0)
		move $t0, $t2
		la $t3, List_InitNew
		sw $t3, 32($t0)
		move $t0, $t2
		la $t2, List_Insert
		sw $t2, 36($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		move $s1, $s0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
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
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 24
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
		move $t0, $t2
		la $t3, Element_GetSalary
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Element_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Element_GetAge
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Element_Equal
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Element_GetMarried
		sw $t3, 16($t0)
		move $t0, $t2
		la $t2, Element_Compare
		sw $t2, 20($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 25
		li $t3, 37000
		li $t4, 0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 10000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 24
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
		move $t0, $t2
		la $t3, Element_GetSalary
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Element_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Element_GetAge
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Element_Equal
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Element_GetMarried
		sw $t3, 16($t0)
		move $t0, $t2
		la $t2, Element_Compare
		sw $t2, 20($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 39
		li $t3, 42000
		li $t4, 1
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $t0, $v0
		move $s2, $s0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 10000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 24
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
		move $t0, $t2
		la $t3, Element_GetSalary
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Element_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Element_GetAge
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Element_Equal
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Element_GetMarried
		sw $t3, 16($t0)
		move $t0, $t2
		la $t2, Element_Compare
		sw $t2, 20($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 22
		li $t3, 34000
		li $t4, 0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 24
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
		move $t0, $t2
		la $t3, Element_GetSalary
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Element_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Element_GetAge
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Element_Equal
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Element_GetMarried
		sw $t3, 16($t0)
		move $t0, $t2
		la $t2, Element_Compare
		sw $t2, 20($t0)
		move $t0, $t1
		move $s3, $t0
		move $t0, $s3
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 27
		li $t3, 34000
		li $t4, 0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s2
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s3
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s3, $v0
		move $a0, $s3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 10000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t1, $v0
		li $t0, 24
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
		move $t0, $t2
		la $t3, Element_GetSalary
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, Element_Init
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, Element_GetAge
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, Element_Equal
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, Element_GetMarried
		sw $t3, 16($t0)
		move $t0, $t2
		la $t2, Element_Compare
		sw $t2, 20($t0)
		move $t0, $t1
		move $s0, $t0
		move $t0, $s0
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 28
		li $t3, 35000
		li $t4, 0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $t0, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 36($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 2220000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s2
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 33300000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $t0, $s0
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		li $t0, 44440000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
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

