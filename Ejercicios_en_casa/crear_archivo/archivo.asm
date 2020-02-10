
%macro escribir 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .data
    msj db 10,"Carpeta o directorio creado",10
    len_msj equ $ -msj

    msj1 db "Ingresa direccion donde crear el Directorio ",10
	len1 equ $ - msj1

    ;path db '/home/calvita/Escritorio/ENSAMBLADOR/archivo.txt',0
    ;len_path equ $ -path
        

section .bss
	direccion resb 2

section .text
    global _start:
_start:

    escribir msj1,len1

    mov eax,3
	mov ebx,2
	mov ecx,direccion
    mov edx,100
	int 80h
    mov eax, [direccion] 

    mov eax, 8		; Servicios para el trabajo con archivos
	mov ebx, direccion	; EBX: la dirección de una cadena de caracteres terminada en nulo.
	mov ecx, 0x1FF ;definimos el permiso 777		; ECX: Modo de acceso.
	;mov edx, 777h		; EDX: permisos al archivo, si se abre creándolo.
	int 80h

    escribir msj,len_msj



    mov eax, 1
    int 80h
