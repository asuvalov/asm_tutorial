%include 'functions.asm'

SECTION .data
msg1    db      'Enter your name: ', 0h
msg2    db      'Hello ', 0h

SECTION .bss
strInput:   resb 255

SECTION .test
global _start

_start:
    mov     eax, msg1
    call    printstr

    mov     edx, 255
    mov     ecx, strInput
    mov     ebx, 0
    mov     eax, 3
    int     80h

    mov     eax, msg2
    call    printstr

    mov     eax, strInput
    call    printstr

    call    exit

