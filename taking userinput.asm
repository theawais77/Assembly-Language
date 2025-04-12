.MODEL SMALL
.STACK 100H
.DATA
 msg DB 'Enter a character: $'
 

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,OFFSET msg    ;PRINT MSG
    MOV AH,09H           
    INT 21H
    
    MOV AH,01H           ;FUCTION TO READ A CHARACTER
    INT 21H              ;CHARACTER STORED IN AL
    
    MOV DL,AL            ;MOV INPUT TO DL
    MOV AH,02H           ;PRINT FUNCTION
    INT 21H
    
    MOV AH,4CH           ; EXIT PROGRAM
    INT 21H
    
MAIN ENDP
END MAIN