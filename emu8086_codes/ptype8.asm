; conditional statement

.MODEL SMALL
.STACK 100H

.DATA

    GRTR DB ' > $'
    SMLR DB ' < $'
    EQAL DB ' = $'

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ; input 2 numbers a b   
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    INT 21H       ; Space
    MOV CL, AL
    
    INT 21H
    MOV CL, AL
    ;-----------------------  
    
    MOV AH, 2
    MOV DL, 0AH   ; new line
    INT 21H
    MOV DL, 0DH
    INT 21H  
             
    
    CMP BL, CL
    JG SEC2 
    
    CMP BL, CL
    JL SEC3
          
    SEC1:         ; A == B
    MOV AH, 2
    MOV DL, BL
    INT 21H 
    
    LEA DX, EQAL
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H  
    
    JMP EXIT
    
    
    SEC2:        ; A > B
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    LEA DX, GRTR
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2
    MOV DL, CL
    INT 21H
    
    JMP EXIT   
    
    
    SEC3:        ; A < B
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    LEA DX, SMLR
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, CL
    INT 21H
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN