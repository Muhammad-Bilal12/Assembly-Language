.model small
.stack 100h

.data
    prompt1 db 10,13,'Enter the first number: $'
    prompt2 db 10,13,'Enter the second number: $'
    resultMsg db 10,13,'Result: $'
    num1 dw ?           ; Variable to store the first number
    num2 dw ?           ; Variable to store the second number
    result dw ?         ; Variable to store the result

.code
start:
    mov ax, @data
    mov ds, ax

    ; Prompt the user to enter the first number
    mov ah, 9
    mov dx, offset prompt1
    int 21h

    ; Read the first number from the user
    mov ah, 1
    int 21h
    sub al, '0'
    mov num1, ax

    ; Prompt the user to enter the second number
    mov ah, 9
    mov dx, offset prompt2
    int 21h

    ; Read the second number from the user
    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, ax

    ; Add the numbers and store the result
    mov ax, num1
    add ax, num2
    mov result, ax

    ; Display the result
    mov ah, 9
    mov dx, offset resultMsg
    int 21h

    ; Display the result number
    mov ax, result
    add al, '0'
    mov ah, 0Eh
    int 10h

    mov ah, 4Ch
    int 21h

end start
