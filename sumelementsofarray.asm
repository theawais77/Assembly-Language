;program to sum elements of a array
.model small
.stack 100h
.data
arr db 1,2,2,3
Len EQU $-arr 
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov si,offset arr
        mov cx,Len 
        
        mov al,0
        
        print_loop:
        add al,[si]
        inc si
        loop print_loop
        add al,'0' 
        
        mov dl,al
        mov ah,02h
        int 21h
        
        mov ah,4ch
        int 21h
    main endp
    end main