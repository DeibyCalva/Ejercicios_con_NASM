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
    msj db "INGRESE UN NUMERO "
    leng equ $ -msj

    msj_mult db "*"

    msj_igual db "="
    new_line db "",10

section .bss
    numero resb 2
    resultado resb 2
    inCr resb 1

section .text
    global _start

_start:
    escribir msj, leng
    leer numero, 2

    mov cl, 0

multiplicar:
    inc cl
    mov al, [numero]
    sub al, "0"
    push ecx

    mul cl

    mov bl,10
    div bl

    add eax, "00"
    mov [resultado], eax
    

    add cl, "0"
    mov [inCr], cl

    escribir numero, 1
    escribir msj_mult, 1
    escribir inCr,1
    escribir msj_igual, 1
    escribir resultado,2
    escribir new_line,1
    pop ecx
    cmp cl, 9
    je salir
    jmp multiplicar

salir:
    mov eax, 1
    int 80h


        

