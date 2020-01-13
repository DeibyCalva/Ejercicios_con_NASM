;Contar el numero de caracteres de una cadena
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro leer 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

SECTION .data
	msj1 db   "   ", 10
    leng1 equ $ -msj1

    new_line db "",10


section .bss
	texto resb 4
	
SECTION .text
global  _start
 
_start:

    escribir msj1, leng1
    leer texto, 2

	mov eax,3
	mov ebx,2
	mov ecx,msj1
	mov edx,30
	int 80h
	
    mov ebx, msj1
    mov eax, ebx
 
bucle:
    cmp     byte [eax], 0
    jz      fin
    inc     eax
    jmp     bucle
 
fin:
    sub eax, ebx 
    sub eax, 1
    
    mov cl, 10
	div cl
          
    add ax, '00'
    mov [texto], ax
    escribir texto, 2
 
    mov     ebx, 0
    mov     eax, 1
    int     80h
    