STACK SEGMENT PARA 'STACK'
          DB 64 DUP(?)
STACK ENDS

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
    sort_verif                   dw  ?
    sort_deplacer                dw  ?

    ent_squarenumberi            dw  ?
    ent_squarenumberj            dw  ?
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
    ent_deplaceri                dw  ?
    ent_deplacerj                dw  ?
    ent_deplacerx                dw  ?
    ent_deplacery                dw  ?
    ent_verifi                   dw  ?
    ent_verifj                   dw  ?
    ent_verifx                   dw  ?
    ent_verify                   dw  ?

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
    validMove                    dw  0
    
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


    menu_msg                     db  'Menu :'', 10, 13
                                 db  '1. Deplacer un pion', 10, 13
                                 db  '2. Afficher ', 10, 13
                                 db  '3. Afficher score', 10, 13
                                 db  '0. Quitter', 10, 13
                                 db  'Votre choix : $''
    
    pion_msg                     db  'Entrez les coordonnees du pion a deplacer (i, j) : $'
    arrivee_msg                  db  'Entrez les coordonnees de la case darrivee (x, y) : $'
    choix_msg                    db  'Choix invalide.', 10, 13, '$'
    
    score_msg                    db  'Black Score : %d             White Score : %d', 10, 13, '$'
    
    quit_msg                     db  'le joueur %c a quitter la game. Player %c wins!', 10, 13, '$'
    
    white_win                    db  'le joueur W a atteint 20! Le joueur W gagne le jeu!', 10, 13, '$'
    black_win                    db  'le joueur B a atteint 20! Le joueur B gagne le jeu!', 10, 13, '$'
    
    no_pieces                    db  'le joueur %c na plus de pions ou de dame! Le joueur %c gagne le jeu!', 10, 13, '$'
    
    draw_msg                     db  'le jeu est bloque, il ny a pas de gagnant.', 10, 13, '$'
    
    choix                        dw  ?
    imain                        dw  ?
    jmain                        dw  ?
    xmain                        dw  ?
    ymain                        dw  ?
    
    whitepieces                  dw  0
    blackpieces                  dw  0
    numWhitePawns                dw  0
    numBlackPawns                dw  0
    
    whiteHasOnlyQueens           db  1
    blackHasOnlyQueens           db  1

DATA ENDS

CODE SEGMENT PARA 'CODE'
main proc
                                       mov           ax, DATA                                                ; Charger la valeur de DATA dans AX
                                       mov           ds, ax                                                  ; Déplacer AX dans DS pour accéder aux données
    
    ; Appeler InitialiserDamier et AfficherDamier
                                       call          InitialiserDamier
                                       call          AfficherDamier
    
    game_loop:                         
    ; Imprimer un séparateur
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, newline                                             ; Charger l'adresse de newline dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
    ; Imprimer le tour du joueur
                                       cmp           player, WHITE                                           ; Comparer player avec la valeur de WHITE
                                       je            print_white_turn                                        ; Sauter à print_white_turn si player == WHITE
                                       mov           dl, 'B'                                                 ; Sinon, charger 'B' dans DL
                                       jmp           print_turn
    print_white_turn:                  
                                       mov           dl, 'W'                                                 ; Charger 'W' dans DL
    print_turn:                        
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, turn_msg                                            ; Charger l'adresse de turn_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
                                       int           21h                                                     ; Appeler à nouveau pour afficher un caractère de nouvelle ligne
    
    ; Imprimer le menu
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, menu_msg                                            ; Charger l'adresse de menu_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
    ; Lire le choix de l'utilisateur
                                       mov           ah, 01h                                                 ; Fonction 01h : Lire un caractère de l'entrée
                                       int           21h                                                     ; Appeler l'interruption 21h pour lire le caractère
                                       sub           al, '0'                                                 ; Convertir le caractère lu en valeur numérique
                                       mov           choix, ax                                               ; Stocker la valeur numérique dans choix
    
    ; Gérer le choix de l'utilisateur
                                       cmp           choix, 1                                                ; Comparer choix avec 1
                                       je            move_pion                                               ; Sauter à move_pion si choix == 1
                                       cmp           choix, 2                                                ; Comparer choix avec 2
                                       je            afficher_damier                                         ; Sauter à afficher_damier si choix == 2
                                       cmp           choix, 3                                                ; Comparer choix avec 3
                                       je            afficher_score                                          ; Sauter à afficher_score si choix == 3
                                       cmp           choix, 0                                                ; Comparer choix avec 0
                                       je            quit_game                                               ; Sauter à quit_game si choix == 0
    
    ; Choix invalide
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, choix_msg                                           ; Charger l'adresse de choix_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
                                       jmp           game_loop                                               ; Retourner à game_loop
    
    move_pion:                         
    ; Lire les coordonnées du pion
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, pion_msg                                            ; Charger l'adresse de pion_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
                                       call          read_int                                                ; Appeler la procédure read_int pour lire un entier
                                       mov           imain, ax                                               ; Stocker la valeur lue dans imain
    
                                       call          read_int                                                ; Appeler à nouveau read_int pour lire un autre entier
                                       mov           jmain, ax                                               ; Stocker la valeur lue dans jmain
    
    ; Lire les coordonnées d'arrivée
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, arrivee_msg                                         ; Charger l'adresse de arrivee_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
                                       call          read_int                                                ; Appeler read_int pour lire un entier
                                       mov           xmain, ax                                               ; Stocker la valeur lue dans xmain
    
                                       call          read_int                                                ; Appeler à nouveau read_int pour lire un autre entier
                                       mov           ymain, ax                                               ; Stocker la valeur lue dans ymain
    
    ; Appeler deplacer
                                       push          xmain                                                   ; Empiler xmain sur la pile
                                       push          ymain                                                   ; Empiler ymain sur la pile
                                       push          jmain                                                   ; Empiler jmain sur la pile
                                       push          imain                                                   ; Empiler imain sur la pile
                                       call          deplacer                                                ; Appeler la procédure deplacer
    
    ; Vérifier la valeur de retour et afficher le damier
                                       cmp           ax, 1                                                   ; Comparer la valeur de retour avec 1
                                       jne           game_loop                                               ; Retourner à game_loop si la valeur n'est pas égale à 1
                                       call          AfficherDamier                                          ; Sinon, appeler AfficherDamier
                                       jmp           game_loop                                               ; Retourner à game_loop
    
    afficher_damier:                   
                                       call          AfficherDamier                                          ; Appeler la procédure AfficherDamier
                                       jmp           game_loop                                               ; Retourner à game_loop
    
    afficher_score:                    
    ; Imprimer le message de score
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, score_msg                                           ; Charger l'adresse de score_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
                                       mov           ax, scoreBlack                                          ; Charger la valeur de scoreBlack dans AX
                                       push          ax                                                      ; Empiler AX sur la pile
                                       mov           ax, scoreWhite                                          ; Charger la valeur de scoreWhite dans AX
                                       push          ax                                                      ; Empiler AX sur la pile
    
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, score_msg                                           ; Charger à nouveau l'adresse de score_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne
    
                                       jmp           game_loop                                               ; Retourner à game_loop
    
    quit_game:                         
    ; Imprimer le message de départ
                                       cmp           player, WHITE                                           ; Comparer player avec la valeur de WHITE
                                       je            print_black_quit                                        ; Sauter à print_black_quit si player == WHITE
                                       mov           dl, 'W'                                                 ; Sinon, charger 'W' dans DL
                                       mov           dh, 'B'                                                 ; Charger 'B' dans DH
                                       jmp           print_quit
    print_black_quit:                  
                                       mov           dl, 'B'                                                 ; Charger 'B' dans DL
                                       mov           dh, 'W'                                                 ; Charger 'W' dans DH
    print_quit:                        
                                       mov           ah, 09h                                                 ; Fonction 09h : Afficher une chaîne
                                       lea           dx, quit_msg                                            ; Charger l'adresse de quit_msg dans DX
                                       int           21h                                                     ; Appeler l'interruption 21h pour afficher la chaîne

    ; Vérifier le gagnant
    ; ... (code pour vérifier le gagnant)

                                       jmp           exit                                                    ; Sauter à exit

    exit:                              
                                       mov           ah, 4Ch                                                 ; Fonction 4Ch : Quitter le programme
                                       int           21h                                                     ; Appeler l'interruption 21h pour quitter

main endp

getRow proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp

    ; Initialiser le pointeur de base
                                       mov           bp, sp

    ; Déplacer la valeur de N dans ax
                                       mov           ax, N

    ; Vérifier si N est inférieur à 1
                                       cmp           al, 1
                                       jl            errorgetRow

    ; Vérifier si N est supérieur à 50
                                       cmp           al, 50
                                       jg            errorgetRow

    ; Soustraire 1 de N (car les rangées sont indexées à partir de 0)
                                       sub           al, 1

    ; Effacer le demi-registre supérieur de ax
                                       mov           ah, 0

    ; Diviser N par 5 pour obtenir le numéro de rangée
                                       mov           bl, 5
                                       div           bl

    ; Ajouter 1 au numéro de rangée (car nous avons soustrait 1 précédemment)
                                       add           al, 1

    ; Sauter à donegetRow pour éviter la gestion des erreurs
                                       jmp           donegetRow

    errorgetRow:                       
    ; Imprimer une nouvelle ligne
                                       lea           dx, newline
                                       call          puts

    ; Imprimer un message d'erreur
                                       lea           dx, error1
                                       call          puts

    ; Définir la valeur de retour à 0 (indiquant une erreur)
                                       mov           ax, 0

    donegetRow:                        
    ; Effacer le demi-registre supérieur de ax (au cas où il a été modifié lors de la gestion des erreurs)
                                       mov           ah, 0

    ; Stocker le numéro de rangée dans la variable sort_getRow
                                       mov           sort_getRow, ax

    ; Restaurer les valeurs des registres depuis la pile
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax

    ; Retourner de la procédure
                                       ret
getRow endp

getColumn proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Déplacer la valeur de N dans ax
                                       mov           ax, N
    
    ; Vérifier si N est inférieur à 1
                                       cmp           al, 1
                                       jl            errorgetcolumn
    
    ; Vérifier si N est supérieur à 50
                                       cmp           al, 50
                                       jg            errorgetcolumn

    ; Appeler la fonction getRow pour vérifier si la rangée est paire ou impaire
                                       push          ax                                                      ; Sauvegarder N sur la pile
                                       call          getRow
                                       mov           ax,sort_getRow                                          ; Déplacer la valeur de la rangée dans AX
                                       pop           bx                                                      ; Restaurer N dans le registre BX

    ; Vérifier si la rangée est paire ou impaire
                                       test          al, 1                                                   ; Vérifier si le bit de poids faible est défini
                                       jnz           odd_row                                                 ; Sauter à odd_row si la rangée est impaire

    ; Rangée paire
                                       mov           ax, N                                                   ; Déplacer N dans le registre AX
                                       mov           cl, 10                                                  ; Définir CL à 10 pour la division
                                       mov           dx, 0
                                       div           cl                                                      ; Diviser AX par 10 (quotient dans AX, reste dans DL)
                                       cmp           ah, 0                                                   ; Vérifier si le reste est 0
                                       je            last_column                                             ; Sauter à last_column si le reste est 0

    ; Calculer la valeur de colonne pour une rangée paire
                                       mov           ax, N
                                       mov           cl, 10
                                       mov           dx, 0
                                       div           cl
                                       mov           al, ah
                                       mov           ah, 0
                                       mov           cx, 2
                                       mul           cx
                                       sub           ax, 11
                                       jmp           done_column                                             ; Sauter à done_column

    odd_row:                           
    ; Rangée impaire
                                       mov           ax, N
                                       mov           cl, 10
                                       mov           dx, 0
                                       div           cl
                                       mov           al, ah
                                       mov           ah, 0
                                       mov           cx, 2
                                       mul           cx
                                       jmp           done_column                                             ; Sauter à done_column

    last_column:                       
                                       mov           ax, 9                                                   ; Définir la valeur de colonne à 9 pour la dernière colonne
                                       jmp           done_column

    errorgetcolumn:                    
                                       lea           dx, newline
                                       call          puts

                                       lea           dx, error1
                                       call          puts
                                       mov           ax, 0

    done_column:                       
                                       mov           ah, 0
                                       mov           sort_getColumn, ax                                      ; Stocker la valeur de colonne dans la variable sort_getColumn
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret

getColumn endp

getSquareNumber proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Déplacer les valeurs de ent_squarenumberi et ent_squarenumberj dans ax et bx
                                       mov           ax, ent_squarenumberi
                                       mov           bx, ent_squarenumberj

    ; Vérifier si les valeurs sont en dehors de la plage [1, 10]
                                       cmp           al, 1
                                       jl            errorgetSquareNumber
                                       cmp           al, 10
                                       jg            errorgetSquareNumber

                                       cmp           bl, 1
                                       jl            errorgetSquareNumber
                                       cmp           bl, 10
                                       jg            errorgetSquareNumber

    ; Calculer le numéro de la case
                                       add           al, bl
                                       mov           ah, 0
                                       mov           bl, 2
                                       div           bl

    ; Vérifier si la case est blanche
                                       cmp           ah, 0
                                       je            msgcaseblanche

    ; Calculer le numéro de la case pour une case noire
                                       mov           dx, ent_squarenumberi
                                       sub           dl, 1
                                       mov           al, dl
                                       mov           bl, 5
                                       mul           bl

                                       mov           dx, ent_squarenumberj
                                       add           dl, 1
                                       mov           cx, ax
                                       mov           ax, dx
                                       mov           ah, 0
                                       mov           bl, 2
                                       div           bl
                                       add           ax, cx

                                       jmp           donegetSquareNumber

    errorgetSquareNumber:              
    ; Imprimer un message d'erreur
                                       lea           dx, newline
                                       call          puts
                                       lea           dx, error2
                                       call          puts
                                       mov           ax, 0
                                       jmp           donegetSquareNumber

    msgcaseblanche:                    
    ; Cas spécial pour une case blanche
                                       mov           ax, 0

    donegetSquareNumber:               
                                       mov           ah, 0
                                       mov           sort_getSquareNumber, ax                                ; Stocker le résultat dans sort_getSquareNumber
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
getSquareNumber endp

getSquareColor proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Déplacer les valeurs de ent_squarecolori et ent_squarecolorj dans ax et bx
                                       mov           ax, ent_squarecolori
                                       mov           bx, ent_squarecolorj

    ; Appeler getSquareNumber pour obtenir le numéro de la case
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax, sort_getSquareNumber
                                       cmp           ax, 0
                                       je            white_square

    ; Cas d'une case noire
                                       mov           ax, BLACK
                                       jmp           done_color

    white_square:                      
    ; Vérifier si les valeurs sont dans la plage [1, 10]
                                       mov           ax, ent_squarecolori
                                       mov           bx, ent_squarecolorj

                                       cmp           al, 1
                                       jl            done_color
                                       cmp           al, 10
                                       jg            done_color

                                       cmp           bl, 1
                                       jl            done_color
                                       cmp           bl, 10
                                       jg            done_color

    ; Cas d'une case blanche
                                       mov           ax, WHITE

    done_color:                        
                                       mov           sort_getSquareColor, ax                                 ; Stocker le résultat dans sort_getSquareColor
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
getSquareColor endp

getSquareState proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Déplacer les valeurs de ent_squarestatei et ent_squarestatej dans ax et bx
                                       mov           ax, ent_squarestatei
                                       mov           bx, ent_squarestatej

    ; Appeler getSquareNumber pour obtenir le numéro de la case
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           ax, sort_getSquareNumber
                                       mov           si, ax

    ; Vérifier l'état de la case à partir du tableau board
                                       mov           dl, board[si-1]
                                       cmp           dl, 0
                                       je            case_vide
                                       cmp           dl, 1
                                       je            pion_blanc
                                       cmp           dl, 2
                                       je            pion_noir
                                       cmp           dl, 3
                                       je            dame_blanche
                                       cmp           dl, 4
                                       je            dame_noire

    case_vide:                         
                                       mov           ax, 0
                                       jmp           done_state

    pion_blanc:                        
                                       mov           ax, 1
                                       jmp           done_state

    pion_noir:                         
                                       mov           ax, 2
                                       jmp           done_state

    dame_blanche:                      
                                       mov           ax, 3
                                       jmp           done_state

    dame_noire:                        
                                       mov           ax, 4

    done_state:                        
                                       mov           sort_getSquareState, ax                                 ; Stocker le résultat dans sort_getSquareState
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
getSquareState endp

InitialiserDamier proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Initialiser le compteur de boucle à 0
                                       mov           cx, 0

    ; Obtenir l'offset du tableau board
                                       mov           bx, offset board

    loop_init:                         
    ; Vérifier si l'index est inférieur à 20
                                       cmp           cx, 20
                                       jl            init_black

    ; Vérifier si l'index est supérieur ou égal à 30
                                       cmp           cx, 30
                                       jge           init_white

    ; Initialiser l'élément courant du tableau à EMPTY (0)
                                       mov           [bx], 0
                                       jmp           next_index

    init_black:                        
    ; Initialiser l'élément courant du tableau à BLACK_PAWN (2)
                                       mov           [bx], 2
                                       jmp           next_index

    init_white:                        
    ; Initialiser l'élément courant du tableau à WHITE_PAWN (1)
                                       mov           [bx], 1

    next_index:                        
    ; Passer à l'élément suivant du tableau
                                       inc           bx
                                       inc           cx

    ; Vérifier si tous les 50 éléments ont été initialisés
                                       cmp           cx, 50
                                       jl            loop_init

    ; Restaurer les valeurs des registres depuis la pile
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
InitialiserDamier endp

printSquare proc
                                       push          bp
                                       mov           bp, sp

    ; Déplacer les valeurs de ent_printi et ent_printj dans ax et bx
                                       mov           ax, ent_printi
                                       mov           bx, ent_printj

    ; Initialiser les variables pour les appels à getSquareState et getSquareColor
                                       mov           ent_squarecolori, ax
                                       mov           ent_squarecolorj, bx
                                       mov           ent_squarestatei, ax
                                       mov           ent_squarestatej, bx

    ; Appeler getSquareState et getSquareColor pour obtenir l'état et la couleur de la case
                                       call          getSquareState
                                       call          getSquareColor
                                       mov           ax, sort_getSquareColor
                                       cmp           ax, WHITE
                                       je            print_white

    ; Vérifier l'état de la case et imprimer le contenu correspondant
                                       mov           ax, sort_getSquareState
                                       cmp           ax, EMPTY
                                       je            EMPTY
                                       cmp           ax, WHITE_PAWN
                                       je            WHITE_PAWN
                                       cmp           ax, BLACK_PAWN
                                       je            BLACK_PAWN
                                       cmp           ax, WHITE_QUEEN
                                       je            WHITE_QUEEN
                                       cmp           ax, BLACK_QUEEN
                                       je            BLACK_QUEEN

    EMPTY:                             
                                       lea           dx, vide
                                       call          puts
                                       jmp           done_printstate

    WHITE_PAWN:                        
                                       lea           dx, pionblanc
                                       call          puts
                                       jmp           done_printstate

    BLACK_PAWN:                        
                                       lea           dx, pionnoir
                                       call          puts
                                       jmp           done_printstate

    WHITE_QUEEN:                       
                                       lea           dx, dameblanche
                                       call          puts
                                       jmp           done_printstate

    BLACK_QUEEN:                       
                                       lea           dx, damenoire
                                       call          puts
                                       jmp           done_printstate

    print_white:                       
    ; Imprimer une case vide pour une case blanche
                                       lea           dx, vd
                                       call          puts

    done_printstate:                   
                                       pop           bp
                                       ret
printSquare endp

AfficherDamier proc
                                       lea           dx, newline
                                       call          puts

                                       lea           dx, newline
                                       call          puts
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

                                       mov           cx, 1
    outer_loop:                        
                                       mov           dx, 1

    inner_loop:                        
    ; Initialiser les variables pour l'appel à printSquare
                                       mov           ent_printi, cx
                                       mov           ent_printj, dx

    ; Appeler printSquare pour afficher la case
                                       call          printSquare

    ; Restaurer les valeurs de ent_printi et ent_printj
                                       mov           cx, ent_printi
                                       mov           dx, ent_printj

    ; Passer à la colonne suivante
                                       inc           dx
                                       cmp           dx, 11
                                       jl            inner_loop

    ; Vérifier si toutes les colonnes ont été affichées
                                       cmp           dx, 11
                                       je            print_row

    ret_print_row:                     
    ; Imprimer deux nouvelles lignes pour séparer les rangées
                                       lea           dx, newline
                                       call          puts
                                       lea           dx, newline
                                       call          puts

    ; Passer à la rangée suivante
                                       mov           cx, ent_printi
                                       inc           cx
                                       cmp           cx, 10
                                       jle           outer_loop

    ; Imprimer les numéros de colonnes
                                       mov           cx, 1
    print_column:                      
                                       mov           ax, cx
                                       call          print_decimal
                                       lea           dx, v
                                       call          puts
                                       inc           cx
                                       cmp           cx, 11
                                       jl            print_column

                                       jmp           doneafficher

    print_row:                         
    ; Imprimer le numéro de rangée
                                       mov           ax, ent_printi
                                       call          print_decimal
                                       jmp           ret_print_row

    doneafficher:                      
    ; Restaurer les valeurs des registres depuis la pile
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
AfficherDamier endp

verifqueens proc
    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp

    ; Initialiser les variables
                                       mov           found, 0                                                ; found = 0 (aucune dame trouvée)
                                       mov           k, 1                                                    ; k = 1 (indice de départ dans ent_verifqueens_testtable)
                                       mov           p, 0                                                    ; p = 0 (indice de départ dans ent_verifqueens_testtable)

    loop1verifqueens:                  
                                       mov           cx, k
                                       cmp           cx, 50
                                       jge           loop1_endverifqueens                                    ; Sortir de la boucle si k >= 50

                                       mov           si, 0
    loop2verifqueens:                  
                                       mov           ax, ent_verifqueens_testtable[si]
                                       cmp           ax, -1
                                       je            loop2_endverifqueens                                    ; Sortir de la boucle interne si la fin du tableau est atteinte

    ; Obtenir le numéro de case à partir des coordonnées (i, j)
                                       push          si
                                       mov           ax, ent_verifqueens_i
                                       mov           ent_squarenumberi, ax
                                       mov           ax, ent_verifqueens_j
                                       mov           ent_squarenumberj, ax
                                       call          getSquareNumber
                                       mov           ax, sort_getSquareNumber
                                       mov           si, p
                                       cmp           ax, ent_verifqueens_testtable[si]
                                       pop           si

                                       jne           skipverifqueens                                         ; Sauter si les numéros de case ne correspondent pas

    ; Obtenir le numéro de case à partir des coordonnées (x, y)
                                       push          si
                                       mov           ax, ent_verifqueens_x
                                       mov           ent_squarenumberi, ax
                                       mov           ax, ent_verifqueens_y
                                       mov           ent_squarenumberj, ax
                                       call          getSquareNumber
                                       mov           ax, sort_getSquareNumber
                                       mov           si, k
                                       cmp           ax, ent_verifqueens_testtable[si]
                                       pop           si

                                       jne           skipverifqueens                                         ; Sauter si les numéros de case ne correspondent pas

    ; Une dame a été trouvée
                                       mov           cx, found
                                       mov           cx, 1
                                       mov           found, cx
                                       jmp           loop1_endverifqueens

    skipverifqueens:                   
                                       inc           si
                                       jmp           loop2verifqueens

    loop2_endverifqueens:              
                                       mov           cx, k
                                       inc           cx
                                       mov           k, cx
                                       push          si
                                       mov           si, k
                                       cmp           ent_verifqueens_testtable[si], 0
                                       pop           si
                                       je            loop1verifqueens                                        ; Continuer la boucle externe si la fin du tableau n'est pas atteinte
                                       mov           cx, k
                                       mov           dx, p
                                       add           dx, cx
                                       mov           p, dx
                                       inc           cx
                                       mov           k, cx
                                       jmp           loop1verifqueens

    loop1_endverifqueens:              
                                       mov           cx, found
                                       cmp           found, cx
                                       jne           endverifqueens                                          ; Sauter à endverifqueens si aucune dame n'a été trouvée

    ; Afficher "Vous devez capturer un pion adverse avec votre dame."
                                       lea           dx, msg
                                       call          puts
                                       mov           sort_verifqueens, 1                                     ; Indique qu'une dame a été trouvée
                                       jmp           exitverifqueens

    endverifqueens:                    
                                       mov           sort_verifqueens, 0                                     ; Indique qu'aucune dame n'a été trouvée

    exitverifqueens:                   
    ; Restaurer les valeurs des registres depuis la pile
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
verifqueens endp

verif proc
    ; Calcul de currentPlayer
                                       push          ax
                                       mov           al, player
                                       cmp           al, WHITE
                                       jne           black_player
                                       mov           currentPlayer, WHITE_PAWN
                                       mov           currentQueen, WHITE_QUEEN
                                       jmp           opponent
                                       pop           ax
    black_player:                      
                                       mov           currentPlayer, BLACK_PAWN
                                       mov           currentQueen, BLACK_QUEEN
    opponent:                          
                                       push          ax
                                       mov           al, player
                                       cmp           al, WHITE
                                       jne           white_opponent
                                       mov           opponentPiece, BLACK_PAWN
                                       mov           opponentQueen, BLACK_QUEEN
                                       jmp           start_square
                                       pop           ax
    white_opponent:                    
                                       mov           opponentPiece, WHITE_PAWN
                                       mov           opponentQueen, WHITE_QUEEN
		
    start_square:                      
    ; Calcul de startSquareNumber
                                       mov           ax , ent_verifi
                                       mov           ent_Squarenumberi , ax
                                       mov           ax , ent_verifj
                                       mov           ent_Squarenumberj , ax
                                       call          getSquareNumber
                                       push          ax
                                       mov           ax , sort_getsquarenumber
                                       mov           startSquareNumber, ax
                                       pop           ax
    ; Calcul de endSquareNumber
                                       mov           ax , ent_verifx
                                       mov           ent_Squarenumberi , ax
                                       mov           ax , ent_verify
                                       mov           ent_Squarenumberj , ax
                                       call          getSquareNumber
                                       push          ax
                                       mov           ax , sort_getsquarenumber
                                       mov           endSquareNumber , ax
                                       pop           ax
		
    ; Vérification de captureaftercapture
                                       mov           si ,0
                                       cmp           captureaftercapture[si], 0
                                       je            check_must_capture1
                                       cmp           captureaftercapture[si+2], 0
                                       je            check_must_capture1
    ; Vérification de currentPlayer
                                       mov           ax , captureaftercapture[si]
                                       mov           ent_squarestatei , ax
                                       mov           ax , captureaftercapture[si+2]
                                       mov           ent_squarestatej , ax
		
                                       call          getSquareState
                                       mov           ax, Sort_getSquareState
                                       cmp           al, currentPlayer

                                       jne           check_current_queen

    ; Vérification des coordonnées
    veriiif1:                          
                                       mov           ax,N
                                       mov           ax , coor[si]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriiif2
                                       pop           ax
                                       mov           ax , N
                                       mov           ax , coor[si]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriiif2
                                       pop           ax
     
                                       mov           ax,N
                                       mov           ax , coor[si+1]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriiif2
                                       pop           ax

                                       mov           N , coor[si+1]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriiif2
                                       pop           ax
    veriiif2:                          
                                       mov           N , coor[si+2]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriiif3
                                       pop           ax
                                       mov           N , coor[si+2]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriiif3
                                       pop           ax

                                       mov           N , coor[si+3]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriiif3
                                       pop           ax
                                       mov           N , coor[si+3]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriiif3
                                       pop           ax
    veriiif3:                          
                                       mov           N , coor[si+4]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriif4
                                       pop           ax
                                       mov           N , coor[si+4]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriif4
                                       pop           ax

                                       mov           N , coor[si+5]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriif4
                                       pop           ax
                                       mov           N , coor[si+5]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriif4
                                       pop           ax
    veriiif4:                          
                                       mov           N , coor[si+6]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            check_pawn_move
                                       pop           ax
                                       mov           N , coor[si+6]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            check_pawn_move
                                       pop           ax

                                       mov           N , coor[si+7]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            check_pawn_move
                                       pop           ax
                                       mov           N , coor[si+7]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            check_pawn_move
                                       pop           ax
		
    bouclek:                           
                                       cmp           coor[k] , 0
                                       je            finbouclek
                                       MOV           AH, 09h
                                       LEA           DX, msg_capture_adv
                                       INT           21h
                                       mov           ax , k
                                       add           ax , 2
                                       mov           k , ax
                                       jmp           bouclek

    finbouclek:                        
                                       jmp           invalid_move



    check_current_queen:               

                                       mov           ax , captureaftercapture[si]
                                       mov           ent_squaerstatei , ax
                                       mov           ax , captureaftercapture[si+2]
                                       mov           ent_squarestatej , ax
		
                                       call          getSquareState
                                       push          ax
                                       mov           ax , Sort_getSquareState
                                       cmp           ax, currentQueen
                                       pop           ax
                                       jne
		
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqtole
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump11
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    jump11:                            
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqtori
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump12
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    jump12:                            
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqubole
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump13
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    jump13:                            
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqubori
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           if3
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    if3:                               
                                       mov           ax , ret
                                       cmp           ax , 0
                                       je            check_must_capture1
                                       jmp           invalid_move

    check_must_capture1:               
                                       call          Mustcapture
                                       mov           ax , sort_Mustcapture
                                       cmp           ax , 1
                                       jne           if2
                                       mov           ax , ent_verifi
                                       mov           ent_squarestatei , ax
                                       mov           ax , ent_verifj
                                       mov           ent_squarestatej , ax
                                       call          getSquareState
                                       push          ax
                                       mov           ax , Sort_getSquareState
                                       cmp           ax, currentPlayer
                                       pop           ax
                                       jne           currentQueen2
    ; Vérification des coordonnées
    veriiif10:                         
                                       mov           N , coor[si]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriif11
                                       pop           ax
                                       mov           N , coor[si]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriif11
                                       pop           ax

                                       mov           N , coor[si+1]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriif11
                                       pop           ax
                                       mov           N , coor[si+1]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriif11
                                       pop           ax
    veriiif11:                         
                                       mov           N , coor[si+2]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriif12
                                       pop           ax
                                       mov           N , coor[si+2]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriif12
                                       pop           ax

                                       mov           N , coor[si+3]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriif12
                                       pop           ax
                                       mov           N , coor[si+3]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriif12
                                       pop           ax
    veriiif12:                         
                                       mov           N , coor[si+4]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            veriif13
                                       pop           ax
                                       mov           N , coor[si+4]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            veriif13
                                       pop           ax

                                       mov           N , coor[si+5]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            veriif13
                                       pop           ax
                                       mov           N , coor[si+5]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            veriif13
                                       pop           ax
    veriiif14:                         
                                       mov           N , coor[si+6]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifi , ax
                                       je            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
                                       pop           ax
                                       mov           N , coor[si+6]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verifj , ax
                                       je            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
                                       pop           ax

                                       mov           N , coor[si+7]
                                       call          getRow
                                       push          ax
                                       mov           ax , sort_getRow
                                       cmp           ent_verifx , ax
                                       je            ,,,,,,,,,,,,,,,,,,,,,,,,,
                                       pop           ax
                                       mov           N , coor[si+7]
                                       call          getColumn
                                       push          ax
                                       mov           ax , sort_getColumn
                                       cmp           ent_verify , ax
                                       je            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
                                       pop           ax
		
    bouclek2:                          
                                       cmp           coor[k2] , 0
                                       je            finbouclek2
                                       MOV           AH, 09h
                                       LEA           DX, msg_capture_adv
                                       INT           21h
                                       mov           ax , k
                                       add           ax , 2
                                       mov           k , ax
                                       jmp           bouclek2

    finbouclek2:                       
                                       mov           ax , rett
                                       add           ax , 2
                                       move          rett , ax

    check_current_queen2:              
                                       mov           ax , ent_verifi
                                       mov           ent_squaerstatei , ax
                                       mov           ax , ent_verifj
                                       mov           ent_squaerstatej , ax
                                       call          getSquareState
                                       push          ax
                                       mov           ax , Sort_getSquareState
                                       cmp           ax, currentQueen
                                       pop           ax
                                       jne           if2
		
                                       mov           ax , jumpsqutole
                                       cmp           ax, 0
                                       jle           jump1
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqtole
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump1
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    jump1:                             
                                       mov           ax , jumpsqutori
                                       cmp           ax, 0
                                       jle           jump2
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqtori
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump2
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
    jump2:                             
		
                                       mov           ax , jumpsqubole
                                       cmp           ax, 0
                                       jle           jump3
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqubole
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           jump3
                                       mov           ax , ret
                                       add           ax , 2
                                       mov           ret , ax
		
    jump3:                             
		
                                       mov           ax , jumpsqubori
                                       cmp           ax, 0
                                       jle           if2
                                       mov           ax , ent_verifi
                                       mov           ent_verifqueens_i , ax
                                       mov           ax , ent_verifj
                                       mov           ent_verifqueens_j  , ax
                                       mov           ax , ent_verifx
                                       mov           ent_verifqueens_x , ax
                                       mov           ax , ent_verify
                                       mov           ent_verifqueens_y  , ax
                                       mov           ax , queencapturesqubori
                                       mov           ent_verifqueens_testtable , ax
                                       call          verifqueens
                                       push          ax
                                       mov           ax , sort_verifqueens
                                       cmp           ax, 1
                                       pop           ax
                                       jne           if2
                                       mov           ax , rett
                                       add           ax , 2
                                       mov           ret , ax


    if2:                               
                                       mov           ax , rett
                                       cmp           ax , 0
je,,,,,,,,,,,,,,,
                                       jmp           invalid_move

    check_current_player2:             
                                       mov           ax , ent_verifi
                                       mov           ent_squaerstatei , ax
                                       mov           ax , ent_verifj
                                       mov           ent_squaerstatej , ax
                                       call          getSquareState
                                       push          ax
                                       mov           ax , Sort_getSquareState
                                       cmp           ax, currentPlayer
                                       pop           ax
                                       jne           ////////////////////////////////////////////////////
                                       call          Mustcapture
                                       mov           ax , sort_Mustcapture
                                       cmp           ax , 0
                                       jne           ////////////////////////////////////////////////
    ; Calcul de abs(i - x)
                                       mov           ax,i
                                       mov           cx,x
                                       sub           ax, cx                                                  ; ax = i - x
                                       mov           si, ax                                                  ; si = i - x (pour garder une copie)
                                       cmp           ax, 0                                                   ; Comparer i - x avec 0
                                       jge           abs1                                                    ; Si i - x >= 0, sauter à abs1
                                       neg           ax                                                      ; Sinon, ax = -(i - x)
    abs1:                              
                                       cmp           ax, 1                                                   ; Comparer abs(i - x) avec 1
                                       jg            true                                                    ; Si abs(i - x) > 1, sauter à true
    ; Calcul de abs(j - y)
                                       mov           ax, bx                                                  ; ax = j
                                       sub           ax, dx                                                  ; ax = j - y
                                       mov           di, ax                                                  ; di = j - y (pour garder une copie)
                                       cmp           ax, 0                                                   ; Comparer j - y avec 0
                                       jge           abs2                                                    ; Si j - y >= 0, sauter à abs2
                                       neg           ax                                                      ; Sinon, ax = -(j - y)
    abs2:                              
                                       cmp           ax, 1                                                   ; Comparer abs(j - y) avec 1
                                       jg            true                                                    ; Si abs(j - y) > 1, sauter à true

    ; Si on arrive ici, les deux conditions sont fausses
                                       jmp           false                                                   ; Sauter à false

    true:                              
                                       MOV           AH, 09h
                                       LEA           DX,msg_invalid_pawn_move db
                                       INT           21h
                                       jmp           invalid_move


                                       mov           ax , startSquareNumber
                                       cmp           ax , 0
                                       je            affichage
                                       move          ax , endSquareNumber
                                       cmp           ax , 0
                                       jne           lll
		
			
    affichage:                         
                                       MOV           AH, 09h
                                       LEA           DX,msg_invalid_square
                                       INT           21h
                                       jmp           invalid_move

    lll:                               
                                       mov           ax , endSquareNumber
                                       cmp           board[ax-1] , EMPTY
                                       je            2222
                                       MOV           AH, 09h
                                       LEA           DX,  msg_end_square_occupied
                                       INT           21h
                                       jmp           invalid_move

    2222:                              
                                       mov           ax , StartSquareNumber
                                       cmp           board[ax-1] , currentPlayer
                                       je            3333
                                       MOV           AH, 09h
                                       LEA           DX,  msg_start_square_invalid
                                       INT           21h
                                       jmp           invalid_move


    3333:                              
                                       mov           ax , StartSquareNumber
                                       cmp           board[ax-1] , EMPTY
                                       je            4444
                                       MOV           AH, 09h
                                       LEA           DX,  msg_start_square_empty
                                       INT           21h
                                       jmp           invalid_move


    4444:                              
                                       mov           ax , StartSquareNumber
                                       cmp           board[ax-1] , WHITE_PAWN
                                       je            5555
                                       mov           ax , StartSquareNumber
                                       cmp           board[ax-1] , BLACK_PAWN
                                       je            5555
                                       MOV           AH, 09h
                                       LEA           DX,  msg_invalid_piece
                                       INT           21h
                                       jmp           invalid_move


    5555:                              
                                       mov           ax , StartSquareNumber
                                       mov           ax ,board[ax-1 ]
                                       cmp           ax , WHITE_PAWN
                                       jne           suit
                                       mov           isWhitePawn , 1

    suit:                              
                                       mov           ax , endSquareNumber
                                       mov           bx , startSquareNumber
                                       sub           ax , bx
                                       mov           moveDirection ,ax
		
		
                                       mov           ax , isWhitePawn
                                       cmp           ax , 0
                                       jl            suit2
                                       mov           ax , moveDirection
                                       cmp           ax , 0
                                       jge


                                       suit2
                                       mov           ax , !isWhitePawn
                                       mov           ax , moveDirection
                                       cmp           ax , 0
                                       jg            suit4
		
                                       suit3
                                       MOV           AH, 09h
                                       LEA           DX,  msg_invalid_pawn_direction
                                       INT           21h
                                       jmp           invalid_move


                                       suit4
                                       mov           ax , ent_verifi
                                       mov           ent_squaerstatei , ax
                                       mov           ax , ent_verifi
                                       mov           ent_squarestatej , ax
		
                                       call          getSquareState
                                       push          ax
                                       mov           ax , Sort_getSquareState
                                       cmp           ax, currentQueen
                                       pop           ax
                                       jne           ................................
                                       mov           ax , startSquareNumber
                                       cmp           ax, 0
                                       jne           enddddddddd
                                       MOV           AH, 09h
                                       LEA           DX, msg_invalid_square
                                       INT           21h
                                       jmp           invalid_move
			
                                       enddddddddddd
			
                                       mov           ax , endSquareNumber
                                       cmp           board[ax-1] , EMPTY
                                       je            ..................................
                                       MOV           AH, 09h
                                       LEA           DX,  msg_end_square_occupied
                                       INT           21h
                                       jmp           invalid_move


                                       mov           ax , startSquareNumber
                                       cmp           board[ax-1] , currentQueen
                                       je            ..................................
                                       MOV           AH, 09h
                                       LEA           DX, msg_start_square_invalid2
                                       INT           21h
                                       jmp           invalid_move


                                       mov           ax , startSquareNumber
                                       cmp           board[ax-1] , EMPTY
                                       jne           ..................................
                                       MOV           AH, 09h
                                       LEA           DX,msg_start_square_empty
                                       INT           21h
                                       jmp           invalid_move

			
                                       mov           ax , startSquareNumber
                                       cmp           board[ax-1] ,WHITE_QUEEN
                                       cmp           board[ax-1] ,BLACK_QUEEN
                                       jne           .......................
                                       MOV           AH, 09h
                                       LEA           DX, msg_start_square_empty
                                       INT           21h
                                       jmp           invalid_move

                                       mov           ax, endSquareNumber
                                       call          getRow
                                       sub           ax,startSquareNumber
                                       cwd
                                       div           abs(ax)
                                       mov           rowDirection,ax
			
                                       mov           ax, endSquareNumber
                                       call          getColumn
                                       sub           ax,startSquareNumber
                                       cwd
                                       div           abs(ax)
                                       mov           columnDirection,ax

                                       mov           ax , startSquareNumber
                                       call          getRow
                                       add           ax,rowDirection
                                       mov           row ,ax

			
                                       mov           ax , startSquareNumber
                                       call          getColumn
                                       add           ax,columnDirection
                                       mov           column ,ax

    check_must_capture2:               
                                       call          Mustcapture
                                       mov           ax , sort_Mustcapture
                                       cmp           ax , 0
                                       jne           elseee
                                       mov           ax, endSquareNumber
                                       call          retRow
                                       cmp           ax, row
                                       jne           continue_while
                                       mov           ax ,endSquareNumber
                                       call          getColumn
                                       cmp           ax,column
                                       jne           continue_while
                                       jmp           end_while
    continue_while:                    
                                       mov           ax,row
                                       mov           bx,column
                                       call          getSquareNumber
                                       dec           ax
                                       mov           dx, ax
                                       cmp           board[dx-1],EMPTY
                                       jne           .................
                                       MOV           AH, 09h
                                       LEA           DX, msg_invalid_pawn_direction
                                       INT           21h
                                       jmp           invalid_move
    ;incrementation de row
                                       mov           ax , row
                                       add           ax , rowDirection
                                       mov           row , ax
			
    ;incrementation de row
                                       mov           ax , column
                                       add           ax , columnDirection
                                       mov           column , ax
    elseee:                            
                                       MOV           AH, 09h
                                       LEA           DX,   msg_start_square_invalid2
                                       INT           21h
                                       jmp           exit
			
                                       MOV           AH, 09h
                                       LEA           DX, msg_invalid_pawn_direction
                                       INT           21h
                                       jmp           exit
    exit:                              
                                       pop           bp
                                       ret           16
verif endp

deplacer proc

                                       ret
deplacer endp

generateAIMove proc

    ; Sauvegarder les valeurs des registres sur la pile
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          si
                                       push          di
                                       push          bp
                                       mov           bp, sp

    ; Vérifier si mustcapture() renvoie 1
                                       call          mustcapture
                                       mov           ax, sort_Mustcapture
                                       cmp           ax, 1
                                       jne           else_generateAIMove

    ; obtenir les coordonnées de la case à partir de coor[0]
                                       mov           si, 0
                                       mov           ax, coor[si]
                                       mov           N, ax
                                       push          si
                                       call          getRow
                                       mov           ax, sort_getRow
                                       mov           ent_deplaceri, ax
                                       call          getColumn
                                       mov           ax, sort_getColumn
                                       mov           ent_deplacerj, ax
                                       pop           si

                                       inc           si

    ; obtenir les coordonnées de la case à partir de coor[1]

                                       mov           ax,coor[si]
                                       mov           N, ax
                                       call          getRow
                                       mov           ax, sort_getRow
                                       mov           ent_deplacerx, ax
                                       call          getColumn
                                       mov           ax, sort_getColumn
                                       mov           ent_deplacery, ax

    ; appeler deplacer (i,j,x,y)
                                       call          deplacer
                                       jmp           end_generateAIMove

    else_generateAIMove:               
    ; initialiser les variables
                                       xor           cx, cx
                                       mov           ent_deplaceri, cx
                                       mov           ent_deplacerj, cx
                                       mov           ent_deplacerx, cx
                                       mov           ent_deplacery, cx
                                       mov           validMove, cx

    while_loop:                        
                                       cmp           validMove, 0
                                       jne           end_while_loop

    ; boucle for (si = 0; si < 50; si++)
                                       xor           si, si
    for_loop:                          
                                       cmp           si, 50
                                       jge           end_for_loop

    ; vérifier si la case est black_pawn ou black_queen
                                       mov           al, board[si]
                                       cmp           al, BLACK_PAWN
                                       je            handle_black_pawn
                                       cmp           al, BLACK_QUEEN
                                       jne           next_iteration_generateAIMove

    ; BLACK_QUEEN logic
    handle_black_queen:                
                                       mov           ax, si
                                       inc           ax
                                       mov           N, ax
                                       push          si
                                       call          getRow
                                       mov           ax,sort_getRow
                                       mov           ent_deplaceri, ax
                                       call          getColumn
                                       mov           ax, sort_getColumn
                                       mov           ent_deplacerj, ax
                                       pop           si

    ; verifier les depalcements diagonaux
                                       mov           cx, 1
    diagonal_loop:                     
                                       cmp           cx, 10
                                       jge           next_iteration_generateAIMove

    ; deplacement diagonal top-left
                                       mov           ax, ent_deplaceri
                                       add           ax, cx
                                       cmp           ax, 10
                                       jg            next_diagonal
                                       mov           bx, ent_deplacerj
                                       add           bx, cx
                                       cmp           bx, 10
                                       jg            next_diagonal

                                       push          si
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           next_diagonal

                                       mov           ax, ent_deplaceri
                                       add           ax, cx
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       add           ax, cx
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi, ax
                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj, ax
                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx, ax
                                       mov           ax, ent_deplacery
                                       mov           ent_verify, ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax, sort_verif
                                       cmp           ax, 1
                                       je            set_valid_move

    ;deplacement diagonal top-right
    next_diagonal:                     
                                       mov           ax, ent_deplaceri
                                       add           ax, cx
                                       cmp           ax, 10
                                       jg            next_diagonal2
                                       mov           bx, ent_deplacerj
                                       sub           bx, cx
                                       cmp           bx, 1
                                       jl            next_diagonal2

                                       push          si
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           next_diagonal2

                                       mov           ax, ent_deplaceri
                                       add           ax, cx
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       sub           ax, cx
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi, ax
                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj, ax
                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx, ax
                                       mov           ax, ent_deplacery
                                       mov           ent_verify, ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax, sort_verif
                                       cmp           ax, 1
                                       je            set_valid_move

    ; deplacement diagonal bottom-right
    next_diagonal2:                    
                                       mov           ax, ent_deplaceri
                                       sub           ax, cx
                                       cmp           ax, 1
                                       jl            next_diagonal3
                                       mov           bx, ent_deplacerj
                                       add           bx, cx
                                       cmp           bx, 10
                                       jg            next_diagonal3

                                       push          si
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           next_diagonal3

                                       mov           ax, ent_deplaceri
                                       sub           ax, cx
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       add           ax, cx
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi, ax
                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj, ax
                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx, ax
                                       mov           ax, ent_deplacery
                                       mov           ent_verify, ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax, sort_verif
                                       cmp           ax, 1
                                       je            set_valid_move

    ; deplacement diagonal bottom-left
    next_diagonal3:                    
                                       mov           ax, ent_deplaceri
                                       sub           ax, cx
                                       cmp           ax, 1
                                       jl            next_iteration_generateAIMove
                                       mov           bx, ent_deplacerj
                                       sub           bx, cx
                                       cmp           bx, 1
                                       jl            next_iteration_generateAIMove

                                       push          si
                                       mov           ent_squarenumberi, ax
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           next_iteration_generateAIMove

                                       mov           ax, ent_deplaceri
                                       sub           ax, cx
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       sub           ax, cx
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi, ax
                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj, ax
                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx, ax
                                       mov           ax, ent_deplacery
                                       mov           ent_verify, ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax, sort_verif
                                       cmp           ax, 1
                                       je            set_valid_move

                                       inc           cx
                                       jmp           diagonal_loop


    ; la prochaine iteration
    next_iteration_generateAIMove:     
                                       inc           si
                                       jmp           for_loop

    ;le saut vers la fin
    end_for_loop:                      
                                       jmp           while_loop

    ;mise à jour de la variable validMove
    set_valid_move:                    
                                       mov           validMove, 1
                                       jmp           end_while_loop

    ; BLACK_PAWN logic
    handle_black_pawn:                 
                                       mov           ax, si
                                       inc           ax
                                       mov           N, ax
                                       push          si
                                       call          getRow
                                       mov           ax, sort_getRow
                                       mov           ent_deplaceri, ax
                                       call          getColumn
                                       mov           ax, sort_getColumn
                                       mov           ent_deplacerj, ax
                                       pop           si

                                       mov           ax, ent_deplaceri
                                       cmp           ax,10
                                       jge           check_pawn_right
                                       mov           ax,ent_deplacerj
                                       cmp           ax,1
                                       jle           check_pawn_right


    ; verifier move i + 1, j - 1
                                       mov           ax, ent_deplaceri
                                       inc           ax
                                       mov           ent_squarenumberi, ax
                                       mov           ax, ent_deplacerj
                                       dec           ax
                                       mov           ent_squarenumberj, ax

                                       push          si
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           check_pawn_right

                                       mov           ax, ent_deplaceri
                                       inc           ax
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       dec           ax
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi , ax

                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj , ax

                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx , ax

                                       mov           ax, ent_deplacery
                                       mov           ent_verify , ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax,sort_verif

                                       cmp           ax, 1
                                       je            set_valid_move

    ; verifier move i + 1, j + 1
    check_pawn_right:                  

                                       mov           ax, ent_deplaceri
                                       cmp           ax,10
                                       jge           next_iteration_generateAIMove
                                       mov           ax,ent_deplacerj
                                       cmp           ax,10
                                       jge           next_iteration_generateAIMove

                                       mov           ax, ent_deplaceri
                                       inc           ax
                                       mov           ent_squarenumberi, ax
                                       mov           ax, ent_deplacerj
                                       inc           ax
                                       mov           ent_squarenumberj, ax

                                       push          si
                                       call          getSquareNumber
                                       pop           si
                                       mov           sort_getSquareNumber, ax
                                       dec           ax
                                       push          si
                                       mov           si, ax
                                       mov           dl, board[si]
                                       pop           si
                                       cmp           dl, EMPTY
                                       jne           next_iteration_generateAIMove


                                       mov           ax, ent_deplaceri
                                       inc           ax
                                       mov           ent_deplacerx, ax
                                       mov           ax, ent_deplacerj
                                       inc           ax
                                       mov           ent_deplacery, ax

                                       mov           ax, ent_deplaceri
                                       mov           ent_verifi , ax

                                       mov           ax, ent_deplacerj
                                       mov           ent_verifj , ax

                                       mov           ax, ent_deplacerx
                                       mov           ent_verifx , ax

                                       mov           ax, ent_deplacery
                                       mov           ent_verify , ax

                                       push          si
                                       call          verif
                                       pop           si
                                       mov           ax,sort_verif

                                       cmp           ax, 1
                                       je            set_valid_move
                                       jmp           next_iteration_generateAIMove

    end_while_loop:                    
    ; Call deplacer(i, j, x, y)
                                       call          deplacer

    end_generateAIMove:                
    ; Restaurer les valeurs des registres depuis la pile
                                       pop           bp
                                       pop           di
                                       pop           si
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret

generateAIMove endp

Mustcapture proc

                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp


    ; Define registers to hold player and variables
                                       mov           AL, player                                              ; Assuming player value is in register AL

    ; Check for WHITE player
                                       cmp           AL, WHITE
                                       jne           notWhite                                                ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                       mov           currentPlayer, WHITE_PAWN
                                       mov           currentQueen, WHITE_QUEEN
                                       mov           opponentPiece, BLACK_PAWN
                                       mov           opponentQueen, BLACK_QUEEN
                                       jmp           finish                                                  ; Jump to the end

    notWhite:                          
    ; Assign values for BLACK player
                                       mov           currentPlayer, BLACK_PAWN
                                       mov           currentQueen, BLACK_QUEEN
                                       mov           opponentPiece, WHITE_PAWN
                                       mov           opponentQueen, WHITE_QUEEN

    finish:                            



    ; Initialisation des variables

                                       mov           cx, 0
                                       mov           capturepossible, cx

                                       mov           q, cx

                                       mov           qatole, cx

                                       mov           qatori, cx

                                       mov           qabole, cx

                                       mov           qabori, cx

                                       mov           jumpsqubole, cx

                                       mov           jumpsqubori, cx

                                       mov           jumpsqutole, cx

                                       mov           jumpsqutori, cx

  

    ; Réinitialisation des tableaux

                                       mov           bx, 0

    reset_arrays:                      

                                       mov           queencapturesqtole[bx], 0

                                       mov           queencapturesqtori[bx], 0

                                       mov           queencapturesqubole[bx], 0

                                       mov           queencapturesqubori[bx], 0

                                       mov           coor[bx], 0

                                       inc           bx
                                       cmp           bx,50
                                       jl            reset_arrays
  

    ; Boucle principale


                                       mov           bx, 0

    main_loop:                         
                                       mov           bxx,bx
    ; Récupération de la valeur de la case courante

                                       mov           al, board[bx]

  

    ; Vérification si c'est un pion ou une reine de la couleur du joueur actuel

                                       cmp           al, currentPlayer

                                       je            process_piece

                                       cmp           al, currentQueen

                                       jne           next_iteration

  

    process_piece:                     

    ; Calcul des coordonnées i et j de la case courante
                                       push          bx
                                       inc           bx
                                       mov           N, bx

                                       call          getRow

                                       mov           ax, sort_getRow
                                       mov           i,ax

                                       call          getColumn

                                       mov           ax, sort_getColumn
                                       mov           j,ax
                                       pop           bx

  

    ; Vérification des captures possibles selon le type de pièce
                                      
                                       mov           al, currentPlayer
                                       cmp           board[bx], al
                                       je            check_pawn_color

                                       mov           al, currentQueen
                                       cmp           board[bx], al
                                       je            process_queen
                                       jmp           next_iteration

  

    check_pawn_color:                  
                                       cmp           player, WHITE

                                       je            process_white_pawn

                                       jmp           process_black_pawn

  

  

    ;capture des pions blancs

    process_white_pawn:                

    ; Vérification de la capture en haut à gauche

                                       cmp           i, 2                                                    ; Vérifier si i > 1

                                       jl            skip_top_left_capture

                                       cmp           j, 2                                                    ; Vérifier si j > 1

                                       jl            skip_top_left_capture

  

                                       mov           dx, j

                                       dec           dx
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i

                                       dec           cx
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           bx ,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al, opponentPiece

                                       cmp           board[bx], al
                                       je            check_top_left_empty

                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_top_left_capture

  

    check_top_left_empty:              
                                       mov           dx, j

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i

                                       sub           cx, 2
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_top_left_capture

  

    ; Capture possible en haut à gauche
                                       mov           si, q

                                       mov           dx, j
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, j

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i

                                       sub           cx, 2
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si

                                       mov           q, si

                                       mov           capturepossible,1
  

    skip_top_left_capture:             
                                      
  

    ; Vérification de la capture en haut à droite

                                       cmp           i, 2                                                    ; Vérifier si i > 1

                                       jl            skip_top_right_capture

                                       cmp           j, 9                                                    ; Vérifier si j < 10

                                       jg            skip_top_right_capture

  

                                       mov           dx, j

                                       inc           dx
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       dec           cx
                                       mov           ent_squarenumberi,cx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                    
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_top_right_empty
                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_top_right_capture

  

    check_top_right_empty:             
                                     
                                       mov           dx, j

                                       add           dx, 2
                                       mov           ent_squarenumberj,dx
                                       mov           cx, i

                                       sub           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_top_right_capture

  

    ; Capture possible en haut à droite

                                       mov           si, q
                                       mov           dx, j
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, j

                                       add           dx, 2
                                       mov           ent_squarenumberj,dx
                                       mov           cx, i

                                       sub           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si
                                       mov           q, si

                                       mov           capturepossible,1
  

    skip_top_right_capture:            
                                      
                                       jmp           next_iteration

  

  

    ;capture pions noirs

    process_black_pawn:                

    ; Vérification de la capture en bas à gauche

                                       cmp           i, 9                                                    ; Vérifier si i < 10

                                       jg            skip_bottom_left_capture

                                       cmp           j, 2                                                    ; Vérifier si j > 1

                                       jl            skip_bottom_left_capture

  

                                       mov           dx, j

                                       dec           dx

                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       inc           cx
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_bottom_left_empty
                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_bottom_left_capture

  

    check_bottom_left_empty:           
                                      
                                       mov           dx, j

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       add           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_bottom_left_capture

  

    ; Capture possible en bas à gauche
                                       mov           si, q

                                       mov           dx, j
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, j

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       add           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           ax , sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           q, si

                                      
                                       mov           capturepossible, 1

  

    skip_bottom_left_capture:          

                                  

    ; Vérification de la capture en bas à droite

                                       cmp           i, 9                                                    ; Vérifier si i < 10

                                       jg            skip_bottom_right_capture

                                       cmp           j, 9                                                    ; Vérifier si j < 10

                                       jg            skip_bottom_right_capture

  

                                       mov           dx, j

                                       inc           dx
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       inc           cx
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                     
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_bottom_right_empty

                                       mov           al, opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_bottom_right_capture


  

    check_bottom_right_empty:          
                                  
                                       mov           dx, j

                                       add           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       add           cx, 2
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_bottom_right_capture

  

    ; Capture possible en bas à droite
                                       mov           si, q
                                       mov           dx, j
                                       mov           ent_squarenumberj, dx

                                       mov           cx, i
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, j

                                       add           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, i

                                       add           cx, 2
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber

                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si
                                       mov           q, si
                                      
                                       mov           capturepossible,1

  

    skip_bottom_right_capture:         
                                       jmp           next_iteration

  

  

    ;capture des reines

    process_queen:                     
                                 
    ; Vérification des captures dans les 4 directions diagonales

                                       jmp           check_top_left_captures
    check_top_left_captures_ret:       
                                       jmp           check_top_right_captures
    check_top_right_captures_ret:      
                                       jmp           check_bottom_left_captures
    check_bottom_left_captures_ret:    
                                       jmp           check_bottom_right_captures
    check_bottom_right_captures_ret:   
                                       jmp           next_iteration

  

    ; Vérification des captures en haut à gauche

    check_top_left_captures:           

                                       mov           cx, 1
                                       mov           cxx, cx


    top_left_loop:                     
                                       mov           pointt,cx
                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx, cx
                                       sub           bx,cx

                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_left_loop

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_top_left_loop

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al , currentQueen
                                       cmp           board[bx], al
                                       je            exit_top_left_loop
                                       mov           al, currentPlayer
                                       cmp           board[bx], al
                                       je            exit_top_left_loop
                                      
                                       cmp           board[bx], EMPTY

                                       je            continue_top_left_loop

  

    ; Une pièce opposée a été trouvée
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_top_left_capture
                                       mov           al,opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_top_left_loop

  

    process_top_left_capture:          
                                       mov           dx, i
                                       mov           bx, j

                                       sub           dx, cx
                                       sub           bx,cx
                                       dec           dx

                                       dec           bx

                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_left_loop

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_top_left_loop

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_top_left_loop

  

    ; Capture possible en haut à gauche

                                       mov           si , qatole
                                       mov           dx,i
                                       mov           bx,j
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtole[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqutole
                                       inc           si
                                       mov           jumpsqutole,si

  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_top_left_jumps:         

                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx, cxx
                                       sub           bx,cxx

                                       sub           dx,cx
                                       sub           bx,cx

                                       cmp           dx, 0                                                   ; Vérifier si dx < 1

                                       jle           end_additional_top_left_jumps

                                       cmp           bx, 0                                                   ; Vérifier si bx < 1

                                       jle           end_additional_top_left_jumps

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_top_left_jumps

                                       mov           si,qatole

                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx, cxx
                                       sub           bx,cxx

                                       sub           dx,cx
                                       sub           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtole[si],ax

                                       inc           si

                                       mov           qatole,si

                                       inc           cx

                                       jmp           additional_top_left_jumps

  

    end_additional_top_left_jumps:     
                                       mov           si,qatole
                                       mov           queencapturesqtole[si], -1

                                       inc           si
                                       mov           qatole,si

                                       jmp           exit_top_left_loop

  

    continue_top_left_loop:            
                                       mov           cx , pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            top_left_loop

  

    exit_top_left_loop:                
                                   
                                       jmp           check_top_left_captures_ret

  

    ; Vérification des captures en haut à droite

    check_top_right_captures:          

                                       mov           cx, 1
                                       mov           cxx,cx

    top_right_loop:                    
                                       mov           pointt,cx
                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx,cx

                                       add           bx,cx
                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_right_loop

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_top_right_loop

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                     
                                       mov           al,currentQueen
                                       cmp           board[bx], al

                                       je            exit_top_right_loop
                                       mov           al , currentPlayer
                                       cmp           board[bx], al

                                       je            exit_top_right_loop
                                       cmp           board[bx], EMPTY

                                       je            continue_top_right_loop

  

    ; Une pièce opposée a été trouvée
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_top_right_capture
                                       mov           al, opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_top_right_loop


  

    process_top_right_capture:         
                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx,cx
                                       dec           dx
                                       add           bx,cx
                                       inc           bx
                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_right_loop

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_top_right_loop

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_top_right_loop

  

    ; Capture possible en haut à droite
                                       mov           si , qatori
                                       mov           dx,i
                                       mov           bx,j
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtori[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqutori
                                       inc           si
                                       mov           jumpsqutori,si

  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_top_right_jumps:        

                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx,cxx

                                       add           bx,cxx

                                       sub           dx,cx
                                       add           bx,cx

                                       cmp           dx, 0                                                   ; Vérifier si dx < 1

                                       jle           end_additional_top_right_jumps

                                       cmp           bx, 11                                                  ; Vérifier si bx > 10

                                       jge           end_additional_top_right_jumps

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_top_right_jumps

  
                                       mov           si,qatori
                                       mov           dx, i

                                       mov           bx, j

                                       sub           dx,cxx

                                       add           bx,cxx

                                       sub           dx,cx
                                       add           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtori[si],ax

                                       inc           si

                                       mov           qatori,si

                                       inc           cx

                                       jmp           additional_top_right_jumps

  

    end_additional_top_right_jumps:    
                                       mov           si,qatori
                                       mov           queencapturesqtori[si], -1

                                       inc           si
                                       mov           qatori,si

                                       jmp           exit_top_right_loop

  

    continue_top_right_loop:           

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            top_left_loop

  

    exit_top_right_loop:               
                                     
                                       jmp           check_top_right_captures_ret

  

    ; Vérification des captures en bas à gauche

    check_bottom_left_captures:        

                                       mov           cx, 1
                                       mov           cxx ,cx


    bottom_left_loop:                  
                                       mov           pointt,cx
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cx

                                       sub           bx,cx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_left_loop

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_bottom_left_loop

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                 
                                       mov           al,currentQueen
                                       cmp           board[bx], al

                                       je            exit_bottom_left_loop
                                       mov           al,currentPlayer
                                       cmp           board[bx], al

                                       je            exit_bottom_left_loop
                                    
                                       cmp           board[bx], EMPTY

                                       je            continue_bottom_left_loop

  

    ; Une pièce opposée a été trouvée
                                   
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_bottom_left_capture
                                       mov           al,, opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_bottom_left_loop
                                     

  

    process_bottom_left_capture:       
                                      
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cx
                                       inc           dx

                                       sub           bx,cx
                                       dec           bx
                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_left_loop

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_bottom_left_loop

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_bottom_left_loop

  

    ; Capture possible en bas à gauche
                                       mov           si , qabole
                                       mov           dx,i
                                       mov           bx,j
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubole[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqubole
                                       inc           si
                                       mov           jumpsqubole,si

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_bottom_left_jumps:      

                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cxx

                                       sub           bx,cxx

                                       add           dx,cx
                                       sub           bx,cx

                                       cmp           dx, 11                                                  ; Vérifier si dx < 1

                                       jge           end_additional_bottom_left_jumps

                                       cmp           bx, 0                                                   ; Vérifier si bx > 10

                                       jle           end_additional_bottom_left_jumps

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_bottom_left_jumps

  
                                       mov           si,qabole
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cxx

                                       sub           bx,cxx

                                       add           dx,cx
                                       sub           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubole[si],ax

                                       inc           si

                                       mov           qabole,si

                                       inc           cx

                                       jmp           additional_bottom_left_jumps

  

    end_additional_bottom_left_jumps:  
                                       mov           si,qabole
                                       mov           queencapturesqubole[si], -1

                                       inc           si
                                       mov           qabole,si

                                       jmp           exit_bottom_left_loop

  

    continue_bottom_left_loop:         

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            bottom_left_loop

  

    exit_bottom_left_loop:             
                                     
                                       jmp           check_bottom_left_captures_ret

  



    ; Vérification des captures en bas à droite

    check_bottom_right_captures:       

                                       mov           cx, 1
                                       mov           cxx,cx


    bottom_right_loop:                 
                                       mov           pointt,cx
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cx
                                       add           bx,cx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_right_loop

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_bottom_right_loop

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                   
                                       mov           al, currentQueen
                                       cmp           board[bx], al

                                       je            exit_bottom_right_loop
                                       mov           al,currentPlayer
                                       cmp           board[bx], al

                                       je            exit_bottom_right_loop
                                      
                                       cmp           board[bx], EMPTY

                                       je            continue_bottom_right_loop

  

    ; Une pièce opposée a été trouvée
                                    
                                       mov           al, opponentQueen
                                       cmp           board[bx], al

                                       je            process_bottom_right_capture
                                       mov           al,opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_bottom_right_loop
                                      

  

    process_bottom_right_capture:      
                                      
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cx
                                       inc           dx
                                       add           bx,cx
                                       inc           bx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_right_loop

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_bottom_right_loop

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_bottom_right_loop

  

    ; Capture possible en bas à droite
                                       mov           si , qabori
                                       mov           dx,i
                                       mov           bx,j
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubori[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqubori
                                       inc           si
                                       mov           jumpsqubori,si


  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_bottom_right_jumps:     

                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cxx
                                       add           bx,cxx

                                       add           dx,cx
                                       add           bx,cx

                                       cmp           dx, 11                                                  ; Vérifier si dx > 10

                                       jge           end_additional_bottom_right_jumps

                                       cmp           bx, 11                                                  ; Vérifier si bx > 10

                                       jge           end_additional_bottom_right_jumps

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_bottom_right_jumps

  
                                       mov           si,qabori
                                       mov           dx, i

                                       mov           bx, j

                                       add           dx,cxx
                                       add           bx,cxx
                                       add           dx,cx
                                       add           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubori[si], ax

                                       inc           si

                                       mov           qabori,si

                                       inc           cx

                                       jmp           additional_bottom_right_jumps

  

    end_additional_bottom_right_jumps: 
                                       mov           si,qabori
                                       mov           queencapturesqubori[si], -1

                                       inc           si
                                       mov           qabori,si

                                       jmp           exit_bottom_right_loop

  

    continue_bottom_right_loop:        

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            bottom_right_loop
    

    exit_bottom_right_loop:            
                                       jmp           check_bottom_right_captures_ret

    ;exit

  

    next_iteration:                    
                                       mov           bx,bxx
                                       inc           bx
                                       cmp           bx,50
                                       jl            main_loop

  

    ; Vérification si au moins une capture est possible
                                       mov           ax, capturepossible
                                       cmp           ax, 0

                                       je            return_false
                                       mov           ax, 1

                                       jmp           return

  

    return_false:                      

                                       mov           ax, 0

  

    return:                            
                                       mov           ah,0
                                       mov           sort_Mustcapture,ax
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret

Mustcapture endp

Mustcaptureaftercapture proc

                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx
                                       push          bp
                                       mov           bp, sp


    ; Define registers to hold player and variables
                                       mov           AL, player                                              ; Assuming player value is in register AL

    ; Check for WHITE player
                                       cmp           AL, WHITE
                                       jne           notWhite1                                               ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                       mov           currentPlayer, WHITE_PAWN
                                       mov           currentQueen, WHITE_QUEEN
                                       mov           opponentPiece, BLACK_PAWN
                                       mov           opponentQueen, BLACK_QUEEN
                                       jmp           finish1                                                 ; Jump to the end

    notWhite1:                         
    ; Assign values for BLACK player
                                       mov           currentPlayer, BLACK_PAWN
                                       mov           currentQueen, BLACK_QUEEN
                                       mov           opponentPiece, WHITE_PAWN
                                       mov           opponentQueen, WHITE_QUEEN

    finish1:                           



    ; Initialisation des variables

                                       mov           cx, 0
                                       mov           capturepossible, cx

                                       mov           q, cx

                                       mov           qatole, cx

                                       mov           qatori, cx

                                       mov           qabole, cx

                                       mov           qabori, cx

                                       mov           jumpsqubole, cx

                                       mov           jumpsqubori, cx

                                       mov           jumpsqutole, cx

                                       mov           jumpsqutori, cx

  

    ; Réinitialisation des tableaux

                                       mov           bx, 0

    reset_arrays1:                     

                                       mov           queencapturesqtole[bx], 0

                                       mov           queencapturesqtori[bx], 0

                                       mov           queencapturesqubole[bx], 0

                                       mov           queencapturesqubori[bx], 0

                                       mov           coor[bx], 0

                                       inc           bx
                                       cmp           bx,50
                                       jl            reset_arrays1
  



  

    ; Vérification si c'est un pion ou une reine de la couleur du joueur actuel

                                       

  

    process_piece1:                    

    ; Calcul des coordonnées i et j de la case courante

                                       mov           ax, ent_Mustcaptureaftercapturei
                                       mov           ent_squarenumberi,ax

                                       mov           ax,ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberj,ax

                                       call          getSquareNumber

                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       mov           al,currentPlayer
                                       cmp           board[bx], al

                                       je            start_process_check_color
                                       mov           al,currentQueen
                                       cmp           board[bx], al

                                       jne           exiit_iteration1


  
    start_process_check_color:         
    ; Vérification des captures possibles selon le type de pièce
                                      
                                       mov           al, currentPlayer
                                       cmp           board[bx], al
                                       je            check_pawn_color1

                                       mov           al, currentQueen
                                       cmp           board[bx], al
                                       je            process_queen1
                                       jmp           exiit_iteration1

  

    check_pawn_color1:                 
                                       cmp           player, WHITE

                                       je            process_white_pawn1

                                       jmp           process_black_pawn1

  

  

    ;capture des pions blancs

    process_white_pawn1:               

    ; Vérification de la capture en haut à gauche

                                       cmp           ent_Mustcaptureaftercapturei, 2                         ; Vérifier si i > 1

                                       jl            skip_top_left_capture1

                                       cmp           ent_Mustcaptureaftercapturej, 2                         ; Vérifier si j > 1

                                       jl            skip_top_left_capture1

  

                                       mov           dx, ent_Mustcaptureaftercapturej

                                       dec           dx
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei

                                       dec           cx
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           bx ,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al, opponentPiece

                                       cmp           board[bx], al
                                       je            check_top_left_empty1

                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_top_left_capture1

  

    check_top_left_empty1:             
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei

                                       sub           cx, 2
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_top_left_capture1

  

    ; Capture possible en haut à gauche
                                       mov           si, q

                                       mov           dx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei

                                       sub           cx, 2
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si

                                       mov           q, si

                                       mov           capturepossible,1
  

    skip_top_left_capture1:            
                                      
  

    ; Vérification de la capture en haut à droite

                                       cmp           ent_Mustcaptureaftercapturei, 2                         ; Vérifier si i > 1

                                       jl            skip_top_right_capture1

                                       cmp           ent_Mustcaptureaftercapturej, 9                         ; Vérifier si j < 10

                                       jg            skip_top_right_capture1

  

                                       mov           dx, ent_Mustcaptureaftercapturej

                                       inc           dx
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       dec           cx
                                       mov           ent_squarenumberi,cx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                    
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_top_right_empty1
                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_top_right_capture1

  

    check_top_right_empty1:            
                                     
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       add           dx, 2
                                       mov           ent_squarenumberj,dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       sub           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_top_right_capture1

  

    ; Capture possible en haut à droite

                                       mov           si, q
                                       mov           dx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       add           dx, 2
                                       mov           ent_squarenumberj,dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       sub           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si
                                       mov           q, si

                                       mov           capturepossible,1
  

    skip_top_right_capture1:           
                                      
                                       jmp           exiit_iteration1

  

  

    ;capture pions noirs

    process_black_pawn1:               

    ; Vérification de la capture en bas à gauche

                                       cmp           ent_Mustcaptureaftercapturei, 9                         ; Vérifier si i < 10

                                       jg            skip_bottom_left_capture1

                                       cmp           ent_Mustcaptureaftercapturej, 2                         ; Vérifier si j > 1

                                       jl            skip_bottom_left_capture1

  

                                       mov           dx, ent_Mustcaptureaftercapturej

                                       dec           dx

                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       inc           cx
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_bottom_left_empty1
                                       mov           al , opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_bottom_left_capture1

  

    check_bottom_left_empty1:          
                                      
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       add           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_bottom_left_capture1

  

    ; Capture possible en bas à gauche
                                       mov           si, q

                                       mov           dx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       sub           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       add           cx, 2
                                       mov           ent_squarenumberi,cx
                                       call          getSquareNumber
                                       mov           ax , sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           q, si

                                      
                                       mov           capturepossible, 1

  

    skip_bottom_left_capture1:         

                                  

    ; Vérification de la capture en bas à droite

                                       cmp           ent_Mustcaptureaftercapturei, 9                         ; Vérifier si i < 10

                                       jg            skip_bottom_right_capture1

                                       cmp           ent_Mustcaptureaftercapturej, 9                         ; Vérifier si j < 10

                                       jg            skip_bottom_right_capture1

  

                                       mov           dx, ent_Mustcaptureaftercapturej

                                       inc           dx
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       inc           cx
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                     
                                       mov           al, opponentPiece
                                       cmp           board[bx], al
                                       je            check_bottom_right_empty1

                                       mov           al, opponentQueen
                                       cmp           board[bx], al
                                       jne           skip_bottom_right_capture1


  

    check_bottom_right_empty1:         
                                  
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       add           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       add           cx, 2
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           skip_bottom_right_capture1

  

    ; Capture possible en bas à droite
                                       mov           si, q
                                       mov           dx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberj, dx

                                       mov           cx, ent_Mustcaptureaftercapturei
                                       mov           ent_squarenumberi, cx

                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax
                                       inc           si
                                       mov           dx, ent_Mustcaptureaftercapturej

                                       add           dx, 2
                                       mov           ent_squarenumberj, dx
                                       mov           cx, ent_Mustcaptureaftercapturei

                                       add           cx, 2
                                       mov           ent_squarenumberi, cx
                                       call          getSquareNumber

                                       mov           ax,sort_getSquareNumber
                                       mov           coor[si], ax

                                       inc           si
                                       mov           q, si
                                      
                                       mov           capturepossible,1

  

    skip_bottom_right_capture1:        
                                       jmp           exiit_iteration1

  

  

    ;capture des reines

    process_queen1:                    
                                 
    ; Vérification des captures dans les 4 directions diagonales

                                       jmp           check_top_left_captures1
    check_top_left_captures1_ret1:     
                                       jmp           check_top_right_captures1
    check_top_right_captures1_ret1:    
                                       jmp           check_bottom_left_captures1
    check_bottom_left_captures1_ret1:  
                                       jmp           check_bottom_right_captures1
    check_bottom_right_captures1_ret1: 
                                       jmp           exiit_iteration1

  

    ; Vérification des captures en haut à gauche

    check_top_left_captures1:          

                                       mov           cx, 1
                                       mov           cxx, cx


    top_left_loop1:                    
                                       mov           pointt,cx
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx, cx
                                       sub           bx,cx

                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_left_loop1

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_top_left_loop1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                      
                                       mov           al , currentQueen
                                       cmp           board[bx], al
                                       je            exit_top_left_loop1
                                       mov           al, currentPlayer
                                       cmp           board[bx], al
                                       je            exit_top_left_loop1
                                      
                                       cmp           board[bx], EMPTY

                                       je            continue_top_left_loop1

  

    ; Une pièce opposée a été trouvée
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_top_left_capture1
                                       mov           al,opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_top_left_loop1

  

    process_top_left_capture1:         
                                       mov           dx, ent_Mustcaptureaftercapturei
                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx, cx
                                       sub           bx,cx
                                       dec           dx

                                       dec           bx

                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_left_loop1

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_top_left_loop1

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx , sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_top_left_loop1

  

    ; Capture possible en haut à gauche

                                       mov           si , qatole
                                       mov           dx, ent_Mustcaptureaftercapturei
                                       mov           bx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtole[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqutole
                                       inc           si
                                       mov           jumpsqutole,si

  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_top_left_jumps1:        

                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx, cxx
                                       sub           bx,cxx

                                       sub           dx,cx
                                       sub           bx,cx

                                       cmp           dx, 0                                                   ; Vérifier si dx < 1

                                       jle           end_additional_top_left_jumps1

                                       cmp           bx, 0                                                   ; Vérifier si bx < 1

                                       jle           end_additional_top_left_jumps1

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_top_left_jumps1

                                       mov           si,qatole

                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx, cxx
                                       sub           bx,cxx

                                       sub           dx,cx
                                       sub           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtole[si],ax

                                       inc           si

                                       mov           qatole,si

                                       inc           cx

                                       jmp           additional_top_left_jumps1

  

    end_additional_top_left_jumps1:    
                                       mov           si,qatole
                                       mov           queencapturesqtole[si], -1

                                       inc           si
                                       mov           qatole,si

                                       jmp           exit_top_left_loop1

  

    continue_top_left_loop1:           
                                       mov           cx , pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            top_left_loop1

  

    exit_top_left_loop1:               
                                   
                                       jmp           check_top_left_captures1_ret1

  

    ; Vérification des captures en haut à droite

    check_top_right_captures1:         

                                       mov           cx, 1
                                       mov           cxx,cx

    top_right_loop1:                   
                                       mov           pointt,cx
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx,cx

                                       add           bx,cx
                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_right_loop1

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_top_right_loop1

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                     
                                       mov           al,currentQueen
                                       cmp           board[bx], al

                                       je            exit_top_right_loop1
                                       mov           al , currentPlayer
                                       cmp           board[bx], al

                                       je            exit_top_right_loop1
                                       cmp           board[bx], EMPTY

                                       je            continue_top_right_loop1

  

    ; Une pièce opposée a été trouvée
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_top_right_capture1
                                       mov           al, opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_top_right_loop1


  

    process_top_right_capture1:        
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx,cx
                                       dec           dx
                                       add           bx,cx
                                       inc           bx
                                       cmp           dx, 1                                                   ; Vérifier si dx < 1

                                       jl            exit_top_right_loop1

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_top_right_loop1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_top_right_loop1

  

    ; Capture possible en haut à droite
                                       mov           si , qatori
                                       mov           dx, ent_Mustcaptureaftercapturei
                                       mov           bx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtori[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqutori
                                       inc           si
                                       mov           jumpsqutori,si

  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_top_right_jumps1:       

                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx,cxx

                                       add           bx,cxx

                                       sub           dx,cx
                                       add           bx,cx

                                       cmp           dx, 0                                                   ; Vérifier si dx < 1

                                       jle           end_additional_top_right_jumps1

                                       cmp           bx, 11                                                  ; Vérifier si bx > 10

                                       jge           end_additional_top_right_jumps1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_top_right_jumps1

  
                                       mov           si,qatori
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       sub           dx,cxx

                                       add           bx,cxx

                                       sub           dx,cx
                                       add           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqtori[si],ax

                                       inc           si

                                       mov           qatori,si

                                       inc           cx

                                       jmp           additional_top_right_jumps1

  

    end_additional_top_right_jumps1:   
                                       mov           si,qatori
                                       mov           queencapturesqtori[si], -1

                                       inc           si
                                       mov           qatori,si

                                       jmp           exit_top_right_loop1

  

    continue_top_right_loop1:          

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            top_left_loop1

  

    exit_top_right_loop1:              
                                     
                                       jmp           check_top_right_captures1_ret1

  

    ; Vérification des captures en bas à gauche

    check_bottom_left_captures1:       

                                       mov           cx, 1
                                       mov           cxx ,cx


    bottom_left_loop1:                 
                                       mov           pointt,cx
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cx

                                       sub           bx,cx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_left_loop1

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_bottom_left_loop1

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                 
                                       mov           al,currentQueen
                                       cmp           board[bx], al

                                       je            exit_bottom_left_loop1
                                       mov           al,currentPlayer
                                       cmp           board[bx], al

                                       je            exit_bottom_left_loop1
                                    
                                       cmp           board[bx], EMPTY

                                       je            continue_bottom_left_loop1

  

    ; Une pièce opposée a été trouvée
                                   
                                       mov           al,opponentQueen
                                       cmp           board[bx], al

                                       je            process_bottom_left_capture1
                                       mov           al,, opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_bottom_left_loop1
                                     

  

    process_bottom_left_capture1:      
                                      
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cx
                                       inc           dx

                                       sub           bx,cx
                                       dec           bx
                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_left_loop1

                                       cmp           bx, 1                                                   ; Vérifier si bx < 1

                                       jl            exit_bottom_left_loop1

  
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_bottom_left_loop1

  

    ; Capture possible en bas à gauche
                                       mov           si , qabole
                                       mov           dx, ent_Mustcaptureaftercapturei
                                       mov           bx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubole[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqubole
                                       inc           si
                                       mov           jumpsqubole,si

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_bottom_left_jumps1:     

                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cxx

                                       sub           bx,cxx

                                       add           dx,cx
                                       sub           bx,cx

                                       cmp           dx, 11                                                  ; Vérifier si dx < 1

                                       jge           end_additional_bottom_left_jumps1

                                       cmp           bx, 0                                                   ; Vérifier si bx > 10

                                       jle           end_additional_bottom_left_jumps1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_bottom_left_jumps1

  
                                       mov           si,qabole
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cxx

                                       sub           bx,cxx

                                       add           dx,cx
                                       sub           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubole[si],ax

                                       inc           si

                                       mov           qabole,si

                                       inc           cx

                                       jmp           additional_bottom_left_jumps1

  

    end_additional_bottom_left_jumps1: 
                                       mov           si,qabole
                                       mov           queencapturesqubole[si], -1

                                       inc           si
                                       mov           qabole,si

                                       jmp           exit_bottom_left_loop1

  

    continue_bottom_left_loop1:        

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            bottom_left_loop1

  

    exit_bottom_left_loop1:            
                                     
                                       jmp           check_bottom_left_captures1_ret1

  



    ; Vérification des captures en bas à droite

    check_bottom_right_captures1:      

                                       mov           cx, 1
                                       mov           cxx,cx


    bottom_right_loop1:                
                                       mov           pointt,cx
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cx
                                       add           bx,cx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_right_loop1

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_bottom_right_loop1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                   
                                       mov           al, currentQueen
                                       cmp           board[bx], al

                                       je            exit_bottom_right_loop1
                                       mov           al,currentPlayer
                                       cmp           board[bx], al

                                       je            exit_bottom_right_loop1
                                      
                                       cmp           board[bx], EMPTY

                                       je            continue_bottom_right_loop1

  

    ; Une pièce opposée a été trouvée
                                    
                                       mov           al, opponentQueen
                                       cmp           board[bx], al

                                       je            process_bottom_right_capture1
                                       mov           al,opponentPiece
                                       cmp           board[bx], al

                                       jne           exit_bottom_right_loop1
                                      

  

    process_bottom_right_capture1:     
                                      
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cx
                                       inc           dx
                                       add           bx,cx
                                       inc           bx

                                       cmp           dx, 10                                                  ; Vérifier si dx > 10

                                       jg            exit_bottom_right_loop1

                                       cmp           bx, 10                                                  ; Vérifier si bx > 10

                                       jg            exit_bottom_right_loop1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           exit_bottom_right_loop1

  

    ; Capture possible en bas à droite
                                       mov           si , qabori
                                       mov           dx, ent_Mustcaptureaftercapturei
                                       mov           bx, ent_Mustcaptureaftercapturej
                                       mov           ent_squarenumberi,dx
                                       mov           ent_squarenumberj,bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubori[si],ax
                                       inc           si
                                       mov           capturepossible,1
                                       mov           si,jumpsqubori
                                       inc           si
                                       mov           jumpsqubori,si


  

    ; Vérifier les sauts supplémentaires

                                       mov           cx, 1

    additional_bottom_right_jumps1:    

                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cxx
                                       add           bx,cxx

                                       add           dx,cx
                                       add           bx,cx

                                       cmp           dx, 11                                                  ; Vérifier si dx > 10

                                       jge           end_additional_bottom_right_jumps1

                                       cmp           bx, 11                                                  ; Vérifier si bx > 10

                                       jge           end_additional_bottom_right_jumps1

                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx

                                       call          getSquareNumber
                                       mov           bx,sort_getSquareNumber
                                       dec           bx
                                       cmp           board[bx], EMPTY

                                       jne           end_additional_bottom_right_jumps1

  
                                       mov           si,qabori
                                       mov           dx, ent_Mustcaptureaftercapturei

                                       mov           bx, ent_Mustcaptureaftercapturej

                                       add           dx,cxx
                                       add           bx,cxx
                                       add           dx,cx
                                       add           bx,cx
                                       mov           ent_squarenumberi, dx
                                       mov           ent_squarenumberj, bx
                                       call          getSquareNumber
                                       mov           ax,sort_getSquareNumber
                                       mov           queencapturesqubori[si], ax

                                       inc           si

                                       mov           qabori,si

                                       inc           cx

                                       jmp           additional_bottom_right_jumps1

  

    end_additional_bottom_right_jumps1:
                                       mov           si,qabori
                                       mov           queencapturesqubori[si], -1

                                       inc           si
                                       mov           qabori,si

                                       jmp           exit_bottom_right_loop1

  

    continue_bottom_right_loop1:       

                                       mov           cx,pointt
                                       inc           cx
                                       cmp           cx,10
                                       jl            bottom_right_loop1
    

    exit_bottom_right_loop1:           
                                       jmp           check_bottom_right_captures1_ret1

    ;exit

  

    exiit_iteration1:                  

  

    ; Vérification si au moins une capture est possible
                                       mov           ax, capturepossible
                                       cmp           ax, 0

                                       je            return1_false1
                                       mov           ax, 1

                                       jmp           return1

  

    return1_false1:                    

                                       mov           ax, 0

  

    return1:                           
                                       mov           ah,0
                                       mov           sort_Mustcaptureaftercapture,ax
                                       pop           bp
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret

Mustcaptureaftercapture endp


puts proc    near
                                       push          ax
                                       mov           ah, 09h
                                       int           21h
                                       pop           ax
                                       ret
puts endp

read_char proc    near
                                       push          ax
                                       mov           ah, 01h
                                       int           21h
                                       pop           ax
                                       ret
read_char endp

read_int proc
                                       push          bx
                                       push          cx
                                       push          dx
    
                                       xor           bx, bx
    
    read_loop:                         
                                       mov           ah, 01h
                                       int           21h
                                       cmp           al, 0Dh                                                 ; Check for Enter key
                                       je            read_done
    
                                       sub           al, '0'
                                       push          ax
                                       mov           ax, bx
                                       mov           bx, 10
                                       mul           bx
                                       mov           bx, ax
                                       pop           ax
                                       add           bx, ax
                                       jmp           read_loop
    
    read_done:                         
                                       mov           ax, bx
                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       ret
    
read_int endp

scan_num proc    near
                                       push          ax
                                       push          bx
                                       push          cx
                                       push          dx

                                       xor           cx, cx

    ; reset flag:
                                       mov           make_minus, 0

    next_digit:                        

                                       call          read_char

    ; check for minus:
                                       cmp           al, '-'
                                       je            set_minus

    ; check for enter key:
                                       cmp           al, cr
                                       je            stop_input

    ; multiply cx by 10 (first time the result is zero)
                                       push          ax
                                       mov           ax, cx
                                       mul           ten                                                     ; dx:ax = ax*10
                                       mov           cx, ax
                                       pop           ax

    ; check if the number is too big
    ; (result should be 16 bits)
                                       cmp           dx, 0
                                       jne           out_of_range

    ; convert from ascii code:
                                       sub           al, 30h

    ; add al to cx:
                                       xor           ah, ah
                                       add           cx, ax
                                       jc            out_of_range                                            ; jump if the number is too big.

                                       jmp           next_digit

    set_minus:                         
                                       mov           make_minus, 1
                                       jmp           next_digit

    out_of_range:                      
                                       lea           dx, error
                                       call          puts

    stop_input:                        
    ; check flag:
                                       cmp           make_minus, 0
                                       je            not_minus
                                       neg           cx
    not_minus:                         

                                       pop           dx
                                       pop           cx
                                       pop           bx
                                       pop           ax
                                       ret
scan_num endp

print_decimal proc
                                       push          ax                                                      ; Sauvegarder la valeur initiale de AX
                                       push          bx                                                      ; Sauvegarder la valeur de BX
                                       push          cx                                                      ; Sauvegarder la valeur de CX
                                       push          dx                                                      ; Sauvegarder la valeur de DX

                                       xor           cx, cx                                                  ; Initialiser CX à 0 (utilisé comme compteur)
                                       mov           bx, 10                                                  ; Diviseur pour la conversion en décimal

    convertloop:                       
                                       xor           dx, dx                                                  ; Initialiser DX à 0
                                       div           bx                                                      ; Diviser AX par 10 (quotient dans AX, reste dans DX)
                                       push          dx                                                      ; Empiler le reste (chiffre)
                                       inc           cx                                                      ; Incrémenter le compteur
                                       cmp           ax, 0                                                   ; Vérifier si le quotient est nul
                                       jnz           convertloop                                             ; Continuer la boucle si le quotient n'est pas nul

    print_digits:                      
                                       pop           dx                                                      ; Dépiler un chiffre
                                       add           dl, '0'                                                 ; Convertir le chiffre en caractère ASCII
                                       mov           ah, 2                                                   ; Fonction d'affichage d'un caractère
                                       int           21h                                                     ; Afficher le caractère
                                       loop          print_digits                                            ; Répéter jusqu'à ce que tous les chiffres soient affichés

                                       pop           dx                                                      ; Restaurer la valeur de DX
                                       pop           cx                                                      ; Restaurer la valeur de CX
                                       pop           bx                                                      ; Restaurer la valeur de BX
                                       pop           ax                                                      ; Restaurer la valeur initiale de AX
                                       ret
print_decimal endp



CODE ENDS
END