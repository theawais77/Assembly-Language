.MODEL SMALL
.STACK 100h

.DATA
    prompt_msg DB 'Enter string (max 78 chars), press Enter: $'
    newline_msg DB 0Dh, 0Ah, '$'
    reversed_msg DB 0Dh, 0Ah, 'Reversed: $'
    input_buffer DB 80 DUP(?)
    char_count   DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, prompt_msg
    MOV AH, 09h
    INT 21h

    ; Read input
    MOV CX, 0
    LEA SI, input_buffer

read_loop:
    MOV AH, 01h
    INT 21h

    CMP AL, 0Dh
    JE end_read

    MOV [SI], AL
    INC SI
    INC CX

    CMP CX, 79
    JGE end_read

    JMP read_loop

end_read:
    MOV char_count, CX

    ; Display "Reversed: "
    LEA DX, reversed_msg
    MOV AH, 09h
    INT 21h

    ; Print in reverse
print_loop:
    CMP CX, 0
    JE done

    DEC SI
    MOV DL, [SI]
    MOV AH, 02h
    INT 21h

    DEC CX
    JMP print_loop

done:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN