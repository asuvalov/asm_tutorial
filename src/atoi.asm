%include 'functions.asm'

SECTION .text
global _start
_start:
    mov     ecx, 0
    
nextNumber:
    inc     ecx
    mov     eax, ecx
    call    printintLF
    cmp     ecx, 10
    jne     nextNumber
    
    call    exit

