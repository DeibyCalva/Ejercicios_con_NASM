%macro escribir 2		
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

segment .data
	mensaje db "Escribir un archivo en memoria ", 10
	len_mensaje equ $-mensaje
	
	archivo db "/home/calvita/Escritorio/ENSAMBLADOR/archivo.txt", 0	; ,0 -> fin del archivo/home/calvita/Escritorio/coronel

segment .bss
	texto resb 15			; variable que almacenará el contenido del archivo
	idArchivo resd 1		; el id que se obtiene del archivo, es el archivo fisico

segment .text
	global _start
_start:
	;//////////// ARBIR ARCHIVO ///////
	mov eax, 8		; escribir, abrir y crear directorios
	mov ebx, archivo
	mov ecx, 1		;El archivo se abre sólo para escribir en él.
	mov edx, 200h		;El archivo puede ser escrito por el dueño.
	int 80h

	test eax, eax
	jz salir
	
	mov dword [idArchivo], eax

	escribir mensaje, len_mensaje

	mov eax, 3		; leer desde teclado
	mov ebx, 0		
	mov ecx, texto		
	mov edx, 25		; tamaño texto
	int 80h
	
	;///// GUARDAR se envia al archivo el texto 
	mov eax, 4
	mov ebx, [idArchivo]
      mov ecx, 0x1FF   ;Definir el permiso 777
	mov ecx, texto
	mov edx, 25
	int 80h

salir:
	mov eax, 1
	int 80h
