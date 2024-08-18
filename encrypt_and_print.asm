; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================
; you can use printf - lecture 7 functions

section .data
    fmt db "%d ", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    
    prompt_enc db 'Enter plaintext to encrypt: ', 0
    prompt_enc_len equ $ - prompt_enc

    ; you are missing output here ---------------------------
    ; add the rest, but this is the basic outline u need

    hex_key dd 0x73113777        ; The XOR key
    ; ==========================

section .bss
    ; ==========================
    input resb 16            ; Reserve 16 bytes for the input
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
    ; print output
    mov rax, 1                    
    mov rdi, 1                    
    mov rsi, prompt_enc           
    mov rdx, prompt_enc_len       
    syscall

    ; Read the user input
    mov rax, 0                    
    mov rdi, 0                    
    mov rsi, input            
    mov rdx, 4                    
    syscall

    ; Print the prompt for the encripted text ---------------------------

    xor rbx, rbx ; clear register

    ; encrypt the input and print it in a loop

    .encripted_loop:
        cmp rbx, 3
        jg .encripted_loop_end

        movzx ax, byte [input + rbx]

        rol ax, 4
        movzx eax, ax

        xor eax, dword [hex_key]
        call print_char_32

        inc rbx
        jmp .encripted_loop

    .encripted_loop_end:
    ; Do not modify anything below this line unless you know what you are doing

    ret