.model small
.stack 100h

.data
    board db 50 dup(0)
    N dw ?
    i dw ?
    j dw ?
    x dw ?
    y dw ?
    get_Row dw ?
    get_Column dw ?
    get_SquareNumber dw ?
    get_SquareColor dw ?
    display_SquareState dw ?

    WHITE           equ     'w'
    BLACK           equ     'b'
    EMPTY           equ     0
    WHITE_PAWN      equ     1
    BLACK_PAWN      equ     2
    WHITE_QUEEN     equ     3
    BLACK_QUEEN     equ     4
    player          db      WHITE
    capturepossible db      0
    coor            dw      2 dup(0)
    newline        dw     0Dh,0Ah, '$'
    error1 dw 'Erreur : N doit etre entre 1 et 50.', 0Dh, 0Ah, '$'
    error2 dw 'Erreur : i et j doivent etre entre 1 et 10.', 0Dh, 0Ah, '$'

    white_empty db '  ', '$'
    black_empty db '. ', '$'
    white_pawn db ' W ', '$'
    black_pawn db ' B ', '$'
    white_queen db 'WD ', '$'
    black_queen db 'BD ', '$'

    cr              equ     0Dh
    lf              equ     0Ah
    error           db      cr, lf, 'the number is out of range!',
    make_minus      dw      ?
    ten             dw      10

.code
main proc
        mov ax, @data
        mov ds, ax

        call InitialiserDamier
        call AfficherDamier



    exit:
        mov ah, 4Ch
        int 21h

    main endp

getRow proc
        push bp
        mov bp, sp

        mov ax, N
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

        lea dx, newline
        call puts

        lea dx, error1
        call puts
        mov ax, 0

    donegetRow:
        mov ah, 0
        mov get_Row, ax
        pop bp
        ret

    getRow endp

getColumn proc
    push bp
    mov bp, sp

    mov ax, N
    cmp al, 1
    jl errorgetcolumn
    cmp al, 50
    jg errorgetcolumn

    push ax
    call getRow
    pop bx

    mov ax, get_Row
    test al, 1
    jnz odd_row

    mov ax, N
    mov cl, 10
    mov dx, 0
    div cl
    cmp ah, 0
    je last_column

    mov ax, N
    mov cl, 10
    mov dx, 0
    div cl
    mov al, ah
    mov ah, 0
    mov cx, 2
    mul cx
    sub ax, 11
    jmp done_column

odd_row:
    mov ax, N
    mov cl, 10
    mov dx, 0
    div cl
    mov al, ah
    mov ah, 0
    mov cx, 2
    mul cx
    jmp done_column

last_column:
    mov ax, 9

    jmp done_column

errorgetcolumn:

        lea dx, newline
        call puts

        lea dx, error1
        call puts
        mov ax, 0

done_column:
    mov ah, 0
    mov get_Column, ax
    pop bp
    ret

getColumn endp

getSquareNumber proc
        push bp
        mov bp, sp

        mov ax, i
        mov bx, j

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
        je caseblanche

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

        lea dx, newline
        call puts

        lea dx, error2
        call puts
        mov ax, 0

    jmp donegetSquareNumber

    caseblanche:

        mov ax, 0

    donegetSquareNumber:
        mov ah, 0
        mov get_SquareNumber, ax
        pop bp
        ret

    getSquareNumber endp

getSquareColor proc
    push bp
    mov bp, sp

    mov ax, i
    mov bx, j

    cmp al, 1
    jl errorgetSquareColor
    cmp al, 10
    jg errorgetSquareColor
    cmp bl, 1
    jl errorgetSquareColor
    cmp bl, 10
    jg errorgetSquareColor


    mov ax, i
    mov bx, j

    call getSquareNumber
    mov ax, get_SquareNumber
    cmp ax, 0
    je white_square


    mov ax, BLACK
    jmp done_color

    white_square:

        mov ax, WHITE

        jmp done_color

    errorgetSquareColor:

        lea dx, newline
        call puts

        lea dx, error2
        call puts

    done_color:
        mov get_SquareColor, ax
        pop bp
        ret

getSquareColor endp

displaySquareState proc
    push bp
    mov bp, sp

    mov ax, i
    mov bx, j
    call getSquareNumber
    mov ax, get_SquareNumber
    mov si, ax


    mov dl, board[si]
    cmp dl, 0
    je case_vide
    cmp dl, 1
    je pion_blanc
    cmp dl, 2
    je pion_noir
    cmp dl, 3
    je dame_blanche
    cmp dl, 4
    je dame_noire


    case_vide:

        mov ax, EMPTY
        jmp done_state

    pion_blanc:

        mov ax, WHITE_PAWN
        jmp done_state

    pion_noir:

        mov ax, BLACK_PAWN
        jmp done_state

    dame_blanche:

        mov ax, WHITE_QUEEN
        jmp done_state

    dame_noire:

        mov ax, BLACK_QUEEN

    done_state:
        mov display_SquareState, ax
        pop bp
        ret

displaySquareState endp

InitialiserDamier proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, offset board


loop_init:
    cmp cx, 20
    jle init_black
    cmp cx, 30
    jg init_white
    mov [bx], EMPTY
    jmp next_index

init_black:
    mov [bx], BLACK_PAWN
    jmp next_index

init_white:
    mov [bx], WHITE_PAWN

next_index:
    inc bx
    inc cx
    cmp cx, 50
    jle loop_init

    pop dx
    pop cx
    pop bx
    pop ax
    ret

InitialiserDamier endp

AfficherDamier proc

ret
AfficherDamier endp

print_char proc
    push ax
    push dx

    mov ah, 2
    mov dl, al
    int 21h

    pop dx
    pop ax
    ret
print_char endp

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

