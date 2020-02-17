;algoritmo presentar numero mayor y numero menor en un arreglo
;Nombre:Deiby Calva

%macro escribir 2 	
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
  msj db "Ingrese 6 Números: ",10
  len equ $ -msj
  msj1 db "El número menor del arreglo es: "
  len1 equ $ -msj1

  msj2 db "El número mayor del arreglo es: "
  len2 equ $ -msj2

  salto db "",10
  lensalto equ $ -salto
  arreglo db 0,0,0,0,0,0
  lgArray equ $ -arreglo

section .bss
   res resb 2

section .text
global _start
_start:
    escribir msj,len

    mov esi,arreglo      ; primer elemento del arreglo				
    mov edi,0            ;  posicion respecto al tamaño del arreglo

leer_arreglo:
	leer res,2
	mov al,[res]      
	sub al,'0'       
	mov [esi],al      
		            
	add esi,1        ; + salto esi en 1
	add edi,1        ; + salto edi a 1

	cmp edi,lgArray  ;
	jb leer_arreglo   ; se ejecutal la etiqueta leer

menor:
    
    mov esi, arreglo
    mov edi, 0         
	mov bl,9        

comparar2:
	mov al, [esi]  
	cmp al,bl                ;comparamo si al es mayor que bl
	ja bucle2                 ;se ejecuta blucle si al es menor que bl
	mov bl,al                ;caso contratio bl es igual al  ...bl contendrá el numeor menor 
bucle2:
	add esi, 1
    add edi, 1         
	cmp edi, lgArray      
	jb comparar2          

imprimir2:
    add bl,'0'
    mov [res],bl
    escribir salto,lensalto
    escribir msj1,len1
    escribir res,1
	escribir salto,lensalto

mayor:
    
    mov esi, arreglo
    mov edi, 0
	mov bl, 0   

comparar3:
	mov al, [esi]  
	cmp al,bl                ;comparamo si al es mayor que bl
	jb bucle3                ;se ejecuta blucle si al es menor que bl
	mov bl,al                ;caso contratio bl es igual al  ...bl contendrá el numeor menor 
bucle3:
	add esi, 1
    add edi, 1        
	cmp edi, lgArray      
	jb comparar3         

imprimir3:
    add bl,'0'
    mov [res],bl
    escribir salto,lensalto
    escribir msj2,len2
    escribir res,1
	escribir salto,lensalto


salir:
    mov eax,1
    mov ebx,0
	int 80h