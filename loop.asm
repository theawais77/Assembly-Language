.model small
.stack 100h
.data
    newline db 10,13,'$' ; newline
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,5
    
print_star:
    mov dl,'*'  ; char to print
    mov ah,02h  ; print function
    int 21h
    loop print_star ;decrement cx and repeat untill cx=0
    
    mov dx,offset newline; print new line
    mov ah,09h
    int 21h
    
main endp
end main