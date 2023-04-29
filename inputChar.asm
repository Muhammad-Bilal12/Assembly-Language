
;program to input character from user and print it
.model small
.stack 100h
.data
.code

start:

mov ah,1   ; --> for input 
int 21h

mov dl,al
mov ah,02
int 21h

mov ah,4ch
int 21h

end start