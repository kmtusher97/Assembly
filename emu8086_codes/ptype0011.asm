; array

.MODEL SMALL
.STACK 100H

.DATA   

    A DB 10 DUP(0) 
    

.CODE     

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX 
    
    XOR BX, BX
    
    FOR:
        MOV AH, 1
        INT 21H
        MOV CL, AL
        
        CMP CL, 0DH
        JE END_FOR
        
        ;SUB BL, 48
        MOV A[BX], CL
        INC BX
        JMP FOR 
    END_FOR:  
               
               
    MOV AH, 2    ; NEWLINE
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    MOV DX, BX
    INT 21H
    
    
        
    

    MOV AH, 4CH
    INT 21H
    MAIN ENDP

END MAIN
