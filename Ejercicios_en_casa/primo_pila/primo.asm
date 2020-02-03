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



segment .data
	msj db 0x9,"·····Comprobación Números Primos·····", 10
	lmsj equ $-msj
	num db "Ingrese el numero: ", 10
	leng1 equ $-num
	msj1 db 0x9,"El número Es primo", 10
	leng2 equ $-msj1
	msj2 db 0x9,"El número No es primo", 10
	leng3 equ $-msj2

segment .bss
	n resb 1

segment .text
global _start
_start:
	escribir msj, lmsj
	escribir num, leng1
    leer n, 2

	mov al,[n]
	sub al, '0'
    push eax;guarda y se pierde
	cmp al,2
	jz primo
	jc primo
	jmp verificar

verificar:
    pop eax;obtener el valor
	;mov al,[n]
	sub al, '0'
	and al, 1
	jz no_primo
	jmp impar

impar:
    pop eax
	;mov al,[n]
	sub al, '0'
	cmp al,3
	jz primo
	jmp verificar2

verificar2:
	pop eax
    ;mov al, [n]
	sub al, '0'
	cmp al,9
	jz no_primo
	jmp primo
	int 80h

primo:
	escribir msj1, leng2
	jmp salir

no_primo:
	escribir msj2, leng3
	jmp salir

salir:
	mov eax, 1
	mov ebx, 0
	int 80h