.model small
.stack 100h

.data
    prompt1 db 'Enter the first number: $'
    prompt2 db 'Enter the second number: $'
    prompt3 db 'Choose an operation (1 - Addition, 2 - Subtraction): $'
    resultMsg db 'The result is: $'
    continueMsg db 'Do you want to continue (Y/N)? $'
    exitMsg db  0ah,'Exiting the program.$'
    inputBuffer db 10    ; Buffer to store the user input
    num1 dw ?
    num2 dw ?
    choice db ?
    result dw ?

.code

start:
    mov ax, @data
    mov ds, ax

    jmp input_num1

check:
    cmp al, 'Y'
    je new_line
    jmp exit_program

new_line:
 ; for print new line
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h

input_num1:
    mov ah, 09
    mov dx, offset prompt1 ; asking to enter the first number
    int 21h
 
    ; Read the first number from the user
    mov ah, 01 
    int 21h
    sub al, '0'
    mov num1, ax

    ; for print new line
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h

input_num2:
    mov ah, 9
    mov dx, offset prompt2 ; asking to enter the second number
    int 21h

    ; Read the second number from the user
    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, ax

    ; for print new line
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h

input_choice:
    mov ah, 9
    mov dx, offset prompt3 ; asking to enter the operator
    int 21h

    mov ah, 1
    int 21h
    mov choice, al

    ; for print new line

    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h

    cmp choice, '1'
    jne check_subtract

 addition:
    ; Load num1 into register
    mov ax, num1
    ; Add num2 to register
    add ax, num2
    ; Store the result in result variable
    mov result, ax

    jmp display_result

check_subtract:
    cmp choice, '2'
    jne input_choice
    ; jne invalid_choice

subtraction:
    ; Load num1 into register
    mov ax, num1
    ; Subtract num2 from the register
    sub ax, num2
    ; Store the result in the result variable
    mov result, ax
    jmp display_result

; invalid_choice:

display_result:
    ; Code for displaying the result
    mov ah, 9
    mov dx, offset resultMsg
    int 21h

    mov ax, result
    add al, '0'
    mov ah, 0Eh
    int 10h
    
    ; mov dl, al
    ; mov ah, 2
    ; int 21h

    ; for print new line
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h

ask_continue:
    ; Code for asking if the user wants to continue
    mov ah, 9
    mov dx, offset continueMsg
    int 21h

    mov ah, 1
    int 21h

    jmp check

    ;Exit the program
    
    exit_program:
    mov ah, 9
    mov dx, offset exitMsg
    int 21h

    mov ah, 4ch
    int 21h

end start
