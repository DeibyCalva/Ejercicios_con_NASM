; Examen loop call
; Nombre: Deiby Calva


%macro imprimir 2
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

    msj_ingreso db 'Ingrese un caracter: '
    len_msj_ingreso equ $-msj_ingreso

    msj_res_con db ' Es una consonante',10
    len_msj_res_con equ $-msj_res_con

    msj_res_voc db 'Es una vocal',10
    len_msj_res_voc equ $-msj_res_voc

    msj_res_num db 'Es un numero',10
    len_msj_res_num equ $-msj_res_num

    msj_res_esp db 'Es un caracter especial',10
    len_msj_res_esp equ $-msj_res_esp

    salto db '',10

section .bss
    caracter resb 2
    resp_retorno resb 2

section .text
    global _start

_start:
    imprimir msj_ingreso, len_msj_ingreso
    leer caracter, 2

    mov al, [caracter]
    cmp al, 47
    jg comp_num

    jmp es_caracter

comp_num:
    cmp al, 58
    jng es_numero

    cmp al, 64
    jg comp_M

    jmp es_caracter

comp_M:
    cmp al, 90
    jng comprobar_vocal_mayuscula

    cmp al, 96
    jg comp_minus

    jmp es_caracter

comp_minus:
    cmp al, 122
    jng comprobar_vocal_minuscula

    jmp es_caracter

comprobar_vocal_mayuscula:
    cmp al, 65
    je es_vocal

    cmp al, 69
    je es_vocal

    cmp al, 73
    je es_vocal

    cmp al, 79
    je es_vocal

    cmp al, 85
    je es_vocal

    jmp es_consonante

comprobar_vocal_minuscula:
    cmp al, 97
    je es_vocal

    cmp al, 101
    je es_vocal

    cmp al, 105
    je es_vocal

    cmp al, 111
    je es_vocal

    cmp al, 117
    je es_vocal

    jmp es_consonante

es_numero:
    imprimir msj_res_num, len_msj_res_num
    
    jmp salir
es_caracter:
    imprimir msj_res_esp, len_msj_res_esp
    jmp salir

es_consonante:
    imprimir msj_res_con, len_msj_res_con
    jmp salir
es_vocal:
    imprimir msj_res_voc, len_msj_res_voc
    jmp salir
retorno:
    imprimir salto, 1
    leer resp_retorno, 2

    mov al, [resp_retorno]

    push ax
    imprimir salto, 1
    pop ax

    cmp al, 121
    je _start

    jmp salir

salir:
    mov eax, 1
    int 80h