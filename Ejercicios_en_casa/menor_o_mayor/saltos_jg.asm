%macro escribir 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

%macro leer 2
    mov eax,3
    mov ebx,2
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .data
    msj1 db "Ingtrese primer numero a comparar: ",0xa
    leng1 equ $ -msj1

    msj2 db  "Ingrese segundo numero a comparar: ",0xa
    leng2 equ $ -msj2

    mensaje_mayor db "ES NUMERO MAYOR",0xa
    leng3 equ $ -mensaje_mayor

    mensaje_menor db "ES NUMERO MENOR",0xa
    leng4 equ $ -mensaje_menor

    mensaje_igual db "ES IGUAL",10
    leng5 equ $ -mensaje_igual

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
    cmp al , bl
    jg MAYOR
    je IGUAL
    jmp MENOR

MAYOR:
    escribir mensaje_mayor, leng3
    jmp salir

IGUAL:
    escribir mensaje_igual,leng5
    jmp salir

MENOR:
    escribir mensaje_menor, leng4
    jmp salir

salir:
    mov eax, 1
    int 80h
