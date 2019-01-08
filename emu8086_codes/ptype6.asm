; variable declaration, initializing the
; value and scan a variable

.MODEL SMALL
.STACK 100H

.DATA

    A DB 3          ; A = 3
    B DB ?          ; value isn't initialized

.CODE

MAIN PROC
    
    MOV AX, @DATA   ; initializing the data segment
    MOV DS, AX                                     
    
    ; scan the value of B  
    
    MOV AH, 1
    INT 21H
    MOV B, AL
    ;--------------------  
        
    MOV AH, 2       ; new line
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H   
    
    
    ; print the value of the two variable
                         
    ; print the value of A
    
    MOV AH, 2 
    ADD A, 48      ; to make the ascii value of 3 
    MOV DL, A
    ;ADD DL, 48    ; to make the ascii value of 3
    INT 21H   
    
    MOV DL, 20H    ; print a space
    INT 21H
    
    ; print the value of B 
    
    MOV DL, B
    INT 21H
    ;--------------------
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN