
;1*1=1
;1*1=1
;1*1=1
;1*1=1
;1*1=1

%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	nueva_linea db 10,""
	longLin equ $-nueva_linea

	tab db "1*"
	lgTab equ $-tab
	igual db "="
	lgIgual equ $-igual

	arreglo dd 1,2,3,4,5
	longArr equ $-arreglo

section .bss	
	resultado resd 3	; 

section .text
	global _start
_start:
	mov esi, arreglo	;esi-> posc 1er elemento array
	mov edi, 0			; edi -> posc dentro del array

	mov ecx, 5
	mov ebx, 1

;******* imprimir enter y evaluar cada fila *******
l1:  		
	push ecx
	push ebx
	call imprimir_salto	; 
	pop ecx		;toma el valor de 
	push ecx
	
;******* imprimir numero y evaluar cada coluna *******
l2:
	push ecx
	add ecx,'0'
	mov [resultado], ecx
	
	call imprimir_tab
	call imprimir_numero	;  
	call imprimir_igual
	call imprimir_numero	;  

	pop ecx
	loop l2 			
;*************** Fin del ciclo l2 ********************
	
	pop ebx
	pop ecx

	loop l1			; usa el valor de ecx
	inc ecx
	int 80h

imprimir_salto:
	escribir nueva_linea,1
	ret

imprimir_numero:
	escribir resultado,2
	ret

imprimir_tab:
	;mov[tab+4], dword ecx
	mov eax,4
	mov ebx,1
	mov ecx,tab
	mov edx,lgTab
	int 80h
	ret

imprimir_igual:
	mov eax,4
	mov ebx,1
	mov ecx,igual
	mov edx,lgIgual
	int 80h
	ret
	

salir:
	
	mov eax, 1
	int 80h
