
;******** leer los numero de un archivo y presentarlos en consola *********

section .data
	mensaje db "Leer un archivo en el disco duro",0xa
	len_mensaje equ $-mensaje

	archivo db "/home/calvita/Escritorio/PRUEBA_ENSAMBLADOR/numeros.txt",0 ;la direccion del archivo // '0' para finlizar el archivo

	arreglo db 0,0,0,0,0,0,0,0,0,0
	len_arreglo equ $-arreglo
	
section .bss
	texto resb 25 ;variable que almacenara el contenido del archivo
	idarchivo resd 1 ;el identificar que se obtienen el archivo, es el archivo fisico
	
	respuesta resb 2
	moda resb 2
section .text
		global _start
_start:
	
	mov eax, 5  	;servicio para abrir el archivo
	mov ebx, archivo ;la direccion del archivo
	mov ecx, 0 	;Modo de acceso 0 => read only
	mov edx, 0	;Permisos: permite leer si esta cerrado
	int 80h

	;TESTEAR PARA VER SI ESTA EL ARCHIVO si la direccion no es correcta
	test eax,eax	;modifica las banderas (como el and)
	jz salir
	
	mov dword [idarchivo], eax
	

	;lee el archivo
	mov eax, 3	;servicio 3: lectura
	mov ebx, [idarchivo] ;entrada por archivo, ya no por teclado
	mov ecx, texto 
	mov edx, 25
	int 80h
	
	
	;####################
	mov esi, arreglo
	mov edi, 0
	

leer:
	;arreglo guardar
	
	mov al, [texto+edi];debe leer la primera numero
	sub al, '0'
	mov [esi], al
	add esi, 1 
	add edi, 1
	
	cmp edi, len_arreglo
	
	jb leer
	
	
	mov eax,0
	mov ecx,0
imprimir:

	push ecx
	push eax
	
	mov al,[arreglo+ecx]
	mov bl,[arreglo+eax]
	
	cmp al,bl
	je igual
	
	add al, '0'
	
	mov [respuesta], al
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, respuesta
	mov edx, 2
	int 80h 
	
	pop eax
	pop ecx
	
	inc ecx
	cmp ecx, len_arreglo
	jb imprimir
	je volver	

	
	                                                                                                                   
	mov eax, 6  	;servicio para cerrar el archivo
	mov ebx, [idarchivo] 
	mov ecx, 0 
	mov edx, 0	
	int 80h
volver:
	inc eax
	mov ecx,0
	cmp eax,8
	je presentarmoda
	
presentarmoda:
	mov eax, 4
	mov ebx, 1
	mov ecx, moda 
	mov edx, 2
	int 80h 
	
	
	jmp salir
igual:
	mov[moda],al
	
	ret	
salir:	
	mov eax, 1
	mov ebx, 0
	int 80h
