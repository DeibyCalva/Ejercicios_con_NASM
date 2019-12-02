; estableciendo un macro para escritura
%macro escribir 2 ;numero de parametros que recibira el macro
	mov eax, 4 
	mov ebx, 1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro


; estableciendo un macro para lectura
%macro leer 2 ;numero de parametros que recibira el macro
	mov eax, 3
	mov ebx, 2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msj1 db "ingrese el primer numero", 10
	leng1 equ $ -msj1
	
	msj2 db "ingrese el segundo numero:", 10
	leng2 equ $ -msj2
	
	mensaje db "el resultado es :"
	leng3 equ $ -mensaje

section .bss

	n1 resb 10
	n2 resb 10
	suma resb 1
	
section .text

	global _start
	
_start:
;**********************INGRESO EL PRIMER NUMERO*************************
	;mov eax,4
	;mov ebx,1
	;mov ecx,msj1
	;mov edx, leng1
	;int 80h
	
	escribir msj1, leng1
	leer n2, 10
	;mov eax,3
	;mov ebx,2
	;mov ecx, n1
	;mov edx,10
	;int 80h
;**********************INGRESO EL segundo NUMERO*************************
	;mov eax,4
	;mov ebx,1
	;mov ecx, msj2
	;mov edx, leng2
	;int 80h
	
	escribir msj2, leng2
	leer n2, 10
	;mov eax,3
	;mov ebx,2
	;mov ecx, n2
	;mov edx,10
	;int 80h



;**********************PROCESO DE SUMA*************************	
	mov ax, [n1]
	mov bx, [n2]
	sub ax, "0"
	sub bx, "0"
	add ax, bx
	add ax, "0"
	
	mov [suma], eax

;**********************Imprime  SUMA*************************		
	escribir mensaje, leng3
	;mov eax,4
	;mov ebx,1
	;mov ecx,mensaje
	;mov edx,leng3
	;int 80h

		leer suma, 1
	;mov eax,4
	;mov ebx,1
	;Mmov ecx, suma 
	;mov edx,1
	;int 80h
	
	
	mov eax,1
	int 80h
	
	
	
	
