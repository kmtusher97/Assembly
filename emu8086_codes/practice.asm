.MODEL SMALL
.STACK 100H
.DATA   
    
    ARA DB 4 DUP(0)
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX     
    
    
    XOR BX, BX
    
    ;MOV BX, 1
    
    FOR: 
        MOV AH, 1 
        INT 21H
        MOV ARA[BX], AL
        
        INC BX 
        CMP BX, 5
        JL FOR
     
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H   
        
    XOR BX, BX
    ;MOV BX, 1
       
    FOR1: 
        MOV AH, 2
        MOV DL, ARA[BX] 
        INT 21H
        
        INC BX 
        CMP BX, 5
        JL FOR1     
         
    
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
END MAIN

