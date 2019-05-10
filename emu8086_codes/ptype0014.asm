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
    
    ;CALL TO_BINARY
    CALL TO_HEXA
    
    
    
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


TO_BINARY PROC
    MOV CL, 0
    
    FOR1:  
        XOR BH, BH
        SHL BX, 1  
        ADD BH, 48 
        
        
        MOV AH, 2
        MOV DL, BH
        INT 21H
        
        INC CL
        CMP CL, 8
        JL FOR1   
        
    RET            
    
    
TO_HEXA PROC
    MOV CL, 1
    XOR BH, BH
    
    FOR2:
      SHL BX, 1
      
      CMP CL, 4 
      JE DO
      
      CMP CL, 8 
      JE DO  
      
      GO:
        JMP END_DO
      
      DO:  
        MOV CH, BH
        CMP CH, 10
        JL DO1
        
        DO1:
            ADD CH, 48
            MOV AH, 2
            MOV DL, CH
            INT 21H
            
            JMP FREE
            
        DO2:
            ADD CH, 55
            MOV AH, 2
            MOV DL, CH
            INT 21H
        
        FREE:   
            XOR BH, BH 
        
      END_DO:
      
      
      INC CL
      CMP CL, 8
      JLE FOR2  
      
    RET


END MAIN

