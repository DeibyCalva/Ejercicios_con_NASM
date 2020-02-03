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
    msjC db "Ingrese numero de columnas: "
    lenC equ $-msjC

    msjF db "Ingrese numero de filas: "
    lenF equ $-msjF
    
    espacio db ' '
    newLine db '',10
section .bss
    columna resb 2
    fila resb 2
    numero resb 2
section .text
    global _start

_start:
    escribir msjC,lenC
    leer columna, 2

    escribir msjF,lenF
    leer fila, 2

    mov eax, [fila]
    mov ebx, [columna]
    sub eax, '0'
    sub ebx, '0'

    mov ecx,1 ;numero
    mov edx,0  ;contador

columnas:
    push eax  ;filas
    push ebx  ;columnas
    push ecx  ;numero
    push edx  ;contador

    mov ax,cx
    mov bl,10
    div bl

    add eax,"00"
    mov [numero], eax

    escribir numero, 2
    escribir espacio,1

    pop edx  ;contador
    pop ecx  ;numero
    pop ebx  ;columnas
    pop eax  ;filas

    inc dl  ;incremento contador
    inc cl  ;incremento numero

    cmp bl, dl
    je filas
    jmp columnas

filas:
    push eax  ;filas
    push ebx  ;columnas
    push ecx  ;numero
    push edx  ;contador
    escribir newLine,1
    pop edx  ;contador
    pop ecx  ;numero
    pop ebx  ;columnas
    pop eax  ;filas

    dec eax   ;decremento filas
    mov edx,0 ;regreso el contador a 0

    cmp al,0
    je salir
    jmp columnas

salir:
    mov eax, 1
    int 80h

    