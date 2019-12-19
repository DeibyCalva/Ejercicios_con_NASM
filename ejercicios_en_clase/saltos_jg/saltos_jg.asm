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
    msj1_n1 db "Ingrese primer numero: "
	leng1_n1 equ $ - msj1_n1

    msj2_n2 db "Ingrese segundo numero: "
	leng2_n2 equ $ - msj2_n2    
    
    msj1 db "Es numero Mayor ", 0xa
    leng1 equ $ - msj1

    msj2 db "Es numero Menor ",0xa
    leng2 equ $ - msj2

    msj3 db  "Es numero Igual ", 0xa
    leng3 equ $ - msj3

section .bss
    n1 resb 1
    n2 resb 1

section .text
    global _start
_start:

    ;*****INGRESO EL PRIMER NUMERO******
    escribir msj1_n1, leng1_n1
    leer n1, 2

    ;*****INGRESO EL segundo NUMERO******
    escribir msj2_n2, leng2_n2
    leer n2, 2


    mov al,[n1]
    mov bl,[n2]
    cmp al, bl

    jg mayor
    je igual
    jmp menor

mayor:
    escribir msj1, leng1
    jmp salir

igual:
    escribir msj3,leng3
    jmp salir

menor:
    escribir msj2,leng2
    jmp salir


salir:
    mov eax, 1
    int 80h


