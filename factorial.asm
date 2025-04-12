.model small
.stack 100h
.data
.code
    main proc
        ;loading data in to data segment register
        mov ax,@data
        mov ds,ax
        
        ;taking userinput
        mov ah,01h
        int 21h
        
        sub al,'0' 
        
        
        mov cl,al
        mov ax,1
        
        call factorial 
        
        ;exiting the program
        mov ah,4ch
        int 21h
    
        main endp  
    
    factorial proc
       mov bl,cl
       
    factorial_loop:
       mul bl        ; Use BL instead of BX for multiplication
       dec bl        ; Decrement BL instead of BX
       cmp bl,0      ; Check if BL is zero
       jnz factorial_loop
        
       ret
        
    factorial endp 
    end main