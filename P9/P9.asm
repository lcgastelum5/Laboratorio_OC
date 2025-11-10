%include "../LIB/pc_iox.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a
N equ 10

section	.data

arregloa times 10 db 0
arreglob db 1, 2, 3, 4, 5, 6, 7, 8 , 9, 10
arregloc db 2, 4, 6, 8, 10, 12, 14, 16, 18, 20
sum dw 0
msgv1 db 'Ingresa vector 1', 0xa, 0
msgv2 db 'Ingresa vector 2', 0xa, 0
msgs db 'Suma de ambos vectores: ', 0xa, 0
msgpp db 'Producto punto de ambos vectores: ', 0xa, 0

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	
;llenado de ambos vectores
 mov edx, msgv1
 call puts
    mov ebx, arreglob
    call inciso_a
 mov edx, msgv2
 call puts
    mov ebx, arregloc
    call inciso_a

;suma de vectores
 mov edx, msgs
 call puts
 call inciso_c

 ;producto punto de vectores
 mov ecx, N
 mov ebx, arreglob
 mov esi, arregloc
 .vd: mov al, [ebx]
 mov dl, [esi]
 mul dl
 add [sum], ax
 inc ebx
 inc esi
 loop .vd
  mov edx, msgpp
  call puts
 mov ax, [sum]
 call pHex_w
 call puts_sl


	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


    puts_sl:
            push eax
            mov al,10
            call putchar
            pop eax
            ret


    inciso_a:
            push eax
            push ebx
            push ecx

            mov ecx, N
            cmp ecx, 10
            ja .outa
        .va: call getch
            sub al, 30h
            cmp al , 9
            jbe .valid
            jmp .va

        .valid: mov [ebx], al
            add al, 30h
            call putchar
            call puts_sl
            inc ebx
            loop .va
            call puts_sl

            pop ecx
            pop ebx
            pop eax
        .outa: ret


    inciso_b:
            push eax
            push ebx
            push ecx

            mov ecx, N
            mov ebx, arreglob
            cmp ecx, 10
            ja .outb
        .vb: mov eax, N
            sub eax, ecx
            mov al, [ebx]
            call pHex_b
            call puts_sl
            inc ebx
            loop .vb
            call puts_sl

            pop ecx
            pop ebx
            pop eax
        .outb: ret


    inciso_c:
            push eax
            push ebx
            push ecx
            push edx

            mov ecx, N
            mov ebx, arreglob
            mov edx, arregloc
            cmp ecx, 10
            ja .outc
        .vc: mov al, [ebx]
            add al, [edx]
            mov [ebx], al
            call pHex_b
            call puts_sl
            inc ebx
            inc edx
            loop .vc
            call puts_sl

            pop edx
            pop ecx
            pop ebx
            pop eax
        .outc: ret

