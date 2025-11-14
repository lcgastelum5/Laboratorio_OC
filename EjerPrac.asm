%include LIB/pc_iox.inc

global _start

section.text
_global:

  mov eax, 1
  int 0x80
