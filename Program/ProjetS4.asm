.model small
.stack 100h

.data
    
    N dw ?
    i dw ?
    j dw ?
    row dw ?
    column dw ?
    squareNumber dw ?
    newline        dw     0Dh,0Ah, '$'
    prompt1 dw 'Entrez un numero N entre 1 et 50 : $'
    prompt2 dw 'Entrez une ligne i entre 1 et 10 : $'
    prompt3 dw 'Entrez une colonne j entre 1 et 10 : $'
    error1 dw 'Erreur : N doit etre entre 1 et 50.', 0Dh, 0Ah, '$'
    error2 dw 'Erreur : i et j doivent etre entre 1 et 10.', 0Dh, 0Ah, '$'
    msgrow dw 'La ligne est : $'
    msgcolumn dw 'La colonne est : $'
    msgsquare dw 'Le numero du carre est : $'
    cr              equ     0Dh
    lf              equ     0Ah
    error           db      cr, lf, 'the number is out of range!',
    make_minus      db      ?       ; used as a flag in procedures.
    ten             dw      10      ; used as multiplier.

.code
main proc
        mov ax, @data
        mov ds, ax

        ; Prompt user for input
        lea dx, prompt1
        call puts
        call scan_num
        mov N, cx

        ; Call getRow function
        mov ax, N
        call getRow
        mov row, ax

        ; Check if row is 0
        cmp row, 0
        je exit

        ; print newline
        lea dx, newline
        mov ah, 9
        int 21h

        ; Display row
        lea dx, msgrow
        call puts
        mov ax, row
        mov ah, 0
        call print_decimal


        ; Call getColumn function
        mov ax, N
        call getColumn
        mov column, ax

        ; Check if column is 0
        cmp column, 0
        je exit

        ; print newline
        lea dx, newline
        mov ah, 9
        int 21h

        ; Display column
        lea dx, msgcolumn
        call puts
        mov ax, column
        mov ah, 0
        call print_decimal


        ; print newline
        lea dx, newline
        mov ah, 9
        int 21h

        ; Prompt user for input i
        lea dx, prompt2
        call puts
        call scan_num
        mov i, cx

        ; print newline
        lea dx, newline
        mov ah, 9
        int 21h

        ; Prompt user for input j
        lea dx, prompt3
        call puts
        call scan_num
        mov j, cx

        ; Call getSquareNumber function
        mov ax, i
        mov bx, j
        call getSquareNumber
        mov squareNumber, ax

        ; Check if squareNumber is 0
        cmp squareNumber, 0
        je exit

        ; print newline
        lea dx, newline
        mov ah, 9
        int 21h

        ; Display squareNumber
        lea dx, msgsquare
        call puts
        mov ax, squareNumber
        mov ah, 0
        call print_decimal

    exit:
        mov ah, 4Ch
        int 21h

    main endp

getRow proc
        push bp
        mov bp, sp

        mov al, [bp+4] ; N
        cmp al, 1
        jl errorgetRow
        cmp al, 50
        jg errorgetRow

        sub al, 1
        mov ah, 0
        mov bl, 5
        div bl
        add al, 1

        jmp donegetRow

    errorgetRow:
        lea dx, error1
        mov ah, 09h
        int 21h
        mov al, 0

    donegetRow:
        pop bp
        ret

    getRow endp

getColumn proc
    push bp
    mov bp, sp

    mov ax, [bp+4] ; N

    ; Call getRow function to check if row is even or odd
    push ax         ; Save N on the stack
    call getRow     ; AX now contains row value
    pop bx          ; Restore N in BX register

    ; Check if row is even or odd
    test al, 1      ; Check if least significant bit is set
    jnz odd_row     ; Jump to odd_row if odd

    ; Even row
    mov ax, N      ; Move N back to AX register
    mov cl, 10      ; Set CL to 10 for division
    mov dx, 0
    div cl          ; Divide AX by 10 (quotient in AX, remainder in DL)
    cmp ah, 0       ; Check if remainder is 0
    je last_column  ; Jump to last_column if remainder is 0

    ; Calculate column value for even row
    mov ax, N
    mov cl, 10
    mov dx, 0
    div cl
    mov al, ah
    mov ah, 0
    mov cx, 2
    mul cx
    sub ax, 11
    jmp done_column ; Jump to done_column

odd_row:
    ; Odd row
    mov ax, N
    mov cl, 10
    mov dx, 0
    div cl
    mov al, ah
    mov ah, 0
    mov cx, 2
    mul cx
    jmp done_column ; Jump to done_column

last_column:
    mov ax, 9       ; Set column value to 9 for last column

done_column:
    pop bp
    ret

getColumn endp

getSquareNumber proc
        push bp
        mov bp, sp

        cmp al, 1
        jl errorgetSquareNumber
        cmp al, 10
        jg errorgetSquareNumber

        cmp bl, 1
        jl errorgetSquareNumber
        cmp bl, 10
        jg errorgetSquareNumber

        add al, bl
        mov ah, 0
        mov bl, 2
        div bl

        cmp ah, 0
        je errorgetSquareNumber

        mov dx, i
        sub dl, 1
        mov al, dl
        mov bl, 5
        mul bl

        mov dx, j
        add dl, 1
        mov cx, ax
        mov ax, dx
        mov ah, 0
        mov bl, 2
        div bl
        add ax, cx

        jmp donegetSquareNumber

    errorgetSquareNumber:
        lea dx, error2
        mov ah, 09h
        int 21h
        mov al, 0

    donegetSquareNumber:
        pop bp
        ret

    getSquareNumber endp

puts    proc    near
        push    ax
        mov     ah, 09h
        int     21h
        pop     ax
        ret
puts    endp

read_char       proc    near
        mov     ah, 01h
        int     21h
        ret
read_char       endp

scan_num        proc    near
        push    dx
        push    ax

        xor     cx, cx

        ; reset flag:
        mov     make_minus, 0

next_digit:

        call    read_char

        ; check for minus:
        cmp     al, '-'
        je      set_minus

        ; check for enter key:
        cmp     al, cr
        je      stop_input

        ; multiply cx by 10 (first time the result is zero)
        push    ax
        mov     ax, cx
        mul     ten                     ; dx:ax = ax*10
        mov     cx, ax
        pop     ax

        ; check if the number is too big
        ; (result should be 16 bits)
        cmp     dx, 0
        jne     out_of_range

        ; convert from ascii code:
        sub     al, 30h

        ; add al to cx:
        xor     ah, ah
        add     cx, ax
        jc      out_of_range    ; jump if the number is too big.

        jmp     next_digit

set_minus:
        mov     make_minus, 1
        jmp     next_digit

out_of_range:
        lea     dx, error
        call    puts

stop_input:
        ; check flag:
        cmp     make_minus, 0
        je      not_minus
        neg     cx
not_minus:

        pop     ax
        pop     dx
        ret
scan_num        endp

print_decimal proc
    push ax     ; Sauvegarder la valeur initiale de AX
    push bx     ; Sauvegarder la valeur de BX
    push cx     ; Sauvegarder la valeur de CX
    push dx     ; Sauvegarder la valeur de DX

    xor cx, cx  ; Initialiser CX à 0 (utilisé comme compteur)
    mov bx, 10  ; Diviseur pour la conversion en décimal

convertloop:
    xor dx, dx  ; Initialiser DX à 0
    div bx      ; Diviser AX par 10 (quotient dans AX, reste dans DX)
    push dx     ; Empiler le reste (chiffre)
    inc cx      ; Incrémenter le compteur
    cmp ax, 0   ; Vérifier si le quotient est nul
    jnz convertloop  ; Continuer la boucle si le quotient n'est pas nul

print_digits:
    pop dx      ; Dépiler un chiffre
    add dl, '0' ; Convertir le chiffre en caractère ASCII
    mov ah, 2   ; Fonction d'affichage d'un caractère
    int 21h     ; Afficher le caractère
    loop print_digits  ; Répéter jusqu'à ce que tous les chiffres soient affichés

    pop dx      ; Restaurer la valeur de DX
    pop cx      ; Restaurer la valeur de CX
    pop bx      ; Restaurer la valeur de BX
    pop ax      ; Restaurer la valeur initiale de AX
    ret
print_decimal endp

end main