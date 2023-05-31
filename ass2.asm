.model small
.stack 100h

.data
    prompt1 db 10,13,'Enter the first number: $'
    prompt2 db 10,13,'Enter the second number: $'
    resultMsg db 10,13,'Result: $'
    check db 10,13,"Do you want to continue(Y/N): $"
    num1 dw ?           ; Variable to store the first number
    num2 dw ?           ; Variable to store the second number
    result dw ?         ; Variable to store the result

.code
start:

mov ax,@data
mov ds,ax


begin:
call input1
call input2
call addition
call display_result

check1:
mov ah,09
lea dx , check
int 21h

mov ah,01
int 21h

cmp al,'Y'
je begin

exit:
mov ah,4ch
int 21h
; Define Sub-routine

input1 proc

    ; Prompt the user to enter the first number
    mov ah, 9
    mov dx, offset prompt1
    int 21h

    ; Read the first number from the user
    mov ah, 1
    int 21h
    sub al, '0'
    mov num1, ax

ret 
input1 endp

input2 proc

    ; Prompt the user to enter the first number
    mov ah, 9
    mov dx, offset prompt2
    int 21h

    ; Read the first number from the user
    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, ax

ret 
input2 endp

addition proc
    mov ax, num1
    add ax, num2
    mov result, ax

ret
addition endp

display_result proc
mov ah, 9
    mov dx, offset resultMsg
    int 21h

    ; Display the result number
    mov ax, result
    add al, '0'
    mov ah, 0Eh
    int 10h

    jmp check1

ret
display_result endp


end start
