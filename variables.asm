; program to Define, Initialize and access variables 

.model small 
.stack 100h
.data

; Initialize variable
var1 db '1'
var2 db ?
var3 db 'Hello World$'

.code
start:


; access data segments
mov ax,@data
mov ds,ax

; access first variable
mov dl,var1
mov ah,2
int 21h

; accesss 2nd variable
; mov var2, '2'
; mov ah,2
; int 21h


; access var 3
mov dx, offset var3  ; for access string
mov ah,9 ; 9 is used to print string
int 21h

mov ah,4ch
int 21h

end start