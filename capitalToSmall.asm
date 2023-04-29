; program to convert capital letter to small letter

.model small 
.stack 100h
.data
.code
start:

; for input
mov ah,1
int 21h

; Logic
; A = 65
; B = 66
; a = 97
; b = 98
; 97 - 65 = 32

; print result
mov dl,al
add al,32
mov ah,2
int 21h

mov ah,4ch
int 21h

end start