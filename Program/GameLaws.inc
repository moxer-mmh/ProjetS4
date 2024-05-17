include "NeededProc.inc"

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
                                       mov    ax, ent_verifqueens_i
                                       mov    ent_squarenumberi, ax
                                       mov    ax, ent_verifqueens_j
                                       mov    ent_squarenumberj, ax
                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    si,p
                                       cmp    ax, ent_verifqueens_testtable[si]
                                       pop    si
            
                                       jne    skipverifqueens
            
                                       push   si
                                       mov    ax, ent_verifqueens_x
                                       mov    ent_squarenumberi, ax
                                       mov    ax, ent_verifqueens_y
                                       mov    ent_squarenumberj, ax
                                       call   getSquareNumber
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
                                       mov    N, bx

                                       call   getRow

                                       mov    ax, sort_getRow
                                       mov    i,ax

                                       call   getColumn

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
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i

                                       dec    cx
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i

                                       sub    cx, 2
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_left_capture

  

    ; Capture possible en haut à gauche
                                       mov    si, q

                                       mov    dx, j
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       sub    dx, 2
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i

                                       sub    cx, 2
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       dec    cx
                                       mov    ent_squarenumberi,cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj,dx
                                       mov    cx, i

                                       sub    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_right_capture

  

    ; Capture possible en haut à droite

                                       mov    si, q
                                       mov    dx, j
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       add    dx, 2
                                       mov    ent_squarenumberj,dx
                                       mov    cx, i

                                       sub    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       inc    cx
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       add    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_left_capture

  

    ; Capture possible en bas à gauche
                                       mov    si, q

                                       mov    dx, j
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       sub    dx, 2
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       add    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       inc    cx
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       add    cx, 2
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_right_capture

  

    ; Capture possible en bas à droite
                                       mov    si, q
                                       mov    dx, j
                                       mov    ent_squarenumberj, dx

                                       mov    cx, i
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, j

                                       add    dx, 2
                                       mov    ent_squarenumberj, dx
                                       mov    cx, i

                                       add    cx, 2
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber

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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_left_loop

  

    ; Capture possible en haut à gauche

                                       mov    si , qatole
                                       mov    dx,i
                                       mov    bx,j
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_right_loop

  

    ; Capture possible en haut à droite
                                       mov    si , qatori
                                       mov    dx,i
                                       mov    bx,j
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_left_loop

  

    ; Capture possible en bas à gauche
                                       mov    si , qabole
                                       mov    dx,i
                                       mov    bx,j
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_right_loop

  

    ; Capture possible en bas à droite
                                       mov    si , qabori
                                       mov    dx,i
                                       mov    bx,j
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

                                       mov    ax, ent_Mustcaptureaftercapturei
                                       mov    ent_squarenumberi,ax

                                       mov    ax,ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberj,ax

                                       call   getSquareNumber

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
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       dec    cx
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_left_capture1

  

    ; Capture possible en haut à gauche
                                       mov    si, q

                                       mov    dx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       dec    cx
                                       mov    ent_squarenumberi,cx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj,dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_top_right_capture1

  

    ; Capture possible en haut à droite

                                       mov    si, q
                                       mov    dx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2
                                       mov    ent_squarenumberj,dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       sub    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       inc    cx
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_left_capture1

  

    ; Capture possible en bas à gauche
                                       mov    si, q

                                       mov    dx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       sub    dx, 2
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       mov    ent_squarenumberi,cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       inc    cx
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    skip_bottom_right_capture1

  

    ; Capture possible en bas à droite
                                       mov    si, q
                                       mov    dx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberj, dx

                                       mov    cx, ent_Mustcaptureaftercapturei
                                       mov    ent_squarenumberi, cx

                                       call   getSquareNumber
                                       mov    ax,sort_getSquareNumber
                                       mov    coor[si], ax
                                       inc    si
                                       mov    dx, ent_Mustcaptureaftercapturej

                                       add    dx, 2
                                       mov    ent_squarenumberj, dx
                                       mov    cx, ent_Mustcaptureaftercapturei

                                       add    cx, 2
                                       mov    ent_squarenumberi, cx
                                       call   getSquareNumber

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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
                                       mov    bx , sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_left_loop1

  

    ; Capture possible en haut à gauche

                                       mov    si , qatole
                                       mov    dx, ent_Mustcaptureaftercapturei
                                       mov    bx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_top_right_loop1

  

    ; Capture possible en haut à droite
                                       mov    si , qatori
                                       mov    dx, ent_Mustcaptureaftercapturei
                                       mov    bx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

  
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_left_loop1

  

    ; Capture possible en bas à gauche
                                       mov    si , qabole
                                       mov    dx, ent_Mustcaptureaftercapturei
                                       mov    bx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
                                       mov    bx,sort_getSquareNumber
                                       dec    bx
                                       cmp    board[bx], EMPTY

                                       jne    exit_bottom_right_loop1

  

    ; Capture possible en bas à droite
                                       mov    si , qabori
                                       mov    dx, ent_Mustcaptureaftercapturei
                                       mov    bx, ent_Mustcaptureaftercapturej
                                       mov    ent_squarenumberi,dx
                                       mov    ent_squarenumberj,bx
                                       call   getSquareNumber
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

                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx

                                       call   getSquareNumber
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
                                       mov    ent_squarenumberi, dx
                                       mov    ent_squarenumberj, bx
                                       call   getSquareNumber
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




