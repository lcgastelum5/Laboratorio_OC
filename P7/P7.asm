%include "../LIB/pc_iox.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

extern	pBin_n;
extern	pBin_b;
extern	pBin_w;
extern	pBin_dw;

section	.text
	global _start       ;referencia para inicio de programa


_start:                   

	mov eax, 0x22446688
	ror eax, 4
	call pHex_dw

	mov al,10
	call putchar
	call putchar

	mov cx, 0x3F48
	shl cx, 3
	mov ax,cx
	call pHex_w

	mov ax,10
	call putchar
	call putchar

	mov esi, 0x20D685F3
	mov eax,esi
	call pBin_dw
	mov al,10
	call putchar
	mov eax, 0x40042021
	xor esi, eax
	mov eax, esi
	call pBin_dw

	mov al,10
	call putchar
	call putchar

	push esi
	pop eax
	call pBin_dw

	mov al,10
	call putchar
	call putchar

	mov ch, 0xA7
	mov al, ch
	call pBin_b
	mov al,10
	call putchar
	mov ah, 0x48
	or ch, ah
	mov al, ch
	call pBin_b

	mov al,10
	call putchar
	call putchar

	mov bp, 0x67DA
	mov ax,bp
	call pBin_w 
	mov al,10
	call putchar
	and bp, 0xBBAD 
	mov ax,bp
	call pBin_w

	mov al,10
	call putchar
	call putchar

	shr bp,3
	mov ax,bp
	call pBin_w

	mov al,10
	call putchar
	call putchar

	mov ebx, 0x5BD20E6A
	shr ebx,5
	mov eax, ebx
	call pBin_dw

	mov al,10
	call putchar
	call putchar

	shl cx, 3
	mov ax,cx
	call pBin_w

	mov al,10
	call putchar
	call putchar

	mov eax, 0x1503ADE0
	push eax
	pop ebx
	mov esi, ebx
	mov eax, esi
	call pHex_dw

	mov al,10
	call putchar
	call putchar




	
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


