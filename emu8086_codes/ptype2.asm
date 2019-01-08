; scan a character, print a new line
; and then print the input char

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC     
   MOV AH, 1   ;scan the char
   INT 21H
   MOV BL, AL    
   
   MOV AH, 2   ;Print the new line
   MOV DL, 0AH ; 0AH ascii code for new line
   INT 21H  

   MOV DL, 0DH ; Remove the space (cret 0dh)
   INT 21H
   
   MOV AH, 2   ;Print the char 
   MOV DL, BL
   INT 21H
   
   EXIT:
   MOV AH, 4CH
   INT 21H
   MAIN ENDP
END MAIN
    
    