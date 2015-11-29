
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
  
    call c
    call pasuse1


.c:
    mov al, 182     ;Preparamos el altaavoz
    out 43h,al      ;valor de la frecuencia en 
    mov ax, 9120    ;decimal para C medio
    out 42h, al     ;Salida del byte bajo
    mov al, ah      ;Salida del byte alto
    out 42h, al     ;enviar la nota por el puerto
    in al, 61h      ;61h
    
    or al, 00000011b    
    out 61h, al
    mov bx, 25
    call inicio 
    
.pause1 proc near:
    mov cx, 65535

 
.pause2:
    dec cx
    jne .pause2
    dec bx
    jne .pause1
    in  al, 61h
    
    and al, 11111100b
    out 61h, al 
    

ret




