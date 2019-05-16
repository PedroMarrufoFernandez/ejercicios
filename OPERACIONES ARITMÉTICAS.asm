
;REALIZADO POR: PEDRO MARRUFO FERNANDEZ
;INSTITUTO TECNOLOGICO SUPERIOR DE VALLADOLID
;6-A ISC.
; OPERACIONES ARITMETICAS BASICAS EN LENGUAJE ENSAMBLADOR:

.model small

.stack 64

.data 
var1 db 0
var2 db 0  

msj1 db 10,13, 'INGRESE EL PRIMER VALOR:$'
msj2 db 10,13, 'INGRESE EL SEGUNDO VALOR:$' 
msj3 db 10,13, 'SUMA:$'
msj4 db 10,13, 'RESTA:$'  
msj5 db 10,13, 'MULTIPLICACION:$' 
msj6 db 10,13, 'DIVISION:$'  

linea db 13,10,'$'
.code
.startup


begin proc far 
    mov ax, @data
    mov ds, ax 
    
    call limpia
mov ah,09h
lea dx, msj1
int 21h


call leer 
sub al,30h 
mov var1,al 
mov ah,09h
lea dx, msj2 
int 21h

call leer 
sub al,30h 
mov var2,al 
mov bl,var2 

    ;_________________________PROCESO DE MENSAJES SUMA__________________________
    add bl,var1 
mov ah,09h
lea dx,msj3 
int 21h
mov dl,bl 
add dl,30h    
mov ah,02h 
int 21h 
    ;___________________-PROCESO DE MENSAJES RESTA____________________________
    mov bl,var1
sub bl,var2
mov ah,09h
lea dx,msj4 
int 21h
mov dl,bl 
add dl,30h 
mov ah,02h
int 21h 
     ;____________PROCESO DE MENSAJES MULTIPLICACION__________________
    mov ah,09h
lea dx,msj5 
int 21h

mov al,var1 
mov bl,var2
mul bl 
mov dl,al 
add dl,30h 
mov ah,02h 
int 21h                                                      
    ;____________________PROCESO DE MENSAJES ________________                                                      
mov ah,09h
lea dx,msj6 
int 21h
xor ax,ax
mov al,var2
mov bl,al
mov al,var1
div bl 
mov bl,al
mov dl,bl
add dl,30h
mov ah,02h
int 21h

 ;______________PROCEDIMIENTOS_____________________-
salto proc near
mov ah,09h
lea dx,linea
int 21h
mov dl,00h
  ret
salto endp

leer proc near
mov ah,01h
int 21h
ret
leer endp

limpia proc near
mov ah,00h
mov al,03h
int 10h
ret
     

     
   
  limpia endp   
end   
  



