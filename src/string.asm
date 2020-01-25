;%include "functions.asm"
global _add_
global _memcpy_
global _memcmp_
global _memset_
global _memchr_

global _strlen_
global _strcpy_

;---------------------------------------------------------------------
; Copy memory from source to destination num bytes
; void* _memcpy_(void* destination, const void* source, size_t num)
;--------------------------------------------------------------------
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
; Compare memory
; return  1 if lhs > rhs
; return -1 if lhs < rhs
; return  0 if lhs = rhs
; int _memcmp_(const void* lhs, const void* rhs, size_t num)
;--------------------------------------------------------------------
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
;Set memory
;void* _memset_(void* ptr, int value, size_t num)
;---------------------------------------------------------------------
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
; Search the first occurance of value inside memory
; return a pointer to the occurance of value or nullptr if it's not found
; void* _memchr_(void* ptr, int value, size_t num)
;--------------------------------------------------------------------
_memchr_:
    push esi
    push ebx
    push ecx

    xor ebx, ebx

    mov esi, [esp+16]
    mov bl,  [esp+20]
    mov ecx, [esp+24]

.search:
    jecxz .not_found
    cmp byte [esi], bl
    je .found 
    inc esi
    dec ecx
    jmp .search

.found:
    mov eax, esi
    jmp .exit

.not_found:
    mov eax, 0

.exit:
    pop ecx
    pop ebx
    pop esi
    ret
;---------------------------------------------------------------------
; int _strlen_(const char* str)
;---------------------------------------------------------------------
_strlen_:
    mov eax, [esp+4]

.nextchar:
    cmp byte [eax], 0
    jz .finished
    inc eax
    jmp .nextchar

.finished:
    sub eax, [esp+4]
    ret
;-----------------------------------------------------------------------------
; Copies the C string pointed by source into the array pointed by destination
; char* _strcpy_(char* destination, const char* source)
;-----------------------------------------------------------------------------
_strcpy_:
    push edi
    push esi
    push ebx

    xor ebx, ebx

    mov edi, [esp+16]
    mov esi, [esp+20]

.copy:
    cmp byte [esi], 0
    jz .finished
    
    mov bl, [esi]
    mov byte [edi], bl
    inc edi
    inc esi
    jmp .copy

.finished:
    mov byte [edi], 0
    mov eax, [esp+16]
    pop esi
    pop edi
    pop ebx
    ret
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
_add_:
    mov ecx, [esp+4]
    sub ecx, [esp+8]
    mov eax, ecx
    ret
