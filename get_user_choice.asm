; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================

section .data
    choice_msg db 'Choice: ', 0  ; Message to be printed before user input

section .bss
    user_input resb 1            ; Reserve 1 byte for user input

section .text
    global get_user_choice

extern greeting

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; Print "Choice: " message before taking user input
    mov rax, 1                   
    mov rdi, 1                  
    mov rsi, choice_msg          ; address of the "Choice: " message
    mov rdx, 8                  
    syscall                     

    ; Get user input
    mov rax, 0                   
    mov rdi, 0                   
    mov rsi, user_input          
    mov rdx, 1                   ; number of bytes to read
    syscall                      

    movzx rax, byte [user_input] 
    sub rax, '0'                 

    ; Do not modify anything below this line unless you know what you are doing 
    ret                         
