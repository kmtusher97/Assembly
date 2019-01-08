; Enter a character
; in the next 2 lines print the ascii code of the
; character in binary and the number of ones
; int the binary representation of it

.MODEL SMALL
.STACK 100H

.DATA     
    msg1 DB 'Enter a character : $'
    msg2 DB 'Binary : $'
    msg3 DB 'Number of ones : $'
    
.CODE
MAIN PROC
    MOV AX, @DATA           ; Initiate the data section
    MOV DS, AX   
    
    LEA DX, msg1            ; instruction message
    MOV AH, 9
    INT 21H                                      
    
    CALL INPUT     
    
    CALL NL
    
    LEA DX, msg2            
    MOV AH, 9
    INT 21H
    
    CALL TO_BINARY  
    CALL NL
    
    LEA DX, msg3            
    MOV AH, 9
    INT 21H     
    
    MOV AH, 2        
    ADD CH, 48
    MOV DL, CH             ; count of one
    INT 21H
    
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
    
TO_BINARY PROC             ; print the binary value of BL   
    MOV CL, 0              
    MOV CH, 0              ; Pairity(1) Counter
    LOOP1:
        XOR BH, BH
        SHL BX, 1          
                                            
        MOV AH, 2          ; Print the bit
        ADD BH, 48
        MOV DL, BH
        INT 21H  
        
        CMP BH, '0'
        JE SEC1
        
        COUNT:
            INC CH         ; conut the 1's
        
        SEC1:
            INC CL
            CMP CL, 8
            JL LOOP1    
            
    RET
            

END MAIN