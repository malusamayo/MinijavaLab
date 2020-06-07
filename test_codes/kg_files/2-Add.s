		.data
		.align 0
newline:		.asciiz "\n"

		.text
		.globl	main
main:
		sw $ra, -4($sp)
		move $fp, $sp
		subu $sp, $sp, 4
		li $t0, 12
		li $t1, 21
		add $t2, $t0, $t1
		move $a0, $t2
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		addu $sp, $sp, 4
		lw $ra, -4($sp)
		j $ra

