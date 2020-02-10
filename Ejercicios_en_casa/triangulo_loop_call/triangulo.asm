section .data
	
	asterisco db "*",0xa
	nueva_linea db 10,''
	
section .text
		global _start
_start:
	mov ecx,10 ;vamos a tener 7 elementos (filas)
	mov ebx,1 ;columnas

L1:
	
	push ecx  ;estoy gurdando en pila el valor de ECX=10   9
	push ebx ;estoy gurdando en pila el valor de EBX=1		2
	call imprimir_enter ;permite llamar al procedimiento imprimir enter
	pop ecx ; para rescatar el ultimo de la pila    ecx= ;1
	mov ebx,ecx   ; vale 1                                                   ;7
	push ebx
L2:

	push ecx ;vale 1
	;permite llamar al procedimiento imprimir asterisco
	call imprimir_asterisco;ecx ='*' ;ebx=1
	pop ecx ;recuperar el ultimo valor y colocarlo en cx
	
	loop L2 ;para decrementar ecx
	pop ebx ;1
	pop ecx ;10
	inc ebx ;
	loop L1 ;cx va a valer 0 por lo q se lo rescata en la liena anterior
	jmp salir
imprimir_asterisco:
	
	mov ax, 4 
	mov bx, 1
	mov ecx,asterisco
	mov dx,1
	int 80h
	ret 
	
imprimir_enter:
		mov eax,4
		mov ebx,1
		mov ecx, nueva_linea
		mov edx,1
		int 80h
		ret   ;vuelve a L2
		
salir:
	mov eax,1
	mov ebx,0
	int 80h