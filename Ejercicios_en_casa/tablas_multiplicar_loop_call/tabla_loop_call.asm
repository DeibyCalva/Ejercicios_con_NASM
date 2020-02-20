%macro escribir 2 
	mov eax, 4 
	mov ebx, 1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

section .data
	msj db "Tablas de multiplicar",10
	len_msj equ $-msj

	msj_enter db "",10
	
	msj_igual db "="
	msj_signo db "*"
	
section .bss
	respuesta resb 2
	multiplicando resb 2
	multiplicador resb 2
	
section .text
		global _start

_start:
	mov ecx, 9
	mov eax, 1
	mov ebx, 1
presentar:	
	push ecx
	push eax
	push ebx

	mul ebx
	
	add eax,'0'
	mov [respuesta], al
	

	escribir respuesta, 2
	
	escribir msj_igual,1

	pop ebx
	pop eax
	pop ecx
	
	add ebx, '0'
	add eax, '0'
	mov [multiplicador], ebx
	sub ebx,'0'
	
	push ecx
	push eax
	push ebx
	call imprimir_multiplicador
	pop ebx
	pop eax
	pop ecx
	
	mov [multiplicando], eax
	
	sub eax,'0'
	
	push ecx
	push eax
	push ebx
	
	call imprimir_signo
	call imprimir_multiplicando
		
	call imprimir_enter

	pop ebx
	pop eax
	pop ecx

	inc ebx
	loop presentar
	jmp l1
	
l1:
	push ecx
	push eax
	push ebx
	
	escribir msj_enter,1
	
	pop ebx
	pop eax
	pop ecx
	
	mov ecx,9
	inc eax
	mov ebx,1
	
	cmp eax, 8
	jb presentar
	jmp salir

imprimir_enter:
	escribir msj_enter, 1
	ret
imprimir_signo:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_signo
	mov edx, 2
	int 80h
	ret
imprimir_multiplicando:
	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicando
	mov edx, 2
	int 80h
	ret

imprimir_multiplicador:
	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicador
	mov edx, 2
	int 80h
	ret	
	
	
salir:
	mov eax,1
	mov ebx,0
	int 80h