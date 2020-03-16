;leer un arreglo de 9 numeros y q me de como resultado el numero que se repita y despues que se guarde en memoria
%macro escribir 2
	mov eax,4
	mov ebx,1s
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msg db  10,"Leyendo archivo... ",10
	len equ $- msg
	archivo db "/home/calvita/Escritorio/PRUEBA_ENSAMBLADOR/archivo.txt", 0 	;arreglo en archivo

	msg3 db "El # que más se repite es: "
	len3 equ $-msg3

	arreglo db 0,0,0,0,0,0,0,0,0
	la equ $-arreglo


	mensaje db 10,"Guardando archivo en memoria... ", 10
	len_mensaje equ $-mensaje
	archivo1 db "/home/calvita/Escritorio/PRUEBA_ENSAMBLADOR/probando.txt", 0 ;

section .bss
	resultado resb 2 	;
	texto resb 	25	
	idarchivo resd 1		
	idarchivo2 resd 1	
	contador resb 1			; contador

section .text
global _start
_start:
;//////////// ARBIR archivo1 ///////
	mov eax, 5		;servicio 5 para leer el archivo
	mov ebx, archivo	;direccion del archivo
	mov ecx,0 		;modo de acceso-->leer=0
	mov edx,0 		;permite leer si esta craeado
	int 80h 

	test eax,eax		;
	jz salir

	mov dword[idarchivo], eax

	escribir msg, len

	mov eax,4		;servicio 3 lectura	
	mov ebx,[idarchivo]	;unidad de entrada
	mov ecx,texto
	mov edx,25
	int 80h
	
	escribir texto,25

	mov eax,6		;servicio 6 cerrar el archivo
	mov ebx,[idarchivo]
	mov ecx,0
	mov edx,0
	;int 80h
	
;--------------------------------------
	mov esi, arreglo	;esi-> posc 1er elemento array
	mov edi, 0			; edi -> posc dentro del array
	
leer:
					;lee el archivo con el array
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, resultado
	mov edx, 2
	int 80h

	mov al,[resultado]
	sub al, '0'

	mov [esi], al	; coloca el valor capturado dentro de esi como contenido
	
	add edi, 1 ; incrementamos el edi en +1
	add esi, 1 ; contiene el arreglo

	cmp edi,la ; compara y si edi es menor que la
	jb leer		; cuando el carry esta activado.. con CF=1 y ZF=1
	;//// PARA PEDIR LOS DIGITOS ////
	mov ecx, 0 ; No se altera en vueltas, Recorrido
	mov bl, 0	;Almacena el Nº + grande del array
;-----------------------------------
comparar:
	mov al,[arreglo + ecx]	;desplazarnos dentro del array
	cmp al, bl	;
	jb bucle	;saltará con CF=1 y ZF=1
	mov bl, al
;-----------------------------------
bucle: 
	inc ecx	
	cmp ecx, la
	jb comparar	; si ecx es menor salta, y obtiene el siguien elemento del array
;-----------------------------------




;------------------------------------
imprimir:
    add bl, '0'		; de num a caracter
    mov [resultado], bl 	;
	escribir msg3,len3 	; el # q se repite es:	
	escribir resultado,1	; el valor de todos los nums impr
	;//////////// Guardar ARCHIVO ///////
	mov eax, 8		; escribir, abrir y crear directorios
	mov ebx, archivo1
	mov ecx, 1		;El archivo se abre sólo para escribir en él.
	mov edx, 200h		;El archivo puede ser escrito por el dueño.
	int 80h

	test eax, eax
	jz salir
	
	mov dword [idarchivo2], eax

	escribir mensaje, len_mensaje
	
	;///// GUARDAR se envia al archivo el texto 
	mov eax, 4
	mov ebx, [idarchivo2]
	mov ecx, resultado
	mov edx, 1
	int 80h
;-----------------------------------

salir:
	mov eax, 1
	int 80h
