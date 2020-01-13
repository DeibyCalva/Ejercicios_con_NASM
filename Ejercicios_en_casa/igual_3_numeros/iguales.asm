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
	msj1 db	10,'Ingrese primer numero: '
	leng1 equ $ - msj1

	msj2 db 10, 'Ingrese segundo numero: '
	leng2 equ $ - msj2

    msj3 db 10, 'Ingrese tercer numero: '
	leng3 equ $ - msj3

	msj4 db 10,'Iguales'
	len_iguales	equ	$ - msj4

	msj5 db	10,'No son Iguales'
	len_no_iguales	equ	$ -msj5

	new_line db "",10
 
section .bss 
	n1 resb	5
	n2 resb 5
    n3 resb 5
 
section .text
	global _start
 
_start:
	escribir msj1, leng1
	leer n1, 2

	escribir msj2, leng2
	leer n2, 2
    
    escribir msj3, leng3
    leer n3, 2

	mov al, [n1]
	mov bl, [n2] 
    mov cl, [n3]

	cmp al, bl
    cmp al, cl
    cmp cl, bl
	jz iguales
	jmp no_iguales

iguales:
	escribir msj4, len_iguales
	escribir new_line, 1
	jmp salir	
 
no_iguales:
	escribir msj5, len_no_iguales
	escribir new_line, 1
	 jmp salir

salir:
 	mov eax,1
	int 80h
