.model small 
.stack 100h
.data  
    var1 db "Enter a number : $"  
   
    var2 db "Enter second num : $" 
      
    result db ?
    
.code
main proc 
    mov ax,@data
    mov ds ,ax
    
    ;print 
    mov ah,09h
    mov dx,offset var1
    int 21h   
    
    ;input leni hai
    mov ah,01h 
    int 21h 
    sub al,'0'
    mov bl,al 
    
    
    
     ;print 
    mov ah,09h
    mov dx,offset var2
    int 21h   
    
    ;input leni hai
    mov ah,01h 
    int 21h
    sub al,'0'
    add al,bl  
    add al,'0'  
    
    mov result,al
     
    mov ah,09h 
    mov dx,offset result
    int 21h
    
    
    mov ah,4ch
    int 21h 
    
main endp
end main
  
