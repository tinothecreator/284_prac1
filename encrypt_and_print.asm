; ==========================
<<<<<<< HEAD
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
=======
; Group member 01: 
; Group member 02: Tinotenda_Chirozvi_22547747
; Group member 03: Name_Surname_student-nr
>>>>>>> 84c4e39dbef17ae4a14bb2e3b2f03e1de18ac5bf
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

    ; Load the input string into a register (assuming it was provided)
    lea rdi, [input]   ; Load the address of the input buffer into rdi
    mov rcx, 4         ; Set the loop counter to 4 (for 4 characters)
    xor rbx, rbx       ; Clear rbx, which will be used as an index

    encrypt_loop:

    mov al, byte [rdi + rbx] ; Load one character into al
    rol al, 4                ; Rotate the character left by 4 bits
    movzx eax, al            ; Zero-extend the byte in al to a full register
    xor eax, [hex_key]       ; XOR the character with the hex key
    mov [cipher + rbx*4], eax; Store the encrypted value in the cipher array

    ; Increment the index and decrement the counter
    inc rbx
    loop encrypt_loop

    ; Print the encrypted integers as characters (this assumes a non-standard approach)
    lea rsi, [cipher]       ; Load the address of the cipher text
    mov rcx, 4              ; Set the loop counter to 4 (for 4 encrypted integers)
    xor rbx, rbx            ; Reset the index to 0

    print_loop:

    mov eax, [rsi + rbx*4]  ; Load the encrypted value into eax
    call print_char_32      ; Print the character
    inc rbx                 ; Increment the index
    loop print_loop         ; Repeat for all 4 characters

    ; Do not modify anything below this line unless you know what you are doing

    ret
