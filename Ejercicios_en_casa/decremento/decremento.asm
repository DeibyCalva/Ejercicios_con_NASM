
; un programa que muestra la funcionalidad DEC para decrementar
; e imprimir el resultado en pantalla
%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
	msj1 db "Ingrese un número:"
	leng1 equ $ - msj1

    msj2 db 10, 'Decremento '
	leng2 equ $ - msj2

	new_line db '',10

section .bss
	numero resb 5
	resultado resb 1
	
section .text
	global _start

_start :
	; ******* mensaje ingrese número
	escribir msj1, leng1
    
    mov eax, 3
	mov ebx, 2
	mov ecx, numero
	mov edx, 1
	int 80h


	jmp imprimir

imprimir:
    
    mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, 1
	int 80h

	mov eax, [numero]
	sub eax, '0'
	dec eax	
	mov ecx, eax
	add eax, '0'
	mov [numero], eax	

	cmp ecx, 0
	jz salir
	jmp imprimir

salir:
	mov eax, 1
    int 80h