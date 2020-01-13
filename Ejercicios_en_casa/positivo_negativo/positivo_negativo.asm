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


section .date
    msj1 db "Ingresed primer Valor: "
    leng1 equ $ -msj1

    msj2 db "Ingrese segundo Valor: "
    leng2 equ $ -msj2

    msj3 db "ES NEGATIVO"
    leng3 equ $ -msj3

    msj4 db "ES POSITIVO"
    leng4 equ $ -msj4

    new_line db "",10

section .bss
    n1 resb 2
    n2 resb 2

section .text
    global _start
_start:
    escribir msj1, leng1
    leer n1, 2

    escribir msj2, leng2
    leer n2, 2

    mov al, [n1]
    mov bl, [n2]
    sub al,'0'
    sub bl, '0'
    sub al, bl
    js negativo 
    jmp positivo 

negativo:
    escribir msj3, leng3
    escribir new_line,1
    jmp salir
positivo:
    escribir msj4, leng4
    escribir new_line,1
    jmp salir
salir:
    mov eax, 1
    int 80h

