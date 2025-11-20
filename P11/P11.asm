
global pBin8b
global pBin16b
global pBin32b
global pBin64b

extern putchar

section	.text




pBin8b:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]

	mov ecx, 8
	mov edx, eax

	.bin8:
		shl dl, 1
		jc .bit81
		jmp .bit80
	.bit81:
		mov al, '1'
		jmp .imp8
	.bit80:
		mov al, '0'
	.imp8:
		call myputchar
		loop .bin8

	pop ebp
	ret

pBin16b:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]

	mov ecx, 16
	mov edx, eax

	.bin16:
		shl dx, 1
		jc .bit161
		jmp .bit160
	.bit161:
		mov al, '1'
		jmp .imp16
	.bit160:
		mov al, '0'
	.imp16:
		call myputchar
		loop .bin16

	pop ebp
	ret

pBin32b:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]

	mov ecx, 32
	mov edx, eax

	.bin32:
		shl edx, 1
		jc .bit321
		jmp .bit320
	.bit321:
		mov al, '1'
		jmp .imp32
	.bit320:
		mov al, '0'
	.imp32:
		call myputchar
		loop .bin32

	pop ebp
	ret

pBin64b:
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	mov edx, [ebp+16]
	push ebx
	push edi

	mov edi, 2
.ciclo:
	mov ecx, 32
	cmp edi, 2
	je .pmas
	jmp .pmes

.pmas:
	mov ebx, eax
	jmp .bin64

.pmes:
	mov ebx, edx
	.bin64:
		shl ebx, 1
		jc .bit641
		jmp .bit640
	.bit641:
		mov al, '1'
		jmp .imp64
	.bit640:
		mov al, '0'
	.imp64:
		call myputchar
		loop .bin64
	dec edi
	cmp edi, 0
	jne .ciclo

	pop edi
	pop ebx
	pop ebp
	ret

myputchar:
	push edx
	push ecx
	push eax
	call putchar
	pop eax
	pop ecx
	pop edx
	ret
