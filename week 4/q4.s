# print the square of a number

	.text	# code/instructions go here
main:
	# x is in $t0
	# y is in $t1

	li	$v0, 4			# $v0 = 4
	la	$a0, prompt_string	# $a0 = address of prompt_string
	syscall

	# scanf("%d", &x)
	li	$v0, 5
	syscall				# scanf("%d", $v0)
	move	$t0, $v0		# x = $v0

	bgt	$t0, 46340, if_true
	b	if_false

	# ble	$t0, 46340, if_false

if_true:
	li	$v0, 4
	la	$a0, error_string
	syscall

	b	if_post

if_false:
	mul	$t1, $t0, $t0		# y = x * x

	move	$a0, $t1
	li	$v0, 1
	syscall				# printf("%d", y)

	li	$v0, 11
	li	$a0, '\n'
	syscall				# printf("\n")

	# b	if_post

if_post:
	li	$v0, 0
	jr	$ra			# return 0

	.data	# stuff I want in memory
prompt_string:
	.asciiz	"Enter a number: "

error_string:
	.asciiz "square too big for 32 bits\n"
