%include "../LIB/pc_iox.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a
N equ 10

section	.data

arregloa times 10 db 0
arreglob db 1, 2, 3, 4, 5, 6, 7, 8 ,9, 10

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   
	
    call inciso_a
    call inciso_b



;inciso c
    mov ecx,N




	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


    puts_sl:
            push eax
            mov al,10
            call putchar
            pop eax
            ret


    inciso_a:
            mov ecx, N
            mov ebx, 0
            mov dl, 9
            cmp ecx, 10
            ja .outa

        .va: call getch
            sub al, 30h
            cmp dl , al
            jae .valid
            jmp .va

        .valid: mov [arregloa + ecx], al
            add al, 30h
            call putchar
            call puts_sl
            inc ebx
            cmp ecx, ebx
            loop .va
            call puts_sl
        .outa: ret


    inciso_b:
            mov ecx, N
            mov ebx, 0
            cmp ecx, 10
            ja .outb
        .vb: mov al, [arreglob + ebx]
            call pHex_b
            call puts_sl
            inc ebx
            cmp ecx, ebx
            loopne .vb
        .outb: ret

