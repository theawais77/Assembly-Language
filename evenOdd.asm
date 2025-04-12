;;check weather even or odd
.model small
.stack 100h
.data 
   str1 db "Enter a number$"       
   input db ?
   newline db 10,13,'$'  
   odd_msg db "Your number is odd$" 
   even_msg db "Your number is even$" 
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
                                    
    mov ah,01h         ;taking user input
    int 21h   
    sub ah,'0'  ;converting ascii into physical
     
     
    ;check even/odd
    mov ah,0        ; Clear AH for division
    mov bl,2        ; Divisor
    div bl          ; AL = AX/BL, AH = remainder
    
    
     mov ah,09h
    mov dx,offset newline
    int 21h
                                                      
     ;check reminder                                                  
    cmp  ah,0
    je is_even
    
    ;if odd
    mov dx,offset odd_msg 
    jmp display_result   
    
    is_even:
    mov dx,offset even_msg
    
    display_result:
    mov ah,09h
    int 21h
                                                       
    mov ah,4ch
    int 21h        
main endp
end main
