; ==========================
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
; ==========================

section .data
    ; ==========================
    message db "Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]? ", 0
    ; ==========================

section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    mov rax, 1                  
    mov rdi, 1                  
    mov rsi, message            
    mov rdx, 68                 
    syscall   
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                         ; return from function