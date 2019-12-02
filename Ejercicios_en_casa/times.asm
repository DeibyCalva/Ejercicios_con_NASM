section .data
	msj db 'DEspelgar los asteriscos 9 veces ',0xa	
	leng equ $-msj
	asterisco times 9 db 10, "*"
	leng_asterisco equ $ -asterisco
	
section .text
	global _start
_start:
	mov eax,4 
	mov ebx,1 
	mov ecx,msj	
	mov edx,leng	
	int 80h
	
	mov eax,4 
	mov ebx,1 
	mov ecx,asterisco
	mov edx,leng_asterisco	
	int 80h
	
	mov eax,1
	int 80h
