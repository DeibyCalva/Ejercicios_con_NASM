%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax,3
    mov abx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .date
    msj1 db 10, "Carpeta o directorio creado"
    leng1 equ $ -msj1

    path db '/home/calvita/Escritorio/coronel', 0
    leng2 equ $ -path

section .bss

section .text
    global _start

_start:
    mov eax, 39    ; servicio para crear un directorio
    mov ebx, path  ; define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777
    int 80h

    escribir msj1, leng1

    mov eax, 1
    int 80h 
