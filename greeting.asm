; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Name_Surname_student-nr
; Group member 03: Name_Surname_student-nr
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