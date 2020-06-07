		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 8
		li $a0, 8
		li $v0, 9
		syscall
		move $t0, $v0
		li $a0, 4
		li $v0, 9
		syscall
		move $t1, $v0
		la $t2, MT4_Change
		sw $t2, 4($t0)
		la $t2, MT4_Start
		sw $t2, 0($t0)
		sw $t0, 0($t1)
		move $t0, $t1
		lw $t1, 0($t0)
		lw $t2, 0($t1)
		li $t1, 1
		li $t3, 2
		li $t4, 3
		li $t5, 4
		li $t6, 5
		li $t7, 6
		move $a0, $t0
		move $a1, $t1
		move $a2, $t3
		move $a3, $t4
		sw $t5 -12($sp)
		sw $t6 -16($sp)
		sw $t7 -20($sp)
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
		.globl MT4_Start
MT4_Start:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 24
		sw $s0, 0($sp)
		move $t0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t3, $a3
		lw $t4, 12($sp)
		lw $t5, 8($sp)
		lw $t6, 4($sp)
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t5
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t6
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t0
		lw $t0, 0($t7)
		lw $t8, 4($t0)
		move $a0, $t7
		move $a1, $t6
		move $a2, $t5
		move $a3, $t4
		sw $t3 -12($sp)
		sw $t2 -16($sp)
		sw $t1 -20($sp)
		jalr $t8
		move $s0, $v0
		move $t0, $s0
		move $v0, $t0
		lw $s0, 0($sp)
		addu $sp, $sp, 24
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

		.text
		.globl MT4_Change
MT4_Change:
		sw $fp, -8($sp)
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 20
		move $t0, $a1
		move $t1, $a2
		move $t2, $a3
		lw $t3, 8($sp)
		lw $t4, 4($sp)
		lw $t5, 0($sp)
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t3
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t4
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $a0, $t5
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $t0, 0
		move $v0, $t0
		addu $sp, $sp, 20
		lw $fp, -8($sp)
		lw $ra, -4($sp)
		j $ra

