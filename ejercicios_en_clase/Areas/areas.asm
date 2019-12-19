%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro


section .data

    mensaje_opcion db 0xa,"SELECCIONE UNA OPCION: ",0xa, "1. Cuadrado",0xa, "2. Rectángulo",0xa, "3. Círculo",0xa, "4. Salir",0ax 
	leng_opcion equ $-mensaje_opcion

	msj1_Cuadrado db 0xa,"Ingrese un lado del cuadrado: "
	len1 equ $ - msj1_Cuadrado

	msj2_Rectangulo db 0xa,"Ingrese la base del rectangulo: "
	len2 equ $ - msj2_Rectangulo

    msj3_Rectangulo db 0xa, "Ingrese la altura del rectangulo: "
	len3 equ $ - msj3_Rectangulo

    msj4_Circulo db 0xa,"Ingrese el radio del circulo: "
	len4 equ $ - msj4_Circulo

	mensaje db 0xa,"El area del cuadrado es: "
	len5 equ $-mensaje

    mensaje2 db 0xa,"El area del rectangulo es: "
	len6 equ $-mensaje2

    mensaje3 db 0xa,"El área del circulo es: "
	len7 equ $-mensaje3

    new_line db 0xa,""



section .bss
    opcion resb 1
	lado resb 1
    base resb 1
    altura resb 1
    radio resb 1
    area_cuadrado resb 1
    area_rectangulo resb 1
    area_circulo resb 1

section .text
	global _start
_start:

    
; Seleccionar una opción
menu:
	escribir mensaje_opcion, leng_opcion
	leer opcion, 2
    mov al, [opcion]
    sub al, '0'

	cmp al, 1
		je cuadrado

	cmp al, 2
		je rectangulo
	
	cmp al, 3
		je circulo

	cmp al, 4
		je salir

cuadrado:

    ; Ingrese el primer lado del cuadrado
	escribir msj1_Cuadrado, len1
	leer lado, 2

    ;Proceso para calcular el area del cuadrado:
	mov al, [lado]
	mov bl, [lado]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [area_cuadrado], al

;Imprime area del cuadrado
	escribir mensaje, len5
	escribir area_cuadrado, 1
	escribir new_line, 1

    jmp menu

rectangulo:

    ; Ingrese la base
    escribir msj2_Rectangulo, len2
	leer base, 2

    ; Ingrese la altura
	escribir msj3_Rectangulo, len3
	leer altura, 2

    ;Proceso de para calcular el are del rectangulo:
	mov al, [base]
	mov bl, [altura]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [area_rectangulo], al

;Imprime area del rectangulo
	escribir mensaje2, len6
	escribir area_rectangulo, 1
	escribir new_line, 1

    jmp menu

circulo:

    ; Ingrese el radio
	escribir msj4_Circulo, len4
	leer radio, 2

    ;Proceso para calcular el area del circulo:
	mov al, [radio]
	mov bl, [radio]
	sub al, '0'
	sub bl, '0'
	mul bl
    mov bl, 3
    mul bl
	add al, '0'
	mov [area_circulo], al

;Imprime area del circulo
	escribir mensaje3, len7
	escribir area_circulo, 1
	escribir new_line, 1

    jmp menu

salir:
	mov eax, 1
	int 80h