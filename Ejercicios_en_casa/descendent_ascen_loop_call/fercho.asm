;Imprime un mensaje 20 veces con el uso de loop
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
    msj db 10,"Numeros:  "
    lengmsj equ $-msj


    espacio db 10
    lengespacio equ $-espacio
section .bss
    nume resb 1

section .text
    global _start:
_start:
    escribir msj, lengmsj
    mov ecx,9 ;siempre tiene q ser numerico
    mov al, '1'
    mov [nume], al
    
l1:
    push ecx
    escribir nume, 1
    mov al, [nume]
    inc al
    mov [nume], al
    escribir espacio, lengespacio
    pop ecx
    loop l1
    jmp salir


    

salir:
    mov eax,1
    int 80h