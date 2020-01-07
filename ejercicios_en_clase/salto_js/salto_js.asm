
;positivo y negativo
%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data
    msj1 db "Ingrese primer numero: "
	len1 equ $-msj1
	
	msj2 db "Ingrese segundo numero: "
	len2 equ $-msj2

    msj_negativo db "es negativo",10
    leng_negativo equ $ - msj_negativo
    msj_positivo db "es positivo",10
    leng_positivo equ $ - msj_positivo

section .bss
    n1 resb 2
	n2 resb 2

section .text
    global _start
_start:

	; ******ingrese primer numero*******
	escribir msj1, len1
	leer n1, 2

	; *******ingrese segundo numero*****
	escribir msj2, len2
	leer n2, 2

    mov ax, [n1]
    mov bx, [n2]
    sub ax, '0'
    sub bx, '0'
    sub ax,bx ; movimiento cambio bandera
    js negativo
    jmp positivo

negativo:
    escribir msj_negativo, leng_negativo
    int 80h
    jmp salir

positivo:
    escribir msj_positivo, leng_positivo
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h

