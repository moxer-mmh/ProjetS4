
getRow proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, N
                                       cmp    al, 1
                                       jl     errorgetRow
                                       cmp    al, 50
                                       jg     errorgetRow

                                       sub    al, 1
                                       mov    ah, 0
                                       mov    bl, 5
                                       div    bl
                                       add    al, 1

                                       jmp    donegetRow

    errorgetRow:                       

    ;new line
                                       lea    dx, newline
                                       call   puts

                                       lea    dx, error1
                                       call   puts
                                       mov    ax, 0

    donegetRow:                        
                                       mov    ah, 0
                                       mov    sort_getRow, ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

getRow endp

getColumn proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, N
                                       cmp    al, 1
                                       jl     errorgetcolumn
                                       cmp    al, 50
                                       jg     errorgetcolumn

    ; Call getRow function to check if row is even or odd
                                       push   ax                                    ; Save N on the stack
                                       call   getRow                                ; AX now contains row value
                                       pop    bx                                    ; Restore N in BX register

    ; Check if row is even or odd
                                       test   al, 1                                 ; Check if least significant bit is set
                                       jnz    odd_row                               ; Jump to odd_row if odd

    ; Even row
                                       mov    ax, N                                 ; Move N back to AX register
                                       mov    cl, 10                                ; Set CL to 10 for division
                                       mov    dx, 0
                                       div    cl                                    ; Divide AX by 10 (quotient in AX, remainder in DL)
                                       cmp    ah, 0                                 ; Check if remainder is 0
                                       je     last_column                           ; Jump to last_column if remainder is 0

    ; Calculate column value for even row
                                       mov    ax, N
                                       mov    cl, 10
                                       mov    dx, 0
                                       div    cl
                                       mov    al, ah
                                       mov    ah, 0
                                       mov    cx, 2
                                       mul    cx
                                       sub    ax, 11
                                       jmp    done_column                           ; Jump to done_column

    odd_row:                           
    ; Odd row
                                       mov    ax, N
                                       mov    cl, 10
                                       mov    dx, 0
                                       div    cl
                                       mov    al, ah
                                       mov    ah, 0
                                       mov    cx, 2
                                       mul    cx
                                       jmp    done_column                           ; Jump to done_column

    last_column:                       
                                       mov    ax, 9                                 ; Set column value to 9 for last column

                                       jmp    done_column

    errorgetcolumn:                    

                                       lea    dx, newline
                                       call   puts

                                       lea    dx, error1
                                       call   puts
                                       mov    ax, 0

    done_column:                       
                                       mov    ah, 0
                                       mov    sort_getColumn, ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

getColumn endp

getSquareNumber proc

                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, ent_squarenumberi
                                       mov    bx, ent_squarenumberj

                                       cmp    al, 1
                                       jl     errorgetSquareNumber
                                       cmp    al, 10
                                       jg     errorgetSquareNumber

                                       cmp    bl, 1
                                       jl     errorgetSquareNumber
                                       cmp    bl, 10
                                       jg     errorgetSquareNumber

                                       add    al, bl
                                       mov    ah, 0
                                       mov    bl, 2
                                       div    bl

                                       cmp    ah, 0
                                       je     msgcaseblanche

                                       mov    dx, ent_squarenumberi
                                       sub    dl, 1
                                       mov    al, dl
                                       mov    bl, 5
                                       mul    bl

                                       mov    dx, ent_squarenumberj
                                       add    dl, 1
                                       mov    cx, ax
                                       mov    ax, dx
                                       mov    ah, 0
                                       mov    bl, 2
                                       div    bl
                                       add    ax, cx

                                       jmp    donegetSquareNumber

    errorgetSquareNumber:              

                                       lea    dx, newline
                                       call   puts

                                       lea    dx, error2
                                       call   puts
                                       mov    ax, 0

                                       jmp    donegetSquareNumber

    msgcaseblanche:                    

                                       mov    ax, 0

    donegetSquareNumber:               
                                       mov    ah, 0
                                       mov    sort_getSquareNumber, ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

getSquareNumber endp

getSquareColor proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, ent_squarecolori
                                       mov    bx, ent_squarecolorj

                                       mov    ent_squarenumberi, ax
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
                                       mov    ax, sort_getSquareNumber
                                       cmp    ax, 0
                                       je     white_square

                                       mov    ax, BLACK
                                       jmp    done_color

    white_square:                      
                                       mov    ax, ent_squarecolori
                                       mov    bx, ent_squarecolorj

                                       cmp    al, 1
                                       jl     done_color
                                       cmp    al, 10
                                       jg     done_color

                                       cmp    bl, 1
                                       jl     done_color
                                       cmp    bl, 10
                                       jg     done_color

                                       mov    ax, WHITE

    done_color:                        
                                       mov    sort_getSquareColor, ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

getSquareColor endp

getSquareState proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, ent_squarestatei
                                       mov    bx, ent_squarestatej

                                       mov    ent_squarenumberi, ax
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
                                       mov    ax, sort_getSquareNumber
                                       mov    si, ax


                                       mov    dl, board[si-1]
                                       cmp    dl, 0
                                       je     case_vide
                                       cmp    dl, 1
                                       je     pion_blanc
                                       cmp    dl, 2
                                       je     pion_noir
                                       cmp    dl, 3
                                       je     dame_blanche
                                       cmp    dl, 4
                                       je     dame_noire


    case_vide:                         
                                       mov    ax, 0
                                       jmp    done_state

    pion_blanc:                        

                                       mov    ax, 1
                                       jmp    done_state

    pion_noir:                         


                                       mov    ax, 2
                                       jmp    done_state

    dame_blanche:                      

                                       mov    ax, 3
                                       jmp    done_state

    dame_noire:                        

                                       mov    ax, 4

    done_state:                        
                                       mov    sort_getSquareState, ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

getSquareState endp
