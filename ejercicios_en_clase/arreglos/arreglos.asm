section .data
    msj1 db "ingrese 6 numeros",10
    leng1 equ $ -msj1

    msj2 db "Presentar numeros ", 10
    leng2 equ $ -msj2
    ;definir el arreglo
    arreglo db 0,0,0,0,0,0
    leng_arreglo equ $ -arreglo

section .bss
    numero resb 2

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, leng1
    int 80h

    ; asiganacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0
leer:
    mov eax, 3
    mov ebx, 1
    mov ecx, numero
    mov edx, 2
    int 80h

    ;asignacion de un numero en  el arreglo
    mov al, [numero]
	sub al, '0'
	mov [esi], al
    ; incrementar una posicion en el arreglo
	add esi, 1 
	add edi, 1
    ;comparar para el salto
	cmp edi, leng_arreglo
    jb leer
    mov esi, arreglo
    mov edi, 0

imprimir:
    mov al, [esi]
    add al, '0'
    mov [numero], al

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 1
    int 80h

	add esi, 1 
	add edi, 1
    ;comparar para el salto
	cmp edi, leng_arreglo
    jb imprimir

salir:
    mov eax, 1
    int 80h

