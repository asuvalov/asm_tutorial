global printstr
global _strlen
global printstrLF

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
; void printint(int number)
printint:
    push    eax
    push    ecx
    push    edx
    push    esi

    mov     esi, 10
    mov     ecx, 0

divideLoop:
    inc     ecx
    mov     edx, 0
    idiv    esi
    add     edx, 48
    push    edx
    cmp     eax, 0
    jnz     divideLoop 
    

printLoop:
    dec     ecx
    mov     eax, esp
    call    printstr
    pop     eax
    cmp     ecx, 0
    jnz     printLoop    

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

;--------------------------------
; void printstrLF(string msg)
; print string with line feed
printstrLF:
    call    printstr
    
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    
    call    printstr
    
    pop     eax
    pop     eax
    ret

;--------------------------------
; void printintLF(int number)
; print number with line feed
printintLF:
    call    printint
    
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    printstr
    pop     eax
    pop     eax
    ret

;--------------------------------
; void exit()
exit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret

