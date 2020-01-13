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
    msj1 db "INGRESE VALOR", 10
    leng1 equ $ -msj1

    msj2 db 10,"primer numero mayor : "
    leng2 equ $ -msj2

    msj3 db 10,"segundo numero mayor: "
    leng3 equ $ -msj3

    msj4 db 10,"tercer numero mayor: "
    leng4 equ $ -msj4



section .bss
    n1 resb 6
    n2 resb 6
    n3 resb 6
    
section .text

    global _start

_start:
    escribir msj1, leng1 
    leer n1, 2
    escribir msj1, leng1 
    leer n2, 2
    escribir msj1, leng1 
    leer n3, 2

 	mov eax,[n1]
	mov ebx,[n2]
	mov ecx,[n3]

	
	cmp eax,ebx
	jg comparacion1
	jmp comparacion2

comparacion1:
    cmp eax, ecx
    jg primer_mayor
    jmp tercer_mayor
comparacion2:
    cmp ebx, ecx
    jg segundo_mayor
    jmp tercer_mayor

primer_mayor:
    escribir msj2, leng3
    escribir n1, 1
    jmp salir 

segundo_mayor:
    escribir msj3, leng3
    escribir n2, 1
    jmp salir
tercer_mayor:
    escribir msj4, leng4
    escribir n3, 1
    jmp salir

salir:
    mov eax, 1
    int 80h








