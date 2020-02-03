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
        msj db 'ingrese el numero de cuantos fibonacci quiere presentar: ',
        len equ $ - msj
        new_line db 10,''

section .bss
        numero resb 2
        anterior resb 2
        despues resb 2
        resultado resb 2
section .text
        global _start

_start:
        escribir msj,len
        leer numero,2
        mov dx,[numero]
        escribir new_line,1
        sub dx,'0'
        mov bx,0
        mov cx,1
        add bx,'0'
        add cx,'0'      
        

        mov [anterior],bx
        mov [despues],cx
        escribir anterior,1
        escribir new_line,1
        escribir despues,1
        escribir new_line,1
        mov bx,0
        mov cx,1

        mov ax,2

ciclofibonacci:
        inc ax
        push ax
        push cx

        add bx,cx
        push bx
        
        mov ax,bx
        mov cl,10
        div cl

        add ax,"00"
        mov [resultado],ax
        escribir resultado,2
        escribir new_line,1

        pop cx
        pop bx
        pop ax

        mov dl, [numero]
        sub dl,'0'

        
        cmp al,dl
        je salir
        jmp ciclofibonacci
salir:
        mov eax,1
        int 80h