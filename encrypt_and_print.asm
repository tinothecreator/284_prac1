; ==========================
; Group member 01: 
; Group member 02: Tinotenda_Chirozvi_22547747
; Group member 03: Name_Surname_student-nr
; ==========================
; you can use printf - lecture 7 functions

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here
    ; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
    global encrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your code goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret
