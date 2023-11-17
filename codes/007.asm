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
