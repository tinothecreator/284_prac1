; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================
; you can use printf - lecture 7 functions

; section .data
;     fmt db "%d ", 0
;     ; Do not modify anything above this line unless you know what you are doing
;     ; ==========================
    
;     prompt_enc db 'Enter plaintext to encrypt: ', 0
;     prompt_enc_len equ $ - prompt_enc

;     ; you are missing output here ---------------------------
;     ; add the rest, but this is the basic outline u need

;     hex_key dd 0x73113777        ; The XOR key
;     ; ==========================

; section .bss
;     ; ==========================
;     input resb 16            ; Reserve 16 bytes for the input
;     ; ==========================

; section .text
;     global encrypt_and_print

; extern printf

; ;When using the below function, be sure to place whatever you want to print in the rax register first
; print_char_32:
;     mov rsi, rax
;     mov rdi, fmt
;     xor rax, rax
;     call printf
;     ret

; encrypt_and_print:
;     ; Do not modify anything above this line unless you know what you are doing
;     ; print output
;     mov rax, 1                    
;     mov rdi, 1                    
;     mov rsi, prompt_enc           
;     mov rdx, prompt_enc_len       
;     syscall

;     ; Read the user input
;     mov rax, 0                    
;     mov rdi, 0                    
;     mov rsi, input            
;     mov rdx, 4                    
;     syscall

;     ; Print the prompt for the encripted text ---------------------------

;     xor rbx, rbx ; clear register

;     ; encrypt the input and print it in a loop

;     .encripted_loop:
;         cmp rbx, 3
;         jg .encripted_loop_end

;         movzx ax, byte [input + rbx]

;         rol ax, 4
;         movzx eax, ax

;         xor eax, dword [hex_key]
;         call print_char_32

;         inc rbx
;         jmp .encripted_loop

;     .encripted_loop_end:
;     ; Do not modify anything below this line unless you know what you are doing

;     ret
section .data
    fmt db "%d ", 0                       ; Format for printing an integer
    prompt_enc db 'Enter plaintext to encrypt: ', 0
    prompt_enc_len equ $ - prompt_enc
    cipher_msg db "The cipher text is: ", 0
    cipher_msg_len equ $ - cipher_msg
    hex_key dd 0x73113777                 ; The XOR key

section .bss
    input resb 16                         ; Reserve 16 bytes for the input

section .text
    global encrypt_and_print

extern printf

; Function to print a 32-bit integer
print_char_32:
    mov rsi, rax        ; Move the value to be printed into RSI
    mov rdi, fmt        ; Load the format string into RDI
    xor rax, rax        ; Clear RAX
    call printf         ; Call printf to print the value
    ret

encrypt_and_print:
    ; Print the prompt for input
    mov rax, 1                    ; syscall number for sys_write
    mov rdi, 1                    ; file descriptor (stdout)
    mov rsi, prompt_enc           ; address of the prompt string
    mov rdx, prompt_enc_len       ; length of the prompt string
    syscall

    ; Read the user input
    mov rax, 0                    ; syscall number for sys_read
    mov rdi, 0                    ; file descriptor (stdin)
    mov rsi, input                ; address of the input buffer
    mov rdx, 4                    ; read up to 4 bytes (4 characters)
    syscall

    ; Print the prompt for the encrypted text
    mov rax, 1                    ; syscall number for sys_write
    mov rdi, 1                    ; file descriptor (stdout)
    mov rsi, cipher_msg           ; address of the cipher text prompt
    mov rdx, cipher_msg_len       ; length of the cipher text prompt
    syscall

    ; Clear rbx for use as an index
    xor rbx, rbx

    ; Encrypt the input and print it in a loop
.encrypted_loop:
    cmp rbx, 4                   ; Check if we've processed 4 characters
    jge .encrypted_loop_end      ; Exit the loop if we've processed all 4

    movzx ax, byte [input + rbx] ; Load a character from the input
    rol ax, 4                    ; Rotate the character left by 4 bits
    movzx eax, ax                ; Zero-extend the result
    xor eax, dword [hex_key]     ; XOR the character with the hex key
    call print_char_32           ; Print the encrypted integer

    inc rbx                      ; Move to the next character
    jmp .encrypted_loop          ; Repeat the loop

.encrypted_loop_end:
    ret

