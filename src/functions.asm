global printstr
global _strlen

;---------------------------------
; int _strlen(string msg)
_strlen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

;--------------------------------
; void printstr(string msg)
printstr:
    push    edx
    push    ecx
    push    ebx
    push    eax
    
    call    _strlen
    
    mov     edx, eax
    pop     eax
    
    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

;--------------------------------
; void exit()
exit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret

