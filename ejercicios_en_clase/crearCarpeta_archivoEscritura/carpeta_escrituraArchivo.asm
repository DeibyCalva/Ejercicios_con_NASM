%macro escribir 2		
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
     path db "/home/calvita/Escritorio/ENSAMBLADOR/Nuevo", 0
    	archivo db "/home/calvita/Escritorio/ENSAMBLADOR/Nuevo/codigo.txt", 0
        mensaje_error db "error en el archivo",10
        len_error equ $ -mensaje_error
section .bss
    texto resb 35
    idarchivo resb 1

section .text
    global _start

_start:

     mov eax, 39
    mov ebx, path
    mov ecx, 0x1FF
    int 80h 

     mov eax, 3
    mov ebx, 2
    mov ecx, texto
    mov edx, 35
    int 80h

    mov eax, 8
    mov ebx, archivo
    mov ecx, 2  ; acceso
    mov edx, 0x1FF ; permiso
    int 80h

    test eax, eax; verifica la direccion establecido hace un testeo de la subrutina
    jz error
    ;*********************asignar id archivo************************
    mov dword [idarchivo], eax

    mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 35
	int 80h
    jmp salir
error:
    escribir mensaje_error, len_error
salir:
    mov eax, 1
    int 80h
