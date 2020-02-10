[23:19, 2/2/2020] Fercho Compa: %macro escribir 2
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
    espacio db '',10
section .bss
    n1 resb 1
    n2 resb 1
    numero resb 1
section .text
    global _start

_start:

    mov esi, 2
    mov al, 0
    mov bl, 1
    add al, '0'
    add bl, '0'
    mov [n1], al
    mov [n2], bl

    escribir n1, 1
    escribir espacio,1
    escribir n2, 1
    escribir espacio,1

    mov al, 0
    mov bl, 1
    mov [n1], al
    mov [n2], bl

 fibonaci:
    
    inc esi

    mov al, [n1]
    mov bl, [n2]
    mov [n1], bl
    add al, bl
    mov [n2], al
  

    mov cl, 10
    div cl 
    add ax, '00'
    mov [num…
[7:42, 3/2/2020] Fercho Compa: %macro imprimir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	msj db "Tabla de Multiplicar",10
	len equ $-msj
	
	msj2 db " x "
	len2 equ $-msj2
	
	msj3 db " = "
	len3 equ $-msj3
	
	msj4 db " | "
	len4 equ $-msj4
	
	
	espacio db 10
	len_esp equ $-espacio
	
	
section .bss
	numero rest 2
	presentarN1 rest 2
	presentarN2 rest 2
	respuesta rest 2
	aux rest 2
	x rest 2


section .text
	global _start
	
_start:
	imprimir msj, len
	mov al, 1
	mov [aux], al
	mov ecx, 0
	
	
	
	principal:
		cmp ecx,6
		jz bucle
		inc ecx
		push ecx
		mov [numero], ecx
		jmp imp
		
	imp:
		mov al, [numero]
		mov [presentarN1], al
		mov cl, [aux]
		mul cl
		
		mov [numero], al
		mov ah, [presentarN1]
		add ax, '00'
		add cx, '00'
		mov [presentarN1], ah
		mov [presentarN2], cl
		imprimir presentarN1, 1
		imprimir msj2, len2
		imprimir presentarN2, 1
		imprimir msj3, len3
		mov eax, 48
		add [numero], eax 
		imprimir numero, 2
		imprimir msj4, len4
		pop ecx
		jmp principal
	
	bucle: 
		imprimir espacio, len_esp
		mov ebx, [aux]
		inc ebx
		mov [aux], ebx
		mov ecx, 0
		cmp ebx, 6
		jb principal
	
	salir:
		mov eax, 1
		mov ebx, 0
		int 80h