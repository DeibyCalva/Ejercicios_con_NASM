
section .data

	mensaje db "Ingrese su nombre",0xa
	len equ $-mensaje
	presentar db "EL nombre ingresado es: "
	len_p equ $-presentar
	
section .bss

	nombre resb 25
	leng_tamanio equ $-nombre
	
section .text
	global _start
_start:
	;*********imprimir mensaje*********
	mov eax,4
	mov ebx,1
	mov ecx, mensaje
	mov edx, len
	int 80h
	
	
	;*********lectura nombre*********
	mov eax,3 ;lectura / operacion lectura
	mov ebx,2
	mov ecx, nombre
	mov edx, 10
	int 80h
	
	;*********imprimir presentar*********
	mov eax,4
	mov ebx,1
	mov ecx, presentar
	mov edx, len_p
	int 80h
	

	;*********imprimir nombre*********
	mov eax,4
	mov ebx,1
	mov ecx, nombre
	mov edx, leng_tamanio
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
	
