 section .data
	nombre db "deiby",10
	tamanonombre equ $-nombre 
	nombre2 db "patricio",10
	tamanonombre2 equ $-nombre2
	apellido db "calva",10
	tamanoapellido equ $-apellido
	apellido2 db "pinta",10
 	tamanoapellido2 equ $-apellido2
      		
 section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx, nombre
	mov edx,tamanonombre
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, nombre2
	mov edx,tamanonombre2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, apellido
	mov edx,tamanoapellido 
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, apellido2
	mov edx,tamanoapellido2
	int 80h



	mov eax,1
 	int 80h
