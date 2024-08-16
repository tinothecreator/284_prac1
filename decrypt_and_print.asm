; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
; ==========================

; Input: 4 values passed to your program (function).
; Output: Display the message: `The plaintext is: `
; Function returns: Nothing (Preferebly 0, but this does not matter for this prac).
; Output snippet:
; • I call your function like this: `decrypt_and_print(1930506807, 1930507047 , 1930506823, 1930506807)`, you output:

; The plaintext is: TEST

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    message db "The plaintext is: ",0
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

    ; Print the message "The plaintext is: "
    mov rdi, message
    xor rax, rax
    call printf

    ; Load the first argument
    mov rax, rdi
    call decrypt_char
    call print_char_32

    ; Load the second argument
    mov rax, rsi
    call decrypt_char
    call print_char_32

    ; Load the third argument
    mov rax, rdx
    call decrypt_char
    call print_char_32

    ; Load the fourth argument
    mov rax, rcx
    call decrypt_char
    call print_char_32


    ret

decrypt_char:
    ; Rotate Right by 4 Bits.
    ; XOR with 0x73113777.

    ror rax, 4
    
    xor rax, 0x73113777
    
    ; The resulting character is in the lowest 8 bits of rax
    and rax, 0xFF
    
    ret