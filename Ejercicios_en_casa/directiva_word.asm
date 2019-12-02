; caracteres que se puede modificar
;bytes
;word 2
; dword 4


section .data
	msj db 'Desplegar los asteriscos 9 veces ',0xa	
	leng equ $-msj
	
section .text
	global _start
_start:
	mov eax,4 
	mov ebx,1 
	mov ecx,msj	
	mov edx,leng
		
	int 80h
	
	mov [msj], dword "desp"
	
	mov eax, 4 
	mov ebx,1 
	mov ecx,msj
	mov edx,leng
	int 80h
	
	mov [msj+15], dword "****"
	
    mov eax,4 
	mov ebx,1 
	mov ecx,msj
	mov edx,leng
	int 80h
	
		
	mov eax,1
	int 80h
