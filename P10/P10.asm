

global suma
global strleng
global getBit

section	.text

suma:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	add eax, [ebp + 12]

	pop ebp
	ret

strleng:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	mov ecx, 0
	.cant: 
		cmp byte [eax], 0
		je .out
		inc ecx
		inc eax
		jmp .cant
	.out:
	mov eax, ecx
	pop ebp
	ret

getBit:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	inc ecx
	shr eax, cl
	lahf 
	mov al, ah
	and eax, 1

	pop ebp
	ret