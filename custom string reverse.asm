.model small
.stack 100h
.data
    msg db 20,0,20 dup('$') ; max 20 char, current length, buffer for input 
    prompt db 'Enter a string: $'
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    ; Print the prompt message
    mov dx, offset prompt
    mov ah, 09h
    int 21h
    
    ; Take user input (maximum 20 characters)
    mov ah, 0ah
    lea dx, msg
    int 21h
    
    ; Set SI to the start of the string (skip first 2 bytes: max length and current length)
    lea si, msg + 2
    ; Load actual input length into DL
    mov dl, [msg + 1] 
    ; Move length into CL for the loop
    mov cl, dl
    
    ; Set SI to the last character of the string (point to the end)
    add si, dx  ; Change dx to dl here
    
reverse_loop:
    ; Load the current character to print
    mov dl, [si]
    mov ah, 02h
    int 21h
    
    ; Decrement SI to point to the previous character
    dec si
    ; Loop until all characters are printed
    loop reverse_loop
    
    ; Exit the program
    mov ah, 4ch
    int 21h
main endp
end main
