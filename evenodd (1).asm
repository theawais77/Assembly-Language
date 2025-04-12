;check whether even or odd
.model small
.stack 100h
.data
    str1 db 'enter a number$'
    input db ?  
    newline db 13,10,'$'
    is_odd db 'the number is odd$'
    is_even db 'the number is even$'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        mov dx,offset str1
        int 21h
        
        mov ah,09h
        mov dx,offset newline
        int 21h
        
        mov ah,01h     ; taking user input
        int 21h
        
        mov cl,al
        
        mov ah,09h
        mov dx,offset newline
        int 21h
        
        mov al,cl
        sub ah ,'0'   ; converting aski to integer 
        
        mov ah,0      ;taking modolus
        MOV bl,2
        div bl
        
       
        cmp ah, 0
        je is_eve
        
        mov ah,09h
        mov dx,offset is_odd
        int 21h
        jmp end_prog
        
        is_eve:
        mov ah,09h
        mov dx,offset is_even
        int 21h
         
        end_prog: 
        mov ah,4ch ;exit
        int 21h
    main endp
    end main