%macro escribir 2
    mov eax,4
    mov ebx,1
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
    msj1 db 10,"INGRESE PRIMER NUMERO:"
    leng1 equ $ -msj1

    msj2 db 10,"INGRESE SEGUNDO NUMERO:"
    leng2 equ $ -msj2

    msj3 db "LA SUMA ES :"
    leng3 equ $ -msj3

    new_line db "",10

section .bss
    n1 resb 1
    n2 resb 1

    resultado resb 1

section .text

    global _start

_start:
;**************INGRESE PRIMER NUMERO*******************
    escribir msj1, leng1
    leer n1, 2

; ************INGRESE SEGUNDO NUMERO*******************
    escribir msj2, leng2
    leer n2, 2


; *************PROCESO SUMA*******************

    mov ax, [n1]
    mov bx, [n2]
    sub ax,'0'
    sub bx,'0'
    add ax,bx
    add ax,'0'

    mov [resultado],ax

 ;**************IMPRIMIR RESULTADO DE LA SUMA*************   
    escribir msj3, leng3
    escribir resultado, 1
    escribir new_line, 1

    mov eax,1
    int 80h








