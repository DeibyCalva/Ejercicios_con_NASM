%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro


section .data

	msg_numero db "Ingrese el numero a comparar "
	tam_numero equ $ - msg_numero

	msg_mayor db "La cantidad de numeros mayores a 5 es "
	tam_mayor equ $ - msg_mayor

	msg_menor db "La cantidad de numeros menores a 5 es "
	tam_menor equ $ - msg_menor

	msg_igual db "La cantidad de numeros iguales a 5 es "
	tam_igual equ $ - msg_igual

	msg_salto db 10,""
	tam_salto equ $ - msg_salto


section .bss
	num resb 2
	may resb 2
	men resb 2
	igu resb 2

section .text
	global _start
_start:

	mov ecx,5

	;Contadores 
	mov eax,0  ;Contador de los numeros mayores 
	mov ebx,0  ;Contador de los numeros menores
	mov edx,0  ;Contador de los numeros iguales a 5

	
ciclo:
	
	push ecx

 	push eax
 	push ebx
 	push edx

	imprimir msg_numero,tam_numero
	leer num,2
	
	mov dh,[num]
	sub dh,'0'
	
	cmp dh,5
	jg mayor
	je igual 
	jng menor

mayor:
	pop edx
	pop ebx
	pop eax
	inc eax
	push eax
	push ebx
	push edx
	jmp finCiclo

menor:
	pop edx
	pop ebx
	pop eax
	inc ebx
	push eax
	push ebx
	push edx
	jmp finCiclo

igual:
	pop edx
	pop ebx
	pop eax
	inc edx	
	push eax
	push ebx
	push edx
	jmp finCiclo	

finCiclo:
	pop edx
	pop ebx
	pop eax
	pop ecx
	loop ciclo

;Imprimir los valores de los contadores
	
	add eax,'0'
	mov [may],eax

	add ebx,'0'
	mov [men],ebx

	add edx,'0'
	mov [igu],edx

	imprimir msg_mayor,tam_mayor
	imprimir may,2
	imprimir msg_salto,tam_salto

	imprimir msg_menor,tam_menor
	imprimir men,2
	imprimir msg_salto,tam_salto

	imprimir msg_igual,tam_igual
	imprimir igu,2
	imprimir msg_salto,tam_salto
	
salir:
	mov eax,1
	int 80h