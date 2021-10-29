ARRAY_LENGTH = 10
SYSCALL_PRINT_INT = 1
SYSCALL_PRINT_CHAR = 11

main:

main__prologue:
	push	$ra

main__body:
	la	$a0, array		# $a0 = array
	li	$a1, ARRAY_LENGTH	# $a1 = ARRAY_LENGTH
	jal	max			# max(array, ARRAY_LENGTH)

	# result will be in $v0

	move	$a0, $v0		# $a0 = result
	li	$v0, SYSCALL_PRINT_INT
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, SYSCALL_PRINT_CHAR
	syscall				# printf("\n")

main__epilogue:
	pop	$ra

	li	$v0, 0
	jr	$ra			# return 0



max:
	# $a0 = address of array
	# $a1 = length
max__prologue:
	push	$ra
	push	$s0

max__body:
	# first_element is in $s0
	lw	$s0, ($a0)		# $s0 = a[0]

max__if_cond:
	beq	$a1, 1, max__if_true
	b	max__if_false

max__if_true:
	move	$v0, $s0
	j	max__epilogue		# return first_element

max__if_false:
	addi	$a0, $a0, 4		# $a0 = &a[1]
	addi	$a1, $a1, -1		# $a1 = length - 1
	jal	max

	# max_so_far is in $v0
max__if_false_inner_cond:
	bgt	$s0, $v0, max__if_false_inner_true
	b	max__if_false_inner_post

max__if_false_inner_true:
	move	$v0, $s0		# $v0 = first_element

max__if_false_inner_post:
	# these 2 instructions are redundant
	move	$v0, $v0
	j	max__epilogue

max__epilogue:
	pop	$s0
	pop	$ra

	jr	$ra

	.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1
