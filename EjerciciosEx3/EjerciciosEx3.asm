
global NotBit32b
global XchgBits
global str_cnt_chr
global isPrime
global shr_s

section .text

NotBit32b:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	ror eax, cl
	xor al, 1
	rol eax, cl
	pop ebp
	ret

XchgBits:
	push ebp
	mov ebp, esp
	push ebx
	push esi
	mov eax, [ebp + 8]
	mov bl, [ebp + 12]
	mov bh, [ebp + 16]

	mov esi, eax
	mov cl, bl
	shr esi, cl
	and esi, 1

	mov edx, eax
	mov cl, bh
	shr edx, cl
	and edx, 1

	cmp esi, edx
	je .fin

	mov esi, 1
	mov cl, bl
	shl esi, cl
	xor eax, esi

	mov edx, 1
	mov cl, bh
	shl edx, cl
	xor eax, edx

.fin:
	pop esi
	pop ebx
	pop ebp
	ret

str_cnt_chr:
	push ebp
	mov ebp, esp
	push ebx
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]

.buscar:
	mov dl, [eax]
	cmp dl, 0
	je .salir

	inc eax 

	cmp dl, bl
	jne .buscar
	inc ecx
	jmp .buscar

.salir:
	mov eax, ecx
	pop ebx
	pop ebp
	ret

	isPrime:
		push ebp
		mov ebp, esp
		push ebx
		push esi
		mov ebx, [ebp + 8]
		cmp ebx, 1
		je .sies
		cmp ebx, 2
		je .sies

		mov ecx, ebx
		and ecx, 1
		cmp ecx, 0
		je .noes

		mov eax, ebx
		mov ecx, 3
		shr ebx, 1
		mov esi, ebx
		mov ebx, eax

	.primo:
		mov eax, ebx
		cmp ecx, esi
		ja .sies
		mov edx, 0
		div ecx
		cmp edx, 0
		je .noes
		add ecx, 2
		jmp .primo


	.sies:
		mov eax, 1
		jmp .salida
	.noes:
		mov eax, 0
	.salida:
		pop esi
		pop ebx
		pop ebp
		ret

	shr_s:
		push ebp
		mov ebp, esp
		mov eax, [ebp + 8]
		sar eax, 1
		pop ebp
		ret