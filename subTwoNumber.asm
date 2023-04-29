
; program to subtract two numbers

.model small                                                                                                                       
.stack 100h
.data
.code

start:

mov bl,3
mov cl,1
sub bl,cl
;add bl,48  ; for constant values

mov dl,bl
mov ah,2
int 21h





mov ah,4ch
int 21h
end start