.model small
.stack 100h
.data 
    newline db 13,10,'$'
    result db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al

    mov ah, 01h
    int 21h
    sub al, '0'

    mov bl, bh
    mul bl       

    add al, '0'
    mov result, al

    mov ah, 09h
    mov dx, offset newline
    int 21h

    mov ah, 02h
    mov dl, result
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
