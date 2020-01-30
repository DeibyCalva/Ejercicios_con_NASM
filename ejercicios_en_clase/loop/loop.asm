section .data
    msj1 db 10, "saludos"
    leng1 equ $ -msj1

section .text
    global _start

_start:
    mov ecx, 5 ; numerico
ciclo:

    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, leng1
    int 80h
    pop ecx
    loop ciclo

    mov eax, 1
    int 80h

