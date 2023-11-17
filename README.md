# Assembly

## Input a character and print it

```assembly
.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH, 1
    INT 21H    ; Input a character
    MOV BL, AL                   
    
    MOV AH, 2
    MOV DL, BL ; Print the input character
    INT 21H
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

END MAIN
```
[001-character-io](https://github.com/kmtusher97/Assembly/blob/master/codes/001-character-io.asm)