.model small
.stack 100h

.data
    
    N dw ?
    i dw ?
    j dw ?
    x dw ?
    y dw ?
    board db 50 dup(?)
    get_Row dw ?
    get_Column dw ?
    get_SquareNumber dw ?
    get_SquareColor dw ?
    get_SquareState dw ?
    newline        dw     0Dh,0Ah, '$'
    error1 dw 'Erreur : N doit etre entre 1 et 50.', 0Dh, 0Ah, '$'
    error2 dw 'Erreur : i et j doivent etre entre 1 et 10.', 0Dh, 0Ah, '$'
    cr              equ     0Dh
    lf              equ     0Ah
    error           db      cr, lf, 'the number is out of range!',
    make_minus      db      ?
    ten             dw      10

    vide db '. $'
    pionblanc db 'W $'
    pionnoir db 'B $'
    dameblanche db 'DB $'
    damenoire db 'DN $'

    EMPTY           equ     0
    WHITE_PAWN      equ     1
    BLACK_PAWN      equ     2
    WHITE_QUEEN     equ     3
    BLACK_QUEEN     equ     4

    v db ' $'
    vd db '  $'
    WHITE equ 'W'
    BLACK equ 'B'

.code
main proc
        mov ax, @data
        mov ds, ax

        lea dx, newline
        call puts

        lea dx, newline
        call puts

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

        ;new line
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
        je msgcaseblanche

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

    msgcaseblanche:

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
    call getSquareNumber
    mov ax, get_SquareNumber
    cmp ax, 0
    je white_square

    mov ax, BLACK
    jmp done_color

    white_square:
        mov ax, i
        mov bx, j

        cmp al, 1
        jl done_color
        cmp al, 10
        jg done_color

        cmp bl, 1
        jl done_color
        cmp bl, 10
        jg done_color

        mov ax, WHITE

    done_color:
        mov get_SquareColor, ax
        pop bp
        ret

getSquareColor endp

getSquareState proc
    push bp
    mov bp, sp

    call getSquareNumber
    mov ax, get_SquareNumber
    mov si, ax


    mov dl, board[si-1]
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
        mov ax, 0
        jmp done_state

    pion_blanc:

        mov ax, 1
        jmp done_state

    pion_noir:


        mov ax, 2
        jmp done_state

    dame_blanche:

        mov ax, 3
        jmp done_state

    dame_noire:

        mov ax, 4

    done_state:
        mov get_SquareState, ax
        pop bp
        ret

getSquareState endp

InitialiserDamier proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0       ; Initialize loop counter to 0
    mov bx, offset board ; Get the offset of the board array

loop_init:
    cmp cx, 20      ; Check if index is less than 20
    jl init_black   ; Jump to init_black if index is less than 20
    cmp cx, 30      ; Check if index is greater than 29
    jge init_white  ; Jump to init_white if index is greater than or equal to 30
    mov [bx], 0     ; Set the current board element to EMPTY (0)
    jmp next_index

init_black:
    mov [bx], 2     ; Set the current board element to BLACK_PAWN (2)
    jmp next_index

init_white:
    mov [bx], 1     ; Set the current board element to WHITE_PAWN (1)

next_index:
    inc bx          ; Move to the next element in the board array
    inc cx          ; Increment the loop counter
    cmp cx, 50      ; Check if all 50 elements have been initialized
    jl loop_init    ; Continue the loop if not all elements have been initialized

    pop dx
    pop cx
    pop bx
    pop ax
    ret

InitialiserDamier endp

printSquareState proc
    push bp
    mov bp, sp

    mov ax, i
    mov bx, j
    call getSquareState
    call getSquareColor
    mov ax, get_SquareColor
    cmp ax, WHITE
    je print_white
    mov ax, get_SquareState


    cmp ax, EMPTY
    je EMPTY
    cmp ax, WHITE_PAWN
    je WHITE_PAWN
    cmp ax, BLACK_PAWN
    je BLACK_PAWN
    cmp ax, WHITE_QUEEN
    je WHITE_QUEEN
    cmp ax, BLACK_QUEEN
    je BLACK_QUEEN

    EMPTY:
        lea dx, vide
        call puts
        jmp done_printstate

    WHITE_PAWN:

        lea dx, pionblanc
        call puts
        jmp done_printstate

    BLACK_PAWN:


        lea dx, pionnoir
        call puts
        jmp done_printstate

    WHITE_QUEEN:

        lea dx, dameblanche
        jmp done_printstate

    BLACK_QUEEN:

        lea dx, damenoire
        call puts
        jmp done_printstate

    print_white:

            lea dx, vd
            call puts

    done_printstate:

        pop bp
        ret


printSquareState endp

AfficherDamier proc
    push bp
    mov bp, sp

    mov cx, 1
outer_loop:
    mov dx, 1

inner_loop:

    mov i, cx
    mov j, dx

    call printSquareState

    mov cx, i
    mov dx, j

    inc dx
    cmp dx, 11
    jl inner_loop

    cmp dx, 11
    je print_row

    ret_print_row:

    lea dx, newline
    call puts

    lea dx, newline
    call puts

    mov cx, i
    inc cx
    cmp cx, 10
    jle outer_loop

    mov cx, 1
    print_column:
        mov ax, cx
        call print_decimal
        lea dx, v
        call puts
        inc cx
        cmp cx, 11
        jl print_column


    jmp doneafficher


    print_row:
        mov ax, i
        call print_decimal
    jmp ret_print_row




    doneafficher:

    pop bp
    ret
AfficherDamier endp

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