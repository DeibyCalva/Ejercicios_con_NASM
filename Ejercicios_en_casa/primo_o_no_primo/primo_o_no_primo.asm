; Verificar si un numero es primo (0-9)
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
	msj1 db "Ingrese el numero: "
	leng1 equ $-msj1

	msj2 db "Es primo"
	leng2 equ $-msj2

	msj3 db "No es primo"
	leng3 equ $-msj3
	
	espacio db 10
	len_espacio equ $-espacio
section .bss
	numero resb 1
	d resb 1
	aux resb 1
section .text
	global _start
_start:
	 	
	escribir msj1, leng1
    leer numero, 2

	mov al, 2
	mov [d], al
	mov al,[numero]
	sub al, '0'
	cmp al,4
	jc primo
	jmp bucle
	
	bucle:
		mov ah, 0
		mov al,[numero]
		sub al, '0'
		
		mov cl, [d]
		
		div cl
		cmp ah, 0
		jz Noprimo
		
		
		mov cl, [d]
		
		mov al,[numero]
		sub al, '0'
		dec al
		inc cl
		mov [d], cl
		cmp cl, al
		jz primo
		
		jmp bucle
		
	primo:
		escribir msj2, leng2
		escribir espacio, len_espacio
		jmp salir
		
	Noprimo:
		escribir msj3, leng3
		escribir espacio, len_espacio
		jmp salir
			
		
	salir:
		mov eax,1
		mov ebx,0
		int 80h