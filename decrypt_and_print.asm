; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================
section .bss
    output resb 4

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    msg db "The plaintext is: ",
    ; ==========================

section .text
global decrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here
    ; ==========================


    ; save rdi, rsi, rcx
    mov r15, rdi
    mov r14, rsi
    mov r13, rdx
    mov r12, rcx


    ; print
    mov rax, 1 ; syscall for write
    mov rdi, 1 ; stdout handle
    mov rsi, msg ; pointer to first character
    mov rdx, 18   ; number of bytes to write
    syscall

    ;pop rdi
    mov rax, r15
    call decrypt_char
    call print_char_32

    ;pop rsi
    mov rax, r14
    call decrypt_char
    call print_char_32

    ;pop rdx
    mov rax, r13
    call decrypt_char
    call print_char_32

    ;pop rcx
    mov rax, r12
    call decrypt_char
    call print_char_32

    ; Do not modify anything below this line unless you know what you are doing

    ret

decrypt_char:
    ror rax, 4
    xor rax, 0x73113777

    ; The resulting character is in the lowest 8 bits of rax
    and rax, 0xFF

    ret