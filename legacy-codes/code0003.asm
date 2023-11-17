; array sorting 

.MODEL SAMLL  
.STACK 100H

.DATA
    ara DB 5,4,1,6,4,2,3 

.CODE
MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    CALL BUBBLE_SORT
    CALL PRINT
    
    
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
    
    
BUBBLE_SORT PROC 
    XOR BX, BX   
    FOR2:
        MOV CH, ara[BX]
        MOV SI, BX 
        INC SI
        FOR3:
            CMP ara[SI], CH
            JGE SEC1
            
            MOV CL, ara[SI]
            MOV ara[SI], CH
            MOV CH, CL
            
            SEC1:
                INC SI
                CMP SI, 7
                JL FOR3  
                
        MOV ara[BX], CH
        
        INC BX 
        CMP BX, 6
        JL FOR2
    
    RET    
    

PRINT PROC
    MOV CX, 7  
    XOR BX, BX
    FOR1:
        MOV AH, 2  
        ADD ara[BX], 48
        MOV DL, ara[BX]
        INT 21H
        
        CALL NL
        
        INC BX
        LOOP FOR1
    
    ret       


END MAIN