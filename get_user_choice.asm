; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================

section .bss
    ; ==========================
    user_input resb 1 
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    mov rax, 0                 
    mov rdi, 0                  
    mov rsi, user_input         ; address of buffer to store input
    mov rdx, 1                  
    syscall     
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret