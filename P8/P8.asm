%include "../LIB/pc_iox.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa

section .data
	msgma	db	'El caracter es mayor',0xa,0
	msgme	db	'El caracter es menor',0xa,0
	msgle	db	'El caracter es una letra',0xa,0
	msgnu	db	'El caracter es un numero',0xa,0
	msgdc	db	'Datos capturados', 0xa,0
	
_start:                   

	;inciso A
	call getche
	mov bl, 'm'
	cmp al, bl
	jae .may
	jmp .men
.may: mov al,10
	call putchar
	mov edx, msgma
	jmp .out
.men: mov al,10
	call putchar
	mov edx, msgme
.out:call puts

	mov al,10
	call putchar
	call putchar

	;inciso B 
	call getche
	mov bl,'A'
	cmp al,bl
	jae .let
	jmp .num
.let: mov al,10
	call putchar
	mov edx, msgle
	jmp .outd
.num: mov al,10
	call putchar
	mov edx, msgnu
.outd: call puts

	mov al,10
	call putchar
	call putchar

	;inciso C
	mov cx, 8
	mov bx, 0
	.ast: mov dx, cx
	.imp: mov al,'*'
	call putchar
	dec dx
	cmp bx, dx
	jb .imp
	mov al,10
	call putchar
	dec cx
	cmp bx, cx
	jb .ast

	mov al,10
	call putchar
	call putchar

	;inciso D
	mov cx,0
	mov bx,10
.arr: call getche
	mov dx, ax
	mov al,10
	call putchar
	inc cx
	cmp bx, cx
	ja .arr
	mov edx, msgdc
	call puts

	mov cx,0
	mov bx,10
	.pil: 
	call putchar
	mov al,10
	call putchar
	inc cx
	cmp bx, cx
	ja .pil





	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


