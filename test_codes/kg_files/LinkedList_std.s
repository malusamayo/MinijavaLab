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
		la $t2, LL_Start
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
		sw $t1, 4($t0)
		sw $t2, 8($t0)
		sw $t3, 12($t0)
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
		lw $t1, 4($t0)
		move $v0, $t1
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
		lw $t1, 8($t0)
		move $v0, $t1
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
		lw $t1, 12($t0)
		move $v0, $t1
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
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		li $s3, 1
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 20($t2)
		lw $t2, 4($s0)
		move $a0, $t1
		move $a1, $t0
		move $a2, $t2
		jalr $t3
		move $s4, $v0
		sub $t0, $s3, $s4
		beqz $t0, L2
		li $s2, 0
		b L3
L2:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		li $s3, 1
		move $t1, $s0
		lw $t2, 0($t1)
		lw $t3, 20($t2)
		lw $t2, 8($s0)
		move $a0, $t1
		move $a1, $t0
		move $a2, $t2
		jalr $t3
		move $s4, $v0
		sub $t0, $s3, $s4
		beqz $t0, L4
		li $s2, 0
		b L5
L4:		nop
		lw $t0, 12($s0)
		beqz $t0, L6
		li $s0, 1
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		sub $t0, $s0, $s3
		beqz $t0, L8
		li $s2, 0
		b L9
L8:		nop
		li $t0, 0
L9:		nop
		b L7
L6:		nop
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 12($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		beqz $s0, L10
		li $s2, 0
		b L11
L10:		nop
		li $t0, 0
L11:		nop
L7:		nop
L5:		nop
L3:		nop
		move $v0, $s2
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
		li $v1, 1
		add $t3, $t1, $v1
		slt $t4, $t0, $t1
		beqz $t4, L12
		li $t2, 0
		b L13
L12:		nop
		li $t1, 1
		slt $t4, $t0, $t3
		sub $t0, $t1, $t4
		beqz $t0, L14
		li $t2, 0
		b L15
L14:		nop
		li $t2, 1
L15:		nop
L13:		nop
		move $v0, $t2
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
		li $t1, 1
		sw $t1, 12($t0)
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
		sw $t3, 12($t0)
		sw $t1, 4($t0)
		sw $t2, 8($t0)
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
		subu $sp, $sp, 16
		sw $s0, 4($sp)
		sw $s1, 0($sp)
		move $t0, $a0
		move $t1, $a1
		move $t2, $t0
		li $a0, 40
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t3, $v0
		la $t4, List_Print
		sw $t4, 36($t0)
		la $t4, List_GetNext
		sw $t4, 32($t0)
		la $t4, List_GetElem
		sw $t4, 28($t0)
		la $t4, List_GetEnd
		sw $t4, 24($t0)
		la $t4, List_Search
		sw $t4, 20($t0)
		la $t4, List_Delete
		sw $t4, 16($t0)
		la $t4, List_SetNext
		sw $t4, 12($t0)
		la $t4, List_Insert
		sw $t4, 8($t0)
		la $t4, List_InitNew
		sw $t4, 4($t0)
		la $t4, List_Init
		sw $t4, 0($t0)
		li $t4, 4
L16:		nop
		li $t5, 16
		slt $t6, $t4, $t5
		beqz $t6, L17
		add $t5, $t3, $t4
		li $t6, 0
		sw $t6, 0($t5)
		li $v1, 4
		add $t4, $t4, $v1
		b L16
L17:		nop
		sw $t0, 0($t3)
		move $s0, $t3
		move $t0, $s0
		lw $t3, 0($t0)
		lw $t4, 4($t3)
		li $t3, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t2
		move $a3, $t3
		jalr $t4
		move $s1, $v0
		move $t0, $s1
		move $v0, $s0
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addu $sp, $sp, 16
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
		sw $t1, 8($t0)
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
		subu $sp, $sp, 56
		sw $s0, 44($sp)
		sw $s1, 40($sp)
		sw $s2, 36($sp)
		sw $s3, 32($sp)
		sw $s4, 28($sp)
		sw $s5, 24($sp)
		sw $s6, 20($sp)
		sw $s7, 16($sp)
		move $t0, $a0
		move $s0, $a1
		move $v0, $t0
		sw $v0, 12($sp)
		li $v0, 0
		sw $v0, 8($sp)
		li $t1, 0
		li $v1, 1
		sub $s3, $t1, $v1
		move $s4, $t0
		move $s5, $t0
		lw $t1, 12($t0)
		move $v0, $t1
		sw $v0, 4($sp)
		lw $t1, 4($t0)
		move $v0, $t1
		sw $v0, 0($sp)
L18:		nop
		li $t0, 0
		li $t1, 1
		lw $v1, 4($sp)
		sub $t2, $t1, $v1
		beqz $t2, L20
		li $t1, 1
		lw $v1, 8($sp)
		sub $t2, $t1, $v1
		beqz $t2, L20
		li $t0, 1
L20:		nop
		beqz $t0, L19
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		lw $v1, 0($sp)
		move $a1, $v1
		jalr $t2
		move $s1, $v0
		beqz $s1, L21
		li $v0, 1
		sw $v0, 8($sp)
		li $t0, 0
		slt $t1, $s3, $t0
		beqz $t1, L23
		move $t0, $s4
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $v0, $s1
		sw $v0, 12($sp)
		b L24
L23:		nop
		li $t0, 0
		li $t1, 555
		sub $t2, $t0, $t1
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $s1, $s5
		lw $t0, 0($s1)
		lw $s2, 12($t0)
		move $t0, $s4
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s6, $v0
		move $a0, $s1
		move $a1, $s6
		jalr $s2
		move $s7, $v0
		move $t0, $s7
		li $t0, 0
		li $t1, 555
		sub $t2, $t0, $t1
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
L24:		nop
		b L22
L21:		nop
		li $t0, 0
L22:		nop
		li $t0, 1
		lw $v1, 8($sp)
		sub $t1, $t0, $v1
		beqz $t1, L25
		move $s5, $s4
		move $t0, $s4
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $s4, $s1
		move $t0, $s4
		lw $t1, 0($t0)
		lw $t2, 24($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $v0, $s1
		sw $v0, 4($sp)
		move $t0, $s4
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $v0, $s1
		sw $v0, 0($sp)
		li $s3, 1
		b L26
L25:		nop
		li $t0, 0
L26:		nop
		b L18
L19:		nop
		lw $v1, 12($sp)
		move $v0, $v1
		lw $s0, 44($sp)
		lw $s1, 40($sp)
		lw $s2, 36($sp)
		lw $s3, 32($sp)
		lw $s4, 28($sp)
		lw $s5, 24($sp)
		lw $s6, 20($sp)
		lw $s7, 16($sp)
		addu $sp, $sp, 56
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
		lw $t1, 12($t0)
		move $s3, $t1
		lw $t1, 4($t0)
		move $s4, $t1
L27:		nop
		li $t0, 1
		sub $t1, $t0, $s3
		beqz $t1, L28
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		move $a1, $s4
		jalr $t2
		move $s5, $v0
		beqz $s5, L29
		li $s1, 1
		b L30
L29:		nop
		li $t0, 0
L30:		nop
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $s2, $s5
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 24($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $s3, $s5
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s5, $v0
		move $s4, $s5
		b L27
L28:		nop
		move $v0, $s1
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
		lw $t1, 12($t0)
		move $v0, $t1
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
		lw $t1, 4($t0)
		move $v0, $t1
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
		lw $t1, 8($t0)
		move $v0, $t1
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
		lw $t1, 12($t0)
		move $s1, $t1
		lw $t1, 4($t0)
		move $s2, $t1
L31:		nop
		li $t0, 1
		sub $t1, $t0, $s1
		beqz $t1, L32
		move $t0, $s2
		lw $t1, 0($t0)
		lw $t2, 4($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $a0, $s3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 32($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $s0, $s3
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 24($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $s1, $s3
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 28($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $s2, $s3
		b L31
L32:		nop
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
		li $a0, 40
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, List_Print
		sw $t2, 36($t0)
		la $t2, List_GetNext
		sw $t2, 32($t0)
		la $t2, List_GetElem
		sw $t2, 28($t0)
		la $t2, List_GetEnd
		sw $t2, 24($t0)
		la $t2, List_Search
		sw $t2, 20($t0)
		la $t2, List_Delete
		sw $t2, 16($t0)
		la $t2, List_SetNext
		sw $t2, 12($t0)
		la $t2, List_Insert
		sw $t2, 8($t0)
		la $t2, List_InitNew
		sw $t2, 4($t0)
		la $t2, List_Init
		sw $t2, 0($t0)
		li $t2, 4
L33:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L34
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L33
L34:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		move $a0, $t0
		jalr $t2
		move $s1, $v0
		move $t0, $s1
		move $s1, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		move $t0, $s0
		li $a0, 24
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Element_Compare
		sw $t2, 20($t0)
		la $t2, Element_Equal
		sw $t2, 16($t0)
		la $t2, Element_GetMarried
		sw $t2, 12($t0)
		la $t2, Element_GetSalary
		sw $t2, 8($t0)
		la $t2, Element_GetAge
		sw $t2, 4($t0)
		la $t2, Element_Init
		sw $t2, 0($t0)
		li $t2, 4
L35:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L36
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L35
L36:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 25
		li $t3, 37000
		li $t4, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		move $a1, $s0
		jalr $t2
		move $s2, $v0
		move $s1, $s2
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		li $t0, 10000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $a0, 24
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Element_Compare
		sw $t2, 20($t0)
		la $t2, Element_Equal
		sw $t2, 16($t0)
		la $t2, Element_GetMarried
		sw $t2, 12($t0)
		la $t2, Element_GetSalary
		sw $t2, 8($t0)
		la $t2, Element_GetAge
		sw $t2, 4($t0)
		la $t2, Element_Init
		sw $t2, 0($t0)
		li $t2, 4
L37:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L38
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L37
L38:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 39
		li $t3, 42000
		li $t4, 1
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		move $s2, $s0
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		move $a1, $s0
		jalr $t2
		move $s3, $v0
		move $s1, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		li $t0, 10000000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $a0, 24
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Element_Compare
		sw $t2, 20($t0)
		la $t2, Element_Equal
		sw $t2, 16($t0)
		la $t2, Element_GetMarried
		sw $t2, 12($t0)
		la $t2, Element_GetSalary
		sw $t2, 8($t0)
		la $t2, Element_GetAge
		sw $t2, 4($t0)
		la $t2, Element_Init
		sw $t2, 0($t0)
		li $t2, 4
L39:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L40
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L39
L40:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 22
		li $t3, 34000
		li $t4, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		move $a1, $s0
		jalr $t2
		move $s3, $v0
		move $s1, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		li $a0, 24
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Element_Compare
		sw $t2, 20($t0)
		la $t2, Element_Equal
		sw $t2, 16($t0)
		la $t2, Element_GetMarried
		sw $t2, 12($t0)
		la $t2, Element_GetSalary
		sw $t2, 8($t0)
		la $t2, Element_GetAge
		sw $t2, 4($t0)
		la $t2, Element_Init
		sw $t2, 0($t0)
		li $t2, 4
L41:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L42
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L41
L42:		nop
		sw $t0, 0($t1)
		move $s3, $t1
		move $t0, $s3
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 27
		li $t3, 34000
		li $t4, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s4, $v0
		move $t0, $s4
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		move $a1, $s2
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 20($t1)
		move $a0, $t0
		move $a1, $s3
		jalr $t2
		move $s4, $v0
		move $a0, $s4
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
		li $a0, 24
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 16
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, Element_Compare
		sw $t2, 20($t0)
		la $t2, Element_Equal
		sw $t2, 16($t0)
		la $t2, Element_GetMarried
		sw $t2, 12($t0)
		la $t2, Element_GetSalary
		sw $t2, 8($t0)
		la $t2, Element_GetAge
		sw $t2, 4($t0)
		la $t2, Element_Init
		sw $t2, 0($t0)
		li $t2, 4
L43:		nop
		li $t3, 16
		slt $t4, $t2, $t3
		beqz $t4, L44
		add $t3, $t1, $t2
		li $t4, 0
		sw $t4, 0($t3)
		li $v1, 4
		add $t2, $t2, $v1
		b L43
L44:		nop
		sw $t0, 0($t1)
		move $s0, $t1
		move $t0, $s0
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 28
		li $t3, 35000
		li $t4, 0
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 8($t1)
		move $a0, $t0
		move $a1, $s0
		jalr $t2
		move $s3, $v0
		move $s1, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s3, $v0
		move $t0, $s3
		li $t0, 2220000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		move $a1, $s2
		jalr $t2
		move $s3, $v0
		move $s1, $s3
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s2, $v0
		move $t0, $s2
		li $t0, 33300000
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 16($t1)
		move $a0, $t0
		move $a1, $s0
		jalr $t2
		move $s2, $v0
		move $s1, $s2
		move $t0, $s1
		lw $t1, 0($t0)
		lw $t2, 36($t1)
		move $a0, $t0
		jalr $t2
		move $s0, $v0
		move $t0, $s0
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

