%include "../LIB/pc_iox.inc"

section .data

	variable DW 0

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov al,100
	call pHex_b	; muestra en pantalla 64

	mov al,10	; cambio de linea
	call putchar

	mov ax,0x12ab 	; presenta en pantalla 12AB
	call pHex_w

	mov al,10 	; cambio de linea
	call putchar

	mov eax,1234ABCDh ; presenta en pantalla 1234ABCD
	call pHex_dw

	mov al,0x0a	  ; cambio de lines 10 decimal o bien 0A hex
	call putchar

	mov eax,0x76543210 ; presenta en pantalla 76543210
        call pHex_dw

	mov al,10       ; cambio de linea
	call putchar
	call putchar

	mov ebx, 0x5C4B2A60
	mov eax, 0x02219522
	add ebx, eax
	mov eax, ebx
	call pHex_dw

	mov al,10       
	call putchar
	call putchar

	push ebx
	pop eax
	call pHex_w
	
	mov al,10
	call putchar
	call putchar

	mov al,8
	mul bl
	mov [variable], ax
	call pHex_w

	mov al,10
	call putchar
	call putchar

	mov ax, [variable]
	inc ax
	mov [variable], ax
	call pHex_w

	mov al,10
	call putchar
	call putchar

	mov ax, bx
	mov bl, 0xFF
	div bl
	call pHex_b
	mov al,10
	call putchar
	mov al, ah
	call pHex_b

	mov al,10
	call putchar
	call putchar

	movzx bx, ah
	mov ax, [variable]
	add ax, bx
	call pHex_w
	mov [variable], ax

	mov al,10
	call putchar
	call putchar

	dec word [variable]
	mov ax, [variable]
	call pHex_w
	mov al,10
	call putchar
	pushf
	pop ax
	call pHex_w

	mov al,10
	call putchar
	call putchar

	push 0x1503
	pop ax
	call pHex_w

	mov al,10
	call putchar
	call putchar


	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel
