;; c1     3 2 7 7
;; c2     2 5 6 6
;       --------
;         5 8 4 3
section .data
    numero1 db "3277"
    numero2 db "2566"
    resultado db '        '
    len_resultado equ $ - resultado
section .text
    global _start
_start:
;*******ubicar tamaño del arreglo******
 mov esi, 3
 mov ecx, 4
 clc ;instruccion sin  operandos su funcion es desactivar el  bit (estado desactivado)de la bandera carry
proceso_suma:
 mov al, [numero1 + esi]
 ;mov ah, [numero2 + esi]
 ;adc al, ah

 adc al, [numero2 + esi]
 aaa
 pushf ; salvar los estados mandandolos a pila 
 or al, 30h;
 popf

 mov [resultado + esi], al
 dec esi
 loop proceso_suma

 mov eax, 4
 mov ebx, 1
 mov ecx, resultado
 mov edx, len_resultado
 int 80h

 mov eax, 1
 int 80h
