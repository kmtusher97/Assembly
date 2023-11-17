; input multidigit number and print

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC  
    ; input a four digit number
    
    MOV AH, 1      
    INT 21H
    MOV BL, AL  
    
    INT 21H
    MOV BH, AL
    
    INT 21H
    MOV CL, AL
    
    INT 21H
    MOV CH, AL
    ;----------------------------------
      
      
    ;print a new line 
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    MOV DL, 0DH
    INT 21H
    ;----------------------------------
    
    ;Print the 4 digit number 
                   
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 2
    MOV DL, CL
    INT 21H
    
    MOV AH, 2
    MOV DL, CH
    INT 21H
    ;----------------------------------
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    