%macro escribir 2
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax,3
    mov ebx,2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    mjs1 db "INGRESE DIVIDENDO:",10
    leng1 equ $ -mjs1

    mjs2 db "INGRESE DIVISOR:",10
    leng2 equ $ -mjs2

    msj3 db "EL RESULTADO ES:",10
    leng3 equ $ -msj3

    msj4 db "Cociente es: "
    leng4  equ $ -msj4

    msj5 db "Residuo es: "
    leng5 equ $ -msj5

    new_line db "",10

section .bss
    n1 resb 1
    n2 resb 1

    resultado resb 1
    residuo resb 1

section .text
    global _start

_start:
;**************INGRESE PRIMER NUMERO*******************

     escribir mjs1, leng1
     leer n1, 2
;**************INGRESE SEGUNDO NUMERO*******************

     escribir mjs2, leng2
     leer n2, 2
; ************************** proceso de la división *******************
     mov al, [n1]
     mov bl, [n2]
     sub al,'0'
     sub bl, '0'
     div bl
     add al,'0'
     add ah,'0'
     mov [resultado],al
     mov [residuo],ah
; ************************** Imprimimos en pantalla el cociente *******************
     escribir msj3, leng3
     escribir msj4, leng4
     escribir resultado, 1
     escribir new_line,1

; ************************** Imprimimos en pantalla el residuo *******************
     escribir msj5, leng5
     escribir residuo, 1
     escribir new_line,1
; **************************** salida del programa ********************
     mov eax, 1
     int 80h






