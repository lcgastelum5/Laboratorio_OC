%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:                   

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa


