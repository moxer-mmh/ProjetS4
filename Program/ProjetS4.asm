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


    menu_msg                     db  'Menu :', 10, 13
                                 db  '1. Deplacer un pion', 10, 13
                                 db  '2. Afficher ', 10, 13
                                 db  '3. Afficher score', 10, 13
                                 db  '0. Quitter', 10, 13
                                 db  'Votre choix : $'

    turn_msg_white               db  'Tour du joueur W', '$'
    turn_msg_black               db  'Tour du joueur B', '$'
    
    pion_msg                     db  'Entrez les coordonnees du pion a deplacer (i, j) : $'
    arrivee_msg                  db  'Entrez les coordonnees de la case darrivee (x, y) : $'
    choix_invalid_msg            db  'Choix invalide.', 10, 13, '$'
    
    score_msg_black              db  'Black Score' , 10, 13, '$'
    score_msg_white              db  'White Score' , 10, 13, '$'
    
    quit_msg                     db  'le joueur %c a quitter la game. Player %c wins!', 10, 13, '$'

    
    white_win                    db  'le joueur W a atteint 20! Le joueur W gagne le jeu!', 10, 13, '$'
    black_win                    db  'le joueur B a atteint 20! Le joueur B gagne le jeu!', 10, 13, '$'
    
    no_pieces                    db  'le joueur %c na plus de pions ou de dame! Le joueur %c gagne le jeu!', 10, 13, '$'
    
    draw_msg                     db  'le jeu est bloque, il ny a pas de gagnant.', 10, 13, '$'
    msg_no_whitepieces           db  'le joueur W n a plus de pions ou de dame! Le joueur B gagne le jeu!', 10, 13, '$'
    msg_no_blackpieces           db  'le joueur B n a plus de pions ou de dame! Le joueur W gagne le jeu!', 10, 13, '$'
    msg_bloque                   db  'le jeu est bloque, il n y a pas de gagnant', 10, 13, '$'
    msg_exit_before_game_ends    db  'Le joueur adverse a gagner ', 10, 13, '$'

    choix                        dw  ?
    imain                        dw  ?
    jmain                        dw  ?
    xmain                        dw  ?
    ymain                        dw  ?
    
    whitepieces                  dw  0
    blackpieces                  dw  0
    numWhitePawns                dw  0
    numBlackPawns                dw  0
    
    whiteHasOnlyQueens           dw  1
    blackHasOnlyQueens           dw  1
    
    startSquareNumber            dw  ?
    endSquareNumber              dw  ?
    jumpedSquareNumber           dw  ?
    captureaftercapture          dw  50 dup(?)
    s                            dw  ?
    t                            dw  ?

DATA ENDS

CODE SEGMENT PARA 'CODE'
main proc
                                                           mov  ax, DATA                                                  ; Charger la valeur de DATA dans AX
                                                           mov  ds, ax                                                    ; D placer AX dans DS pour acc der aux donn es
    
    ; Appeler InitialiserDamier et AfficherDamier
    
                                                           call InitialiserDamier                                         ; Appeler la proc dure InitialiserDamier
                                                           call AfficherDamier                                            ; Appeler la proc dure AfficherDamier
                                       
                                                           lea  dx,newline
                                                           call puts
                                       
    ;call          AfficherDamier
    
    game_loop:                                             
    ; Imprimer un s parateur
                                                           lea  dx, newline                                               ; Charger l'adresse de newline dans DX
                                                           call puts                                                      ; Appeler l'interruption 21h pour afficher la cha ne
    
    ; Imprimer le tour du joueur
                                                           mov  al,player
                                                           cmp  al, WHITE                                                 ; Comparer player avec la valeur de WHITE
                                                           je   print_white_turn                                          ; Sauter   print_white_turn si player == WHITE
                                                           lea  dx, turn_msg_black                                        ; Charger l'adresse de la cha ne pour le joueur Noir
                                                           jmp  print_turn
    print_white_turn:                                      
                                                           lea  dx, turn_msg_white                                        ; Charger l'adresse de la cha ne pour le joueur Blanc                                                 ; Charger 'W' dans DL
    print_turn:                                            
                                                           call puts
                                                           lea  dx, newline                                               ; Charger l'adresse de la nouvelle ligne
                                                           call puts                                                      ; Afficher une nouvelle ligne                                                   ; Appeler   nouveau pour afficher un caract re de nouvelle ligne
										
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Black_Move

    ; Imprimer le menu
                                                           lea  dx, menu_msg                                              ; Charger l'adresse de menu_msg dans DX
                                                           call puts                                                      ; Appeler l'interruption 21h pour afficher la cha ne
    
    ; Lire le choix de l'utilisateur
                                                           call scan_num                                                  ; Appeler la proc dure read_int pour lire un entier
                                                           mov  choix, cx                                                 ; Stocker la valeur num rique dans choix
    
    ; G rer le choix de l'utilisateur
                                                           cmp  choix, 1                                                  ; Comparer choix avec 1
                                                           je   move_pion                                                 ; Sauter   move_pion si choix == 1
                                                           cmp  choix, 2                                                  ; Comparer choix avec 2
                                                           je   afficher_damier                                           ; Sauter   afficher_damier si choix == 2
                                                           cmp  choix, 3                                                  ; Comparer choix avec 3
                                                           je   afficher_score                                            ; Sauter   afficher_score si choix == 3
                                                           cmp  choix, 0                                                  ; Comparer choix avec 0
                                                           je   Game_conditions                                           ; Sauter   quit_game si choix == 0
    
    ; Choix invalide
                                       
                                                           lea  dx, choix_invalid_msg                                     ; Charger l'adresse de choix_invalid_msg dans DX
                                                           call puts
                                                           jmp  game_loop                                                 ; Retourner   game_loop
    
    move_pion:                                             
    ; Lire les coordonn es du pion
                                                           lea  dx, pion_msg                                              ; Charger l'adresse de pion_msg dans DX
                                                           call puts                                                      ; Appeler l'interruption 21h pour afficher la cha ne
    
                                                           call scan_num                                                  ; Appeler la proc dure read_int pour lire un entier
                                                           mov  imain, cx                                                 ; Stocker la valeur lue dans imain
    
                                                           call scan_num                                                  ; Appeler   nouveau read_int pour lire un autre entier
                                                           mov  jmain, cx                                                 ; Stocker la valeur lue dans jmain
    
    ; Lire les coordonn es d'arriv e
                                                           lea  dx, arrivee_msg                                           ; Charger l'adresse de arrivee_msg dans DX
                                                           call puts                                                      ; Appeler l'interruption 21h pour afficher la cha ne
    
                                                           call scan_num                                                  ; Appeler read_int pour lire un entier
                                                           mov  xmain, cx                                                 ; Stocker la valeur lue dans xmain
    
                                                           call scan_num                                                  ; Appeler   nouveau read_int pour lire un autre entier
                                                           mov  ymain, cx                                                 ; Stocker la valeur lue dans ymain
    
    ; Appeler Deplacer
                                                           mov  ax,imain
                                                           mov  ent_deplaceri,ax

                                                           mov  ax,jmain
                                                           mov  ent_deplacerj,ax

                                                           mov  ax,xmain
                                                           mov  ent_deplacerx,ax

                                                           mov  ax,ymain
                                                           mov  ent_deplacery,ax

                                                           call deplacer                                                  ; Appeler la proc dure deplacer
    
    ; V rifier la valeur de retour et afficher le damier
                                                           cmp  sort_deplacer, 1                                          ; Comparer la valeur de retour avec 1
                                                           jne  Game_conditions                                           ; Retourner   game_loop si la valeur n'est pas  gale   1
                                                           call AfficherDamier                                            ; Sinon, appeler AfficherDamier
                                                           jmp  Game_conditions                                           ; Retourner   game_loop
    
    afficher_damier:                                       
                                                           call AfficherDamier                                            ; Appeler la proc dure AfficherDamier
                                                           jmp  Game_conditions                                           ; Retourner   game_loop
    
    afficher_score:                                        
    ; Imprimer le message de score
    ; Afficher le message   Black Score :
                                                           lea  dx,newline
                                                           call puts
                                       
                                                           lea  dx,score_msg_black
                                                           call puts
                                             
                                                           lea  dx,newline
                                                           call puts


    ; Convertir et afficher le score de Black
                                                           mov  ax, scoreBlack
                                                           call PrintNumber
									
                                                           lea  dx,newline
                                                           call puts

    ; Afficher le message           White Score :
                                                           lea  dx,score_msg_white
                                                           call puts
									
                                                           lea  dx,newline
                                                           call puts

    ; Convertir et afficher le score de White
                                                           Mov  ax, scoreWhite
                                                           call PrintNumber
									
									

    ; Afficher le retour   la ligne
                                                           lea  dx,newline
                                                           call puts

                                                           jmp  Game_conditions
    

    Black_Move:                                            
    ;call generateAIMove
                                                           call AfficherDamier


    Game_conditions:                                       

                                                           cmp  choix,0
                                                           je   exit_0

                                                           mov  ax, scoreWhite
                                                           cmp  ax, 20
                                                           jl   check_black_score                                         ; Sauter   check_black_score si scoreWhite < 20

    ; Afficher le message de victoire pour le joueur W
                                                           lea  dx, white_win
                                                           call puts

                                                           jmp  exit_main                                                 ; Quitter

    check_black_score:                                     
                                                           mov  ax, scoreBlack
                                                           cmp  ax, 20
                                                           jl   check_other_conditions                                    ; Sauter   check_other_conditions si scoreBlack < 20

    ; Afficher le message de victoire pour le joueur B
                                                           lea  dx, black_win
                                                           call puts

                                                           jmp  exit_main                                                 ; Quitter le jeu

    check_other_conditions:                                
    ; Initialiser les compteurs de pi ces a 0
                                                           xor  ax, ax
                                                           mov  whitepieces, ax
                                                           mov  blackpieces, ax

    ; Boucle pour parcourir le plateau de jeu
                                                           mov  cx, 50                                                    ; Nombre de cases sur le plateau
                                                           xor  si, si                                                    ; Initialiser l'index du tableau   0

    loop_count_pieces:                                     
                                                           mov  al, board[si]                                             ; Charger la valeur de la case actuelle
                                                           cmp  al,WHITE_PAWN
                                                           je   increment_whitepieces
                                                           cmp  al, WHITE_QUEEN
                                                           je   increment_whitepieces
                                                           cmp  al,BLACK_PAWN
                                                           je   increment_blackpieces
                                                           cmp  al,BLACK_QUEEN
                                                           je   increment_blackpieces
								
                                                           jmp  next_piece

    increment_whitepieces:                                 
                                                           mov  ax,whitepieces
                                                           inc  ax
                                                           mov  whitepieces,ax
                                                           jmp  next_piece

    increment_blackpieces:                                 
                                                           mov  ax,blackpieces
                                                           inc  ax
                                                           mov  blackpieces,ax


    next_piece:                                            
                                                           inc  si
                                                           loop loop_count_pieces


                                                           mov  ax,whitepieces
                                                           cmp  ax,0
                                                           jne  check_black_pieces

                                                           lea  dx,msg_no_whitepieces
                                                           call puts
                                                           jmp  exit_main


    check_black_pieces:                                    
                                                           mov  ax,blackpieces
                                                           cmp  ax,0
                                                           jne  check_another_other_conditions

                                                           lea  dx,msg_no_blackpieces
                                                           call puts
                                                           jmp  exit_main

    check_another_other_conditions:                        

                                                           mov  ax, 1
                                                           mov  whiteHasOnlyQueens, ax
                                                           mov  blackHasOnlyQueens, ax

                                                           mov  ax,0
                                                           mov  numWhitePawns,ax
                                                           mov  numBlackPawns,ax

                                                           mov  cx,50
                                                           xor  si,si

    loop_count_pieces2:                                    
                                                           mov  al,board[si]
                                                           cmp  al,WHITE_PAWN
                                                           jne  skip_white_pawn

                                                           mov  ax,0
                                                           mov  whiteHasOnlyQueens,ax

                                                           mov  ax,numWhitePawns
                                                           inc  ax
                                                           mov  numWhitePawns,ax

    skip_white_pawn:                                       
                                                           mov  al,board[si]
                                                           cmp  al, BLACK_PAWN
                                                           jne  skip_black_pawn

                                                           mov  ax,0
                                                           mov  blackHasOnlyQueens, ax
							
                                                           mov  ax,numBlackPawns
                                                           inc  ax
                                                           mov  numBlackPawns,ax

    skip_black_pawn:                                       
                                                           inc  si
                                                           loop loop_count_pieces2

    ;verifier les conditions qui restes

                                                           mov  ax, whiteHasOnlyQueens
                                                           and  ax, blackHasOnlyQueens
                                                           and  ax, capturepossible                                       ; ax = 0 si whiteHasOnlyQueens && blackHasOnlyQueens && capturepossible == 0
                                                           jnz  reset_move_counter

                                                           mov  ax,movesSinceLastCapture
                                                           inc  ax
                                                           mov  movesSinceLastCapture,ax

                                                           cmp  ax,6
                                                           jl   exit_main

                                                           lea  dx,msg_bloque
                                                           call puts
                                                           jmp  exit_main


    reset_move_counter:                                    
                                                           mov  ax,0
                                                           mov  movesSinceLastCapture,ax

                                                           jmp  game_loop

    exit_0:                                                
                                                           lea  dx,msg_exit_before_game_ends
                                                           call puts


    exit_main:                                             
                                                           ret                                                            ; Appeler l'interruption 21h pour quitter

main endp

getRow proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp

    ; Initialiser le pointeur de base
                                                           mov  bp, sp

    ; D placer la valeur de N dans ax
                                                           mov  ax, N

    ; V rifier si N est inf rieur   1
                                                           cmp  al, 1
                                                           jl   errorgetRow

    ; V rifier si N est sup rieur   50
                                                           cmp  al, 50
                                                           jg   errorgetRow

    ; Soustraire 1 de N (car les rang es sont index es   partir de 0)
                                                           sub  al, 1

    ; Effacer le demi-registre sup rieur de ax
                                                           mov  ah, 0

    ; Diviser N par 5 pour obtenir le num ro de rang e
                                                           mov  bl, 5
                                                           div  bl

    ; Ajouter 1 au num ro de rang e (car nous avons soustrait 1 pr c demment)
                                                           add  al, 1

    ; Sauter   donegetRow pour  viter la gestion des erreurs
                                                           jmp  donegetRow

    errorgetRow:                                           
    ; Imprimer une nouvelle ligne
                                                           lea  dx, newline
                                                           call puts

    ; Imprimer un message d'erreur
                                                           lea  dx, error1
                                                           call puts

    ; D finir la valeur de retour   0 (indiquant une erreur)
                                                           mov  ax, 0

    donegetRow:                                            
    ; Effacer le demi-registre sup rieur de ax (au cas o  il a  t  modifi  lors de la gestion des erreurs)
                                                           mov  ah, 0

    ; Stocker le num ro de rang e dans la variable sort_getRow
                                                           mov  sort_getRow, ax

    ; Restaurer les valeurs des registres depuis la pile
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax

    ; Retourner de la proc dure
                                                           ret
getRow endp

getColumn proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; D placer la valeur de N dans ax
                                                           mov  ax, N
    
    ; V rifier si N est inf rieur   1
                                                           cmp  al, 1
                                                           jl   errorgetcolumn
    
    ; V rifier si N est sup rieur   50
                                                           cmp  al, 50
                                                           jg   errorgetcolumn

    ; Appeler la fonction getRow pour v rifier si la rang e est paire ou impaire
                                                           push ax                                                        ; Sauvegarder N sur la pile
                                                           call getRow
                                                           mov  ax,sort_getRow                                            ; AX contient maintenant la valeur de la rang e
                                                           pop  bx                                                        ; Restaurer N dans le registre BX

    ; V rifier si la rang e est paire ou impaire
                                                           test al, 1                                                     ; V rifier si le bit de poids faible est d fini
                                                           jnz  odd_row                                                   ; Sauter   odd_row si la rang e est impaire

    ; Rang e paire
                                                           mov  ax, N                                                     ; D placer N dans le registre AX
                                                           mov  cl, 10                                                    ; D finir CL   10 pour la division
                                                           mov  dx, 0
                                                           div  cl                                                        ; Diviser AX par 10 (quotient dans AX, reste dans DL)
                                                           cmp  ah, 0                                                     ; V rifier si le reste est 0
                                                           je   last_column                                               ; Sauter   last_column si le reste est 0

    ; Calculer la valeur de colonne pour une rang e paire
                                                           mov  ax, N
                                                           mov  cl, 10
                                                           mov  dx, 0
                                                           div  cl
                                                           mov  al, ah
                                                           mov  ah, 0
                                                           mov  cx, 2
                                                           mul  cx
                                                           sub  ax, 11
                                                           jmp  done_column                                               ; Sauter   done_column

    odd_row:                                               
    ; Rang e impaire
                                                           mov  ax, N
                                                           mov  cl, 10
                                                           mov  dx, 0
                                                           div  cl
                                                           mov  al, ah
                                                           mov  ah, 0
                                                           mov  cx, 2
                                                           mul  cx
                                                           jmp  done_column                                               ; Sauter   done_column

    last_column:                                           
                                                           mov  ax, 9                                                     ; D finir la valeur de colonne   9 pour la derni re colonne
                                                           jmp  done_column

    errorgetcolumn:                                        
                                                           lea  dx, newline
                                                           call puts

                                                           lea  dx, error1
                                                           call puts
                                                           mov  ax, 0

    done_column:                                           
                                                           mov  ah, 0
                                                           mov  sort_getColumn, ax                                        ; Stocker la valeur de colonne dans la variable sort_getColumn
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret

getColumn endp

getSquareNumber proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; D placer les valeurs de ent_squarenumberi et ent_squarenumberj dans ax et bx
                                                           mov  ax, ent_squarenumberi
                                                           mov  bx, ent_squarenumberj

    ; V rifier si les valeurs sont en dehors de la plage [1, 10]
                                                           cmp  al, 1
                                                           jl   errorgetSquareNumber
                                                           cmp  al, 10
                                                           jg   errorgetSquareNumber

                                                           cmp  bl, 1
                                                           jl   errorgetSquareNumber
                                                           cmp  bl, 10
                                                           jg   errorgetSquareNumber

    ; Calculer le num ro de la case
                                                           add  al, bl
                                                           mov  ah, 0
                                                           mov  bl, 2
                                                           div  bl

    ; V rifier si la case est blanche
                                                           cmp  ah, 0
                                                           je   msgcaseblanche

    ; Calculer le num ro de la case pour une case noire
                                                           mov  dx, ent_squarenumberi
                                                           sub  dl, 1
                                                           mov  al, dl
                                                           mov  bl, 5
                                                           mul  bl

                                                           mov  dx, ent_squarenumberj
                                                           add  dl, 1
                                                           mov  cx, ax
                                                           mov  ax, dx
                                                           mov  ah, 0
                                                           mov  bl, 2
                                                           div  bl
                                                           add  ax, cx

                                                           jmp  donegetSquareNumber

    errorgetSquareNumber:                                  
    ; Imprimer un message d'erreur
                                                           lea  dx, newline
                                                           call puts
                                                           lea  dx, error2
                                                           call puts
                                                           mov  ax, 0
                                                           jmp  donegetSquareNumber

    msgcaseblanche:                                        
    ; Cas sp cial pour une case blanche
                                                           mov  ax, 0

    donegetSquareNumber:                                   
                                                           mov  ah, 0
                                                           mov  sort_getSquareNumber, ax                                  ; Stocker le r sultat dans sort_getSquareNumber
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
getSquareNumber endp

getSquareColor proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; D placer les valeurs de ent_squarecolori et ent_squarecolorj dans ax et bx
                                                           mov  ax, ent_squarecolori
                                                           mov  bx, ent_squarecolorj

    ; Appeler getSquareNumber pour obtenir le num ro de la case
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           cmp  ax, 0
                                                           je   white_square

    ; Cas d'une case noire
                                                           mov  ax, BLACK
                                                           jmp  done_color

    white_square:                                          
    ; V rifier si les valeurs sont dans la plage [1, 10]
                                                           mov  ax, ent_squarecolori
                                                           mov  bx, ent_squarecolorj

                                                           cmp  al, 1
                                                           jl   done_color
                                                           cmp  al, 10
                                                           jg   done_color

                                                           cmp  bl, 1
                                                           jl   done_color
                                                           cmp  bl, 10
                                                           jg   done_color

    ; Cas d'une case blanche
                                                           mov  ax, WHITE

    done_color:                                            
                                                           mov  sort_getSquareColor, ax                                   ; Stocker le r sultat dans sort_getSquareColor
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
getSquareColor endp

getSquareState proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; D placer les valeurs de ent_squarestatei et ent_squarestatej dans ax et bx
                                                           mov  ax, ent_squarestatei
                                                           mov  bx, ent_squarestatej

    ; Appeler getSquareNumber pour obtenir le num ro de la case
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  si, ax

    ; V rifier l' tat de la case   partir du tableau board
                                                           mov  dl, board[si-1]
                                                           cmp  dl, 0
                                                           je   case_vide
                                                           cmp  dl, 1
                                                           je   pion_blanc
                                                           cmp  dl, 2
                                                           je   pion_noir
                                                           cmp  dl, 3
                                                           je   dame_blanche
                                                           cmp  dl, 4
                                                           je   dame_noire

    case_vide:                                             
                                                           mov  ax, 0
                                                           jmp  done_state

    pion_blanc:                                            
                                                           mov  ax, 1
                                                           jmp  done_state

    pion_noir:                                             
                                                           mov  ax, 2
                                                           jmp  done_state

    dame_blanche:                                          
                                                           mov  ax, 3
                                                           jmp  done_state

    dame_noire:                                            
                                                           mov  ax, 4

    done_state:                                            
                                                           mov  sort_getSquareState, ax                                   ; Stocker le r sultat dans sort_getSquareState
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
getSquareState endp

InitialiserDamier proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; Initialiser le compteur de boucle   0
                                                           mov  cx, 0

    ; Obtenir l'offset du tableau board
                                                           mov  bx, offset board

    loop_init:                                             
    ; V rifier si l'index est inf rieur   20
                                                           cmp  cx, 20
                                                           jl   init_black

    ; V rifier si l'index est sup rieur ou  gal   30
                                                           cmp  cx, 30
                                                           jge  init_white

    ; Initialiser l' l ment courant du tableau   EMPTY (0)
                                                           mov  [bx], 0
                                                           jmp  next_index

    init_black:                                            
    ; Initialiser l' l ment courant du tableau   BLACK_PAWN (2)
                                                           mov  [bx], 2
                                                           jmp  next_index

    init_white:                                            
    ; Initialiser l' l ment courant du tableau   WHITE_PAWN (1)
                                                           mov  [bx], 1

    next_index:                                            
    ; Passer   l' l ment suivant du tableau
                                                           inc  bx
                                                           inc  cx

    ; V rifier si tous les 50  l ments ont  t  initialis s
                                                           cmp  cx, 50
                                                           jl   loop_init

    ; Restaurer les valeurs des registres depuis la pile
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
InitialiserDamier endp

printSquare proc
                                                           push bp
                                                           mov  bp, sp

    ; D placer les valeurs de ent_printi et ent_printj dans ax et bx
                                                           mov  ax, ent_printi
                                                           mov  bx, ent_printj

    ; Initialiser les variables pour les appels   getSquareState et getSquareColor
                                                           mov  ent_squarecolori, ax
                                                           mov  ent_squarecolorj, bx
                                                           mov  ent_squarestatei, ax
                                                           mov  ent_squarestatej, bx

    ; Appeler getSquareState et getSquareColor pour obtenir l' tat et la couleur de la case
                                                           call getSquareState
                                                           call getSquareColor
                                                           mov  ax, sort_getSquareColor
                                                           cmp  ax, WHITE
                                                           je   print_white

    ; V rifier l' tat de la case et imprimer le contenu correspondant
                                                           mov  ax, sort_getSquareState
                                                           cmp  ax, EMPTY
                                                           je   EMPTY
                                                           cmp  ax, WHITE_PAWN
                                                           je   WHITE_PAWN
                                                           cmp  ax, BLACK_PAWN
                                                           je   BLACK_PAWN
                                                           cmp  ax, WHITE_QUEEN
                                                           je   WHITE_QUEEN
                                                           cmp  ax, BLACK_QUEEN
                                                           je   BLACK_QUEEN

    EMPTY:                                                 
                                                           lea  dx, vide
                                                           call puts
                                                           jmp  done_printstate

    WHITE_PAWN:                                            
                                                           lea  dx, pionblanc
                                                           call puts
                                                           jmp  done_printstate

    BLACK_PAWN:                                            
                                                           lea  dx, pionnoir
                                                           call puts
                                                           jmp  done_printstate

    WHITE_QUEEN:                                           
                                                           lea  dx, dameblanche
                                                           call puts
                                                           jmp  done_printstate

    BLACK_QUEEN:                                           
                                                           lea  dx, damenoire
                                                           call puts
                                                           jmp  done_printstate

    print_white:                                           
    ; Imprimer une case vide pour une case blanche
                                                           lea  dx, vd
                                                           call puts

    done_printstate:                                       
                                                           pop  bp
                                                           ret
printSquare endp

AfficherDamier proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

                                                           mov  cx, 1
    outer_loop:                                            
                                                           mov  dx, 1

    inner_loop:                                            
    ; Initialiser les variables pour l'appel   printSquare
                                                           mov  ent_printi, cx
                                                           mov  ent_printj, dx

    ; Appeler printSquare pour afficher la case
                                                           call printSquare

    ; Restaurer les valeurs de ent_printi et ent_printj
                                                           mov  cx, ent_printi
                                                           mov  dx, ent_printj

    ; Passer   la colonne suivante
                                                           inc  dx
                                                           cmp  dx, 11
                                                           jl   inner_loop

    ; V rifier si toutes les colonnes ont  t  affich es
                                                           cmp  dx, 11
                                                           je   print_row

    ret_print_row:                                         
    ; Imprimer deux nouvelles lignes pour s parer les rang es
                                                           lea  dx, newline
                                                           call puts
                                                           lea  dx, newline
                                                           call puts

    ; Passer   la rang e suivante
                                                           mov  cx, ent_printi
                                                           inc  cx
                                                           cmp  cx, 10
                                                           jle  outer_loop

    ; Imprimer les num ros de colonnes
                                                           mov  cx, 1
    print_column:                                          
                                                           mov  ax, cx
                                                           call print_decimal
                                                           lea  dx, v
                                                           call puts
                                                           inc  cx
                                                           cmp  cx, 11
                                                           jl   print_column

                                                           jmp  doneafficher

    print_row:                                             
    ; Imprimer le num ro de rang e
                                                           mov  ax, ent_printi
                                                           call print_decimal
                                                           jmp  ret_print_row

    doneafficher:                                          
    ; Restaurer les valeurs des registres depuis la pile
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
AfficherDamier endp

verifqueens proc
    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    ; Initialiser les variables
                                                           mov  found, 0                                                  ; found = 0 (aucune dame trouv e)
                                                           mov  k, 1                                                      ; k = 1 (indice de d part dans ent_verifqueens_testtable)
                                                           mov  p, 0                                                      ; p = 0 (indice de d part dans ent_verifqueens_testtable)

    loop1verifqueens:                                      
                                                           mov  cx, k
                                                           cmp  cx, 50
                                                           jge  loop1_endverifqueens                                      ; Sortir de la boucle si k >= 50

                                                           mov  si, 0
    loop2verifqueens:                                      
                                                           mov  ax, ent_verifqueens_testtable[si]
                                                           cmp  ax, -1
                                                           je   loop2_endverifqueens                                      ; Sortir de la boucle interne si la fin du tableau est atteinte

    ; Obtenir le num ro de case   partir des coordonn es (i, j)
                                                           push si
                                                           mov  ax, ent_verifqueens_i
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, ent_verifqueens_j
                                                           mov  ent_squarenumberj, ax
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  si, p
                                                           cmp  ax, ent_verifqueens_testtable[si]
                                                           pop  si

                                                           jne  skipverifqueens                                           ; Sauter si les num ros de case ne correspondent pas

    ; Obtenir le num ro de case   partir des coordonn es (x, y)
                                                           push si
                                                           mov  ax, ent_verifqueens_x
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, ent_verifqueens_y
                                                           mov  ent_squarenumberj, ax
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  si, k
                                                           cmp  ax, ent_verifqueens_testtable[si]
                                                           pop  si

                                                           jne  skipverifqueens                                           ; Sauter si les num ros de case ne correspondent pas

    ; Une dame a  t  trouv e
                                                           mov  cx, found
                                                           mov  cx, 1
                                                           mov  found, cx
                                                           jmp  loop1_endverifqueens

    skipverifqueens:                                       
                                                           inc  si
                                                           jmp  loop2verifqueens

    loop2_endverifqueens:                                  
                                                           mov  cx, k
                                                           inc  cx
                                                           mov  k, cx
                                                           push si
                                                           mov  si, k
                                                           cmp  ent_verifqueens_testtable[si], 0
                                                           pop  si
                                                           je   loop1verifqueens                                          ; Continuer la boucle externe si la fin du tableau n'est pas atteinte
                                                           mov  cx, k
                                                           mov  dx, p
                                                           add  dx, cx
                                                           mov  p, dx
                                                           inc  cx
                                                           mov  k, cx
                                                           jmp  loop1verifqueens

    loop1_endverifqueens:                                  
                                                           mov  cx, found
                                                           cmp  found, cx
                                                           jne  endverifqueens                                            ; Sauter   endverifqueens si aucune dame n'a  t  trouv e

    ; Afficher "Vous devez capturer un pion adverse avec votre dame."
                                                           lea  dx, msg
                                                           call puts
                                                           mov  sort_verifqueens, 1                                       ; Indique qu'une dame a  t  trouv e
                                                           jmp  exitverifqueens

    endverifqueens:                                        
                                                           mov  sort_verifqueens, 0                                       ; Indique qu'aucune dame n'a  t  trouv e

    exitverifqueens:                                       
    ; Restaurer les valeurs des registres depuis la pile
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
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
jump11 :
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
jump12 :
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
jump13 :
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

check_must_capture1 :
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
jump1 :
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
jump2 :
		
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
		
jump3 :
		
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

check_current_player2 :
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
                                       jge           abs1                                                  ; Si i - x >= 0, sauter à abs1
                                       neg           ax                                                      ; Sinon, ax = -(i - x)
abs1:
                                       cmp           ax, 1                                                   ; Comparer abs(i - x) avec 1
                                       jg            true                                                  ; Si abs(i - x) > 1, sauter à true
    ; Calcul de abs(j - y)
                                       mov           ax, bx                                                  ; ax = j
                                       sub           ax, dx                                                  ; ax = j - y
                                       mov           di, ax                                                  ; di = j - y (pour garder une copie)
                                       cmp           ax, 0                                                   ; Comparer j - y avec 0
                                       jge           abs2                                                  ; Si j - y >= 0, sauter à abs2
                                       neg           ax                                                      ; Sinon, ax = -(j - y)
abs2:
                                       cmp           ax, 1                                                   ; Comparer abs(j - y) avec 1
                                       jg            true                                                  ; Si abs(j - y) > 1, sauter à true

    ; Si on arrive ici, les deux conditions sont fausses
                                       jmp           false                                                 ; Sauter à false

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

check_must_capture2 :
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
                                       jmp           exit_verif
			
                                       MOV           AH, 09h
                                       LEA           DX, msg_invalid_pawn_direction
                                       INT           21h
                                       jmp           exit_verif
exit_verif:
                                       pop           bp
                                       ret           
verif endp


generateAIMove proc

    ; Sauvegarder les valeurs des registres sur la pile
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push si
                                                           push di
                                                           push bp
                                                           mov  bp, sp

    ; Vérifier si mustcapture() renvoie 1
                                                           call mustcapture
                                                           mov  ax, sort_Mustcapture
                                                           cmp  ax, 1
                                                           jne  else_generateAIMove

    ; obtenir les coordonnées de la case à partir de coor[0]
                                                           mov  si, 0
                                                           mov  ax, coor[si]
                                                           mov  N, ax
                                                           push si
                                                           call getRow
                                                           mov  ax, sort_getRow
                                                           mov  ent_deplaceri, ax
                                                           call getColumn
                                                           mov  ax, sort_getColumn
                                                           mov  ent_deplacerj, ax
                                                           pop  si

                                                           inc  si

    ; obtenir les coordonnées de la case à partir de coor[1]

                                                           mov  ax,coor[si]
                                                           mov  N, ax
                                                           call getRow
                                                           mov  ax, sort_getRow
                                                           mov  ent_deplacerx, ax
                                                           call getColumn
                                                           mov  ax, sort_getColumn
                                                           mov  ent_deplacery, ax

    ; appeler deplacer (i,j,x,y)
                                                           call deplacer
                                                           jmp  end_generateAIMove

    else_generateAIMove:                                   
    ; initialiser les variables
                                                           xor  cx, cx
                                                           mov  ent_deplaceri, cx
                                                           mov  ent_deplacerj, cx
                                                           mov  ent_deplacerx, cx
                                                           mov  ent_deplacery, cx
                                                           mov  validMove, cx

    while_loop:                                            
                                                           cmp  validMove, 0
                                                           jne  end_while_loop

    ; boucle for (si = 0; si < 50; si++)
                                                           xor  si, si
    for_loop:                                              
                                                           cmp  si, 50
                                                           jge  end_for_loop

    ; vérifier si la case est black_pawn ou black_queen
                                                           mov  al, board[si]
                                                           cmp  al, BLACK_PAWN
                                                           je   handle_black_pawn
                                                           cmp  al, BLACK_QUEEN
                                                           jne  next_iteration_generateAIMove

    ; BLACK_QUEEN logic
    handle_black_queen:                                    
                                                           mov  ax, si
                                                           inc  ax
                                                           mov  N, ax
                                                           push si
                                                           call getRow
                                                           mov  ax,sort_getRow
                                                           mov  ent_deplaceri, ax
                                                           call getColumn
                                                           mov  ax, sort_getColumn
                                                           mov  ent_deplacerj, ax
                                                           pop  si

    ; verifier les depalcements diagonaux
                                                           mov  cx, 1
    diagonal_loop:                                         
                                                           cmp  cx, 10
                                                           jge  next_iteration_generateAIMove

    ; deplacement diagonal top-left
                                                           mov  ax, ent_deplaceri
                                                           add  ax, cx
                                                           cmp  ax, 10
                                                           jg   next_diagonal
                                                           mov  bx, ent_deplacerj
                                                           add  bx, cx
                                                           cmp  bx, 10
                                                           jg   next_diagonal

                                                           push si
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  next_diagonal

                                                           mov  ax, ent_deplaceri
                                                           add  ax, cx
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           add  ax, cx
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi, ax
                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj, ax
                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx, ax
                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify, ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax, sort_verif
                                                           cmp  ax, 1
                                                           je   set_valid_move

    ;deplacement diagonal top-right
    next_diagonal:                                         
                                                           mov  ax, ent_deplaceri
                                                           add  ax, cx
                                                           cmp  ax, 10
                                                           jg   next_diagonal2
                                                           mov  bx, ent_deplacerj
                                                           sub  bx, cx
                                                           cmp  bx, 1
                                                           jl   next_diagonal2

                                                           push si
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  next_diagonal2

                                                           mov  ax, ent_deplaceri
                                                           add  ax, cx
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           sub  ax, cx
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi, ax
                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj, ax
                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx, ax
                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify, ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax, sort_verif
                                                           cmp  ax, 1
                                                           je   set_valid_move

    ; deplacement diagonal bottom-right
    next_diagonal2:                                        
                                                           mov  ax, ent_deplaceri
                                                           sub  ax, cx
                                                           cmp  ax, 1
                                                           jl   next_diagonal3
                                                           mov  bx, ent_deplacerj
                                                           add  bx, cx
                                                           cmp  bx, 10
                                                           jg   next_diagonal3

                                                           push si
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  next_diagonal3

                                                           mov  ax, ent_deplaceri
                                                           sub  ax, cx
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           add  ax, cx
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi, ax
                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj, ax
                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx, ax
                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify, ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax, sort_verif
                                                           cmp  ax, 1
                                                           je   set_valid_move

    ; deplacement diagonal bottom-left
    next_diagonal3:                                        
                                                           mov  ax, ent_deplaceri
                                                           sub  ax, cx
                                                           cmp  ax, 1
                                                           jl   next_iteration_generateAIMove
                                                           mov  bx, ent_deplacerj
                                                           sub  bx, cx
                                                           cmp  bx, 1
                                                           jl   next_iteration_generateAIMove

                                                           push si
                                                           mov  ent_squarenumberi, ax
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  next_iteration_generateAIMove

                                                           mov  ax, ent_deplaceri
                                                           sub  ax, cx
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           sub  ax, cx
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi, ax
                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj, ax
                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx, ax
                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify, ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax, sort_verif
                                                           cmp  ax, 1
                                                           je   set_valid_move

                                                           inc  cx
                                                           jmp  diagonal_loop


    ; la prochaine iteration
    next_iteration_generateAIMove:                         
                                                           inc  si
                                                           jmp  for_loop

    ;le saut vers la fin
    end_for_loop:                                          
                                                           jmp  while_loop

    ;mise à jour de la variable validMove
    set_valid_move:                                        
                                                           mov  validMove, 1
                                                           jmp  end_while_loop

    ; BLACK_PAWN logic
    handle_black_pawn:                                     
                                                           mov  ax, si
                                                           inc  ax
                                                           mov  N, ax
                                                           push si
                                                           call getRow
                                                           mov  ax, sort_getRow
                                                           mov  ent_deplaceri, ax
                                                           call getColumn
                                                           mov  ax, sort_getColumn
                                                           mov  ent_deplacerj, ax
                                                           pop  si

                                                           mov  ax, ent_deplaceri
                                                           cmp  ax,10
                                                           jge  check_pawn_right
                                                           mov  ax,ent_deplacerj
                                                           cmp  ax,1
                                                           jle  check_pawn_right


    ; verifier move i + 1, j - 1
                                                           mov  ax, ent_deplaceri
                                                           inc  ax
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, ent_deplacerj
                                                           dec  ax
                                                           mov  ent_squarenumberj, ax

                                                           push si
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  check_pawn_right

                                                           mov  ax, ent_deplaceri
                                                           inc  ax
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           dec  ax
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi , ax

                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj , ax

                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx , ax

                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify , ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax,sort_verif

                                                           cmp  ax, 1
                                                           je   set_valid_move

    ; verifier move i + 1, j + 1
    check_pawn_right:                                      

                                                           mov  ax, ent_deplaceri
                                                           cmp  ax,10
                                                           jge  next_iteration_generateAIMove
                                                           mov  ax,ent_deplacerj
                                                           cmp  ax,10
                                                           jge  next_iteration_generateAIMove

                                                           mov  ax, ent_deplaceri
                                                           inc  ax
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, ent_deplacerj
                                                           inc  ax
                                                           mov  ent_squarenumberj, ax

                                                           push si
                                                           call getSquareNumber
                                                           pop  si
                                                           mov  sort_getSquareNumber, ax
                                                           dec  ax
                                                           push si
                                                           mov  si, ax
                                                           mov  dl, board[si]
                                                           pop  si
                                                           cmp  dl, EMPTY
                                                           jne  next_iteration_generateAIMove


                                                           mov  ax, ent_deplaceri
                                                           inc  ax
                                                           mov  ent_deplacerx, ax
                                                           mov  ax, ent_deplacerj
                                                           inc  ax
                                                           mov  ent_deplacery, ax

                                                           mov  ax, ent_deplaceri
                                                           mov  ent_verifi , ax

                                                           mov  ax, ent_deplacerj
                                                           mov  ent_verifj , ax

                                                           mov  ax, ent_deplacerx
                                                           mov  ent_verifx , ax

                                                           mov  ax, ent_deplacery
                                                           mov  ent_verify , ax

                                                           push si
                                                           call verif
                                                           pop  si
                                                           mov  ax,sort_verif

                                                           cmp  ax, 1
                                                           je   set_valid_move
                                                           jmp  next_iteration_generateAIMove

    end_while_loop:                                        
    ; Call deplacer(i, j, x, y)
                                                           call deplacer

    end_generateAIMove:                                    
    ; Restaurer les valeurs des registres depuis la pile
                                                           pop  bp
                                                           pop  di
                                                           pop  si
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret

generateAIMove endp

Mustcapture proc

                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp


    ; Define registers to hold player and variables
                                                           mov  AL, player                                                ; Assuming player value is in register AL

    ; Check for WHITE player
                                                           cmp  AL, WHITE
                                                           jne  notWhite                                                  ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                                           mov  currentPlayer, WHITE_PAWN
                                                           mov  currentQueen, WHITE_QUEEN
                                                           mov  opponentPiece, BLACK_PAWN
                                                           mov  opponentQueen, BLACK_QUEEN
                                                           jmp  finish                                                    ; Jump to the end

    notWhite:                                              
    ; Assign values for BLACK player
                                                           mov  currentPlayer, BLACK_PAWN
                                                           mov  currentQueen, BLACK_QUEEN
                                                           mov  opponentPiece, WHITE_PAWN
                                                           mov  opponentQueen, WHITE_QUEEN

    finish:                                                



    ; Initialisation des variables

                                                           mov  cx, 0
                                                           mov  capturepossible, cx

                                                           mov  q, cx

                                                           mov  qatole, cx

                                                           mov  qatori, cx

                                                           mov  qabole, cx

                                                           mov  qabori, cx

                                                           mov  jumpsqubole, cx

                                                           mov  jumpsqubori, cx

                                                           mov  jumpsqutole, cx

                                                           mov  jumpsqutori, cx

  

    ; R initialisation des tableaux

                                                           mov  bx, 0

    reset_arrays:                                          

                                                           mov  queencapturesqtole[bx], 0

                                                           mov  queencapturesqtori[bx], 0

                                                           mov  queencapturesqubole[bx], 0

                                                           mov  queencapturesqubori[bx], 0

                                                           mov  coor[bx], 0

                                                           inc  bx
                                                           cmp  bx,50
                                                           jl   reset_arrays
  

    ; Boucle principale


                                                           mov  bx, 0

    main_loop:                                             
                                                           mov  bxx,bx
    ; R cup ration de la valeur de la case courante

                                                           mov  al, board[bx]

  

    ; V rification si c'est un pion ou une reine de la couleur du joueur actuel

                                                           cmp  al, currentPlayer

                                                           je   process_piece

                                                           cmp  al, currentQueen

                                                           jne  next_iteration

  

    process_piece:                                         

    ; Calcul des coordonn es i et j de la case courante
                                                           push bx
                                                           inc  bx
                                                           mov  N, bx

                                                           call getRow

                                                           mov  ax, sort_getRow
                                                           mov  i,ax

                                                           call getColumn

                                                           mov  ax, sort_getColumn
                                                           mov  j,ax
                                                           pop  bx

  

    ; V rification des captures possibles selon le type de pi ce
                                      
                                                           mov  al, currentPlayer
                                                           cmp  board[bx], al
                                                           je   check_pawn_color

                                                           mov  al, currentQueen
                                                           cmp  board[bx], al
                                                           je   process_queen
                                                           jmp  next_iteration

  

    check_pawn_color:                                      
                                                           cmp  player, WHITE

                                                           je   process_white_pawn

                                                           jmp  process_black_pawn

  

  

    ;capture des pions blancs

    process_white_pawn:                                    

    ; V rification de la capture en haut   gauche

                                                           cmp  i, 2                                                      ; V rifier si i > 1

                                                           jl   skip_top_left_capture

                                                           cmp  j, 2                                                      ; V rifier si j > 1

                                                           jl   skip_top_left_capture

  

                                                           mov  dx, j

                                                           dec  dx
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i

                                                           dec  cx
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  bx ,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al, opponentPiece

                                                           cmp  board[bx], al
                                                           je   check_top_left_empty

                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_top_left_capture

  

    check_top_left_empty:                                  
                                                           mov  dx, j

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_top_left_capture

  

    ; Capture possible en haut   gauche
                                                           mov  si, q

                                                           mov  dx, j
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, j

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si

                                                           mov  q, si

                                                           mov  capturepossible,1
  

    skip_top_left_capture:                                 
                                      
  

    ; V rification de la capture en haut   droite

                                                           cmp  i, 2                                                      ; V rifier si i > 1

                                                           jl   skip_top_right_capture

                                                           cmp  j, 9                                                      ; V rifier si j < 10

                                                           jg   skip_top_right_capture

  

                                                           mov  dx, j

                                                           inc  dx
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           dec  cx
                                                           mov  ent_squarenumberi,cx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                    
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_top_right_empty
                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_top_right_capture

  

    check_top_right_empty:                                 
                                     
                                                           mov  dx, j

                                                           add  dx, 2
                                                           mov  ent_squarenumberj,dx
                                                           mov  cx, i

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_top_right_capture

  

    ; Capture possible en haut   droite

                                                           mov  si, q
                                                           mov  dx, j
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, j

                                                           add  dx, 2
                                                           mov  ent_squarenumberj,dx
                                                           mov  cx, i

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si
                                                           mov  q, si

                                                           mov  capturepossible,1
  

    skip_top_right_capture:                                
                                      
                                                           jmp  next_iteration

  

  

    ;capture pions noirs

    process_black_pawn:                                    

    ; V rification de la capture en bas   gauche

                                                           cmp  i, 9                                                      ; V rifier si i < 10

                                                           jg   skip_bottom_left_capture

                                                           cmp  j, 2                                                      ; V rifier si j > 1

                                                           jl   skip_bottom_left_capture

  

                                                           mov  dx, j

                                                           dec  dx

                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           inc  cx
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_bottom_left_empty
                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_bottom_left_capture

  

    check_bottom_left_empty:                               
                                      
                                                           mov  dx, j

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           add  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_bottom_left_capture

  

    ; Capture possible en bas   gauche
                                                           mov  si, q

                                                           mov  dx, j
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, j

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           add  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  ax , sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  q, si

                                      
                                                           mov  capturepossible, 1

  

    skip_bottom_left_capture:                              

                                  

    ; V rification de la capture en bas   droite

                                                           cmp  i, 9                                                      ; V rifier si i < 10

                                                           jg   skip_bottom_right_capture

                                                           cmp  j, 9                                                      ; V rifier si j < 10

                                                           jg   skip_bottom_right_capture

  

                                                           mov  dx, j

                                                           inc  dx
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           inc  cx
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                     
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_bottom_right_empty

                                                           mov  al, opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_bottom_right_capture


  

    check_bottom_right_empty:                              
                                  
                                                           mov  dx, j

                                                           add  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           add  cx, 2
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_bottom_right_capture

  

    ; Capture possible en bas   droite
                                                           mov  si, q
                                                           mov  dx, j
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, i
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, j

                                                           add  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, i

                                                           add  cx, 2
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si
                                                           mov  q, si
                                      
                                                           mov  capturepossible,1

  

    skip_bottom_right_capture:                             
                                                           jmp  next_iteration

  

  

    ;capture des reines

    process_queen:                                         
                                 
    ; V rification des captures dans les 4 directions diagonales

                                                           jmp  check_top_left_captures
    check_top_left_captures_ret:                           
                                                           jmp  check_top_right_captures
    check_top_right_captures_ret:                          
                                                           jmp  check_bottom_left_captures
    check_bottom_left_captures_ret:                        
                                                           jmp  check_bottom_right_captures
    check_bottom_right_captures_ret:                       
                                                           jmp  next_iteration

  

    ; V rification des captures en haut   gauche

    check_top_left_captures:                               

                                                           mov  cx, 1
                                                           mov  cxx, cx


    top_left_loop:                                         
                                                           mov  pointt,cx
                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx, cx
                                                           sub  bx,cx

                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_left_loop

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_top_left_loop

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al , currentQueen
                                                           cmp  board[bx], al
                                                           je   exit_top_left_loop
                                                           mov  al, currentPlayer
                                                           cmp  board[bx], al
                                                           je   exit_top_left_loop
                                      
                                                           cmp  board[bx], EMPTY

                                                           je   continue_top_left_loop

  

    ; Une pi ce oppos e a  t  trouv e
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_top_left_capture
                                                           mov  al,opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_top_left_loop

  

    process_top_left_capture:                              
                                                           mov  dx, i
                                                           mov  bx, j

                                                           sub  dx, cx
                                                           sub  bx,cx
                                                           dec  dx

                                                           dec  bx

                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_left_loop

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_top_left_loop

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_top_left_loop

  

    ; Capture possible en haut   gauche

                                                           mov  si , qatole
                                                           mov  dx,i
                                                           mov  bx,j
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtole[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqutole
                                                           inc  si
                                                           mov  jumpsqutole,si

  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_top_left_jumps:                             

                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx, cxx
                                                           sub  bx,cxx

                                                           sub  dx,cx
                                                           sub  bx,cx

                                                           cmp  dx, 0                                                     ; V rifier si dx < 1

                                                           jle  end_additional_top_left_jumps

                                                           cmp  bx, 0                                                     ; V rifier si bx < 1

                                                           jle  end_additional_top_left_jumps

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_top_left_jumps

                                                           mov  si,qatole

                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx, cxx
                                                           sub  bx,cxx

                                                           sub  dx,cx
                                                           sub  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtole[si],ax

                                                           inc  si

                                                           mov  qatole,si

                                                           inc  cx

                                                           jmp  additional_top_left_jumps

  

    end_additional_top_left_jumps:                         
                                                           mov  si,qatole
                                                           mov  queencapturesqtole[si], -1

                                                           inc  si
                                                           mov  qatole,si

                                                           jmp  exit_top_left_loop

  

    continue_top_left_loop:                                
                                                           mov  cx , pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   top_left_loop

  

    exit_top_left_loop:                                    
                                   
                                                           jmp  check_top_left_captures_ret

  

    ; V rification des captures en haut   droite

    check_top_right_captures:                              

                                                           mov  cx, 1
                                                           mov  cxx,cx

    top_right_loop:                                        
                                                           mov  pointt,cx
                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx,cx

                                                           add  bx,cx
                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_right_loop

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_top_right_loop

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                     
                                                           mov  al,currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_top_right_loop
                                                           mov  al , currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_top_right_loop
                                                           cmp  board[bx], EMPTY

                                                           je   continue_top_right_loop

  

    ; Une pi ce oppos e a  t  trouv e
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_top_right_capture
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_top_right_loop


  

    process_top_right_capture:                             
                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx,cx
                                                           dec  dx
                                                           add  bx,cx
                                                           inc  bx
                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_right_loop

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_top_right_loop

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_top_right_loop

  

    ; Capture possible en haut   droite
                                                           mov  si , qatori
                                                           mov  dx,i
                                                           mov  bx,j
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtori[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqutori
                                                           inc  si
                                                           mov  jumpsqutori,si

  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_top_right_jumps:                            

                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx,cxx

                                                           add  bx,cxx

                                                           sub  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 0                                                     ; V rifier si dx < 1

                                                           jle  end_additional_top_right_jumps

                                                           cmp  bx, 11                                                    ; V rifier si bx > 10

                                                           jge  end_additional_top_right_jumps

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_top_right_jumps

  
                                                           mov  si,qatori
                                                           mov  dx, i

                                                           mov  bx, j

                                                           sub  dx,cxx

                                                           add  bx,cxx

                                                           sub  dx,cx
                                                           add  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtori[si],ax

                                                           inc  si

                                                           mov  qatori,si

                                                           inc  cx

                                                           jmp  additional_top_right_jumps

  

    end_additional_top_right_jumps:                        
                                                           mov  si,qatori
                                                           mov  queencapturesqtori[si], -1

                                                           inc  si
                                                           mov  qatori,si

                                                           jmp  exit_top_right_loop

  

    continue_top_right_loop:                               

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   top_right_loop

  

    exit_top_right_loop:                                   
                                     
                                                           jmp  check_top_right_captures_ret

  

    ; V rification des captures en bas   gauche

    check_bottom_left_captures:                            

                                                           mov  cx, 1
                                                           mov  cxx ,cx


    bottom_left_loop:                                      
                                                           mov  pointt,cx
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cx

                                                           sub  bx,cx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_left_loop

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_bottom_left_loop

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                 
                                                           mov  al,currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_bottom_left_loop
                                                           mov  al,currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_bottom_left_loop
                                    
                                                           cmp  board[bx], EMPTY

                                                           je   continue_bottom_left_loop

  

    ; Une pi ce oppos e a  t  trouv e
                                   
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_bottom_left_capture
                                                           mov  al,, opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_bottom_left_loop
                                     

  

    process_bottom_left_capture:                           
                                      
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cx
                                                           inc  dx

                                                           sub  bx,cx
                                                           dec  bx
                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_left_loop

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_bottom_left_loop

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_bottom_left_loop

  

    ; Capture possible en bas   gauche
                                                           mov  si , qabole
                                                           mov  dx,i
                                                           mov  bx,j
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubole[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqubole
                                                           inc  si
                                                           mov  jumpsqubole,si

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_bottom_left_jumps:                          

                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cxx

                                                           sub  bx,cxx

                                                           add  dx,cx
                                                           sub  bx,cx

                                                           cmp  dx, 11                                                    ; V rifier si dx < 1

                                                           jge  end_additional_bottom_left_jumps

                                                           cmp  bx, 0                                                     ; V rifier si bx > 10

                                                           jle  end_additional_bottom_left_jumps

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_bottom_left_jumps

  
                                                           mov  si,qabole
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cxx

                                                           sub  bx,cxx

                                                           add  dx,cx
                                                           sub  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubole[si],ax

                                                           inc  si

                                                           mov  qabole,si

                                                           inc  cx

                                                           jmp  additional_bottom_left_jumps

  

    end_additional_bottom_left_jumps:                      
                                                           mov  si,qabole
                                                           mov  queencapturesqubole[si], -1

                                                           inc  si
                                                           mov  qabole,si

                                                           jmp  exit_bottom_left_loop

  

    continue_bottom_left_loop:                             

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   bottom_left_loop

  

    exit_bottom_left_loop:                                 
                                     
                                                           jmp  check_bottom_left_captures_ret

  



    ; V rification des captures en bas   droite

    check_bottom_right_captures:                           

                                                           mov  cx, 1
                                                           mov  cxx,cx


    bottom_right_loop:                                     
                                                           mov  pointt,cx
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_right_loop

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_bottom_right_loop

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                   
                                                           mov  al, currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_bottom_right_loop
                                                           mov  al,currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_bottom_right_loop
                                      
                                                           cmp  board[bx], EMPTY

                                                           je   continue_bottom_right_loop

  

    ; Une pi ce oppos e a  t  trouv e
                                    
                                                           mov  al, opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_bottom_right_capture
                                                           mov  al,opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_bottom_right_loop
                                      

  

    process_bottom_right_capture:                          
                                      
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cx
                                                           inc  dx
                                                           add  bx,cx
                                                           inc  bx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_right_loop

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_bottom_right_loop

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_bottom_right_loop

  

    ; Capture possible en bas   droite
                                                           mov  si , qabori
                                                           mov  dx,i
                                                           mov  bx,j
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubori[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqubori
                                                           inc  si
                                                           mov  jumpsqubori,si


  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_bottom_right_jumps:                         

                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cxx
                                                           add  bx,cxx

                                                           add  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 11                                                    ; V rifier si dx > 10

                                                           jge  end_additional_bottom_right_jumps

                                                           cmp  bx, 11                                                    ; V rifier si bx > 10

                                                           jge  end_additional_bottom_right_jumps

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_bottom_right_jumps

  
                                                           mov  si,qabori
                                                           mov  dx, i

                                                           mov  bx, j

                                                           add  dx,cxx
                                                           add  bx,cxx
                                                           add  dx,cx
                                                           add  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubori[si], ax

                                                           inc  si

                                                           mov  qabori,si

                                                           inc  cx

                                                           jmp  additional_bottom_right_jumps

  

    end_additional_bottom_right_jumps:                     
                                                           mov  si,qabori
                                                           mov  queencapturesqubori[si], -1

                                                           inc  si
                                                           mov  qabori,si

                                                           jmp  exit_bottom_right_loop

  

    continue_bottom_right_loop:                            

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   bottom_right_loop
    

    exit_bottom_right_loop:                                
                                                           jmp  check_bottom_right_captures_ret

    ;exit

  

    next_iteration:                                        
                                                           mov  bx,bxx
                                                           inc  bx
                                                           cmp  bx,50
                                                           jl   main_loop

  

    ; V rification si au moins une capture est possible
                                                           mov  ax, capturepossible
                                                           cmp  ax, 0

                                                           je   return_false
                                                           mov  ax, 1

                                                           jmp  return

  

    return_false:                                          

                                                           mov  ax, 0

  

    return:                                                
                                                           mov  ah,0
                                                           mov  sort_Mustcapture,ax
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret

Mustcapture endp

Mustcaptureaftercapture proc

                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp


    ; Define registers to hold player and variables
                                                           mov  AL, player                                                ; Assuming player value is in register AL

    ; Check for WHITE player
                                                           cmp  AL, WHITE
                                                           jne  notWhite1                                                 ; Jump if not WHITE (i.e., BLACK)

    ; Assign values for WHITE player
                                                           mov  currentPlayer, WHITE_PAWN
                                                           mov  currentQueen, WHITE_QUEEN
                                                           mov  opponentPiece, BLACK_PAWN
                                                           mov  opponentQueen, BLACK_QUEEN
                                                           jmp  finish1                                                   ; Jump to the end

    notWhite1:                                             
    ; Assign values for BLACK player
                                                           mov  currentPlayer, BLACK_PAWN
                                                           mov  currentQueen, BLACK_QUEEN
                                                           mov  opponentPiece, WHITE_PAWN
                                                           mov  opponentQueen, WHITE_QUEEN

    finish1:                                               



    ; Initialisation des variables

                                                           mov  cx, 0
                                                           mov  capturepossible, cx

                                                           mov  q, cx

                                                           mov  qatole, cx

                                                           mov  qatori, cx

                                                           mov  qabole, cx

                                                           mov  qabori, cx

                                                           mov  jumpsqubole, cx

                                                           mov  jumpsqubori, cx

                                                           mov  jumpsqutole, cx

                                                           mov  jumpsqutori, cx

  

    ; R initialisation des tableaux

                                                           mov  bx, 0

    reset_arrays1:                                         

                                                           mov  queencapturesqtole[bx], 0

                                                           mov  queencapturesqtori[bx], 0

                                                           mov  queencapturesqubole[bx], 0

                                                           mov  queencapturesqubori[bx], 0

                                                           mov  coor[bx], 0

                                                           inc  bx
                                                           cmp  bx,50
                                                           jl   reset_arrays1
  



  

    ; V rification si c'est un pion ou une reine de la couleur du joueur actuel

                                       

  

    process_piece1:                                        

    ; Calcul des coordonn es i et j de la case courante

                                                           mov  ax, ent_Mustcaptureaftercapturei
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberj,ax

                                                           call getSquareNumber

                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           mov  al,currentPlayer
                                                           cmp  board[bx], al

                                                           je   start_process_check_color
                                                           mov  al,currentQueen
                                                           cmp  board[bx], al

                                                           jne  exiit_iteration1


    start_process_check_color:                             

    ; V rification des captures possibles selon le type de pi ce
                                      
                                                           mov  al, currentPlayer
                                                           cmp  board[bx], al
                                                           je   check_pawn_color1

                                                           mov  al, currentQueen
                                                           cmp  board[bx], al
                                                           je   process_queen1
                                                           jmp  exiit_iteration1

  

    check_pawn_color1:                                     
                                                           cmp  player, WHITE

                                                           je   process_white_pawn1

                                                           jmp  process_black_pawn1

  

  

    ;capture des pions blancs

    process_white_pawn1:                                   

    ; V rification de la capture en haut   gauche

                                                           cmp  ent_Mustcaptureaftercapturei, 2                           ; V rifier si i > 1

                                                           jl   skip_top_left_capture1

                                                           cmp  ent_Mustcaptureaftercapturej, 2                           ; V rifier si j > 1

                                                           jl   skip_top_left_capture1

  

                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           dec  dx
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           dec  cx
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  bx ,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al, opponentPiece

                                                           cmp  board[bx], al
                                                           je   check_top_left_empty1

                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_top_left_capture1

  

    check_top_left_empty1:                                 
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_top_left_capture1

  

    ; Capture possible en haut   gauche
                                                           mov  si, q

                                                           mov  dx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si

                                                           mov  q, si

                                                           mov  capturepossible,1
  

    skip_top_left_capture1:                                
                                      
  

    ; V rification de la capture en haut   droite

                                                           cmp  ent_Mustcaptureaftercapturei, 2                           ; V rifier si i > 1

                                                           jl   skip_top_right_capture1

                                                           cmp  ent_Mustcaptureaftercapturej, 9                           ; V rifier si j < 10

                                                           jg   skip_top_right_capture1

  

                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           inc  dx
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           dec  cx
                                                           mov  ent_squarenumberi,cx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                    
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_top_right_empty1
                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_top_right_capture1

  

    check_top_right_empty1:                                
                                     
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           add  dx, 2
                                                           mov  ent_squarenumberj,dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_top_right_capture1

  

    ; Capture possible en haut   droite

                                                           mov  si, q
                                                           mov  dx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           add  dx, 2
                                                           mov  ent_squarenumberj,dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           sub  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si
                                                           mov  q, si

                                                           mov  capturepossible,1
  

    skip_top_right_capture1:                               
                                      
                                                           jmp  exiit_iteration1

  

  

    ;capture pions noirs

    process_black_pawn1:                                   

    ; V rification de la capture en bas   gauche

                                                           cmp  ent_Mustcaptureaftercapturei, 9                           ; V rifier si i < 10

                                                           jg   skip_bottom_left_capture1

                                                           cmp  ent_Mustcaptureaftercapturej, 2                           ; V rifier si j > 1

                                                           jl   skip_bottom_left_capture1

  

                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           dec  dx

                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           inc  cx
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_bottom_left_empty1
                                                           mov  al , opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_bottom_left_capture1

  

    check_bottom_left_empty1:                              
                                      
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           add  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_bottom_left_capture1

  

    ; Capture possible en bas   gauche
                                                           mov  si, q

                                                           mov  dx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           sub  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           add  cx, 2
                                                           mov  ent_squarenumberi,cx
                                                           call getSquareNumber
                                                           mov  ax , sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  q, si

                                      
                                                           mov  capturepossible, 1

  

    skip_bottom_left_capture1:                             

                                  

    ; V rification de la capture en bas   droite

                                                           cmp  ent_Mustcaptureaftercapturei, 9                           ; V rifier si i < 10

                                                           jg   skip_bottom_right_capture1

                                                           cmp  ent_Mustcaptureaftercapturej, 9                           ; V rifier si j < 10

                                                           jg   skip_bottom_right_capture1

  

                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           inc  dx
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           inc  cx
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                     
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al
                                                           je   check_bottom_right_empty1

                                                           mov  al, opponentQueen
                                                           cmp  board[bx], al
                                                           jne  skip_bottom_right_capture1


  

    check_bottom_right_empty1:                             
                                  
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           add  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           add  cx, 2
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  skip_bottom_right_capture1

  

    ; Capture possible en bas   droite
                                                           mov  si, q
                                                           mov  dx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberj, dx

                                                           mov  cx, ent_Mustcaptureaftercapturei
                                                           mov  ent_squarenumberi, cx

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax
                                                           inc  si
                                                           mov  dx, ent_Mustcaptureaftercapturej

                                                           add  dx, 2
                                                           mov  ent_squarenumberj, dx
                                                           mov  cx, ent_Mustcaptureaftercapturei

                                                           add  cx, 2
                                                           mov  ent_squarenumberi, cx
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber
                                                           mov  coor[si], ax

                                                           inc  si
                                                           mov  q, si
                                      
                                                           mov  capturepossible,1

  

    skip_bottom_right_capture1:                            
                                                           jmp  exiit_iteration1

  

  

    ;capture des reines

    process_queen1:                                        
                                 
    ; V rification des captures dans les 4 directions diagonales

                                                           jmp  check_top_left_captures1
    check_top_left_captures1_ret1:                         
                                                           jmp  check_top_right_captures1
    check_top_right_captures1_ret1:                        
                                                           jmp  check_bottom_left_captures1
    check_bottom_left_captures1_ret1:                      
                                                           jmp  check_bottom_right_captures1
    check_bottom_right_captures1_ret1:                     
                                                           jmp  exiit_iteration1

  

    ; V rification des captures en haut   gauche

    check_top_left_captures1:                              

                                                           mov  cx, 1
                                                           mov  cxx, cx


    top_left_loop1:                                        
                                                           mov  pointt,cx
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx, cx
                                                           sub  bx,cx

                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_left_loop1

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_top_left_loop1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                      
                                                           mov  al , currentQueen
                                                           cmp  board[bx], al
                                                           je   exit_top_left_loop1
                                                           mov  al, currentPlayer
                                                           cmp  board[bx], al
                                                           je   exit_top_left_loop1
                                      
                                                           cmp  board[bx], EMPTY

                                                           je   continue_top_left_loop1

  

    ; Une pi ce oppos e a  t  trouv e
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_top_left_capture1
                                                           mov  al,opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_top_left_loop1

  

    process_top_left_capture1:                             
                                                           mov  dx, ent_Mustcaptureaftercapturei
                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx, cx
                                                           sub  bx,cx
                                                           dec  dx

                                                           dec  bx

                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_left_loop1

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_top_left_loop1

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx , sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_top_left_loop1

  

    ; Capture possible en haut   gauche

                                                           mov  si , qatole
                                                           mov  dx, ent_Mustcaptureaftercapturei
                                                           mov  bx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtole[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqutole
                                                           inc  si
                                                           mov  jumpsqutole,si

  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_top_left_jumps1:                            

                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx, cxx
                                                           sub  bx,cxx

                                                           sub  dx,cx
                                                           sub  bx,cx

                                                           cmp  dx, 0                                                     ; V rifier si dx < 1

                                                           jle  end_additional_top_left_jumps1

                                                           cmp  bx, 0                                                     ; V rifier si bx < 1

                                                           jle  end_additional_top_left_jumps1

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_top_left_jumps1

                                                           mov  si,qatole

                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx, cxx
                                                           sub  bx,cxx

                                                           sub  dx,cx
                                                           sub  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtole[si],ax

                                                           inc  si

                                                           mov  qatole,si

                                                           inc  cx

                                                           jmp  additional_top_left_jumps1

  

    end_additional_top_left_jumps1:                        
                                                           mov  si,qatole
                                                           mov  queencapturesqtole[si], -1

                                                           inc  si
                                                           mov  qatole,si

                                                           jmp  exit_top_left_loop1

  

    continue_top_left_loop1:                               
                                                           mov  cx , pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   top_left_loop1

  

    exit_top_left_loop1:                                   
                                   
                                                           jmp  check_top_left_captures1_ret1

  

    ; V rification des captures en haut   droite

    check_top_right_captures1:                             

                                                           mov  cx, 1
                                                           mov  cxx,cx

    top_right_loop1:                                       
                                                           mov  pointt,cx
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx,cx

                                                           add  bx,cx
                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_right_loop1

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_top_right_loop1

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                     
                                                           mov  al,currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_top_right_loop1
                                                           mov  al , currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_top_right_loop1
                                                           cmp  board[bx], EMPTY

                                                           je   continue_top_right_loop1

  

    ; Une pi ce oppos e a  t  trouv e
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_top_right_capture1
                                                           mov  al, opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_top_right_loop1


  

    process_top_right_capture1:                            
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx,cx
                                                           dec  dx
                                                           add  bx,cx
                                                           inc  bx
                                                           cmp  dx, 1                                                     ; V rifier si dx < 1

                                                           jl   exit_top_right_loop1

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_top_right_loop1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_top_right_loop1

  

    ; Capture possible en haut   droite
                                                           mov  si , qatori
                                                           mov  dx, ent_Mustcaptureaftercapturei
                                                           mov  bx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtori[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqutori
                                                           inc  si
                                                           mov  jumpsqutori,si

  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_top_right_jumps1:                           

                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx,cxx

                                                           add  bx,cxx

                                                           sub  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 0                                                     ; V rifier si dx < 1

                                                           jle  end_additional_top_right_jumps1

                                                           cmp  bx, 11                                                    ; V rifier si bx > 10

                                                           jge  end_additional_top_right_jumps1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_top_right_jumps1

  
                                                           mov  si,qatori
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           sub  dx,cxx

                                                           add  bx,cxx

                                                           sub  dx,cx
                                                           add  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqtori[si],ax

                                                           inc  si

                                                           mov  qatori,si

                                                           inc  cx

                                                           jmp  additional_top_right_jumps1

  

    end_additional_top_right_jumps1:                       
                                                           mov  si,qatori
                                                           mov  queencapturesqtori[si], -1

                                                           inc  si
                                                           mov  qatori,si

                                                           jmp  exit_top_right_loop1

  

    continue_top_right_loop1:                              

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   top_right_loop1

  

    exit_top_right_loop1:                                  
                                     
                                                           jmp  check_top_right_captures1_ret1

  

    ; V rification des captures en bas   gauche

    check_bottom_left_captures1:                           

                                                           mov  cx, 1
                                                           mov  cxx ,cx


    bottom_left_loop1:                                     
                                                           mov  pointt,cx
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cx

                                                           sub  bx,cx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_left_loop1

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_bottom_left_loop1

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                 
                                                           mov  al,currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_bottom_left_loop1
                                                           mov  al,currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_bottom_left_loop1
                                    
                                                           cmp  board[bx], EMPTY

                                                           je   continue_bottom_left_loop1

  

    ; Une pi ce oppos e a  t  trouv e
                                   
                                                           mov  al,opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_bottom_left_capture1
                                                           mov  al,, opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_bottom_left_loop1
                                     

  

    process_bottom_left_capture1:                          
                                      
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cx
                                                           inc  dx

                                                           sub  bx,cx
                                                           dec  bx
                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_left_loop1

                                                           cmp  bx, 1                                                     ; V rifier si bx < 1

                                                           jl   exit_bottom_left_loop1

  
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_bottom_left_loop1

  

    ; Capture possible en bas   gauche
                                                           mov  si , qabole
                                                           mov  dx, ent_Mustcaptureaftercapturei
                                                           mov  bx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubole[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqubole
                                                           inc  si
                                                           mov  jumpsqubole,si

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_bottom_left_jumps1:                         

                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cxx

                                                           sub  bx,cxx

                                                           add  dx,cx
                                                           sub  bx,cx

                                                           cmp  dx, 11                                                    ; V rifier si dx < 1

                                                           jge  end_additional_bottom_left_jumps1

                                                           cmp  bx, 0                                                     ; V rifier si bx > 10

                                                           jle  end_additional_bottom_left_jumps1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_bottom_left_jumps1

  
                                                           mov  si,qabole
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cxx

                                                           sub  bx,cxx

                                                           add  dx,cx
                                                           sub  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubole[si],ax

                                                           inc  si

                                                           mov  qabole,si

                                                           inc  cx

                                                           jmp  additional_bottom_left_jumps1

  

    end_additional_bottom_left_jumps1:                     
                                                           mov  si,qabole
                                                           mov  queencapturesqubole[si], -1

                                                           inc  si
                                                           mov  qabole,si

                                                           jmp  exit_bottom_left_loop1

  

    continue_bottom_left_loop1:                            

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   bottom_left_loop1

  

    exit_bottom_left_loop1:                                
                                     
                                                           jmp  check_bottom_left_captures1_ret1

  



    ; V rification des captures en bas   droite

    check_bottom_right_captures1:                          

                                                           mov  cx, 1
                                                           mov  cxx,cx


    bottom_right_loop1:                                    
                                                           mov  pointt,cx
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_right_loop1

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_bottom_right_loop1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                   
                                                           mov  al, currentQueen
                                                           cmp  board[bx], al

                                                           je   exit_bottom_right_loop1
                                                           mov  al,currentPlayer
                                                           cmp  board[bx], al

                                                           je   exit_bottom_right_loop1
                                      
                                                           cmp  board[bx], EMPTY

                                                           je   continue_bottom_right_loop1

  

    ; Une pi ce oppos e a  t  trouv e
                                    
                                                           mov  al, opponentQueen
                                                           cmp  board[bx], al

                                                           je   process_bottom_right_capture1
                                                           mov  al,opponentPiece
                                                           cmp  board[bx], al

                                                           jne  exit_bottom_right_loop1
                                      

  

    process_bottom_right_capture1:                         
                                      
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cx
                                                           inc  dx
                                                           add  bx,cx
                                                           inc  bx

                                                           cmp  dx, 10                                                    ; V rifier si dx > 10

                                                           jg   exit_bottom_right_loop1

                                                           cmp  bx, 10                                                    ; V rifier si bx > 10

                                                           jg   exit_bottom_right_loop1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  exit_bottom_right_loop1

  

    ; Capture possible en bas   droite
                                                           mov  si , qabori
                                                           mov  dx, ent_Mustcaptureaftercapturei
                                                           mov  bx, ent_Mustcaptureaftercapturej
                                                           mov  ent_squarenumberi,dx
                                                           mov  ent_squarenumberj,bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubori[si],ax
                                                           inc  si
                                                           mov  capturepossible,1
                                                           mov  si,jumpsqubori
                                                           inc  si
                                                           mov  jumpsqubori,si


  

    ; V rifier les sauts suppl mentaires

                                                           mov  cx, 1

    additional_bottom_right_jumps1:                        

                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cxx
                                                           add  bx,cxx

                                                           add  dx,cx
                                                           add  bx,cx

                                                           cmp  dx, 11                                                    ; V rifier si dx > 10

                                                           jge  end_additional_bottom_right_jumps1

                                                           cmp  bx, 11                                                    ; V rifier si bx > 10

                                                           jge  end_additional_bottom_right_jumps1

                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx

                                                           call getSquareNumber
                                                           mov  bx,sort_getSquareNumber
                                                           dec  bx
                                                           cmp  board[bx], EMPTY

                                                           jne  end_additional_bottom_right_jumps1

  
                                                           mov  si,qabori
                                                           mov  dx, ent_Mustcaptureaftercapturei

                                                           mov  bx, ent_Mustcaptureaftercapturej

                                                           add  dx,cxx
                                                           add  bx,cxx
                                                           add  dx,cx
                                                           add  bx,cx
                                                           mov  ent_squarenumberi, dx
                                                           mov  ent_squarenumberj, bx
                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber
                                                           mov  queencapturesqubori[si], ax

                                                           inc  si

                                                           mov  qabori,si

                                                           inc  cx

                                                           jmp  additional_bottom_right_jumps1

  

    end_additional_bottom_right_jumps1:                    
                                                           mov  si,qabori
                                                           mov  queencapturesqubori[si], -1

                                                           inc  si
                                                           mov  qabori,si

                                                           jmp  exit_bottom_right_loop1

  

    continue_bottom_right_loop1:                           

                                                           mov  cx,pointt
                                                           inc  cx
                                                           cmp  cx,10
                                                           jl   bottom_right_loop1
    

    exit_bottom_right_loop1:                               
                                                           jmp  check_bottom_right_captures1_ret1

    ;exit

  

    exiit_iteration1:                                      

  

    ; V rification si au moins une capture est possible
                                                           mov  ax, capturepossible
                                                           cmp  ax, 0

                                                           je   return1_false1
                                                           mov  ax, 1

                                                           jmp  return1

  

    return1_false1:                                        

                                                           mov  ax, 0

  

    return1:                                               
                                                           mov  ah,0
                                                           mov  sort_Mustcaptureaftercapture,ax
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret

Mustcaptureaftercapture endp

deplacer proc
    
                                                           push ax
                                                           push bx
                                                           push cx
                                                           push dx
                                                           push bp
                                                           mov  bp, sp

    
                                                           mov  ax,ent_deplaceri
                                                           mov  ent_verifi,ax

                                                           mov  ax,ent_deplacerj
                                                           mov  ent_verifj,ax

                                                           mov  ax,ent_deplacerx
                                                           mov  ent_verifx,ax

                                                           mov  ax,ent_deplacery
                                                           mov  ent_verify,ax

    ; call verif
                                                           mov  sort_verif,1                                              ;pr le moment

                                                           cmp  sort_verif,1
                                                           jne  return0_deplacer                                          ; Non, on quitte

                                                           mov  ax,ent_deplaceri
                                                           mov  ent_squarestatei,ax

                                                           mov  ax,ent_deplacerj
                                                           mov  ent_squarestatej,ax

                                                           call getSquareState

                                                           cmp  sort_getSquareState,WHITE_PAWN
                                                           je   condition_vraie
                                                           cmp  sort_getSquareState,BLACK_PAWN
                                                           jne  condition_fausse                                          ;partie queen

    condition_vraie:                                       
                                                           mov  ax,ent_deplaceri
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,ent_deplacerj
                                                           mov  ent_squarenumberj,ax
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber

                                                           mov  startSquareNumber,ax

                                                           mov  ax,ent_deplacerx
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,ent_deplacery
                                                           mov  ent_squarenumberj,ax
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber

                                                           mov  endSquareNumber,ax

                                                           call mustcapture
                                                           cmp  sort_Mustcapture,1
                                                           je   deplacement_indirect

    ;deplacement direct
                                                           mov  ax,endSquareNumber
                                                           mov  bx,startSquareNumber

                                                           dec  ax
                                                           dec  bx

                                                           mov  dl,board[bx]
                                                           mov  si,ax

                                                           mov  board[si],dl
                                                           mov  board[bx],EMPTY

                                                           mov  al,player
                                                           cmp  player,WHITE
                                                           jne  black_pawn_upGrades_DirectMove

                                                           mov  ax,endSquareNumber
                                                           mov  si,ax
            
                                                           cmp  board[si],BLACK_PAWN
                                                           jne  black_pawn_upGrades_DirectMove

                                                           mov  ax,endSquareNumber
                                                           mov  N,ax
                                                           call getRow
                                                           cmp  sort_getRow,1
                                                           jne  black_pawn_upGrades_DirectMove
            
                                                           mov  si,ax
                                                           mov  board[si],WHITE_PAWN
                                                           jmp  Switch_Player_DirectMove

    black_pawn_upGrades_DirectMove:                        
                                                           mov  al,player
                                                           cmp  player,BLACK
                                                           jne  Switch_Player_DirectMove

                                                           mov  ax,endSquareNumber
                                                           dec  ax
                                                           mov  si,ax
                                                           cmp  board[si],BLACK_PAWN                                      ;endSquareNumber=WHITE_PAWN
                                                           jne  Switch_Player_DirectMove

                                                           mov  ax,endSquareNumber
                                                           mov  N,ax
                                                           call getRow
                                                           cmp  sort_getRow,1
                                                           jne  Switch_Player_DirectMove

    Switch_Player_DirectMove:                              
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Switch_Player_Black_DirectMove

                                                           mov  al,BLACK
                                                           mov  player,al
                                                           jmp  return1_deplacer

    Switch_Player_Black_DirectMove:                        
                                                           mov  al,WHITE
                                                           mov  player,al
                                                           jmp  return1_deplacer


    deplacement_indirect:                                  
                                                           mov  cx,ent_deplacerx
                                                           mov  dx,ent_deplacery
    ; Calculer (i + x) / 2
                                                           mov  ax,ent_deplaceri                                          ; Copier la valeur de i dans AX
                                                           add  ax, cx                                                    ; Ajouter x   AX (ax = i + x)
                                                           shr  ax, 1                                                     ; Diviser par 2 en d calant d'un bit vers la droite (ax = (i + x) / 2)
                                                           mov  bx, ax                                                    ; Stocker (i + x) / 2 dans BX

    ; Calculer (j + y) / 2
                                                           mov  ax, ent_deplacerj                                         ; Copier la valeur de j dans AX
                                                           add  ax, dx                                                    ; Ajouter y   AX (ax = j + y)
                                                           shr  ax, 1                                                     ; Diviser par 2 en d calant d'un bit vers la droite (ax = (j + y) / 2)

                                                           mov  ent_squarenumberi,bx
                                                           mov  ent_squarenumberj,ax

                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber                                   ;ax=jumpedSquareNumber
                                                           mov  jumpedSquareNumber,ax
                                                           dec  ax
                                                           mov  si,ax
                                                           mov  board[si],EMPTY

                                                           mov  ax,endSquareNumber
                                                           mov  bx,startSquareNumber

                                                           dec  ax
                                                           dec  bx

                                                           mov  dl,board[bx]
                
                                                           mov  si,ax
                
                                                           mov  board[si],dl
                                                           mov  board[bx],EMPTY

                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  black_pawn_upGrades

                                                           mov  ax,endSquareNumber
                                                           dec  ax
                                                           mov  si,ax
                                                           cmp  board[si],WHITE_PAWN                                      ;endSquareNumber=WHITE_PAWN
                                                           jne  black_pawn_upGrades

                                                           mov  ax,endSquareNumber
                                                           mov  N,ax
                                                           call getRow
                                                           cmp  sort_getRow,1
                                                           jne  black_pawn_upGrades
                
                                                           mov  si,ax

                                                           mov  board[si],WHITE_QUEEN
                                                           jmp  UpdateScore
                
    black_pawn_upGrades:                                   
                                                           mov  al,player
                                                           cmp  al,Black
                                                           jne  UpdateScore

                                                           mov  ax,endSquareNumber
                                                           dec  ax
                                                           mov  si,ax
                                                           cmp  board[si],BLACK_PAWN                                      ;endSquareNumber=WHITE_PAWN
                                                           jne  UpdateScore

                                                           mov  ax,endSquareNumber
                                                           mov  N,ax
                                                           call getRow
                                                           cmp  sort_getRow,1
                                                           jne  UpdateScore
                                
                                                           mov  si,ax
                                                           mov  board[si],BLACK_QUEEN

    UpdateScore:                                           
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Score_Black

                                                           mov  ax,scoreWhite
                                                           inc  ax
                                                           mov  scoreWhite,ax
                                                           jmp  Verif_Capture_after_Capture_Deplacer
                
    Score_Black:                                           

                                                           mov  ax,scoreBlack
                                                           inc  ax
                                                           mov  scoreBlack,ax

    Verif_Capture_after_Capture_Deplacer:                  
                                                           mov  cx,0
                                                           mov  movesSinceLastCapture,cx
                                                           mov  si,0

                                                           mov  captureaftercapture[si],cx
                                                           inc  si
                                                           mov  captureaftercapture[si],cx

                                                           mov  ax,ent_deplacerx
                                                           mov  ent_Mustcaptureaftercapturei,ax

                                                           mov  ax,ent_deplacery
                                                           mov  ent_Mustcaptureaftercapturej,ax

                                                           call Mustcaptureaftercapture

                                                           cmp  sort_Mustcaptureaftercapture,1
                                                           jne  Switch_Player

                                                           mov  ax,ent_deplacerx
                                                           mov  si,0
                                                           mov  captureaftercapture[si],ax

                                                           mov  ax,ent_deplacery
                                                           inc  si
                                                           mov  captureaftercapture[si],ax

                                                           jmp  return1_deplacer

    Switch_Player:                                         
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Switch_Player_Black

                                                           mov  al,BLACK
                                                           mov  player,al
                                                           jmp  return1_deplacer

    Switch_Player_Black:                                   
                                                           mov  al,WHITE
                                                           mov  player,al
                                                           jmp  return1_deplacer
                        
    condition_fausse:                                      
    ;condition queen
                                                           mov  ax,ent_deplaceri
                                                           mov  ent_squarestatei,ax

                                                           mov  ax,ent_deplacerj
                                                           mov  ent_squarestatej,ax

                                                           call getSquareState

                                                           cmp  sort_getSquareState,WHITE_QUEEN
                                                           je   condition_vraie_Queen
                                                           cmp  sort_getSquareState,BLACK_QUEEN
                                                           jne  return0_deplacer

    condition_vraie_Queen:                                 
                                                           mov  ax,ent_deplaceri
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,ent_deplacerj
                                                           mov  ent_squarenumberj,ax
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber

                                                           mov  startSquareNumber,ax

                                                           mov  ax,ent_deplacerx
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,ent_deplacery
                                                           mov  ent_squarenumberj,ax
                                                           call getSquareNumber

                                                           mov  ax,sort_getSquareNumber

                                                           mov  endSquareNumber,ax

                                                           call mustcapture
                                                           cmp  sort_Mustcapture,1
                                                           je   deplacement_indirect_Queen

    ;deplacement direct queen
                                                           mov  ax,endSquareNumber
                                                           dec  ax
                                                           mov  bx,startSquareNumber
                                                           dec  bx
                                                           mov  dl,board[bx]
                
                                                           mov  si,ax
                                                           mov  board[si],dl

                                                           mov  board[bx],EMPTY

    ;SwitchPlayer

                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Switch_Player_Black_DirectMove_Queen

                                                           mov  al,BLACK
                                                           mov  player,al
                                                           jmp  return1_deplacer

    Switch_Player_Black_DirectMove_Queen:                  
                                                           mov  al,WHITE
                                                           mov  player,al
                                                           jmp  return1_deplacer


    deplacement_indirect_Queen:                            

                                                           cmp  jumpsqutole,0
                                                           jne  fin_condition_Deplacer_Queen_jumpsqutole

                                
                                                           mov  ax,ent_deplacerx
                                                           inc  ax
                                                           mov  s,ax

                                                           mov  ax,ent_deplacery
                                                           inc  ax
                                                           mov  t,ax
    boucle_Deplacer_Queen_jumpsqutole:                     
    ; Appeler displaySquareState(s, t)
                                                           mov  ax,s
                                                           mov  ent_squarestatei,ax

                                                           mov  ax,t
                                                           mov  ent_squarestatej,ax

                                                           call getSquareState

                                                           mov  ax,sort_getSquareState

    ; V rifier les conditions
                                                           cmp  ax, EMPTY                                                 ; displaySquareState(s, t) == EMPTY
                                                           jne  fin_boucle_Deplacer_Queen_jumpsqutole
                                                           cmp  s, 11                                                     ; s < 11
                                                           jg   fin_boucle_Deplacer_Queen_jumpsqutole
                                                           cmp  t, 11                                                     ; t < 11
                                                           jg   fin_boucle_Deplacer_Queen_jumpsqutole

    ; Incr menter s et t
                                                           mov  ax,s
                                                           inc  ax
                                                           mov  s,ax
                                
                                                           mov  ax,t
                                                           inc  ax
                                                           mov  t,ax
                                                           jmp  boucle_Deplacer_Queen_jumpsqutole

    fin_boucle_Deplacer_Queen_jumpsqutole:                 
    ; V rifier les conditions apr s la boucle
                                                           cmp  s, 11                                                     ; s < 11
                                                           jg   fin_condition_Deplacer_Queen_jumpsqutole
                                                           cmp  t, 11                                                     ; t < 11
                                                           jg   fin_condition_Deplacer_Queen_jumpsqutole

    ; Appeler displaySquareState(s, t)
                                                           mov  ax,s
                                                           mov  ent_squarestatei,ax

                                                           mov  ax,t
                                                           mov  ent_squarestatej,ax

                                                           call getSquareState

                                                           mov  ax,sort_getSquareState

    ; V rifier si displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN
                                                           cmp  ax, BLACK_PAWN
                                                           je   assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqutole
                                                           cmp  ax, BLACK_QUEEN
                                                           jne  fin_condition_Deplacer_Queen_jumpsqutole

    assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqutole:
    ; Appeler getSquareNumber(s, t)
                                                           mov  ax,s
                                                           mov  ent_squarenumberi,ax

                                                           mov  ax,t
                                                           mov  ent_squarenumberj,ax

                                                           call getSquareNumber
                                                           mov  ax,sort_getSquareNumber

                                                           mov  jumpedSquareNumber, ax                                    ; Stocker le r sultat dans jumpedSquareNumber

    fin_condition_Deplacer_Queen_jumpsqutole:              
    ;debut condition jumpsqutori
                                                           cmp  jumpsqutori, 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqutori

    ; s = x + 1
                                                           mov  ax, ent_deplacerx
                                                           inc  ax
                                                           mov  s, ax

    ; t = y - 1
                                                           mov  ax, ent_deplacery
                                                           dec  ax
                                                           mov  t, ax

    boucle_Deplacer_Queen_jumpsqutori:                     
    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier les conditions
                                                           cmp  ax, EMPTY                                                 ; displaySquareState(s, t) == EMPTY
                                                           jne  fin_boucle_Deplacer_Queen_jumpsqutori
                                                           cmp  s, 11                                                     ; s < 11
                                                           jg   fin_boucle_Deplacer_Queen_jumpsqutori
                                                           cmp  t, 0                                                      ; t > 0
                                                           jle  fin_boucle_Deplacer_Queen_jumpsqutori

    ; Incr menter s et d cr menter t
                                                           mov  ax,s
                                                           inc  ax
                                                           mov  s,ax

                                                           mov  ax,t
                                                           dec  ax
                                                           mov  t,ax
                                                           jmp  boucle_Deplacer_Queen_jumpsqutori

    fin_boucle_Deplacer_Queen_jumpsqutori:                 
    ; V rifier les conditions apr s la boucle
                                                           cmp  s, 11                                                     ; s < 11
                                                           jg   fin_condition_Deplacer_Queen_jumpsqutori
                                                           cmp  t, 0                                                      ; t > 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqutori

    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier si displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN
                                                           cmp  ax, BLACK_PAWN
                                                           je   assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqutori
                                                           cmp  ax, BLACK_QUEEN
                                                           jne  fin_condition_Deplacer_Queen_jumpsqutori

    assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqutori:
    ; Appeler getSquareNumber(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, t
                                                           mov  ent_squarenumberj, ax
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  jumpedSquareNumber, ax                                    ; Stocker le r sultat dans jumpedSquareNumber

    fin_condition_Deplacer_Queen_jumpsqutori:              
    ; debut condition jumpsqubole
                                                           cmp  jumpsqubole, 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqubole

    ; s = x - 1
                                                           mov  ax, ent_deplacerx
                                                           dec  ax
                                                           mov  s, ax

    ; t = y + 1
                                                           mov  ax, ent_deplacery
                                                           inc  ax
                                                           mov  t, ax

    boucle_Deplacer_Queen_jumpsqubole:                     
    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier les conditions
                                                           cmp  ax, EMPTY                                                 ; displaySquareState(s, t) == EMPTY
                                                           jne  fin_boucle_Deplacer_Queen_jumpsqubole
                                                           cmp  s, 0                                                      ; s > 0
                                                           jle  fin_boucle_Deplacer_Queen_jumpsqubole
                                                           cmp  t, 10                                                     ; t < 11
                                                           jg   fin_boucle_Deplacer_Queen_jumpsqubole

    ; D cr menter s et incr menter t
                                                           mov  ax, s
                                                           dec  ax
                                                           mov  s, ax
                                                           mov  ax, t
                                                           inc  ax
                                                           mov  t, ax
                                                           jmp  boucle_Deplacer_Queen_jumpsqubole

    fin_boucle_Deplacer_Queen_jumpsqubole:                 
    ; V rifier les conditions apr s la boucle
                                                           cmp  s, 0                                                      ; s > 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqubole
                                                           cmp  t, 10                                                     ; t < 11
                                                           jg   fin_condition_Deplacer_Queen_jumpsqubole

    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier si displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN
                                                           cmp  ax, BLACK_PAWN
                                                           je   assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqubole
                                                           cmp  ax, BLACK_QUEEN
                                                           jne  fin_condition_Deplacer_Queen_jumpsqubole

    assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqubole:
    ; Appeler getSquareNumber(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, t
                                                           mov  ent_squarenumberj, ax
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  jumpedSquareNumber, ax                                    ; Stocker le r sultat dans jumpedSquareNumber

    fin_condition_Deplacer_Queen_jumpsqubole:              
    ;debut condition jumpsqubori
                                                           cmp  jumpsqubori, 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqubori

    ; s = x - 1
                                                           mov  ax, ent_deplacerx
                                                           dec  ax
                                                           mov  s, ax

    ; t = y - 1
                                                           mov  ax, ent_deplacery
                                                           dec  ax
                                                           mov  t, ax

    boucle_Deplacer_Queen_jumpsqubori:                     
    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier les conditions
                                                           cmp  ax, EMPTY                                                 ; displaySquareState(s, t) == EMPTY
                                                           jne  fin_boucle_Deplacer_Queen_jumpsqubori
                                                           cmp  s, 0                                                      ; s > 0
                                                           jle  fin_boucle_Deplacer_Queen_jumpsqubori
                                                           cmp  t, 0                                                      ; t > 0
                                                           jle  fin_boucle_Deplacer_Queen_jumpsqubori

    ; D cr menter s et t
                                                           mov  ax, s
                                                           dec  ax
                                                           mov  s, ax
                                                           mov  ax, t
                                                           dec  ax
                                                           mov  t, ax
                                                           jmp  boucle_Deplacer_Queen_jumpsqubori

    fin_boucle_Deplacer_Queen_jumpsqubori:                 
    ; V rifier les conditions apr s la boucle
                                                           cmp  s, 0                                                      ; s > 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqubori
                                                           cmp  t, 0                                                      ; t > 0
                                                           jle  fin_condition_Deplacer_Queen_jumpsqubori

    ; Appeler displaySquareState(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarestatei, ax
                                                           mov  ax, t
                                                           mov  ent_squarestatej, ax
                                                           call getSquareState
                                                           mov  ax, sort_getSquareState

    ; V rifier si displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN
                                                           cmp  ax, BLACK_PAWN
                                                           je   assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqubori
                                                           cmp  ax, BLACK_QUEEN
                                                           jne  fin_condition_Deplacer_Queen_jumpsqubori

    assigner_jumpedSquareNumber_Deplacer_Queen_jumpsqubori:
    ; Appeler getSquareNumber(s, t)
                                                           mov  ax, s
                                                           mov  ent_squarenumberi, ax
                                                           mov  ax, t
                                                           mov  ent_squarenumberj, ax
                                                           call getSquareNumber
                                                           mov  ax, sort_getSquareNumber
                                                           mov  jumpedSquareNumber, ax                                    ; Stocker le r sultat dans jumpedSquareNumber

    fin_condition_Deplacer_Queen_jumpsqubori:              
    ;UpdateBoard
                                                           dec  ax
                                                           mov  si,ax
                                                           mov  board[si],EMPTY

                                                           mov  ax,endSquareNumber
                                                           mov  bx,startSquareNumber

                                                           dec  ax
                                                           dec  bx
                                                           mov  dl,board[bx]
                                    
                                                           mov  si,ax

                                                           mov  board[si],dl
                                                           mov  board[bx],EMPTY


    ;UpdateScore Queen
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Score_Black_Queen_Indirect

                                                           mov  ax,scoreWhite
                                                           inc  ax
                                                           mov  scoreWhite,ax
                                                           jmp  Verif_Capture_after_Capture_Deplacer_Queen

    Score_Black_Queen_Indirect:                            
                                                           mov  ax,scoreBlack
                                                           inc  ax
                                                           mov  scoreBlack,ax

    Verif_Capture_after_Capture_Deplacer_Queen:            
                                                           mov  cx,0
                                                           mov  movesSinceLastCapture,cx
                                    
                                                           mov  si,0

                                                           mov  captureaftercapture[si],cx
                                                           inc  si
                                                           mov  captureaftercapture[si],cx

                                                           mov  ax,ent_deplacerx
                                                           mov  ent_Mustcaptureaftercapturei,ax

                                                           mov  ax,ent_deplacery
                                                           mov  ent_Mustcaptureaftercapturej,ax

                                                           call Mustcaptureaftercapture

                                                           cmp  sort_Mustcaptureaftercapture,1
                                                           jne  Switch_Player_Queen_Indirect

                                                           mov  ax,ent_deplacerx
                                                           mov  si,0
                                                           mov  captureaftercapture[si],ax

                                                           mov  ax,ent_deplacery
                                                           inc  si
                                                           mov  captureaftercapture[si],ax

                                                           jmp  return1_deplacer

    Switch_Player_Queen_Indirect:                          
                                                           mov  al,player
                                                           cmp  al,WHITE
                                                           jne  Switch_Player_Black_Queen_Indirect

                                                           mov  al,BLACK
                                                           mov  player,al
                                                           jmp  return1_deplacer

    Switch_Player_Black_Queen_Indirect:                    
                                                           mov  al,WHITE
                                                           mov  player,al
                                                           jmp  return1_deplacer

    return0_deplacer:                                      
                                                           mov  ax,0
                                                           mov  sort_deplacer,ax
                                                           jmp  fin_Deplacer

    return1_deplacer:                                      
                                                           mov  ax,1
                                                           mov  sort_deplacer,ax


    fin_Deplacer:                                          
        
                                                           pop  bp
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           pop  ax
                                                           ret
deplacer endp



puts proc    near
                                                           push ax
                                                           mov  ah, 09h
                                                           int  21h
                                                           pop  ax
                                                           ret
puts endp

read_char proc    near
                                                           mov  ah, 01h
                                                           int  21h
                                                           ret
read_char endp

scan_num proc    near
                                                           push dx
                                                           push ax

                                                           xor  cx, cx

    ; reset flag:
                                                           mov  make_minus, 0

    next_digit:                                            

                                                           call read_char

    ; check for minus:
                                                           cmp  al, '-'
                                                           je   set_minus

    ; check for enter key:
                                                           cmp  al, cr
                                                           je   stop_input

    ; multiply cx by 10 (first time the result is zero)
                                                           push ax
                                                           mov  ax, cx
                                                           mul  ten                                                       ; dx:ax = ax*10
                                                           mov  cx, ax
                                                           pop  ax

    ; check if the number is too big
    ; (result should be 16 bits)
                                                           cmp  dx, 0
                                                           jne  out_of_range

    ; convert from ascii code:
                                                           sub  al, 30h

    ; add al to cx:
                                                           xor  ah, ah
                                                           add  cx, ax
                                                           jc   out_of_range                                              ; jump if the number is too big.

                                                           jmp  next_digit

    set_minus:                                             
                                                           mov  make_minus, 1
                                                           jmp  next_digit

    out_of_range:                                          
                                                           lea  dx, error
                                                           call puts

    stop_input:                                            
    ; check flag:
                                                           cmp  make_minus, 0
                                                           je   not_minus
                                                           neg  cx
    not_minus:                                             

                                                           pop  ax
                                                           pop  dx
                                                           ret
scan_num endp

print_decimal proc
                                                           push ax                                                        ; Sauvegarder la valeur initiale de AX
                                                           push bx                                                        ; Sauvegarder la valeur de BX
                                                           push cx                                                        ; Sauvegarder la valeur de CX
                                                           push dx                                                        ; Sauvegarder la valeur de DX

                                                           xor  cx, cx                                                    ; Initialiser CX   0 (utilis  comme compteur)
                                                           mov  bx, 10                                                    ; Diviseur pour la conversion en d cimal

    convertloop:                                           
                                                           xor  dx, dx                                                    ; Initialiser DX   0
                                                           div  bx                                                        ; Diviser AX par 10 (quotient dans AX, reste dans DX)
                                                           push dx                                                        ; Empiler le reste (chiffre)
                                                           inc  cx                                                        ; Incr menter le compteur
                                                           cmp  ax, 0                                                     ; V rifier si le quotient est nul
                                                           jnz  convertloop                                               ; Continuer la boucle si le quotient n'est pas nul

    print_digits:                                          
                                                           pop  dx                                                        ; D piler un chiffre
                                                           add  dl, '0'                                                   ; Convertir le chiffre en caract re ASCII
                                                           mov  ah, 2                                                     ; Fonction d'affichage d'un caract re
                                                           int  21h                                                       ; Afficher le caract re
                                                           loop print_digits                                              ; R p ter jusqu'  ce que tous les chiffres soient affich s

                                                           pop  dx                                                        ; Restaurer la valeur de DX
                                                           pop  cx                                                        ; Restaurer la valeur de CX
                                                           pop  bx                                                        ; Restaurer la valeur de BX
                                                           pop  ax                                                        ; Restaurer la valeur initiale de AX
                                                           ret
print_decimal endp
read_int proc
                                                           push bx
                                                           push cx
                                                           push dx
    
                                                           xor  bx, bx
    
    read_loop:                                             
                                                           mov  ah, 01h
                                                           int  21h
                                                           cmp  al, 0Dh                                                   ; Check for Enter key
                                                           je   read_done
    
                                                           sub  al, '0'
                                                           push ax
                                                           mov  ax, bx
                                                           mov  bx, 10
                                                           mul  bx
                                                           mov  bx, ax
                                                           pop  ax
                                                           add  bx, ax
                                                           jmp  read_loop
    
    read_done:                                             
                                                           mov  ax, bx
                                                           pop  dx
                                                           pop  cx
                                                           pop  bx
                                                           ret
    
read_int endp
PrintNumber PROC
                                                           PUSH AX
                                                           PUSH BX
                                                           PUSH CX
                                                           PUSH DX

                                                           MOV  CX, 0                                                     ; Compteur de chiffres
                                                           MOV  BX, 10

    PrintLoop:                                             
                                                           XOR  DX, DX
                                                           DIV  BX                                                        ; AX = AX / 10, DX = reste
                                                           ADD  DL, '0'                                                   ; Convertir chiffre en ASCII
                                                           PUSH DX                                                        ; Stocker le chiffre
                                                           INC  CX
                                                           CMP  AX, 0
                                                           JNE  PrintLoop

    PrintDigits:                                           
                                                           POP  DX
                                                           MOV  AH, 02h
                                                           INT  21h
                                                           LOOP PrintDigits

                                                           POP  DX
                                                           POP  CX
                                                           POP  BX
                                                           POP  AX
                                                           RET
PrintNumber ENDP




CODE ENDS
END