.model small
.stack 100h 
.code
start:
Mov al,49
mov bl,50
call proc1 
call display1


mov ah,4ch
int 21h 
proc1 proc

mov al,50
mov bl,49
ret
proc1 endp

display1 proc 
mov ah,02
mov dl,al
int 21h 

mov ah,02
mov dl,bl
int 21h 
ret 
display1 endp
end start


