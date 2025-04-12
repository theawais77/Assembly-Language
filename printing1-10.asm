.model small
.stack 100h
.data

.code
    main proc
        ;loading data in to the data segment
        mov ax,@data
        mov ds,ax
        
        mov cx,10 
        mov bx,1
 loop_counter: 
        mov ah,02h  
        mov dl,bl  
        add dl,48 
        int 21h
        inc bx
        
 loop loop_counter
         
        ;exiting the program
        mov ah,4ch
        int 21h
main endp
end main    