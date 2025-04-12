.model small
.stack 100h
.data
    str1 db 'enter a number$'
    input  db ?
    newline db 10,13,'$'
.code 
main proc
    mov ax,@data
    mov ds,ax

    ; Display message
    mov ah,09h
    mov dx,offset str1
    int 21h

    ; Newline
    mov ah,09h
    mov dx,offset newline
    int 21h

    ; Take input character
    mov ah,01h
    int 21h
    mov input, al         ; store input character

    ; Newline
    mov ah,09h
    mov dx,offset newline
    int 21h

    ; Print the character using function 02h
    mov dl, input
    mov ah, 02h
    int 21h

    ; Exit
    mov ah,4ch
    int 21h
main endp
end main
