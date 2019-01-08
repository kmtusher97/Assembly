.MODEL SMALL
.STACK 100H
.DATA   
    
   
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX      
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
  
  
    CALL NL
    
    
    MOV CL, 0
    
    FOR:  
        XOR BH, BH
        SHL BX, 1  
        ADD BH, 48 
        
        
        MOV AH, 2
        MOV DL, BH
        INT 21H
        
        INC CL
        CMP CL, 8
        JL FOR
    
    
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP 



    
NL PROC
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H  
    
    RET      

PRINT PROC
    


END MAIN

