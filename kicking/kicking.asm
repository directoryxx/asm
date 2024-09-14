; hello.asm
section .data
    msg1    db "Hello World", 10,0          ; string with New Line and 0
    msg1Len equ $-msg1-1                    ; measure length of msg1, minus 0
    msg2    db "Kicking and alive", 10, 0   ; string with New Line and 0
    msg2Len equ $-msg2-2                    ; measure length of msg2, minus 0
    radius  dq 357                          ; not string, displayable ?
    pi      dq 3.14                         ; not string, displayable ?

section .bss
section .text
    global main

main:

    ; Set up stack frame
    push rbp            ; function prologue
    mov rbp, rsp        ; function prologue

    ; echo msg1
    mov  rax, 1         ; write
    mov  rdi, 1         ; stdout
    mov  rsi, msg1      ; pointer to msg1
    mov  rdx, msg1Len   ; set byte of msg1 (Get from msg1Len)
    syscall

    ; echo msg2
    mov rax, 1   
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2Len
    syscall

    ; Clean stack trace
    mov rsp, rbp
    pop rbp

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall
    