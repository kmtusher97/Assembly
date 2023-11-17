; add two digits

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC   
    ; input two digit [a b format] 
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 1    ; scan a space
    INT 21H
    MOV CL, AL 
    
    MOV AH, 1
    INT 21H
    MOV CH, AL   
    
    MOV CL, BL   ;Keep the value of a for print result
    ;---------------------------- 
    
    ADD BL, CH   ; BL = BL + CH 
    SUB BL, 30H  ; BL = BL - 48, make the result
    
    ;Print the result [a + b = c format]
    
    MOV AH, 2    ; New Line
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV DL, CL   ; print a
    INT 21H               
    
    MOV DL, 20H  ; print a space
    INT 21H   
    
    MOV DL, 2BH  ; print a +
    INT 21H
    
    MOV DL, 20H  ; print a space
    INT 21H 
    
    MOV DL, CH   ; print a
    INT 21H   
    
    MOV DL, 20H  ; print a space
    INT 21H
    
    MOV DL, 3DH  ; print an =
    INT 21H 
    
    MOV DL, 20H  ; print a space
    INT 21H
               
    
    MOV DL, BL   ; print the result c
    INT 21H
    ;---------------------------- 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN