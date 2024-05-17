STACK SEGMENT PARA STACK
          DB 64 DUP(?)
STACK ENDS

include "C:\EMU8086\inc\emu8086.inc"
DATA SEGMENT PARA 'DATA'
    N                            dw  ?
    i                            dw  ?
    j                            dw  ?
    x                            dw  ?
    y                            dw  ?
    board                        db  50 dup(?)
    axx                          dw  ?
    bxx                          dw  ?
    cxx                          dw  ?
    dxx                          dw  ?

    pointt                       dw  ?

    sort_getRow                  dw  ?
    sort_getColumn               dw  ?
    sort_getSquareNumber         dw  ?
    sort_getSquareColor          dw  ?
    sort_getSquareState          dw  ?
    sort_Mustcapture             dw  ?
    sort_Mustcaptureaftercapture dw  ?
    sort_verifqueens             dw  ?

    ent_squarecolori             dw  ?
    ent_squarecolorj             dw  ?
    ent_squarestatei             dw  ?
    ent_squarestatej             dw  ?
    ent_printi                   dw  ?
    ent_printj                   dw  ?
    ent_Mustcaptureaftercapturei dw  ?
    ent_Mustcaptureaftercapturej dw  ?
    ent_verifqueens_i            dw  ?
    ent_verifqueens_j            dw  ?
    ent_verifqueens_x            dw  ?
    ent_verifqueens_y            dw  ?
    ent_verifqueens_testtable    dw  50 dup(?)

    newline                      dw  0Dh,0Ah, '$'
    error1                       dw  'Erreur : N doit etre entre 1 et 50.', 0Dh, 0Ah, '$'
    error2                       dw  'Erreur : i et j doivent etre entre 1 et 10.', 0Dh, 0Ah, '$'
    cr                           equ 0Dh
    lf                           equ 0Ah
    error                        db  cr, lf, 'the number is out of range!',
    make_minus                   db  ?
    ten                          dw  10

    vide                         db  '. $'
    pionblanc                    db  'W $'
    pionnoir                     db  'B $'
    dameblanche                  db  'DW$'
    damenoire                    db  'DB$'

    EMPTY                        equ 0
    WHITE_PAWN                   equ 1
    BLACK_PAWN                   equ 2
    WHITE_QUEEN                  equ 3
    BLACK_QUEEN                  equ 4

    v                            db  ' $'
    vd                           db  '  $'
    WHITE                        equ 'W'
    BLACK                        equ 'B'
    player                       db  WHITE


    coor                         dw  50 dup(?)
    scoreWhite                   dw  0
    scoreBlack                   dw  0

    capturepossible              dw  0
    jumpsqubole                  dw  0
    jumpsqubori                  dw  0
    jumpsqutole                  dw  0
    jumpsqutori                  dw  0

    queencapturesqtole           dw  50 dup(?)
    queencapturesqtori           dw  50 dup(?)
    queencapturesqubole          dw  50 dup(?)
    queencapturesqubori          dw  50 dup(?)

    movesSinceLastCapture        dw  0
    
    q                            dw  0
    qatole                       dw  ?
    qatori                       dw  ?
    qabole                       dw  ?
    qabori                       dw  ?
    currentPlayer                db  ?
    currentQueen                 db  ?
    opponentPiece                db  ?
    opponentQueen                db  ?

    found                        dw  ?
    k                            dw  ?
    p                            dw  ?
    msg                          db  'Vous devez capturer un pion adverse avec votre dame.', 10, 13, '$'


    yes1                         db  'yes1 $'
    no1                          db  'no1 $'

DATA ENDS

CODE SEGMENT PARA 'CODE'
main proc
                                       ASSUME CS:CODE,DS:DATA,SS:STACK              ;assume as code,data and stack segments the respective registers
                                       PUSH   DS
                                       SUB    AX,AX                                 ;clean the AX register
                                       PUSH   AX
                                       MOV    AX,DATA                               ;save on the AX register the contents of the DATA segment
                                       MOV    DS,AX                                 ;save on the DS segment the contents of AX
                                       POP    AX                                    ;release the top item from the stack to the AX register
                                       POP    AX                                    ;release the top item from the stack to the AX register

                                       lea    dx, newline
                                       call   puts

                                       lea    dx, newline
                                       call   puts

                                       mov    board[27], WHITE_QUEEN
                                       mov    board[22], BLACK_PAWN

                                       mov    ent_Mustcaptureaftercapturei,6
                                       mov    ent_Mustcaptureaftercapturej,5
                                       call   Mustcaptureaftercapture
                                      
                                       mov    ax, capturepossible

                                       cmp    ax, 1

                                       je     yes

                                       lea    dx, no1

                                       call   puts

                                       jmp    exit

    yes:                               

                                       lea    dx, yes1

                                       call   puts










    exit:                              
                                       mov    ah, 4Ch
                                       int    21h

main endp

GET_ROW MACRO N
    LOCAL errorgetRow, donegetRow
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
ENDM

GET_COLUMN MACRO N
    LOCAL errorgetcolumn, done_column, odd_row, last_column
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

    push   ax
    GET_ROW N
    pop    bx

    test   al, 1
    jnz    odd_row

    mov    ax, N
    mov    cl, 10
    mov    dx, 0
    div    cl
    cmp    ah, 0
    je     last_column

    mov    ax, N
    mov    cl, 10
    mov    dx, 0
    div    cl
    mov    al, ah
    mov    ah, 0
    mov    cx, 2
    mul    cx
    sub    ax, 11
    jmp    done_column

odd_row:                           
    mov    ax, N
    mov    cl, 10
    mov    dx, 0
    div    cl
    mov    al, ah
    mov    ah, 0
    mov    cx, 2
    mul    cx
    jmp    done_column

last_column:                       
    mov    ax, 9

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
ENDM

GET_SQUARE_NUMBER MACRO i, j
    LOCAL errorgetSquareNumber, donegetSquareNumber, msgcaseblanche
    push   ax
    push   bx
    push   cx
    push   dx
    push   bp
    mov    bp, sp

    mov    ax, i
    mov    bx, j

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

    mov    dx, i
    sub    dl, 1
    mov    al, dl
    mov    bl, 5
    mul    bl

    mov    dx, j
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
ENDM

GET_SQUARE_COLOR MACRO i, j
    LOCAL white_square, done_color
    push   ax
    push   bx
    push   cx
    push   dx
    push   bp
    mov    bp, sp

    GET_SQUARE_NUMBER i, j
    mov    ax, sort_getSquareNumber
    cmp    ax, 0
    je     white_square

    mov    ax, BLACK
    jmp    done_color

white_square:                      
    mov    ax, i
    mov    bx, j

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
ENDM

GET_SQUARE_STATE MACRO i, j
    LOCAL case_vide, pion_blanc, pion_noir, dame_blanche, dame_noire, done_state
    push   ax
    push   bx
    push   cx
    push   dx
    push   bp
    mov    bp, sp

    ; Call the GET_SQUARE_NUMBER macro
    GET_SQUARE_NUMBER i, j
    mov    ax, sort_getSquareNumber
    mov    si, ax

    ; Check the state of the square on the board
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
ENDM

InitialiserDamier proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    cx, 0                                 ; Initialize loop counter to 0
                                       mov    bx, offset board                      ; Get the offset of the board array

    loop_init:                         
                                       cmp    cx, 20                                ; Check if index is less than 20
                                       jl     init_black                            ; Jump to init_black if index is less than 20
                                       cmp    cx, 30                                ; Check if index is greater than 29
                                       jge    init_white                            ; Jump to init_white if index is greater than or equal to 30
                                       mov    [bx], 0                               ; Set the current board element to EMPTY (0)
                                       jmp    next_index

    init_black:                        
                                       mov    [bx], 2                               ; Set the current board element to BLACK_PAWN (2)
                                       jmp    next_index

    init_white:                        
                                       mov    [bx], 1                               ; Set the current board element to WHITE_PAWN (1)

    next_index:                        
                                       inc    bx                                    ; Move to the next element in the board array
                                       inc    cx                                    ; Increment the loop counter
                                       cmp    cx, 50                                ; Check if all 50 elements have been initialized
                                       jl     loop_init                             ; Continue the loop if not all elements have been initialized
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

InitialiserDamier endp

printSquare proc
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, ent_printi
                                       mov    bx, ent_printj

                                       mov    ent_squarecolori, ax
                                       mov    ent_squarecolorj, bx
                                       mov    ent_squarestatei, ax
                                       mov    ent_squarestatej, bx

                                       GET_SQUARE_STATE ax, bx
                                       GET_SQUARE_COLOR ax, bx
                                       mov    ax, sort_getSquareColor
                                       cmp    ax, WHITE
                                       je     print_white
                                       mov    ax, sort_getSquareState


                                       cmp    ax, EMPTY
                                       je     EMPTY
                                       cmp    ax, WHITE_PAWN
                                       je     WHITE_PAWN
                                       cmp    ax, BLACK_PAWN
                                       je     BLACK_PAWN
                                       cmp    ax, WHITE_QUEEN
                                       je     WHITE_QUEEN
                                       cmp    ax, BLACK_QUEEN
                                       je     BLACK_QUEEN

    EMPTY:                             
                                       lea    dx, vide
                                       call   puts
                                       jmp    done_printstate

    WHITE_PAWN:                        

                                       lea    dx, pionblanc
                                       call   puts
                                       jmp    done_printstate

    BLACK_PAWN:                        


                                       lea    dx, pionnoir
                                       call   puts
                                       jmp    done_printstate

    WHITE_QUEEN:                       

                                       lea    dx, dameblanche
                                       call   puts
                                       jmp    done_printstate

    BLACK_QUEEN:                       

                                       lea    dx, damenoire
                                       call   puts
                                       jmp    done_printstate

    print_white:                       

                                       lea    dx, vd
                                       call   puts

    done_printstate:                   

                                       pop    bp
                                       ret


printSquare endp

AfficherDamier proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp

                                       mov    cx, 1
    outer_loop:                        
                                       mov    dx, 1

    inner_loop:                        

                                       mov    ent_printi, cx
                                       mov    ent_printj, dx

                                       call   printSquare

                                       mov    cx, ent_printi
                                       mov    dx, ent_printj

                                       inc    dx
                                       cmp    dx, 11
                                       jl     inner_loop

                                       cmp    dx, 11
                                       je     print_row

    ret_print_row:                     

                                       lea    dx, newline
                                       call   puts

                                       lea    dx, newline
                                       call   puts

                                       mov    cx, ent_printi
                                       inc    cx
                                       cmp    cx, 10
                                       jle    outer_loop

                                       mov    cx, 1
    print_column:                      
                                       mov    ax, cx
                                       call   print_decimal
                                       lea    dx, v
                                       call   puts
                                       inc    cx
                                       cmp    cx, 11
                                       jl     print_column


                                       jmp    doneafficher


    print_row:                         
                                       mov    ax, ent_printi
                                       call   print_decimal
                                       jmp    ret_print_row




    doneafficher:                      

                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret
AfficherDamier endp

verifqueens proc
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp
                                       mov    found, 0
                                       mov    k, 1
                                       mov    p, 0
    
    loop1verifqueens:                  
                                       mov    cx,k
                                       cmp    cx, 50
                                       jge    loop1_endverifqueens
        
                                       mov    si, 0
    loop2verifqueens:                  
                                       mov    ax, ent_verifqueens_testtable[si]
                                       cmp    ax, -1
                                       je     loop2_endverifqueens
            
                                       push   si
                                       GET_SQUARE_NUMBER ent_verifqueens_i, ent_verifqueens_j
                                       mov    ax,sort_getSquareNumber
                                       mov    si,p
                                       cmp    ax, ent_verifqueens_testtable[si]
                                       pop    si
            
                                       jne    skipverifqueens
            
                                       push   si
                                       GET_SQUARE_NUMBER ent_verifqueens_x, ent_verifqueens_y
                                       mov    ax,sort_getSquareNumber
                                       mov    si,k
                                       cmp    ax, ent_verifqueens_testtable[si]
                                       pop    si
            
                                       jne    skipverifqueens
                                       mov    cx,found
                                       mov    cx, 1
                                       mov    found ,cx
                                       jmp    loop1_endverifqueens
            
    skipverifqueens:                   
                                       inc    si
                                       jmp    loop2verifqueens
    loop2_endverifqueens:              
                                       mov    cx,k
                                       inc    cx
                                       mov    k,cx
                                       push si
                                       mov si,k
                                       cmp    ent_verifqueens_testtable[si], 0
                                       pop si
                                       je     loop1verifqueens
                                       mov    cx,k
                                       mov    dx,p
                                       add    dx,cx
                                       mov    p,dx
                                       inc    cx
                                       mov    k,cx
                                       jmp    loop1verifqueens
    loop1_endverifqueens:              
                                       mov    cx,found
                                       cmp    found, cx
                                       jne    endverifqueens
    
    ; Afficher "Vous devez capturer un pion adverse avec votre dame."
                                       lea    dx, msg
                                       call   puts
                                       mov    sort_verifqueens, 1
                                       jmp    exitverifqueens
    
    endverifqueens:                    
                                       mov    sort_verifqueens, 0
    
    exitverifqueens:                   
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret
verifqueens endp

Mustcapture proc

                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp


    ; Define registers to hold player and variables
                                       mov    AL, player                            ; Assuming player value is in register AL

    ; Check for WHITE player
                                       cmp    AL, WHITE
                                       jne    notWhite                              ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                       mov    currentPlayer, WHITE_PAWN
                                       mov    currentQueen, WHITE_QUEEN
                                       mov    opponentPiece, BLACK_PAWN
                                       mov    opponentQueen, BLACK_QUEEN
                                       jmp    finish                                ; Jump to the end

    notWhite:                          
    ; Assign values for BLACK player
                                       mov    currentPlayer, BLACK_PAWN
                                       mov    currentQueen, BLACK_QUEEN
                                       mov    opponentPiece, WHITE_PAWN
                                       mov    opponentQueen, WHITE_QUEEN

    finish:                            



    ; Initialisation des variables

                                       mov    cx, 0
                                       mov    capturepossible, cx

                                       mov    q, cx

                                       mov    qatole, cx

                                       mov    qatori, cx

                                       mov    qabole, cx

                                       mov    qabori, cx

                                       mov    jumpsqubole, cx

                                       mov    jumpsqubori, cx

                                       mov    jumpsqutole, cx

                                       mov    jumpsqutori, cx

  

    ; Réinitialisation des tableaux

                                       mov    bx, 0

    reset_arrays:                      

                                       mov    queencapturesqtole[bx], 0

                                       mov    queencapturesqtori[bx], 0

                                       mov    queencapturesqubole[bx], 0

                                       mov    queencapturesqubori[bx], 0

                                       mov    coor[bx], 0

                                       inc    bx
                                       cmp    bx,50
                                       jl     reset_arrays
  

    ; Boucle principale


                                       mov    bx, 0

    main_loop:                         
                                       mov    bxx,bx
    ; Récupération de la valeur de la case courante

                                       mov    al, board[bx]

  

    ; Vérification si c'est un pion ou une reine de la couleur du joueur actuel

                                       cmp    al, currentPlayer

                                       je     process_piece

                                       cmp    al, currentQueen

                                       jne    next_iteration

  

    process_piece:                     

    ; Calcul des coordonnées i et j de la case courante
                                       push   bx
                                       inc    bx

                                       GET_ROW bx


                                       GET_COLUMN bx

                                       mov    ax, sort_getRow
                                       mov    i,ax
                                       mov    ax, sort_getColumn
                                       mov    j,ax
                                       pop    bx

  

    ; Vérification des captures possibles selon le type de pièce
                                      
                                       mov    al, currentPlayer
                                       cmp    board[bx], al
                                       je     check_pawn_color

                                       mov    al, currentQueen
                                       cmp    board[bx], al
                                       je     process_queen
                                       jmp    next_iteration

  

    check_pawn_color:                  
                                       cmp    player, WHITE

                                       je     process_white_pawn

                                       jmp    process_black_pawn

  

  

    ;capture des pions blancs

    process_white_pawn:                

    ; Vérification de la capture en haut à gauche

                                       cmp    i, 2                                  ; Vérifier si i > 1

                                       jl     skip_top_left_capture

                                       cmp    j, 2                                  ; Vérifier si j > 1

                                       jl     skip_top_left_capture

  

                                       mov    dx, j

                                       dec    dx

                                       mov    cx, i

                                       dec    cx

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx ,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al, opponentPiece

                                       cmp    board[bx], al
                                       je     check_top_left_empty

                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_top_left_capture

  

    check_top_left_empty:              
                                       mov    dx, j

                                       sub    dx, 2

                                       mov    cx, i

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_left_capture

  

    ; Capture possible en haut à gauche
                                       mov    si, q

                                       mov    dx, j

                                       mov    cx, i

                                        GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       sub    dx, 2

                                       mov    cx, i

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si

                                       mov    q, si

                                       mov    capturepossible,1
  

    skip_top_left_capture:             
                                      
  

    ; Vérification de la capture en haut à droite

                                       cmp    i, 2                                  ; Vérifier si i > 1

                                       jl     skip_top_right_capture

                                       cmp    j, 9                                  ; Vérifier si j < 10

                                       jg     skip_top_right_capture

  

                                       mov    dx, j

                                       inc    dx
                                       mov    cx, i

                                       dec    cx

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                    
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_top_right_empty
                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_top_right_capture

  

    check_top_right_empty:             
                                     
                                       mov    dx, j

                                       add    dx, 2
                                       mov    cx, i

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_right_capture

  

    ; Capture possible en haut à droite

                                       mov    si, q
                                       mov    dx, j

                                       mov    cx, i

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       add    dx, 2

                                       mov    cx, i

                                       sub    cx, 2
                                       
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si
                                       mov    q, si

                                       mov    capturepossible,1
  

    skip_top_right_capture:            
                                      
                                       jmp    next_iteration

  

  

    ;capture pions noirs

    process_black_pawn:                

    ; Vérification de la capture en bas à gauche

                                       cmp    i, 9                                  ; Vérifier si i < 10

                                       jg     skip_bottom_left_capture

                                       cmp    j, 2                                  ; Vérifier si j > 1

                                       jl     skip_bottom_left_capture

  

                                       mov    dx, j

                                       dec    dx

                                       mov    cx, i

                                       inc    cx

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_bottom_left_empty
                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_bottom_left_capture

  

    check_bottom_left_empty:           
                                      
                                       mov    dx, j

                                       sub    dx, 2

                                       mov    cx, i

                                       add    cx, 2
                                       
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_left_capture

  

    ; Capture possible en bas à gauche
                                       mov    si, q

                                       mov    dx, j

                                       mov    cx, i


                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       sub    dx, 2
                                       mov    cx, i

                                       add    cx, 2
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax , sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    q, si

                                      
                                       mov    capturepossible, 1

  

    skip_bottom_left_capture:          

                                  

    ; Vérification de la capture en bas à droite

                                       cmp    i, 9                                  ; Vérifier si i < 10

                                       jg     skip_bottom_right_capture

                                       cmp    j, 9                                  ; Vérifier si j < 10

                                       jg     skip_bottom_right_capture

  

                                       mov    dx, j

                                       inc    dx

                                       mov    cx, i

                                       inc    cx

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                     
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_bottom_right_empty

                                       mov    al, opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_bottom_right_capture


  

    check_bottom_right_empty:          
                                  
                                       mov    dx, j

                                       add    dx, 2

                                       mov    cx, i

                                       add    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_right_capture

  

    ; Capture possible en bas à droite
                                       mov    si, q
                                       mov    dx, j


                                       mov    cx, i


                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       add    dx, 2
                                       mov    cx, i

                                       add    cx, 2
                                       GET_SQUARE_NUMBER cx, dx

                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si
                                       mov    q, si
                                      
                                       mov    capturepossible,1

  

    skip_bottom_right_capture:         
                                       jmp    next_iteration

  

  

    ;capture des reines

    process_queen:                     
                                 
    ; Vérification des captures dans les 4 directions diagonales

                                       jmp    check_top_left_captures
    check_top_left_captures_ret:       
                                       jmp    check_top_right_captures
    check_top_right_captures_ret:      
                                       jmp    check_bottom_left_captures
    check_bottom_left_captures_ret:    
                                       jmp    check_bottom_right_captures
    check_bottom_right_captures_ret:   
                                       jmp    next_iteration

  

    ; Vérification des captures en haut à gauche

    check_top_left_captures:           

                                       mov    cx, 1
                                       mov    cxx, cx


    top_left_loop:                     
                                       mov    pointt,cx
                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx, cx
                                       sub    bx,cx

                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_left_loop

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_top_left_loop


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al , currentQueen
                                       cmp    board[bx], al
                                       je     exit_top_left_loop
                                       mov    al, currentPlayer
                                       cmp    board[bx], al
                                       je     exit_top_left_loop
                                      
                                       cmp    board[bx], EMPTY

                                       je     continue_top_left_loop

  

    ; Une pièce opposée a été trouvée
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_top_left_capture
                                       mov    al,opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_top_left_loop

  

    process_top_left_capture:          
                                       mov    dx, i
                                       mov    bx, j

                                       sub    dx, cx
                                       sub    bx,cx
                                       dec    dx

                                       dec    bx

                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_left_loop

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_top_left_loop

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_left_loop

  

    ; Capture possible en haut à gauche

                                       mov    si , qatole
                                       mov    dx,i
                                       mov    bx,j

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtole[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqutole
                                       inc    si
                                       mov    jumpsqutole,si

  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_top_left_jumps:         

                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx, cxx
                                       sub    bx,cxx

                                       sub    dx,cx
                                       sub    bx,cx

                                       cmp    dx, 0                                 ; Vérifier si dx < 1

                                       jle    end_additional_top_left_jumps

                                       cmp    bx, 0                                 ; Vérifier si bx < 1

                                       jle    end_additional_top_left_jumps

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_top_left_jumps

                                       mov    si,qatole

                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx, cxx
                                       sub    bx,cxx

                                       sub    dx,cx
                                       sub    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtole[si],ax

                                       inc    si

                                       mov    qatole,si

                                       inc    cx

                                       jmp    additional_top_left_jumps

  

    end_additional_top_left_jumps:     
                                       mov    si,qatole
                                       mov    queencapturesqtole[si], -1

                                       inc    si
                                       mov    qatole,si

                                       jmp    exit_top_left_loop

  

    continue_top_left_loop:            
                                       mov    cx , pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     top_left_loop

  

    exit_top_left_loop:                
                                   
                                       jmp    check_top_left_captures_ret

  

    ; Vérification des captures en haut à droite

    check_top_right_captures:          

                                       mov    cx, 1
                                       mov    cxx,cx

    top_right_loop:                    
                                       mov    pointt,cx
                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx,cx

                                       add    bx,cx
                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_right_loop

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_top_right_loop

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                     
                                       mov    al,currentQueen
                                       cmp    board[bx], al

                                       je     exit_top_right_loop
                                       mov    al , currentPlayer
                                       cmp    board[bx], al

                                       je     exit_top_right_loop
                                       cmp    board[bx], EMPTY

                                       je     continue_top_right_loop

  

    ; Une pièce opposée a été trouvée
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_top_right_capture
                                       mov    al, opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_top_right_loop


  

    process_top_right_capture:         
                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx,cx
                                       dec    dx
                                       add    bx,cx
                                       inc    bx
                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_right_loop

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_top_right_loop


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_right_loop

  

    ; Capture possible en haut à droite
                                       mov    si , qatori
                                       mov    dx,i
                                       mov    bx,j

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtori[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqutori
                                       inc    si
                                       mov    jumpsqutori,si

  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_top_right_jumps:        

                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx,cxx

                                       add    bx,cxx

                                       sub    dx,cx
                                       add    bx,cx

                                       cmp    dx, 0                                 ; Vérifier si dx < 1

                                       jle    end_additional_top_right_jumps

                                       cmp    bx, 11                                ; Vérifier si bx > 10

                                       jge    end_additional_top_right_jumps


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_top_right_jumps

  
                                       mov    si,qatori
                                       mov    dx, i

                                       mov    bx, j

                                       sub    dx,cxx

                                       add    bx,cxx

                                       sub    dx,cx
                                       add    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtori[si],ax

                                       inc    si

                                       mov    qatori,si

                                       inc    cx

                                       jmp    additional_top_right_jumps

  

    end_additional_top_right_jumps:    
                                       mov    si,qatori
                                       mov    queencapturesqtori[si], -1

                                       inc    si
                                       mov    qatori,si

                                       jmp    exit_top_right_loop

  

    continue_top_right_loop:           

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     top_left_loop

  

    exit_top_right_loop:               
                                     
                                       jmp    check_top_right_captures_ret

  

    ; Vérification des captures en bas à gauche

    check_bottom_left_captures:        

                                       mov    cx, 1
                                       mov    cxx ,cx


    bottom_left_loop:                  
                                       mov    pointt,cx
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cx

                                       sub    bx,cx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_left_loop

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_bottom_left_loop

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                 
                                       mov    al,currentQueen
                                       cmp    board[bx], al

                                       je     exit_bottom_left_loop
                                       mov    al,currentPlayer
                                       cmp    board[bx], al

                                       je     exit_bottom_left_loop
                                    
                                       cmp    board[bx], EMPTY

                                       je     continue_bottom_left_loop

  

    ; Une pièce opposée a été trouvée
                                   
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_bottom_left_capture
                                       mov    al,, opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_bottom_left_loop
                                     

  

    process_bottom_left_capture:       
                                      
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cx
                                       inc    dx

                                       sub    bx,cx
                                       dec    bx
                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_left_loop

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_bottom_left_loop

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_left_loop

  

    ; Capture possible en bas à gauche
                                       mov    si , qabole
                                       mov    dx,i
                                       mov    bx,j

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubole[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqubole
                                       inc    si
                                       mov    jumpsqubole,si

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_bottom_left_jumps:      

                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cxx

                                       sub    bx,cxx

                                       add    dx,cx
                                       sub    bx,cx

                                       cmp    dx, 11                                ; Vérifier si dx < 1

                                       jge    end_additional_bottom_left_jumps

                                       cmp    bx, 0                                 ; Vérifier si bx > 10

                                       jle    end_additional_bottom_left_jumps


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_bottom_left_jumps

  
                                       mov    si,qabole
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cxx

                                       sub    bx,cxx

                                       add    dx,cx
                                       sub    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubole[si],ax

                                       inc    si

                                       mov    qabole,si

                                       inc    cx

                                       jmp    additional_bottom_left_jumps

  

    end_additional_bottom_left_jumps:  
                                       mov    si,qabole
                                       mov    queencapturesqubole[si], -1

                                       inc    si
                                       mov    qabole,si

                                       jmp    exit_bottom_left_loop

  

    continue_bottom_left_loop:         

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     bottom_left_loop

  

    exit_bottom_left_loop:             
                                     
                                       jmp    check_bottom_left_captures_ret

  



    ; Vérification des captures en bas à droite

    check_bottom_right_captures:       

                                       mov    cx, 1
                                       mov    cxx,cx


    bottom_right_loop:                 
                                       mov    pointt,cx
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cx
                                       add    bx,cx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_right_loop

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_bottom_right_loop



                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                   
                                       mov    al, currentQueen
                                       cmp    board[bx], al

                                       je     exit_bottom_right_loop
                                       mov    al,currentPlayer
                                       cmp    board[bx], al

                                       je     exit_bottom_right_loop
                                      
                                       cmp    board[bx], EMPTY

                                       je     continue_bottom_right_loop

  

    ; Une pièce opposée a été trouvée
                                    
                                       mov    al, opponentQueen
                                       cmp    board[bx], al

                                       je     process_bottom_right_capture
                                       mov    al,opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_bottom_right_loop
                                      

  

    process_bottom_right_capture:      
                                      
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cx
                                       inc    dx
                                       add    bx,cx
                                       inc    bx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_right_loop

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_bottom_right_loop


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_right_loop

  

    ; Capture possible en bas à droite
                                       mov    si , qabori
                                       mov    dx,i
                                       mov    bx,j

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubori[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqubori
                                       inc    si
                                       mov    jumpsqubori,si


  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_bottom_right_jumps:     

                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cxx
                                       add    bx,cxx

                                       add    dx,cx
                                       add    bx,cx

                                       cmp    dx, 11                                ; Vérifier si dx > 10

                                       jge    end_additional_bottom_right_jumps

                                       cmp    bx, 11                                ; Vérifier si bx > 10

                                       jge    end_additional_bottom_right_jumps



                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_bottom_right_jumps

  
                                       mov    si,qabori
                                       mov    dx, i

                                       mov    bx, j

                                       add    dx,cxx
                                       add    bx,cxx
                                       add    dx,cx
                                       add    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubori[si], ax

                                       inc    si

                                       mov    qabori,si

                                       inc    cx

                                       jmp    additional_bottom_right_jumps

  

    end_additional_bottom_right_jumps: 
                                       mov    si,qabori
                                       mov    queencapturesqubori[si], -1

                                       inc    si
                                       mov    qabori,si

                                       jmp    exit_bottom_right_loop

  

    continue_bottom_right_loop:        

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     bottom_right_loop
    

    exit_bottom_right_loop:            
                                       jmp    check_bottom_right_captures_ret

    ;exit

  

    next_iteration:                    
                                       mov    bx,bxx
                                       inc    bx
                                       cmp    bx,50
                                       jl     main_loop

  

    ; Vérification si au moins une capture est possible
                                       mov    ax, capturepossible
                                       cmp    ax, 0

                                       je     return_false
                                       mov    ax, 1

                                       jmp    return

  

    return_false:                      

                                       mov    ax, 0

  

    return:                            
                                       mov    ah,0
                                       mov    sort_Mustcapture,ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

Mustcapture endp

Mustcaptureaftercapture proc

                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx
                                       push   bp
                                       mov    bp, sp


    ; Define registers to hold player and variables
                                       mov    AL, player                            ; Assuming player value is in register AL

    ; Check for WHITE player
                                       cmp    AL, WHITE
                                       jne    notWhite1                             ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                       mov    currentPlayer, WHITE_PAWN
                                       mov    currentQueen, WHITE_QUEEN
                                       mov    opponentPiece, BLACK_PAWN
                                       mov    opponentQueen, BLACK_QUEEN
                                       jmp    finish1                               ; Jump to the end

    notWhite1:                         
    ; Assign values for BLACK player
                                       mov    currentPlayer, BLACK_PAWN
                                       mov    currentQueen, BLACK_QUEEN
                                       mov    opponentPiece, WHITE_PAWN
                                       mov    opponentQueen, WHITE_QUEEN

    finish1:                           



    ; Initialisation des variables

                                       mov    cx, 0
                                       mov    capturepossible, cx

                                       mov    q, cx

                                       mov    qatole, cx

                                       mov    qatori, cx

                                       mov    qabole, cx

                                       mov    qabori, cx

                                       mov    jumpsqubole, cx

                                       mov    jumpsqubori, cx

                                       mov    jumpsqutole, cx

                                       mov    jumpsqutori, cx

  

    ; Réinitialisation des tableaux

                                       mov    bx, 0

    reset_arrays1:                     

                                       mov    queencapturesqtole[bx], 0

                                       mov    queencapturesqtori[bx], 0

                                       mov    queencapturesqubole[bx], 0

                                       mov    queencapturesqubori[bx], 0

                                       mov    coor[bx], 0

                                       inc    bx
                                       cmp    bx,50
                                       jl     reset_arrays1
  



  

    ; Vérification si c'est un pion ou une reine de la couleur du joueur actuel

                                       

  

    process_piece1:                    

    ; Calcul des coordonnées i et j de la case courante


                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei, ent_Mustcaptureaftercapturej

                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       mov    al,currentPlayer
                                       cmp    board[bx], al

                                       je     process_piece1
                                       mov    al,currentQueen
                                       cmp    board[bx], al

                                       jne    exiit_iteration1


  

    ; Vérification des captures possibles selon le type de pièce
                                      
                                       mov    al, currentPlayer
                                       cmp    board[bx], al
                                       je     check_pawn_color1

                                       mov    al, currentQueen
                                       cmp    board[bx], al
                                       je     process_queen1
                                       jmp    exiit_iteration1

  

    check_pawn_color1:                 
                                       cmp    player, WHITE

                                       je     process_white_pawn1

                                       jmp    process_black_pawn1

  

  

    ;capture des pions blancs

    process_white_pawn1:               

    ; Vérification de la capture en haut à gauche

                                       cmp    ent_Mustcaptureaftercapturei, 2       ; Vérifier si i > 1

                                       jl     skip_top_left_capture1

                                       cmp    ent_Mustcaptureaftercapturej, 2       ; Vérifier si j > 1

                                       jl     skip_top_left_capture1

  

                                       mov    dx, ent_Mustcaptureaftercapturej

                                       dec    dx

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       dec    cx


                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx ,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al, opponentPiece

                                       cmp    board[bx], al
                                       je     check_top_left_empty1

                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_top_left_capture1

  

    check_top_left_empty1:             
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_left_capture1

  

    ; Capture possible en haut à gauche
                                       mov    si, q


                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei, ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si

                                       mov    q, si

                                       mov    capturepossible,1
  

    skip_top_left_capture1:            
                                      
  

    ; Vérification de la capture en haut à droite

                                       cmp    ent_Mustcaptureaftercapturei, 2       ; Vérifier si i > 1

                                       jl     skip_top_right_capture1

                                       cmp    ent_Mustcaptureaftercapturej, 9       ; Vérifier si j < 10

                                       jg     skip_top_right_capture1

  

                                       mov    dx, ent_Mustcaptureaftercapturej

                                       inc    dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       dec    cx


                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                    
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_top_right_empty1
                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_top_right_capture1

  

    check_top_right_empty1:            
                                     
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_right_capture1

  

    ; Capture possible en haut à droite

                                       mov    si, q

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si
                                       mov    q, si

                                       mov    capturepossible,1
  

    skip_top_right_capture1:           
                                      
                                       jmp    exiit_iteration1

  

  

    ;capture pions noirs

    process_black_pawn1:               

    ; Vérification de la capture en bas à gauche

                                       cmp    ent_Mustcaptureaftercapturei, 9       ; Vérifier si i < 10

                                       jg     skip_bottom_left_capture1

                                       cmp    ent_Mustcaptureaftercapturej, 2       ; Vérifier si j > 1

                                       jl     skip_bottom_left_capture1

  

                                       mov    dx, ent_Mustcaptureaftercapturej

                                       dec    dx

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       inc    cx
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_bottom_left_empty1
                                       mov    al , opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_bottom_left_capture1

  

    check_bottom_left_empty1:          
                                      
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_left_capture1

  

    ; Capture possible en bas à gauche
                                       mov    si, q


                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       GET_SQUARE_NUMBER cx, dx
                                       mov    ax , sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    q, si

                                      
                                       mov    capturepossible, 1

  

    skip_bottom_left_capture1:         

                                  

    ; Vérification de la capture en bas à droite

                                       cmp    ent_Mustcaptureaftercapturei, 9       ; Vérifier si i < 10

                                       jg     skip_bottom_right_capture1

                                       cmp    ent_Mustcaptureaftercapturej, 9       ; Vérifier si j < 10

                                       jg     skip_bottom_right_capture1

  

                                       mov    dx, ent_Mustcaptureaftercapturej

                                       inc    dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       inc    cx

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                     
                                       mov    al, opponentPiece
                                       cmp    board[bx], al
                                       je     check_bottom_right_empty1

                                       mov    al, opponentQueen
                                       cmp    board[bx], al
                                       jne    skip_bottom_right_capture1


  

    check_bottom_right_empty1:         
                                  
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2

                                       GET_SQUARE_NUMBER cx, dx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_right_capture1

  

    ; Capture possible en bas à droite
                                       mov    si, q

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2

                                       GET_SQUARE_NUMBER cx, dx

                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax

                                       inc    si
                                       mov    q, si
                                      
                                       mov    capturepossible,1

  

    skip_bottom_right_capture1:        
                                       jmp    exiit_iteration1

  

  

    ;capture des reines

    process_queen1:                    
                                 
    ; Vérification des captures dans les 4 directions diagonales

                                       jmp    check_top_left_captures1
    check_top_left_captures1_ret1:     
                                       jmp    check_top_right_captures1
    check_top_right_captures1_ret1:    
                                       jmp    check_bottom_left_captures1
    check_bottom_left_captures1_ret1:  
                                       jmp    check_bottom_right_captures1
    check_bottom_right_captures1_ret1: 
                                       jmp    exiit_iteration1

  

    ; Vérification des captures en haut à gauche

    check_top_left_captures1:          

                                       mov    cx, 1
                                       mov    cxx, cx


    top_left_loop1:                    
                                       mov    pointt,cx
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx, cx
                                       sub    bx,cx

                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_left_loop1

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_top_left_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                      
                                       mov    al , currentQueen
                                       cmp    board[bx], al
                                       je     exit_top_left_loop1
                                       mov    al, currentPlayer
                                       cmp    board[bx], al
                                       je     exit_top_left_loop1
                                      
                                       cmp    board[bx], EMPTY

                                       je     continue_top_left_loop1

  

    ; Une pièce opposée a été trouvée
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_top_left_capture1
                                       mov    al,opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_top_left_loop1

  

    process_top_left_capture1:         
                                       mov    dx, ent_Mustcaptureaftercapturei
                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx, cx
                                       sub    bx,cx
                                       dec    dx

                                       dec    bx

                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_left_loop1

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_top_left_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_left_loop1

  

    ; Capture possible en haut à gauche

                                       mov    si , qatole

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtole[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqutole
                                       inc    si
                                       mov    jumpsqutole,si

  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_top_left_jumps1:        

                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx, cxx
                                       sub    bx,cxx

                                       sub    dx,cx
                                       sub    bx,cx

                                       cmp    dx, 0                                 ; Vérifier si dx < 1

                                       jle    end_additional_top_left_jumps1

                                       cmp    bx, 0                                 ; Vérifier si bx < 1

                                       jle    end_additional_top_left_jumps1

  

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_top_left_jumps1

                                       mov    si,qatole

                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx, cxx
                                       sub    bx,cxx

                                       sub    dx,cx
                                       sub    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtole[si],ax

                                       inc    si

                                       mov    qatole,si

                                       inc    cx

                                       jmp    additional_top_left_jumps1

  

    end_additional_top_left_jumps1:    
                                       mov    si,qatole
                                       mov    queencapturesqtole[si], -1

                                       inc    si
                                       mov    qatole,si

                                       jmp    exit_top_left_loop1

  

    continue_top_left_loop1:           
                                       mov    cx , pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     top_left_loop1

  

    exit_top_left_loop1:               
                                   
                                       jmp    check_top_left_captures1_ret1

  

    ; Vérification des captures en haut à droite

    check_top_right_captures1:         

                                       mov    cx, 1
                                       mov    cxx,cx

    top_right_loop1:                   
                                       mov    pointt,cx
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx,cx

                                       add    bx,cx
                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_right_loop1

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_top_right_loop1

  
                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                     
                                       mov    al,currentQueen
                                       cmp    board[bx], al

                                       je     exit_top_right_loop1
                                       mov    al , currentPlayer
                                       cmp    board[bx], al

                                       je     exit_top_right_loop1
                                       cmp    board[bx], EMPTY

                                       je     continue_top_right_loop1

  

    ; Une pièce opposée a été trouvée
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_top_right_capture1
                                       mov    al, opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_top_right_loop1


  

    process_top_right_capture1:        
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx,cx
                                       dec    dx
                                       add    bx,cx
                                       inc    bx
                                       cmp    dx, 1                                 ; Vérifier si dx < 1

                                       jl     exit_top_right_loop1

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_top_right_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_right_loop1

  

    ; Capture possible en haut à droite
                                       mov    si , qatori

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtori[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqutori
                                       inc    si
                                       mov    jumpsqutori,si

  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_top_right_jumps1:       

                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx,cxx

                                       add    bx,cxx

                                       sub    dx,cx
                                       add    bx,cx

                                       cmp    dx, 0                                 ; Vérifier si dx < 1

                                       jle    end_additional_top_right_jumps1

                                       cmp    bx, 11                                ; Vérifier si bx > 10

                                       jge    end_additional_top_right_jumps1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_top_right_jumps1

  
                                       mov    si,qatori
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       sub    dx,cxx

                                       add    bx,cxx

                                       sub    dx,cx
                                       add    bx,cx
                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqtori[si],ax

                                       inc    si

                                       mov    qatori,si

                                       inc    cx

                                       jmp    additional_top_right_jumps1

  

    end_additional_top_right_jumps1:   
                                       mov    si,qatori
                                       mov    queencapturesqtori[si], -1

                                       inc    si
                                       mov    qatori,si

                                       jmp    exit_top_right_loop1

  

    continue_top_right_loop1:          

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     top_left_loop1

  

    exit_top_right_loop1:              
                                     
                                       jmp    check_top_right_captures1_ret1

  

    ; Vérification des captures en bas à gauche

    check_bottom_left_captures1:       

                                       mov    cx, 1
                                       mov    cxx ,cx


    bottom_left_loop1:                 
                                       mov    pointt,cx
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cx

                                       sub    bx,cx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_left_loop1

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_bottom_left_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                 
                                       mov    al,currentQueen
                                       cmp    board[bx], al

                                       je     exit_bottom_left_loop1
                                       mov    al,currentPlayer
                                       cmp    board[bx], al

                                       je     exit_bottom_left_loop1
                                    
                                       cmp    board[bx], EMPTY

                                       je     continue_bottom_left_loop1

  

    ; Une pièce opposée a été trouvée
                                   
                                       mov    al,opponentQueen
                                       cmp    board[bx], al

                                       je     process_bottom_left_capture1
                                       mov    al,, opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_bottom_left_loop1
                                     

  

    process_bottom_left_capture1:      
                                      
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cx
                                       inc    dx

                                       sub    bx,cx
                                       dec    bx
                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_left_loop1

                                       cmp    bx, 1                                 ; Vérifier si bx < 1

                                       jl     exit_bottom_left_loop1

  
                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_left_loop1

  

    ; Capture possible en bas à gauche
                                       mov    si , qabole

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubole[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqubole
                                       inc    si
                                       mov    jumpsqubole,si

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_bottom_left_jumps1:     

                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cxx

                                       sub    bx,cxx

                                       add    dx,cx
                                       sub    bx,cx

                                       cmp    dx, 11                                ; Vérifier si dx < 1

                                       jge    end_additional_bottom_left_jumps1

                                       cmp    bx, 0                                 ; Vérifier si bx > 10

                                       jle    end_additional_bottom_left_jumps1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_bottom_left_jumps1

  
                                       mov    si,qabole
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cxx

                                       sub    bx,cxx

                                       add    dx,cx
                                       sub    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubole[si],ax

                                       inc    si

                                       mov    qabole,si

                                       inc    cx

                                       jmp    additional_bottom_left_jumps1

  

    end_additional_bottom_left_jumps1: 
                                       mov    si,qabole
                                       mov    queencapturesqubole[si], -1

                                       inc    si
                                       mov    qabole,si

                                       jmp    exit_bottom_left_loop1

  

    continue_bottom_left_loop1:        

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     bottom_left_loop1

  

    exit_bottom_left_loop1:            
                                     
                                       jmp    check_bottom_left_captures1_ret1

  



    ; Vérification des captures en bas à droite

    check_bottom_right_captures1:      

                                       mov    cx, 1
                                       mov    cxx,cx


    bottom_right_loop1:                
                                       mov    pointt,cx
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cx
                                       add    bx,cx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_right_loop1

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_bottom_right_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                   
                                       mov    al, currentQueen
                                       cmp    board[bx], al

                                       je     exit_bottom_right_loop1
                                       mov    al,currentPlayer
                                       cmp    board[bx], al

                                       je     exit_bottom_right_loop1
                                      
                                       cmp    board[bx], EMPTY

                                       je     continue_bottom_right_loop1

  

    ; Une pièce opposée a été trouvée
                                    
                                       mov    al, opponentQueen
                                       cmp    board[bx], al

                                       je     process_bottom_right_capture1
                                       mov    al,opponentPiece
                                       cmp    board[bx], al

                                       jne    exit_bottom_right_loop1
                                      

  

    process_bottom_right_capture1:     
                                      
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cx
                                       inc    dx
                                       add    bx,cx
                                       inc    bx

                                       cmp    dx, 10                                ; Vérifier si dx > 10

                                       jg     exit_bottom_right_loop1

                                       cmp    bx, 10                                ; Vérifier si bx > 10

                                       jg     exit_bottom_right_loop1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_right_loop1

  

    ; Capture possible en bas à droite
                                       mov    si , qabori

                                       GET_SQUARE_NUMBER ent_Mustcaptureaftercapturei,ent_Mustcaptureaftercapturej
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubori[si],ax
                                       inc    si
                                       mov    capturepossible,1
                                       mov    si,jumpsqubori
                                       inc    si
                                       mov    jumpsqubori,si


  

    ; Vérifier les sauts supplémentaires

                                       mov    cx, 1

    additional_bottom_right_jumps1:    

                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cxx
                                       add    bx,cxx

                                       add    dx,cx
                                       add    bx,cx

                                       cmp    dx, 11                                ; Vérifier si dx > 10

                                       jge    end_additional_bottom_right_jumps1

                                       cmp    bx, 11                                ; Vérifier si bx > 10

                                       jge    end_additional_bottom_right_jumps1


                                       GET_SQUARE_NUMBER dx, bx
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    end_additional_bottom_right_jumps1

  
                                       mov    si,qabori
                                       mov    dx, ent_Mustcaptureaftercapturei

                                       mov    bx, ent_Mustcaptureaftercapturej

                                       add    dx,cxx
                                       add    bx,cxx
                                       add    dx,cx
                                       add    bx,cx

                                       GET_SQUARE_NUMBER dx, bx
                                       mov    ax,sort_getSquareNumber
                                       mov    queencapturesqubori[si], ax

                                       inc    si

                                       mov    qabori,si

                                       inc    cx

                                       jmp    additional_bottom_right_jumps1

  

    end_additional_bottom_right_jumps1:
                                       mov    si,qabori
                                       mov    queencapturesqubori[si], -1

                                       inc    si
                                       mov    qabori,si

                                       jmp    exit_bottom_right_loop1

  

    continue_bottom_right_loop1:       

                                       mov    cx,pointt
                                       inc    cx
                                       cmp    cx,10
                                       jl     bottom_right_loop1
    

    exit_bottom_right_loop1:           
                                       jmp    check_bottom_right_captures1_ret1

    ;exit

  

    exiit_iteration1:                  

  

    ; Vérification si au moins une capture est possible
                                       mov    ax, capturepossible
                                       cmp    ax, 0

                                       je     return1_false1
                                       mov    ax, 1

                                       jmp    return1

  

    return1_false1:                    

                                       mov    ax, 0

  

    return1:                           
                                       mov    ah,0
                                       mov    sort_Mustcaptureaftercapture,ax
                                       pop    bp
                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret

Mustcaptureaftercapture endp




puts proc    near
                                       push   ax
                                       mov    ah, 09h
                                       int    21h
                                       pop    ax
                                       ret
puts endp

read_char proc    near
                                       push   ax
                                       mov    ah, 01h
                                       int    21h
                                       pop    ax
                                       ret
read_char endp

scan_num proc    near
                                       push   ax
                                       push   bx
                                       push   cx
                                       push   dx

                                       xor    cx, cx

    ; reset flag:
                                       mov    make_minus, 0

    next_digit:                        

                                       call   read_char

    ; check for minus:
                                       cmp    al, '-'
                                       je     set_minus

    ; check for enter key:
                                       cmp    al, cr
                                       je     stop_input

    ; multiply cx by 10 (first time the result is zero)
                                       push   ax
                                       mov    ax, cx
                                       mul    ten                                   ; dx:ax = ax*10
                                       mov    cx, ax
                                       pop    ax

    ; check if the number is too big
    ; (result should be 16 bits)
                                       cmp    dx, 0
                                       jne    out_of_range

    ; convert from ascii code:
                                       sub    al, 30h

    ; add al to cx:
                                       xor    ah, ah
                                       add    cx, ax
                                       jc     out_of_range                          ; jump if the number is too big.

                                       jmp    next_digit

    set_minus:                         
                                       mov    make_minus, 1
                                       jmp    next_digit

    out_of_range:                      
                                       lea    dx, error
                                       call   puts

    stop_input:                        
    ; check flag:
                                       cmp    make_minus, 0
                                       je     not_minus
                                       neg    cx
    not_minus:                         

                                       pop    dx
                                       pop    cx
                                       pop    bx
                                       pop    ax
                                       ret
scan_num endp

print_decimal proc
                                       push   ax                                    ; Sauvegarder la valeur initiale de AX
                                       push   bx                                    ; Sauvegarder la valeur de BX
                                       push   cx                                    ; Sauvegarder la valeur de CX
                                       push   dx                                    ; Sauvegarder la valeur de DX

                                       xor    cx, cx                                ; Initialiser CX à 0 (utilisé comme compteur)
                                       mov    bx, 10                                ; Diviseur pour la conversion en décimal

    convertloop:                       
                                       xor    dx, dx                                ; Initialiser DX à 0
                                       div    bx                                    ; Diviser AX par 10 (quotient dans AX, reste dans DX)
                                       push   dx                                    ; Empiler le reste (chiffre)
                                       inc    cx                                    ; Incrémenter le compteur
                                       cmp    ax, 0                                 ; Vérifier si le quotient est nul
                                       jnz    convertloop                           ; Continuer la boucle si le quotient n'est pas nul

    print_digits:                      
                                       pop    dx                                    ; Dépiler un chiffre
                                       add    dl, '0'                               ; Convertir le chiffre en caractère ASCII
                                       mov    ah, 2                                 ; Fonction d'affichage d'un caractère
                                       int    21h                                   ; Afficher le caractère
                                       loop   print_digits                          ; Répéter jusqu'à ce que tous les chiffres soient affichés

                                       pop    dx                                    ; Restaurer la valeur de DX
                                       pop    cx                                    ; Restaurer la valeur de CX
                                       pop    bx                                    ; Restaurer la valeur de BX
                                       pop    ax                                    ; Restaurer la valeur initiale de AX
                                       ret
print_decimal endp



CODE ENDS
END


generateAIMove PROC

    ; Check if a capture must be made
    call mustcapture
    cmp ax, 1
    jne no_capture_required

    ; Must capture
    ; Fetch coordinates for the capture move
    mov si, 0
    mov N,coor[si]
    call getRow
    push ax        ; Save i
    call getColumn
    push ax        ; Save j
    inc si
    mov N,coor[si]
    call getRow
    push ax        ; Save x
    call getColumn
    push ax        ; Save y

    ; Move piece
    pop dx         ; y
    pop cx         ; x
    pop bx         ; j
    pop ax         ; i
    call deplacer
    jmp end_generateAIMove

no_capture_required:

    ; Initialize validMove to 0
    mov validMove, 0

    ; Outer loop
outer_loop:
    cmp validMove, 1
    je valid_move_found

    ; Iterate over the board
    mov cx, 0      ; k = 0
iterate_board:
    cmp cx, 50
    jge outer_loop_end

    ; Check if the piece is a BLACK_PAWN or BLACK_QUEEN
    mov bx, board[cx]
    cmp bx, BLACK_PAWN
    je check_black_pawn
    cmp bx, BLACK_QUEEN
    je check_black_queen

    jmp next_iteration

check_black_queen:
    ; Handle BLACK_QUEEN moves
    call getRow
    push ax        ; Save i
    call getColumn
    push ax        ; Save j

    ; Diagonal moves for the BLACK_QUEEN
    ; (i + m, j + m)
    mov bx, 1
check_queen_move1:
    cmp bx, 10
    jge break_move1
    ; Check if (i + bx > 10 || j + bx > 10)
    add ax, bx
    cmp ax, 10
    ja break_move1
    add ax, bx
    cmp ax, 10
    ja break_move1
    ; Check if square is EMPTY
    call getSquareNumber
    mov di,




generateAIMove endp
