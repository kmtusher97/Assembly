.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH, 1
    INT 21H    ;Scan a character
    MOV BL, AL                   
    
    MOV AH, 2
    MOV DL, BL ;Print the input character
    INT 21H
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN