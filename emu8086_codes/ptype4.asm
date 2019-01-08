;Print a string 

.MODEL SMALL
.STACK 100H

.DATA  

    STR1 DB 'We need to print a string.$' 
    STR2 DB 'STR1, STR2 & STR3 are string variables...$'
    STR3 DB 'Doller sign in the null char for the string..$'

.CODE

MAIN PROC 
    
    MOV AX, @DATA   ;initializing the data segment
    MOV DS, AX
                 
    ; Print the strings
    
    LEA DX, STR1    ;Load Effective Address
    MOV AH, 9       ;Print the 1st string
    INT 21H  
    
    MOV AH, 2       ;New Line
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    LEA DX, STR2
    MOV AH, 9       ;Print the 2nd string
    INT 21H        
    
    MOV AH, 2       ;New Line
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    LEA DX, STR3
    MOV AH, 9       ;Print the 3rd string
    INT 21H        
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN