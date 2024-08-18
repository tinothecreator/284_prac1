; ==========================
<<<<<<< HEAD
; Group member 01: Tinotenda_Chirozvi_22547747
; Group member 02: Tafara_Hwata_22565991
; Group member 03: Devan_Dewet_05169098
=======
; Group member 01: Tinotenda Chirozvi_22547747
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
>>>>>>> 84c4e39dbef17ae4a14bb2e3b2f03e1de18ac5bf
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