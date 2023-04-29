
.model small
.stack 100h
.data
.code

start:

mov dl,66
mov ah,02
int 21h

mov dl,'I'
mov ah,02
int 21h

mov dl,'L'
mov ah,02
int 21h

mov dl,'A'
mov ah,02
int 21h


mov dl,'L'
mov ah,02
int 21h


mov ah,4ch
int 21h

end start