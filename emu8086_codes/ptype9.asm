; loop

.MODEL SMALL
.STACK 100H

.DATA

    TXT DB ' Mellllooooowwww!!! $'
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV AH, 1
    INT 21H
    MOV BL, AL  
    SUB BL, 48
    
    LOOP:
        MOV CX, 0   ; Loops run in CX
        MOV CL, BL   
        
        MOV BL, '5'
        
        SEC:
            MOV AH, 2
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H 
                   
            MOV DL, BL
            INT 21H
             
            LEA DX, TXT
            MOV AH, 9
            INT 21H 
            
            INC BL
            LOOP SEC 
      
     
     
    EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP 

END MAIN