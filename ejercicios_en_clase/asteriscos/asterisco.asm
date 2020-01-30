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
	msj db "escriba un numero: "
	leng_1 equ $-msj

	msj2 db "*"

    new_line db "",10

section .bss
    numero resb 1

section text
	global _start

_start:
	escribir msj, leng_1
    leer numero, 1

    mov eax, [numero]
    mov ebx, [numero]
    sub eax, '0'
    sub ebx, '0'

	jmp filas

filas:	
	push eax
    push ebx
    escribir msj2, 1
	pop ebx
    pop eax

    dec eax	

    cmp eax, 0
    jz colum
	jmp filas	

colum:
	dec ebx			
	push ebx
    escribir new_line, 1
	pop ebx
    mov eax,[numero]
    sub eax, '0'
    cmp ebx, 0
    jz salir
	jmp filas	

salir:
	mov eax, 1
	int 80h
