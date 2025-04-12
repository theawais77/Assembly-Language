;program to display elements of a array
.model small
.stack 100h
.data
arr db 7,2,1,4,5,6,7
Len EQU $-arr
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov si,offset arr
        mov cx,Len
        
        print_loop:
        mov al,[si]
        add al ,'0'
        mov dl,al
        
        mov ah,02h
        int 21h
        
        inc si
        loop print_loop
        
        mov ah,4ch
        int 21h
    main endp
    end main