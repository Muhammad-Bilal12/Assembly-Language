.model small
.stack 100h

.data
    password db 'OpenAI'   ; Set the correct password
    maxAttempts db 3       ; Set the maximum number of attempts
    prompt db 0ah, 'Enter the password: $'
    correctMsg db 0ah, 'Correct password! Access granted.$'
    wrongMsg db 0ah, 'Wrong password!$'
    attemptsLeft db ' attempts left.$'
    attempt db ?           ; Variable to store the current attempt number
    inputBuffer db 20      ; Buffer to store the user input

.code
    start:
        mov ax, @data
        mov ds, ax

        mov cx, maxAttempts  ; Initialize the attempt counter

    password_guess:
        mov ah, 9
        mov dx, offset prompt
        int 21h

        mov ah, 0ah          ; Read user input
        mov dx, offset inputBuffer
        int 21h

        ; Compare the input with the correct password
        cmp inputBuffer, password
        je correct_password
        jmp wrong_password

    correct_password:
        mov ah, 9
        mov dx, offset correctMsg
        int 21h

        jmp exit_program

    wrong_password:
        ; Decrement the attempt counter
        dec cx

        ; Display wrong password message
        mov ah, 9
        mov dx, offset wrongMsg
        int 21h

        ; Display attempts left message
        mov ah, 2
        mov dl, cx
        add dl, '0'
        mov ah, 9
        mov dx, offset attemptsLeft
        int 21h

        ; Check if attempts are exhausted
        cmp cx, 0
        jne password_guess

        ; If attempts are exhausted, display exit message
        mov ah, 9
        mov dx, offset exitMsg
        int 21h

    exit_program:
        mov ah, 4Ch
        int 21h

end start
