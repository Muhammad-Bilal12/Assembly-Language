.model small
.stack 100h

.data
    prompt1 db 'Enter the first number: $'
    prompt2 db 'Enter the second number: $'
    prompt3 db 'Choose an operation (1 - Addition, 2 - Subtraction): $'
    resultMsg db 'The result is: $'
    continueMsg db 'Do you want to continue (Y/N)? $'
    exitMsg db 'Exiting the program.$'
    num1 dw ?
    num2 dw ?
    choice db ?
    result dw ?

.code
start:
    mov ax, @data
    mov ds, ax

    jmp input_num1

input_num1:
    mov ah, 9
    mov dx, offset prompt1
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num1, ax

    jmp input_num2

input_num2:
    mov ah, 9
    mov dx, offset prompt2
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov num2, ax

    jmp input_choice

input_choice:
    mov ah, 9
    mov dx, offset prompt3
    int 21h

    mov ah, 1
    int 21h
    mov choice, al

    cmp choice, '1'
    jne check_subtract

    ; Addition
    ; add num1, num2
    ; mov result, num1
    ; jmp display_result

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
    jne invalid_choice

    ;  Subtraction
    ; sub num1, num2
    ; mov result, num1
    ; jmp display_result

subtraction:
    ; Load num1 into register
    mov ax, num1
    ; Subtract num2 from the register
    sub ax, num2
    ; Store the result in the result variable
    mov result, ax
    jmp display_result


invalid_choice:
    mov ah, 9
    mov dx, offset prompt3
    int 21h
    jmp input_choice

display_result:
    mov ah, 9
    mov dx, offset resultMsg
    int 21h

    mov ax, result
    add ax, '0'
    mov dl, al
    mov ah, 2
    int 21h

    jmp ask_continue

ask_continue:
    mov ah, 9
    mov dx, offset continueMsg
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'Y'
    je start

    ; Exit the program
    mov ah, 9
    mov dx, offset exitMsg
    int 21h

    mov ax, 4C00h
    int 21h

end start
