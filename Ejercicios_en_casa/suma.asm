section .data
	msj db "el resultado es:", 0xa
	leng equ $ -msj

section .bss
	suma resb 1; el 
	
section .text

	global _start
	
_start:

	mov eax,2
	mov ebx,0
	add eax,ebx; transformar de # a cadenas se suma "0" add registro , "0"
	add eax, "0" ; transforma de numero a cadena
	
	mov [suma], eax

	mov eax,4
	mov ebx,1
	mov ecx, msj
	mov edx,leng
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx, suma
	mov edx,1
	int 80h
	
	mov eax, 1
	int 80h
	
	
	
	
	
	
	
