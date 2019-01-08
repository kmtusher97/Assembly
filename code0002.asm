; Enter a character
; in the next line print the ascii code of the
; character in hexadecimal 

.MODEL SMALL
.STACK 100H

.DATA     
    msg1 DB 'Enter a character : $'
    msg2 DB 'ASCII code in hexadecimal : $'
    
.CODE
MAIN PROC
    MOV AX, @DATA           ; Initiate the data section
    MOV DS, AX   
    
    WHILE1:
        LEA DX, msg1            ; instruction message
        MOV AH, 9
        INT 21H                                      
        
        CALL INPUT 
        
        CMP BL, 0DH
        JE EXIT
            
        CALL NL
        
        LEA DX, msg2            
        MOV AH, 9
        INT 21H
        
        CALL TO_HEXA   
        CALL NL
    
    
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP 


INPUT PROC
    MOV AH, 1               ; input a char
    INT 21H                               
    MOV BL, AL                            
    
    ret
    
NL PROC                     ; New Line function
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    RET    
    
TO_HEXA PROC                ; print the Hexadecimal value of BL  
    MOV CX, 2
    FOR1: 
        XOR BH, BH
        SHL BX, 4
        
        CMP BH, 9 
        JG PRINT2
        
        PRINT1:
            MOV AH, 2
            ADD BH, 48
            MOV DL, BH
            INT 21H   
            
            JMP ITR
            
        PRINT2:
            MOV AH, 2
            ADD BH, 55
            MOV DL, BH
            INT 21H  
             
        
        ITR:
            LOOP FOR1     
            
    RET
            

END MAIN