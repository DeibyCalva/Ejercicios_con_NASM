;Examen sobre Oilas
; Nombre: Deiby Patricio Calva
;Fecha: 03-02-2020



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
    msj db "INGRESE PRIMER NUMERO:  "
    leng equ $ -msj

    msj_4 db "INGRESE SEGUNDO NUMERO:  "
    leng_4 equ $ -msj_4

    msj_5 db "INGRESE TERCER NUMERO:  "
    leng_5 equ $ -msj_5

    msj_6 db "INGRESE CUARTO NUMERO:  "
    leng_6 equ $ -msj_6

    msj_7 db "INGRESE QUINTO NUMERO:  "
    leng_7 equ $ -msj_7

    msj_incre db "Ordenado menor a mayor: "
    leng_2 equ $ -msj_incre

    msj_drece db " Ordenado mayor a menor: "
    leng_3 equ $ -msj_drece

    new_line db "",10

section .bss
    numero resb 2
    numero2 resb 2
    numero3 resb 2
    numero4 resb 2
    numero5 resb 2
    resultado resb 2
    inCr resb 2

section .text
    global _start

_start:
    escribir msj, leng
    leer numero, 2

    escribir msj_4,leng_2
    leer numero2, 2

    escribir msj_5,leng_5
    leer numero3, 2

    escribir msj_6,leng_6
    leer numero4, 2

    escribir msj_7,leng_7
    leer numero5, 2



    mov bl, -1

procedimiento:
    inc bl
    mov al, [numero]
    sub al, "0"
    push ebx

    sub al, bl 

    mov cl,10
    div cl

    add ax,"00"
    mov [resultado], ax
    mov ax, bx
    div cl
    add ax,'00'
    mov [inCr], ax

    ;escribir numero, 1
    escribir msj_incre, leng_2
    escribir inCr,2
    escribir msj_drece, leng_3
    escribir resultado,2
    escribir new_line,1
    pop ebx
    cmp bl, 5
    je salir
    jmp procedimiento

salir:
    mov eax, 1
    int 80h