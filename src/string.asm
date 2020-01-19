;%include "functions.asm"
global _add_
global _memcpy_
global _memcmp_
global _memset_

;---------------------------------------------------------------------
;copy memory from source to destination num bytes
;void* _memcpy_(void* destination, const void* source, size_t num)
_memcpy_:
    push edi
    push esi
    push ecx

    mov edi, [esp+16]
    mov esi, [esp+20]
    mov ecx, [esp+24]
    cld
    rep movsb
    
    mov eax, [esp+16]

    pop ecx
    pop esi
    pop edi

    ret
;---------------------------------------------------------------------
;compare memory
;return  1 if lhs > rhs
;return -1 if lhs < rhs
;return  0 if lhs = rhs
;int _memcmp_(const void* lhs, const void* rhs, size_t num)
_memcmp_:
    push edi
    push esi
    push ecx

    mov esi, [esp+16]
    mov edi, [esp+20]
    mov ecx, [esp+24]
    cld
    repe cmpsb
    
    je .equal
    jl .less
    jg .greater

.equal:
    mov eax, 0
    jmp .exit

.less:
    mov eax, -1
    jmp .exit
    
.greater:
    mov eax, 1

.exit:
    pop ecx
    pop esi
    pop edi
    ret
;---------------------------------------------------------------------
;set memory
;void* _memset_(void* ptr, int value, size_t num)
_memset_:
    push esi
    push ebx
    push ecx

    xor ebx, ebx

    mov esi, [esp+16]
    mov  bl, [esp+20]
    mov ecx, [esp+24]    

.set:
    jecxz .exit
    mov byte [esi], bl
    inc esi
    dec ecx
    jmp .set

.exit:
    mov eax, [esp+16]    

    pop ecx
    pop ebx
    pop esi 
    ret
;---------------------------------------------------------------------
_add_:
    mov ecx, [esp+4]
    sub ecx, [esp+8]
    mov eax, ecx
    ret
