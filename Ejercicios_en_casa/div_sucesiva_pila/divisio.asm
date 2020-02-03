;*************************************************
; Divicion con restas sucesivas 
;Crear un algoritmo que permita simular la división
;No se puede utilizar la instrucción DIV
;Se debe presentar el cociente y residuo
;**************************************************
;Autor: Deiby Calva
;*************************************************+
%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data	
	msj1 db "Ingrese el dividendo: "
	len1 equ $-msj1
	
	msj2 db "Ingrese el divisor: "
	len2 equ $-msj2
	
	msj_resultado db "EL resultado es: "
	len_resultado equ $-msj_resultado
	
	msj_residuo db "EL residuo es: "
	len_residuo equ $-msj_residuo
	
	msj_espacio db 10
	len_espacio equ $-msj_espacio
	
section .bss
	n1 resb 1
	n2 resb 1
	contador resb 1
	
section .text
		global _start
_start:

	; ******ingrese el el dividendo*******
	escribir msj1, len1
	leer n1, 2

	; *******ingrese el divisor*****
	escribir msj2, len2
	leer n2, 2

	mov al, 0
	mov [contador], al
	
	resta: 
		mov cl, [contador]
		inc cl ;inc se utiliza para incrementar el contenido de un registro o de una posición de memoria
		mov [contador], cl
		mov al, [n1]
		sub al, '0'
		mov bl, [n2]
		sub bl, '0'
		sub al, bl
		add al, '0'
		mov [n1], al
		sub al, '0'

		cmp al, bl
		jc Mostrar ;Saltar si hubo arrastre
		jmp resta
		
		
	Mostrar: 
		mov cl, [contador]
		add cl, '0'
		mov [contador], cl

		mov eax,4
		mov ebx,1
		mov ecx,msj_resultado
		mov edx,len_resultado
		int 80h
		
		mov eax,4
		mov ebx,1
		mov ecx,contador
		mov edx,1
		int 80h
		
		mov eax,4
		mov ebx,1
		mov ecx,msj_espacio
		mov edx,len_espacio
		int 80h
		
		mov eax,4
		mov ebx,1
		mov ecx,msj_residuo
		mov edx,len_residuo
		int 80h
		
		mov eax,4
		mov ebx,1
		mov ecx,n1
		mov edx,1
		int 80h
		
		mov eax,4
		mov ebx,1
		mov ecx,msj_espacio
		mov edx,len_espacio
		int 80h

    salir:
	mov eax, 1
	int 80h