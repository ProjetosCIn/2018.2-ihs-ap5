section .data

cte_1n equ -1
i equ 0
j equ 0
n equ 0

SECTION .text
global calcula_seno

get_out:
	ret

power:
	mov eax, i
	cmp eax, 0
	je get_out
	fmul st0, st0


fatorial:

calcula_seno:
	enter 0, 0
	finit
	fld qword [EBP + 16] ;Carrega X em st0

	l_oop:
		fld1 ;Carrega 1 em st0
		fsub 2 ;Subtrai 2 de st0 -> st0 = -1
		call power ;chama power, pega oque está em st0 e eleva a
		





