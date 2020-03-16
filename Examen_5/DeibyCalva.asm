;;;;  Ultimo Examen 5
;;;;  Nombre: Deiby Patricio Calva
;;;; home/calvita/Documentos/ENSAMBLADOR/Ejercicios_con_NASM/Examen_5/CalvaDeiby.txt

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
    mensaje db "LEER  ARCHIVO Arreglo EN EL DISCO DURO",0xa
	len_mensaje equ $-mensaje

    archivo db '/home/calvita/Documentos/ENSAMBLADOR/Ejercicios_con_NASM/Examen_5/datosExamen.txt',0
    newLine db '',10

    mjs1 db 'El numero '
    len1 equ $ -mjs1

    mjs2 db ' se repite '
    len2 equ $ -mjs2

    mjs3 db ' veces', 0xa
    len3 equ $ -mjs3

    mjsSum db 10, 'La Suma TOTAL del Arreglo es: '
    lenSum equ $ -mjsSum


    arreglo db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    len_arreglo equ $ -arreglo

    suma db '  '

    espacio db 10
	len_espacio equ $-espacio

section .bss
    id_arreglo resb 1
    value resb 1
    cont resb 1
    sum resb 2

section .text
    global _start
_start:

leer_numero:
    escribir mensaje, len_mensaje
    
    mov eax, 5 
    mov ebx, archivo
    mov ecx, 0
    mov edx, 0
    int 80h

    test eax, eax
    jz salir
    mov dword[id_arreglo], eax
    
    mov eax, 3
    mov ebx, [id_arreglo]
    mov ecx, arreglo
    mov edx, len_arreglo ;
    int 80h

    escribir arreglo,len_arreglo
    escribir newLine,1

    mov eax, 6
    mov ebx, [id_arreglo]
    mov ecx, 0
    mov edx, 0x1FF
    int 80h


Numero_repita:
    mov esi, arreglo
    mov edi, 0

    mov eax, [esi]
    mov [value], eax

    mov bl, 0
    mov [cont], bl
    
    mov cl, 0

    mov dl, 0

fin_repita:
    mov al, [value]
    mov bl, [esi]

    call compare_repita
    
    inc esi
    inc edi
    cmp edi, len_arreglo
    jb fin_repita
    jmp compare_arreglo
    
compare_repita:
    cmp al, bl
    je incre_cont
    ret
incre_cont:
    inc cl
    ret
compare_arreglo:
    inc dl
    mov al, dl
    mov esi, arreglo
    mov edi, 0
    call ver_posicion
    push edx
    call imprimir_Resul_repita
    pop edx
    mov al, [esi]
    mov [value], al

    mov cl, 0

    cmp dl, len_arreglo
    jb fin_repita
    jmp inicia_suma_arreglo
ver_posicion:
    inc esi
    inc edi
    dec al
    cmp al, 0
    jg ver_posicion
    ret


imprimir_Resul_repita:
    add cl, '0'
    mov [cont], cl

    escribir mjs1, len1
    escribir value, 1
    escribir mjs2, len2
    escribir cont, 1
    escribir mjs3, len3
    ret

inicia_suma_arreglo:
    mov esi, 0
    mov ecx, len_arreglo
    mov bl, 0
    clc  
suma_numeros_arreglo:
    mov al, [arreglo+esi]
    sub al, '0'
    add bl, al
    inc esi
    loop suma_numeros_arreglo
    mov al, bl
    mov bl, 10
    div bl
    add ax,'00'
    mov [sum], ax
    escribir mjsSum, lenSum
    escribir sum, 2
    jmp salir

imprimir_Resultado_Suma:
    escribir newLine, 1
    escribir mjsSum, lenSum
    escribir sum, 2
    escribir newLine, 1
salir:
    escribir espacio, len_espacio
    mov eax, 1
    int 80h