.model small
.stack 100h
.data
    var1 db '3'     
    var2 db '3'     
    res  db '?'     
.code 
main proc
    mov ax, @data
    mov ds, ax

    mov al, var1
    sub al, '0'
    mov bl, var2
    sub bl, '0'
    add al, bl
    add al, '0'

    mov res, al
    mov dl, res
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main