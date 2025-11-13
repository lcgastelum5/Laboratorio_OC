%include "LIB/pc_iox.inc"

N equ 2

section .data
cadena db "Hola Mundo", 0

section .bss
length resd 1

section .text
global _start


_start:
	mov ebx, cadena
	call InvertirStr


	call PrintStr


	mov al, 15h
	mov cl, N 
	call TestBit


	mov edx, 9
	call EsPar

	mov eax, 1
	int 0x80


SaltoLinea:
	push eax
	mov al,10
	call putchar
	pop eax
	ret

PrintStr:
	push edx
	mov edx, ebx
	call puts
	call SaltoLinea
	pop edx
	ret

InvertirStr:
	push eax
	push ecx
	push edx
	push esi

	; calcular longitud
	mov edx, ebx
	mov ecx, 0
.calc:
	mov al, [edx]
	cmp al, 0
	je .res
	inc edx
	inc ecx
	jmp .calc

.res:
	mov [length], ecx
   	dec edx 

	mov esi, ebx           
	mov eax, [length]
	add ebx, eax           
	dec ebx                


.inv:
	mov al, [edx]          
	mov [ebx], al         
	dec edx
	inc ebx
	loop .inv

	mov byte [ebx], 0      

	mov eax, [length]
	sub ebx, eax           

	pop esi
	pop edx
	pop ecx
	pop eax
	ret


TestBit:
    push eax
    push ecx
         
    cmp cl, 7
    ja .rt

    shr al, cl

	lahf
    and al, 1           
    call pHex_n
	call SaltoLinea

.rt:
      
    pop ecx
    pop eax
    ret


EsPar: 
	push eax
	push ebx
	push edx

	shr edx, 1

	lahf  
	mov al, ah
	and al, 1
	xor al, 1
	call pHex_n
	call SaltoLinea


	pop edx
	pop ebx
	pop eax
	ret




