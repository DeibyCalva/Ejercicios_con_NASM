
; estableciendo un macro para escritura
%macro escribir 2 ;numero de parametros que recibira el macro
	mov eax, 4 
	mov ebx, 1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro



section .data
	msj1 db "Division de 8 bits:", 0ax
	leng equ $ -msj1

	msj_cociente db "cociente es : :", 0ax
	leng_cociente equ $ -msj_cociente
			
	msj_residuo db 10, "el residuo es :"
	leng_residuo equ $ -msj_residuo
	
	new_line db  "", 10


section .bss

	residuo resb 1
	cociente resb 1

section .text
	global _start

_start:

	escribir msj1, leng
	mov ax,9
	mov bl, 2
	div bl  ; esatmos moviendo AL AH
	add al, '0'
	mov [cociente], al
	add ah, '0' 
	mov [residuo], ah
	
	;*********cociente**********
	
	escribir msj_cociente, leng_cociente
	escribir cociente, 1
	
	;*********residuo**********
	
	escribir msj_residuo, leng_residuo
	escribir residuo, 1 
	
	;*********final**********
	;escribir new_line, 1
	mov eax,1
	int 80h
	
	
