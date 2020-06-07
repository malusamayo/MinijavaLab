		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 4
		li $t0, 1
		li $t1, 0
L0:		move $t2, $t0
		li $t3, 10
		slt $t4, $t2, $t3
		beqz $t4, L1
		move $t2, $t0
		li $t3, 1
		add $t0, $t2, $t3
		move $t2, $t1
		li $t3, 1
		sub $t1, $t2, $t3
		b L0
L1:		nop
		move $t2, $t0
		move $t3, $t1
		slt $t4, $t2, $t3
		beqz $t4, L2
		move $t2, $t1
		move $t1, $t0
		move $t0, $t2
		b L3
L2:		nop
L3:		nop
		move $t2, $t0
		move $t3, $t1
		slt $t4, $t2, $t3
		beqz $t4, L4
		b L5
L4:		nop
L5:		nop
L6:		move $t2, $t0
		move $t3, $t1
		slt $t4, $t2, $t3
		beqz $t4, L7
		b L6
L7:		nop
		move $t2, $t0
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t1
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 4
		lw $ra, -4($sp)
		j $ra

