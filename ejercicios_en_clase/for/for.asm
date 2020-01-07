section .data
    msj1 db 10,"Item:"
	len1 equ $-msj1

section .bss
     imprimir resb 2
   
section .text
    global _start

_start:
    mov cx,9

ciclo:
   
  ;  
    cmp cx,0
    jz salir
    dec cx
    jnz imprimir_mensaje

imprimir_mensaje:
    mov eax,4
    mov ebx, 1
    push cx
    add cx, '0'
    mov [imprimir], cx 
    mov ecx, msj1
    mov edx, len1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx, imprimir
    mov edx,1
    int 80h

    pop cx
    jmp ciclo
    
salir:
    mov eax,1
    int 80h

