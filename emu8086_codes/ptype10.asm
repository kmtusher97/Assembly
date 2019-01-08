; nested loop

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    
    MOV AH, 1
    INT 21H
    MOV BL, AL 
    
    MOV AH, 2       ; NEW LINE
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    
    MOV BH, '1'  
    LOOP1: 
        
        MOV CL, '1'
        LOOP2:
            MOV AH, 2       ; PRINT THE *
            MOV DL, 2AH
            INT 21H
            
            INC CL
            CMP CL, BH
            JLE LOOP2
        
        MOV AH, 2       ; NEW LINE
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H  
        
        INC BH
        CMP BH, BL
        JLE LOOP1
              
    
   
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP 

END MAIN