.model small
.stack 100h
.data 
    msg db 'hello$',0 ; array of characters
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si,0  ; index si=0
    mov cx,5  ; loop counter
    
start_loop:
    mov dl,msg[si]; load array elements
    mov ah,02h    ;print
    int 21h
    
    inc si ; next element
    loop start_loop ; repeat loop until cx=0
    
    mov ah,4ch ; exit the program
    int 21h
main endp
end main