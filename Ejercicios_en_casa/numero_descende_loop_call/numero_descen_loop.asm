section .data
	nueva_linea db 10,''


section .bss	;almacenamos elementos a imprimir
	resultado resb 1	; para que solo imprima el numero

section .text
	global _start
_start:
	mov ecx, 9
	mov ebx, 9

;******* imprimir enter y evaluar cada fila *******
l1:  		; invertiremos al cx, para que tenga max y min valores
	push ecx
	push ebx
	call imprimir_enter	; se reemplaza el valor de cx por enter
						; y se reemplaza el valor de ebx por 1
	pop ecx		;toma el valor de 9
	push ecx
	

;******* imprimir numero y evaluar cada coluna *******
l2:
	push ecx
	add ecx,'0'
	mov [resultado], ecx
	call imprimir_numero	; se remmplaza el valor cx por num y 
							; se reemplaza el valor de ebx por 1
	pop ecx
	loop l2 			; es el encargado de -> 5,4,3,2,1
	;*** Fin del ciclo l2 ***
	
	pop ebx
	pop ecx
	dec ebx
	loop l1			; usa el valor de ecx
	int 80h

imprimir_enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	ret
imprimir_numero:
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
	ret
	

salir:
