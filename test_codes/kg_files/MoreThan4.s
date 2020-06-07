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
		li $t0, 8
		move $a0, $t0
		li $v0, 9
		syscall
		move $t2, $v0
		move $t0, $t1
		move $t3, $t2
		sw $t3, 0($t0)
		move $t0, $t2
		la $t3, MT4_Start
		sw $t3, 0($t0)
		move $t0, $t2
		la $t2, MT4_Change
		sw $t2, 4($t0)
		move $t0, $t1
		move $t1, $t0
		move $t0, $t1
		lw $t2, 0($t0)
		move $t0, $t2
		lw $t2, 0($t0)
		move $t0, $t2
		move $t2, $t0
		move $t0, $t1
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
		move $t7, $t1
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t2
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t3
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t4
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t5
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t6
		move $a0, $t7
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t7, $t0
		move $t0, $t7
		lw $t8, 0($t0)
		move $t0, $t8
		lw $t8, 4($t0)
		move $t0, $t8
		move $t8, $t0
		move $t0, $t7
		move $t7, $t6
		move $t6, $t5
		move $t5, $t4
		move $t4, $t3
		move $t3, $t2
		move $t2, $t1
		move $a0, $t0
		move $a1, $t7
		move $a2, $t6
		move $a3, $t5
		sw $t4 -12($sp)
		sw $t3 -16($sp)
		sw $t2 -20($sp)
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
		move $t6, $t0
		move $a0, $t6
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
		move $t0, $t2
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t3
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t4
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		move $t0, $t5
		move $a0, $t0
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

