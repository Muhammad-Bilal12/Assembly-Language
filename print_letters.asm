; program to print capital letters from A to Z using loops

.model small
.stack 100h
.data
.code

start:


mov cx,26
mov dl, 65
L1:

mov ah,2
int 21h

; add dl ,1
inc dx ; also do the same thing --> increament by 1

Loop L1

mov ah,4ch
int 21h
end start