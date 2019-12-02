section .data
	msj_dividendo	db	'Ingrese Primer Número: ', 0xa	
	leng_dividendo	equ 	$ - msj_dividendo
 
	msj_divisor	db 'Ingrese Segundo Numero: ', 0xa
	leng_divisor	equ	$ - msj_divisor

	msj_cociente	db 10,'La División es:'
	leng_cociente		equ	$ - msj_cociente

	msj_residuo	db 10,'Residuo es: ' 
	leng_residuo	equ	$ - msj_residuo

section .bss
	num1 resb 1
	num2 resb 1
	resultado resb 1
	residuo resb 1

section .text
	global _start
_start:

	;********** Imprimimos en pantalla el mensaje 2*********
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_dividendo
	mov edx, leng_dividendo
	int 80h
 
	; *******Obtenemos el numero 1******************
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	;***********imprimimos en pantalla el mensaje 3********
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_divisor
	mov edx, leng_divisor
	int 80h
 
	;*************Obtenemos el numero 2**********
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h

	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	
	add al, '0' 	; Convertimos el resultado de la resta de decimal a ascii
 	add ah, '0'

	mov [resultado], al
	mov [residuo], ah
 
	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_cociente
	mov edx, leng_cociente
	int 80h
 
	;************************ Imprimimos en pantalla el resultado***************
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	; *********************Imprimimos en pantalla el resultado******************
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_residuo
	mov edx, leng_residuo
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
