.MODEL SMALL
.STACK 100H
.DATA
  msg DB 'Hello, World!$',0 ; $ means string has ended

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV DX, OFFSET msg  ; load address of msg
    MOV AH,09H          ; print string function
    INT 21H             ; display message
    
    MOV AH,4CH          ; EXIT PROGRAM
    INT 21H 
    
MAIN ENDP
END MAIN