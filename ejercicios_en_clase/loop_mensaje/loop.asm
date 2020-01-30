%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro 

section .data
    msj1 db 10, "MENSAJE "
    leng1 equ $ -msj1

section .bss
    ;numero resb 1
    resultado resb 1

section .text
    global _start

_start:
    mov ecx, 20 ; numerico
    ;mov ecx, [numero]
   ; sub ecx, "0"
ciclo:

    push ecx
    mov al, cl
    mov ebx, 1
    mov cl,10
    div cl
    add ax, "00"
    mov [resultado], eax
    escribir msj1, leng1
    escribir resultado, 2
    mov edx, leng1
    int 80h
    pop ecx
    loop ciclo
salir:
    mov eax, 1
    int 80h

