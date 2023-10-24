	.data
	.eqv	print_10,1
	.eqv	print_str,4
	.eqv	read_int,5
	.eqv	print_char,11
str1:	.asciiz	"\nIntroduza um numero: "
str2:	.asciiz	"\nO valor em binário e:"
	.text
	.globl main
	
	# Mapa de registos
	# $t0 = valor dec
	# $t1 = i
	# $t2 = bit
	# $t3 = resto de i por 4
	# $t4 = flag
	
main:
	# Perguntar valor
	la	$a0,str1
	li	$v0,print_str
	syscall
	# Receber o valor
	li	$v0,read_int
	syscall
	la	$t0,($v0)
	# Prompt final
	la	$a0,str2
	li	$v0,print_str
	syscall
	# Convercao em binario
	li	$t1,0
do:
	andi	$t2,$t0,0x80000000
	srl	$t2,$t2,31

	beqz	$t4,skip
print:
	li	$t4,1
	rem	$t3,$t1,4
	bnez	$t3,endif
	li	$a0,' '
	li	$v0,print_char
	syscall
endif:
	la	$a0,($t2)
	li	$v0,print_10
	syscall
	sll	$t0,$t0,1
	addi	$t1,$t1,1
	bge	$t1,32,endwhile
	j	do
skip:
	beq	$t2,1,print
	sll	$t0,$t0,1
	addi	$t1,$t1,1
	bge	$t1,32,endwhile
	j	do
endwhile:
	jr	$ra
