		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 92
		li $t0, 20
		li $t1, 4
		li $t2, 1
		move $t3, $t0
		add $t4, $t2, $t3
		mul $t2, $t1, $t4
		move $a0, $t2
		li $v0, 9
		syscall
		move $t1, $v0
		move $t2, $t1
		move $t3, $t0
		sw $t3, 0($t2)
		move $t0, $t1
		move $v0, $t0
		sw $v0, 52($sp)
		li $t0, 19
L0:		li $t1, 0
		move $t2, $t0
		slt $t3, $t1, $t2
		beqz $t3, L1
		lw $v1, 52($sp)
		move $t1, $v1
		move $t2, $t1
		li $t1, 4
		li $t3, 1
		move $t4, $t0
		add $t5, $t3, $t4
		mul $t3, $t1, $t5
		add $t1, $t2, $t3
		move $t2, $t1
		move $t1, $t0
		sw $t1, 0($t2)
		move $t1, $t0
		li $t2, 1
		sub $t0, $t1, $t2
		b L0
L1:		nop
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
		la $t2, E_e
		sw $t2, 0($t0)
		move $t0, $t1
		move $t1, $t0
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		li $t0, 24
		move $a0, $t0
		li $v0, 9
		syscall
		move $t3, $v0
		move $t0, $t2
		move $t4, $t3
		sw $t4, 0($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 4($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 8($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 12($t0)
		move $t0, $t3
		la $t4, B_add
		sw $t4, 0($t0)
		move $t0, $t3
		la $t4, A_loc
		sw $t4, 4($t0)
		move $t0, $t3
		la $t4, A_print
		sw $t4, 8($t0)
		move $t0, $t3
		la $t4, A_set_true
		sw $t4, 12($t0)
		move $t0, $t3
		la $t4, B_set_false
		sw $t4, 16($t0)
		move $t0, $t3
		la $t3, B_show
		sw $t3, 20($t0)
		move $t0, $t2
		move $v0, $t0
		sw $v0, 48($sp)
		li $t0, 16
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		li $t0, 28
		move $a0, $t0
		li $v0, 9
		syscall
		move $t3, $v0
		move $t0, $t2
		move $t4, $t3
		sw $t4, 0($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 4($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 8($t0)
		move $t0, $t2
		li $t4, 0
		sw $t4, 12($t0)
		move $t0, $t3
		la $t4, B_add
		sw $t4, 0($t0)
		move $t0, $t3
		la $t4, A_loc
		sw $t4, 4($t0)
		move $t0, $t3
		la $t4, A_print
		sw $t4, 8($t0)
		move $t0, $t3
		la $t4, A_set_true
		sw $t4, 12($t0)
		move $t0, $t3
		la $t4, B_set_false
		sw $t4, 16($t0)
		move $t0, $t3
		la $t4, B_show
		sw $t4, 20($t0)
		move $t0, $t3
		la $t3, C_func
		sw $t3, 24($t0)
		move $t0, $t2
		move $v0, $t0
		sw $v0, 40($sp)
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		lw $v1, 48($sp)
		move $t0, $v1
		move $a0, $t1
		move $a1, $t0
		jalr $t2
		move $t3, $v0
		lw $v1, 48($sp)
		move $v0, $v1
		sw $v0, 44($sp)
		lw $v1, 48($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 44($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 48($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 44($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 48($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 8($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 48($sp)
		move $t0, $v1
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
		lw $v1, 44($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 16($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $t0, $v0
		lw $v1, 44($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		beqz $s4, L4
		lw $v1, 44($sp)
		move $t0, $v1
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
		beqz $s4, L4
		li $t0, 1
		b L5
L4:		li $t0, 0
L5:		nop
		move $t1, $t0
		move $t0, $t1
		beqz $t0, L2
		li $t0, 5428543
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		b L3
L2:		nop
		lw $v1, 48($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 4($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		move $a0, $t1
		jalr $t2
		move $s4, $v0
		beqz $s4, L6
		li $t0, 1234567
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		b L7
L6:		nop
		li $t0, 666
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
L7:		nop
L3:		nop
L8:		lw $v1, 48($sp)
		move $t0, $v1
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
		li $t0, 50
		slt $t1, $s4, $t0
		beqz $t1, L9
		lw $v1, 44($sp)
		move $t0, $v1
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
		lw $v1, 48($sp)
		move $t0, $v1
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
		move $a0, $s4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		lw $v1, 40($sp)
		move $t0, $v1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $t2, $t1
		move $t1, $t0
		li $t0, 0
		li $t3, 1
		li $t4, 2
		li $t5, 3
		li $t6, 4
		li $t7, 5
		li $t8, 6
		li $t9, 7
		li $s4, 8
		li $s5, 9
		li $s6, 10
		li $s7, 11
		li $v0, 12
		sw $v0, 20($sp)
		li $s1, 13
		li $v0, 14
		sw $v0, 28($sp)
		li $v0, 15
		sw $v0, 24($sp)
		li $v0, 16
		sw $v0, 36($sp)
		li $v0, 17
		sw $v0, 32($sp)
		li $s3, 28
		move $a0, $s3
		li $v0, 9
		syscall
		move $s2, $v0
		move $s3, $s2
		li $s0, 18
		sw $s0, 0($s3)
		move $s0, $s2
		li $s3, 19
		sw $s3, 4($s0)
		move $s0, $s2
		li $s3, 20
		sw $s3, 8($s0)
		move $s0, $s2
		li $s3, 21
		sw $s3, 12($s0)
		move $s0, $s2
		li $s3, 22
		sw $s3, 16($s0)
		move $s0, $s2
		li $s3, 23
		sw $s3, 20($s0)
		move $s0, $s2
		li $s3, 24
		sw $s3, 24($s0)
		move $s0, $s2
		move $s2, $s0
		move $a0, $t1
		move $a1, $t0
		move $a2, $t3
		move $a3, $t4
		sw $t5 -12($sp)
		sw $t6 -16($sp)
		sw $t7 -20($sp)
		sw $t8 -24($sp)
		sw $t9 -28($sp)
		sw $s4 -32($sp)
		sw $s5 -36($sp)
		sw $s6 -40($sp)
		sw $s7 -44($sp)
		lw $v1, 20($sp)
		sw $v1 -48($sp)
		sw $s1 -52($sp)
		lw $v1, 28($sp)
		sw $v1 -56($sp)
		lw $v1, 24($sp)
		sw $v1 -60($sp)
		lw $v1, 36($sp)
		sw $v1 -64($sp)
		lw $v1, 32($sp)
		sw $v1 -68($sp)
		sw $s2 -72($sp)
		jalr $t2
		move $s0, $v0
		move $a0, $s0
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
		li $t0, 28
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
		la $t3, B_add
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, A_loc
		sw $t3, 4($t0)
		move $t0, $t2
		la $t3, A_print
		sw $t3, 8($t0)
		move $t0, $t2
		la $t3, A_set_true
		sw $t3, 12($t0)
		move $t0, $t2
		la $t3, B_set_false
		sw $t3, 16($t0)
		move $t0, $t2
		la $t3, B_show
		sw $t3, 20($t0)
		move $t0, $t2
		la $t2, D_func
		sw $t2, 24($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		move $t1, $t0
		lw $t2, 0($t1)
		move $t1, $t2
		lw $t2, 24($t1)
		move $t1, $t2
		move $v0, $t1
		sw $v0, 16($sp)
		move $v0, $t0
		sw $v0, 12($sp)
		li $t0, 0
		li $v0, 1
		sw $v0, 8($sp)
		li $t4, 2
		li $t5, 3
		li $t6, 4
		li $v0, 5
		sw $v0, 4($sp)
		li $v0, 6
		sw $v0, 0($sp)
		li $t9, 7
		li $s0, 8
		li $s1, 9
		li $s2, 10
		li $s3, 11
		li $s4, 12
		lw $v1, 52($sp)
		move $s5, $v1
		move $s6, $s5
		li $s7, 4
		li $t2, 1
		li $t1, 13
		add $t3, $t2, $t1
		mul $t1, $s7, $t3
		add $s5, $s6, $t1
		move $t1, $s5
		lw $t2, 0($t1)
		move $t1, $t2
		move $t2, $t1
		lw $v1, 52($sp)
		move $t1, $v1
		move $t3, $t1
		li $s5, 4
		li $s6, 1
		li $s7, 14
		add $t7, $s6, $s7
		mul $s6, $s5, $t7
		add $t1, $t3, $s6
		move $t3, $t1
		lw $t1, 0($t3)
		move $t3, $t1
		move $t1, $t3
		li $t3, 15
		li $t7, 16
		li $s5, 17
		li $s6, 28
		move $a0, $s6
		li $v0, 9
		syscall
		move $s7, $v0
		move $s6, $s7
		li $t8, 18
		sw $t8, 0($s6)
		move $t8, $s7
		li $s6, 19
		sw $s6, 4($t8)
		move $t8, $s7
		li $s6, 20
		sw $s6, 8($t8)
		move $t8, $s7
		li $s6, 21
		sw $s6, 12($t8)
		move $t8, $s7
		li $s6, 22
		sw $s6, 16($t8)
		move $t8, $s7
		li $s6, 23
		sw $s6, 20($t8)
		move $t8, $s7
		li $s6, 24
		sw $s6, 24($t8)
		move $t8, $s7
		move $s6, $t8
		lw $v1, 12($sp)
		move $a0, $v1
		move $a1, $t0
		lw $v1, 8($sp)
		move $a2, $v1
		move $a3, $t4
		sw $t5 -12($sp)
		sw $t6 -16($sp)
		lw $v1, 4($sp)
		sw $v1 -20($sp)
		lw $v1, 0($sp)
		sw $v1 -24($sp)
		sw $t9 -28($sp)
		sw $s0 -32($sp)
		sw $s1 -36($sp)
		sw $s2 -40($sp)
		sw $s3 -44($sp)
		sw $s4 -48($sp)
		sw $t2 -52($sp)
		sw $t1 -56($sp)
		sw $t3 -60($sp)
		sw $t7 -64($sp)
		sw $s5 -68($sp)
		sw $s6 -72($sp)
		lw $v1, 16($sp)
		jalr $v1
		move $s7, $v0
		move $a0, $s7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		b L8
L9:		nop
		addu $sp, $sp, 92
		lw $ra, -4($sp)
		j $ra

		.text
		.globl E_e
E_e:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 12
		sw $s0, 0($sp)
		move $s0, $a1
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
		move $t0, $s0
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 12
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl A_print
A_print:
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
		.globl A_add
A_add:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		move $t2, $t0
		lw $t3, 8($t2)
		move $t2, $t3
		move $t3, $t2
		li $t2, 10
		add $t4, $t3, $t2
		sw $t4, 8($t1)
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
		.globl A_set_true
A_set_true:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		li $t2, 1
		sw $t2, 4($t1)
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
		.globl A_set_false
A_set_false:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		li $t2, 0
		sw $t2, 4($t1)
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
		.globl A_loc
A_loc:
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
		.globl B_add
B_add:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		move $t2, $t0
		lw $t3, 12($t2)
		move $t2, $t3
		move $t3, $t2
		li $t2, 10
		add $t4, $t3, $t2
		sw $t4, 12($t1)
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
		.globl B_set_false
B_set_false:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		move $t0, $a0
		move $t1, $t0
		li $t2, 0
		sw $t2, 4($t1)
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
		.globl B_show
B_show:
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
		.globl C_func
C_func:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 72
		lw $t1, 20($sp)
		lw $t0, 0($sp)
		move $t2, $t1
		move $t1, $t0
		lw $t0, 24($t1)
		move $t1, $t0
		move $t0, $t1
		add $t1, $t2, $t0
		move $v0, $t1
		addu $sp, $sp, 72
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl D_func
D_func:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 72
		move $t0, $a3
		lw $t1, 20($sp)
		move $t2, $t0
		move $t0, $t1
		mul $t1, $t2, $t0
		move $v0, $t1
		addu $sp, $sp, 72
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

