.model small
.stack 100h
.data  
  msg db 'enter the number$'
  input db ?
  newline db 10,13,'$'
.code 
main proc
    mov ax,@data  ;loading data in to data segment
    mov ds,ax
    
    greater:
    mov dx, offset msg    ; displaying msg output
    mov ah,09h
    int 21h
    
    mov dx,offset newline   ; line break 
    mov ah,09h
    int 21h
    
    mov ah,01h  
    int 21h          ; taking user input
    mov input,ah           
    
    
    sub input,'0'
    
    cmp input,48           ; check input between 0 and greater
    jmp lesser
    jg greater 
    
    lesser:
    mov bl,input
    mov cl,bl 
    loop_start:
    mul bl
    dec cx
    mov input,bl
    loop loop_start
     
    mov dx,offset newline   ; line break 
    mov ah,09h
    int 21h
    
    mov dx, offset input    ; displaying msg output
    mov ah,09h
    int 21h 
    
        
    mov ax,4ch    ; exiting the program
    int 21h
main endp
end main