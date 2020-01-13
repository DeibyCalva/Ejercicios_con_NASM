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
    msj1 db "ingrese valor a comparar: "
    leng1 equ $ -msj1

    msj2 db "Es par"
    leng2 equ $ -msj2

    msj3 db "Es impar"
    leng3 equ $ -msj3

    new_line db "",10

section .bss
    n1 resb 1

section .text
    global _start
_start:
    escribir msj1, leng1
    leer n1, 2

    mov al,[n1]
    sub eax,0
	and eax,1
	jz par  ;si zf esta activada
	jmp impar
par:
    escribir msj2,leng2
    escribir new_line, 1
    jmp salir
impar:
    escribir msj3, leng3
    escribir new_line, 1
    jmp salir
salir:
    mov eax, 1
    int 80h
