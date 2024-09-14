section .data
    hello db "Hello, World", 0; Null-terminated string

section .bss
section .text
    global main

main:

    ; Write 'Hello, World' to stdout (file descriptor 1)
    mov rax, 1      ; syscall number for sys_write
    mov rdi, 1      ; fil descriptor 1 (stdout)
    mov rsi, hello  ; pointer to the string to write
    mov rdx, 12     ; length of the string "hello"
    syscall         ; invoke the system call

    ; exit the program

    mov rax, 60     ; syscall number for sys_exit
    xor rdi, rdi    ; return code 0
    syscall         ; invoke the system call