bits 16
; Copyright (C) 2024 Anatoliy6463
section bootloader
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov bx, kernel_load
    mov ah, 0x02
    mov al, 0x01
    mov ch, 0x00
    mov dh, 0x00
    mov dl, 0x80
    int 0x13
    jc load_error

    jmp 0x0000:kernel_entry

load_error:
    mov ah, 0x0E
    mov al, 'E'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, '!'
    int 0x10
    hlt

section kernel
    kernel_load:

    kernel_entry:
    call init

    hlt
