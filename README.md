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

[001](https://github.com/kmtusher97/Assembly/blob/master/codes/001.asm)

## Input a character and print it with a newline

```assembly
; scan a character, print a new line and then print the input char

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
   MOV AH, 1   ; Scan the char
   INT 21H
   MOV BL, AL

   MOV AH, 2   ; Print the new line
   MOV DL, 0AH ; 0AH ascii code for new line
   INT 21H

   MOV DL, 0DH ; Remove the space (cret 0dh)
   INT 21H

   MOV AH, 2   ; Print the char
   MOV DL, BL
   INT 21H

   EXIT:
   MOV AH, 4CH
   INT 21H
   MAIN ENDP
END MAIN

```

[002](https://github.com/kmtusher97/Assembly/blob/master/codes/002.asm)

## Input multi-digit number and print

```assembly
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
```

[003](https://github.com/kmtusher97/Assembly/blob/master/codes/003.asm)

## Print a string

```assembly
; Print a string

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
```

[004](https://github.com/kmtusher97/Assembly/blob/master/codes/004.asm)

## Add two digits

```assembly
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
```

[005](https://github.com/kmtusher97/Assembly/blob/master/codes/005.asm)

## Declare variable, input and print the variable

```assembly
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
```

[006](https://github.com/kmtusher97/Assembly/blob/master/codes/006.asm)

## Arithmetic operation on variables

```assembly
.model small
.stack 100h

.data

    a db ?
    b db ?
    c db ?
    d db ?
    e db ?
    f db ?

.code
main proc

    mov ax, @data
    mov ds, ax

    ; input a b

    mov ah, 1
    int 21h
    mov a, al

    int 21h     ; space
    mov bl, al

    int 21h
    mov b, al
    ;---------------------

    ; add c = a + b
    mov bl, a
    mov c, bl
    mov bl, b
    add c, bl
    sub c, 48
    ;---------------------

    ; sub d = a - b
    mov bl, a
    mov d, bl
    mov bl, b
    add d, bl
    sub d, 54
    ;---------------------

    ; print a + b = c

    mov ah, 2   ; new line
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    mov dl, a   ; print a
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, 2bh ; +
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, b   ; print b
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, 3dh ; =
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, c
    int 21h
    ;---------------------

    ; print a - b = d

    mov ah, 2   ; new line
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    mov dl, a   ; print a
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, 2dh ; -
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, b   ; print b
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, 3dh ; =
    int 21h

    mov dl, 20h ; space
    int 21h

    mov dl, d
    int 21h
    ;---------------------

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
```

[007](https://github.com/kmtusher97/Assembly/blob/master/codes/007.asm)

## Conditional statement

```assembly
; conditional statement

.MODEL SMALL
.STACK 100H

.DATA

    GRTR DB ' > $'
    SMLR DB ' < $'
    EQAL DB ' = $'

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; input 2 numbers a b

    MOV AH, 1
    INT 21H
    MOV BL, AL

    INT 21H       ; Space
    MOV CL, AL

    INT 21H
    MOV CL, AL
    ;-----------------------

    MOV AH, 2
    MOV DL, 0AH   ; new line
    INT 21H
    MOV DL, 0DH
    INT 21H


    CMP BL, CL
    JG SEC2

    CMP BL, CL
    JL SEC3

    SEC1:         ; A == B
    MOV AH, 2
    MOV DL, BL
    INT 21H

    LEA DX, EQAL
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT


    SEC2:        ; A > B
    MOV AH, 2
    MOV DL, BL
    INT 21H

    LEA DX, GRTR
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, CL
    INT 21H

    JMP EXIT


    SEC3:        ; A < B
    MOV AH, 2
    MOV DL, BL
    INT 21H

    LEA DX, SMLR
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, CL
    INT 21H



    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
```

[008](https://github.com/kmtusher97/Assembly/blob/master/codes/008.asm)

## Loops

```assembly
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
```

[009](https://github.com/kmtusher97/Assembly/blob/master/codes/009.asm)

## Nested loops

```assembly
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
```

[010](https://github.com/kmtusher97/Assembly/blob/master/codes/010.asm)

## Array

```assembly
; array

.MODEL SMALL
.STACK 100H

.DATA

    A DB 10 DUP(0)


.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    XOR BX, BX

    FOR:
        MOV AH, 1
        INT 21H
        MOV CL, AL

        CMP CL, 0DH
        JE END_FOR

        ;SUB BL, 48
        MOV A[BX], CL
        INC BX
        JMP FOR
    END_FOR:


    MOV AH, 2    ; NEWLINE
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    MOV DX, BX
    INT 21H


    MOV AH, 4CH
    INT 21H
    MAIN ENDP

END MAIN
```

[011](https://github.com/kmtusher97/Assembly/blob/master/codes/011.asm)
