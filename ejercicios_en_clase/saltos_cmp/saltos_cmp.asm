%macro  escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro  leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    mensaje db "Operaciones Basicas Aritmeticas", 10
    leng equ $-mensaje
    msj1 db "Ingrese el primer número: "
    leng1 equ $ - msj1

    msj2 db "Ingrese el segundo número: "
    leng2 equ $ - msj2

    msj_opcion db 'Eliga una  Opcion',10
	leng_opcion equ $-msj_opcion
    
    mjs_suma db "La suma es: "
    lengSuma equ $ - mjs_suma

    mjs_resta db "La resta es: "
    lengResta equ $ - mjs_resta

    mjs_mult db "La multiplicación es: "
    lengMul equ $ - mjs_mult

    mjs_div db "La Division es: ",10
    lengDiv equ $ - mjs_div

    msj_cociente db "El cociente es: "
    leng_cociente equ $-msj_cociente

    msj_residuo db "El residuo es: "
    leng_residuo equ $-msj_residuo
    
    new_line db  "", 10

section .bss
    n1 resb 1
    n2 resb 1

    resultado resb 1
    residuo resb 1

    opcion resb 2

section .text
    global _start
_start:

    escribir mensaje, leng
    ;*****INGRESO EL PRIMER NUMERO******
    escribir msj1, leng1
    leer n1, 2

    jmp menu

menu:

    escribir msj_opcion , leng_opcion
    leer n2, 2
    
    mov ah, [opcion]	; Movemos la opcion seleccionada a el registro AH
	sub ah, '0'		; Convertimos el valor ingresado de ascii a decimal
 
	cmp ah, 1
	je sumar
 
	cmp ah, 2
	je restar
 
	cmp ah, 3
	je multiplicar
 
	cmp ah, 4
	je dividir


sumar:
    ;****** PROCESO DE SUMA********
    mov ax,[n1]
    mov bx,[n2]
    sub ax, '0'
    sub bx, '0'
    add ax, bx
    add ax, '0'
    mov [resultado], ax 
    ;*****Escribir Suma*****
    escribir mjs_suma, lengSuma
    escribir resultado, 1
    escribir new_line, 1

    jmp menu

restar:
    ;****** PROCESO DE RESTA********
    mov ax,[n1]
    mov bx,[n2]
    sub ax, '0'
    sub bx, '0'
    sub ax, bx
    add ax, '0'
    mov [resultado], ax 
    ;*****Escribir Resta*****
    escribir mjs_resta, lengResta
    escribir resultado, 1
    escribir new_line, 1

    jmp menu

multiplicar:
    ;******PROCESO Multiplicacion********
    mov al,[n1]
    mov bl,[n2]
    sub al, '0'
    sub bl, '0'
    mul bl
    add al, '0'
    mov [resultado], al 
    ;*****Escribir MULTIPLICAION*****
    escribir mjs_mult, lengMul
    escribir resultado, 1
    escribir new_line, 1

    jmp menu

dividir:
    ;******PROCESO DIVISION********
    mov al, [n1]
    mov bl, [n2]
    sub al, '0'
    sub bl, '0'
    div bl
    add al, '0'
    mov [resultado], al
    add ah, '0'
    mov [residuo], ah
    
    ;*****Escribir DIVISION*****
    escribir mjs_div, lengDiv
    escribir msj_cociente, leng_cociente
    escribir resultado, 1
    escribir new_line, 1
    
    escribir msj_residuo, leng_residuo
    escribir residuo, 1
    escribir new_line, 1

    jmp menu

salir:
    mov eax, 1
    int 80h