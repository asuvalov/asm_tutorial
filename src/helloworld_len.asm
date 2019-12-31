SECTION .data
msg     db      'Hello brave new world!', 0Ah

SECTION .text
global _start

_start:
    mov     ebx, msg
    mov     eax, ebx

nextchar:
    cmp     byte [eax], 0   ; set zero flag
    jz      finished        ; jump if ZF true
    inc     eax             ; increment
    jmp     nextchar

finished:
    sub     eax, ebx        ; eax - ebx = strlen
    mov     edx, eax
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4
    int     80h

    mov     ebx, 0
    mov     eax, 1
    int     80h

