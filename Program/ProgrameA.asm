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
    rett                         dw  ?


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
    column                       dw  ?
    row                          dw  ?
    k                            dw  ?
    k2                           dw  ?
    rowDirection                 dw  ?
    columnDirection              dw  ?
    moveDirection                dw  ?





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
  
    p                            dw  ?
    
    msg                          db  'Vous devez capturer un pion adverse avec votre dame.', 10, 13, '$'
    msg_continuer_deplacer       db  'Vous devez continuer a capturer le pion adverse .', 10, 13, '$'


    menu_msg                     db  '         Menu : ', 10, 13
    deplacer_msg                 db  '1-> Deplacer un pion', 10, 13
                                 db  '                      2-> Afficher Le damier ', 10, 13
                                 db  '3-> Afficher le score', 10, 13
                                 db  '                      0-> Quitter  ', 10, 13
                                 db  ' Votre choix : $ '

    turn_msg_white               db  '                ~~~~~~~~~~ Tour du joueur W ~~~~~~~~~~ $'
    turn_msg_black               db  '                ~~~~~~~~~~ Tour du joueur B ~~~~~~~~~~', '$'
    
    pion_msg_i                   db  'Entrez les coordonnees du pion a deplacer  : i= $'
    pion_msg_j                   db  'Entrez les coordonnees du pion a deplacer  : j= $'
    arrivee_msg_x                db  'Entrez les coordonnees de la case darrivee  : x= $'
    arrivee_msg_y                db  'Entrez les coordonnees de la case darrivee  : y= $'
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
    msg_exit_before_game_ends    db  'Vous avez quitter ,Le joueur adverse a gagner ', 10, 13, '$'
    newline2                     db  '                                                                          '
                                 db  '                                                                          '
                                 db  '                                                                          $'
    

    a1                           db  '                          *******************************                    ', 10, 13
                                 db  '      *********************************************************************  ', 10, 13
                                 db  '                                  BIENVENUE                                  ', 10, 13
                                 db  '                                                                             ', 10, 13
                                 db  '                                    DANS                                    ' , 10, 13
                                 db  '                                                                             ', 10, 13
                                 db  '                                JEU DE DAMES !!!                             ', 10, 13
                                 db  '                                                                             ', 10, 13
                                 db  '                          *******************************                    ', 10, 13
                                 db  '      ********************************************************************* $', 10, 13


 
 
    msg_start                    db  '                Appuyez sur Entree pour commencer le jeu $', 10, 13
    first                        db  '   B   B   B   B   B ',10, 13,
                                 db  ' B   B   B   B   B   ',10, 13,
                                 db  '   B   B   B   B   B ',10, 13,
                                 db  ' B   B   B   B   B   ',10, 13,
                                 db  '   .   .   .   .   . ',10, 13,
                                 db  ' .   .   .   .   .   ',10, 13,
                                 db  '   W   W   W   W   W ',10, 13,
                                 db  ' W   W   W   W   W   ',10, 13,
                                 db  '   W   W   W   W   W ',10, 13,
                                 db  ' W   W   W   W   W   ',10, 13,
                                 db  ' 1 2 3 4 5 6 7 8 9 $ ',10, 13,


    msg_jouer                    db  'Jouons aux dames !$'

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
    msg_invalid_pawn_move        db  "Le deplacement du pion sur cette case n'est pas valide car il est trop long.", 0Ah, 0
    msg_invalid_square           db  "Erreur : i et j doivent etre entre 1 et 10.", 0Ah, 0
    msg_end_square_occupied      db  "Cette case  est deja occupee.", 0Ah, 0
    msg_start_square_invalid     db  "Cette case ne contient pas votre pion et dame.", 0Ah, 0
    msg_start_square_empty       db  "Aucun pion a deplacer sur cette case.", 0Ah, 0
    msg_invalid_piece            db  "Aucun pion a deplacer sur cette case.", 0Ah, 0
    msg_invalid_pawn_direction   db  "Le deplacement du pion  n'est pas dans la bonne direction.", 0Ah, 0
    msg_valid                    db  "Le deplacement du pion sur la case est valide.\n" , 0Ah, 0
    msg_capture_adv              db  "Vous devez capturer le pion adverse .\n"  ,0Ah, 0

DATA ENDS

CODE SEGMENT PARA 'CODE'
main proc
                                   mov  ax, DATA                          ; Charger la valeur de DATA dans AX
                                   mov  ds, ax
                                    
                                   mov  ah,9
                                   lea  dx,a1
                                   int  21h

                            
                                       
                                   lea  dx,newline
                                   int  21h
                                   lea  dx,newline
                                   int  21h
                                       
                                   lea  dx,newline
                                   int  21h
                                                            
                                   mov  ah, 09h
                                   lea  dx, msg_start
                                   int  21h


    ; Attendre l'appui sur la touche Entr?e
                                   mov  ah, 00h
                                   int  16h
                                   cmp  al, 13                            ; Code ASCII de la touche Entr?e
                                   jne  attente
                                        
                                    
    ; Effacer l'?cran
                                   mov  ah, 00h
                                   mov  al, 03h
                                   int  10h

    
    ; Appeler InitialiserDamier et AfficherDamier
                                       
                                       
                                   call InitialiserDamier
                                       
                                   lea  dx,first
                                   call puts
                                       
    ;call AfficherDamier

                                   mov  ah, 02h
                                   mov  bh, 0
                                   mov  dh, 12                            ; Move to row 12 (8 rows for damier + 4 rows extra space)                                        mov dl, 0   ; Column 0 (leftmost position)
                                   int  10h
                                                                               
    game_loop:                     
    
                                   lea  dx,newline
                                   call puts
                                         
                                        
    ; Appeler l'interruption 21h pour afficher la cha?ne
    
    ; Imprimer le tour du joueur
                                   mov  al,player
                                   cmp  al, WHITE                         ; Comparer player avec la valeur de WHITE
                                   je   print_white_turn                  ; Sauter ? print_white_turn si player == WHITE
                                   lea  dx, turn_msg_black                ; Charger l'adresse de la cha?ne pour le joueur Noir
                                   jmp  print_turn
    print_white_turn:              
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                                         
                                   lea  dx, turn_msg_white                ; Charger l'adresse de la cha?ne pour le joueur Blanc                                                 ; Charger 'W' dans DL
    print_turn:                    
                                   call puts
                                   lea  dx, newline                       ; Charger l'adresse de la nouvelle ligne
                                   call puts                              ; Afficher une nouvelle ligne                                                   ; Appeler ? nouveau pour afficher un caract?re de nouvelle ligne
										
                                   mov  al,player
                                   cmp  al,WHITE
                                   jne  Black_Move

    ; Imprimer le menu
                                                                                                                    
                                   lea  dx, menu_msg                      ; Charger l'adresse de menu_msg dans DX
                                       
                                   call puts

    ; Lire le choix de l'utilisateur
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                       
                                   call scan_num                          ; Appeler la proc?dure read_int pour lire un entier
                                   mov  choix, cx
                                       
    ; Stocker la valeur num?rique dans choix
                                            
    ; G?rer le choix de l'utilisateur
                                   cmp  choix, 1                          ; Comparer choix avec 1
                                   je   move_pion                         ; Sauter ? move_pion si choix == 1
                                   cmp  choix, 2                          ; Comparer choix avec 2
                                   je   afficher_damier                   ; Sauter ? afficher_damier si choix == 2
                                   cmp  choix, 3                          ; Comparer choix avec 3
                                   je   afficher_score                    ; Sauter ? afficher_score si choix == 3
                                   cmp  choix, 0                          ; Comparer choix avec 0
                                   je   Game_conditions                   ; Sauter ? quit_game si choix == 0
    
    ; Choix invalide
                                       
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                       
                                   lea  dx, choix_invalid_msg             ; Charger l'adresse de choix_invalid_msg dans DX
                                   call puts
                                   jmp  game_loop                         ; Retourner ? game_loop
    
    move_pion:                     
    ; Lire les coordonn?es du pion
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                                                                      
                                   lea  dx, pion_msg_i                    ; Charger l'adresse de pion_msg dans DX
                                   call puts                              ; Appeler l'interruption 21h pour afficher la cha?ne
    
                                   call scan_num                          ; Appeler la proc?dure read_int pour lire un entier
                                   mov  imain, cx
                                       
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                       
                                   lea  dx, pion_msg_j                    ; Charger l'adresse de pion_msg dans DX
                                   call puts                              ;
                                   call scan_num                          ; Appeler ? nouveau read_int pour lire un autre entier
                                   mov  jmain, cx
    ; Lire les coordonn?es d'arriv?e
                                   lea  dx, newline                       ; Charger l'adresse de newline dans DX
                                   call puts
                                       
                                   lea  dx, arrivee_msg_x                 ; Charger l'adresse de arrivee_msg dans DX
                                   call puts                              ; Appeler l'interruption 21h pour afficher la cha?ne
    
                                   call scan_num                          ; Appeler read_int pour lire un entier
                                   mov  xmain, cx                         ; Stocker la valeur lue dans xmai
                                   lea  dx, newline
                                   call puts
                                   lea  dx, arrivee_msg_y                 ; Charger l'adresse de arrivee_msg dans DX
                                   call puts
                                   call scan_num                          ; Appeler ? nouveau read_int pour lire un autre entier
                                   mov  ymain, cx                         ; Stocker la valeur lue dans ymain
    
    ; Appeler Deplacer
                                   mov  ax,imain
                                   mov  ent_deplaceri,ax

                                   mov  ax,jmain
                                   mov  ent_deplacerj,ax

                                   mov  ax,xmain
                                   mov  ent_deplacerx,ax

                                   mov  ax,ymain
                                   mov  ent_deplacery,ax
									   
									    
    ; Effacer l'?cran
                                   mov  ah, 00h
                                   mov  al, 03h
                                   int  10h

    ;call          deplacer                                                ; Appeler la proc?dure deplacer
    
    ; V?rifier la valeur de retour et afficher le damier
                                   cmp  sort_deplacer, 1                  ; Comparer la valeur de retour avec 1
                                   jne  Game_conditions
                                      
    ; Retourner ? game_loop si la valeur n'est pas ?gale ? 1
                                   call AfficherDamier                    ; Sinon, appeler AfficherDamier
                                   jmp  Game_conditions                   ; Retourner ? game_loop
    
    afficher_damier:               
                                       
    ; Effacer l'?cran
                                   mov  ah, 00h
                                   mov  al, 03h
                                   int  10h
                                    
                                    
    ; Afficher le damier
                                   call AfficherDamier
                                       
                                   mov  ah, 06h
                                   mov  al, 0
                                   mov  bh, 07h
                                   mov  ch, 0
                                   mov  cl, 0
                                   mov  dh, 24
                                   mov  dl, 79
                                   int  10h
                                   jmp  Game_conditions                   ; Retourner ? game_loop
                                        
    afficher_score:                
    ; Imprimer le message de score
    ; Afficher le message ? Black Score : ?
                                   lea  dx,newline
                                   call puts
                                       
                                   lea  dx,score_msg_black
                                   call puts
                                             


    ; Convertir et afficher le score de Black
                                   mov  ax, scoreBlack
                                   call PrintNumber
									
                                   lea  dx,newline
                                   call puts

    ; Afficher le message ?         White Score : ?
                                   lea  dx,score_msg_white
                                   call puts
									
                                   lea  dx,newline
                                   call puts

    ; Convertir et afficher le score de White
                                   Mov  ax, scoreWhite
                                   call PrintNumber
									
									

    ; Afficher le retour ? la ligne
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
                                   jl   check_black_score                 ; Sauter ? check_black_score si scoreWhite < 20

    ; Afficher le message de victoire pour le joueur W
                                   lea  dx, white_win
                                   call puts

                                   jmp  exit_main                         ; Quitter

    check_black_score:             
                                   mov  ax, scoreBlack
                                   cmp  ax, 20
                                   jl   check_other_conditions            ; Sauter ? check_other_conditions si scoreBlack < 20

    ; Afficher le message de victoire pour le joueur B
                                   lea  dx, black_win
                                   call puts

                                   jmp  exit_main                         ; Quitter le jeu

    check_other_conditions:        
    ; Initialiser les compteurs de pi?ces a 0
                                   xor  ax, ax
                                   mov  whitepieces, ax
                                   mov  blackpieces, ax

    ; Boucle pour parcourir le plateau de jeu
                                   mov  cx, 50                            ; Nombre de cases sur le plateau
                                   xor  si, si                            ; Initialiser l'index du tableau ? 0

    loop_count_pieces:             
                                   mov  al, board[si]                     ; Charger la valeur de la case actuelle
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
							
                                   lea  dx,newline
                                   call puts

                                   lea  dx,msg_no_whitepieces
                                   call puts
                                   jmp  exit_main


    check_black_pieces:            
                                   mov  ax,blackpieces
                                   cmp  ax,0
                                   jne  check_another_other_conditions
							
                                   lea  dx,newline
                                   call puts

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
                                   and  ax, capturepossible               ; ax = 0 si whiteHasOnlyQueens && blackHasOnlyQueens && capturepossible == 0
                                   jnz  reset_move_counter
                            
    ; Incr?menter movesSinceLastCapture
                                   mov  ax, movesSinceLastCapture
                                   inc  ax
                                   mov  movesSinceLastCapture, ax
                            
    ; V?rifier si movesSinceLastCapture >= 6
                                   cmp  ax, 6
                                   jl   game_loop                         ; Continuer le jeu si movesSinceLastCapture < 6
                            
    ; Afficher le message de jeu bloqu?
                                   lea  dx, msg_bloque
                                   call puts
                                   jmp  exit_main
                            
    reset_move_counter:            
                                   mov  ax, 0
                                   mov  movesSinceLastCapture, ax
                                   jmp  game_loop
                
    exit_0:                        
                                   lea  dx,msg_exit_before_game_ends
                                   call puts


    exit_main:                     
                                   mov  ah, 4Ch                           ; fonction pour quitter
                                   int  20h                               ; appelle l'interruption 20h                                                ; Appeler l'interruption 21h pour quitter
    
    attente:                       
                                   jmp  attente
                                                                      
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

    ; D?placer la valeur de N dans ax
                                   mov  ax, N

    ; V?rifier si N est inf?rieur ? 1
                                   cmp  al, 1
                                   jl   errorgetRow

    ; V?rifier si N est sup?rieur ? 50
                                   cmp  al, 50
                                   jg   errorgetRow

    ; Soustraire 1 de N (car les rang?es sont index?es ? partir de 0)
                                   sub  al, 1

    ; Effacer le demi-registre sup?rieur de ax
                                   mov  ah, 0

    ; Diviser N par 5 pour obtenir le num?ro de rang?e
                                   mov  bl, 5
                                   div  bl

    ; Ajouter 1 au num?ro de rang?e (car nous avons soustrait 1 pr?c?demment)
                                   add  al, 1

    ; Sauter ? donegetRow pour ?viter la gestion des erreurs
                                   jmp  donegetRow

    errorgetRow:                   
    ; Imprimer une nouvelle ligne
                                   lea  dx, newline
                                   call puts

    ; Imprimer un message d'erreur
                                   lea  dx, error1
                                   call puts

    ; D?finir la valeur de retour ? 0 (indiquant une erreur)
                                   mov  ax, 0

    donegetRow:                    
    ; Effacer le demi-registre sup?rieur de ax (au cas o? il a ?t? modifi? lors de la gestion des erreurs)
                                   mov  ah, 0

    ; Stocker le num?ro de rang?e dans la variable sort_getRow
                                   mov  sort_getRow, ax

    ; Restaurer les valeurs des registres depuis la pile
                                   pop  bp
                                   pop  dx
                                   pop  cx
                                   pop  bx
                                   pop  ax

    ; Retourner de la proc?dure
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

    ; D?placer la valeur de N dans ax
                                   mov  ax, N
    
    ; V?rifier si N est inf?rieur ? 1
                                   cmp  al, 1
                                   jl   errorgetcolumn
    
    ; V?rifier si N est sup?rieur ? 50
                                   cmp  al, 50
                                   jg   errorgetcolumn

    ; Appeler la fonction getRow pour v?rifier si la rang?e est paire ou impaire
                                   push ax                                ; Sauvegarder N sur la pile
                                   call getRow
                                   mov  ax,sort_getRow                    ; AX contient maintenant la valeur de la rang?e
                                   pop  bx                                ; Restaurer N dans le registre BX

    ; V?rifier si la rang?e est paire ou impaire
                                   test al, 1                             ; V?rifier si le bit de poids faible est d?fini
                                   jnz  odd_row                           ; Sauter ? odd_row si la rang?e est impaire

    ; Rang?e paire
                                   mov  ax, N                             ; D?placer N dans le registre AX
                                   mov  cl, 10                            ; D?finir CL ? 10 pour la division
                                   mov  dx, 0
                                   div  cl                                ; Diviser AX par 10 (quotient dans AX, reste dans DL)
                                   cmp  ah, 0                             ; V?rifier si le reste est 0
                                   je   last_column                       ; Sauter ? last_column si le reste est 0

    ; Calculer la valeur de colonne pour une rang?e paire
                                   mov  ax, N
                                   mov  cl, 10
                                   mov  dx, 0
                                   div  cl
                                   mov  al, ah
                                   mov  ah, 0
                                   mov  cx, 2
                                   mul  cx
                                   sub  ax, 11
                                   jmp  done_column                       ; Sauter ? done_column

    odd_row:                       
    ; Rang?e impaire
                                   mov  ax, N
                                   mov  cl, 10
                                   mov  dx, 0
                                   div  cl
                                   mov  al, ah
                                   mov  ah, 0
                                   mov  cx, 2
                                   mul  cx
                                   jmp  done_column                       ; Sauter ? done_column

    last_column:                   
                                   mov  ax, 9                             ; D?finir la valeur de colonne ? 9 pour la derni?re colonne
                                   jmp  done_column

    errorgetcolumn:                
                                   lea  dx, newline
                                   call puts

                                   lea  dx, error1
                                   call puts
                                   mov  ax, 0

    done_column:                   
                                   mov  ah, 0
                                   mov  sort_getColumn, ax                ; Stocker la valeur de colonne dans la variable sort_getColumn
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

    ; D?placer les valeurs de ent_squarenumberi et ent_squarenumberj dans ax et bx
                                   mov  ax, ent_squarenumberi
                                   mov  bx, ent_squarenumberj

    ; V?rifier si les valeurs sont en dehors de la plage [1, 10]
                                   cmp  al, 1
                                   jl   errorgetSquareNumber
                                   cmp  al, 10
                                   jg   errorgetSquareNumber

                                   cmp  bl, 1
                                   jl   errorgetSquareNumber
                                   cmp  bl, 10
                                   jg   errorgetSquareNumber

    ; Calculer le num?ro de la case
                                   add  al, bl
                                   mov  ah, 0
                                   mov  bl, 2
                                   div  bl

    ; V?rifier si la case est blanche
                                   cmp  ah, 0
                                   je   msgcaseblanche

    ; Calculer le num?ro de la case pour une case noire
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
    ; Cas sp?cial pour une case blanche
                                   mov  ax, 0

    donegetSquareNumber:           
                                   mov  ah, 0
                                   mov  sort_getSquareNumber, ax          ; Stocker le r?sultat dans sort_getSquareNumber
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

    ; D?placer les valeurs de ent_squarecolori et ent_squarecolorj dans ax et bx
                                   mov  ax, ent_squarecolori
                                   mov  bx, ent_squarecolorj

    ; Appeler getSquareNumber pour obtenir le num?ro de la case
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
    ; V?rifier si les valeurs sont dans la plage [1, 10]
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
                                   mov  sort_getSquareColor, ax           ; Stocker le r?sultat dans sort_getSquareColor
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

    ; D?placer les valeurs de ent_squarestatei et ent_squarestatej dans ax et bx
                                   mov  ax, ent_squarestatei
                                   mov  bx, ent_squarestatej

    ; Appeler getSquareNumber pour obtenir le num?ro de la case
                                   mov  ent_squarenumberi, ax
                                   mov  ent_squarenumberj, bx

                                   call getSquareNumber
                                   mov  ax, sort_getSquareNumber
                                   mov  si, ax

    ; V?rifier l'?tat de la case ? partir du tableau board
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
                                   mov  sort_getSquareState, ax           ; Stocker le r?sultat dans sort_getSquareState
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

    ; Initialiser le compteur de boucle ? 0
                                   mov  cx, 0

    ; Obtenir l'offset du tableau board
                                   mov  bx, offset board

    loop_init:                     
    ; V?rifier si l'index est inf?rieur ? 20
                                   cmp  cx, 20
                                   jl   init_black

    ; V?rifier si l'index est sup?rieur ou ?gal ? 30
                                   cmp  cx, 30
                                   jge  init_white

    ; Initialiser l'?l?ment courant du tableau ? EMPTY (0)
                                   mov  [bx], 0
                                   jmp  next_index

    init_black:                    
    ; Initialiser l'?l?ment courant du tableau ? BLACK_PAWN (2)
                                   mov  [bx], 2
                                   jmp  next_index

    init_white:                    
    ; Initialiser l'?l?ment courant du tableau ? WHITE_PAWN (1)
                                   mov  [bx], 1

    next_index:                    
    ; Passer ? l'?l?ment suivant du tableau
                                   inc  bx
                                   inc  cx

    ; V?rifier si tous les 50 ?l?ments ont ?t? initialis?s
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

    ; D?placer les valeurs de ent_printi et ent_printj dans ax et bx
                                   mov  ax, ent_printi
                                   mov  bx, ent_printj

    ; Initialiser les variables pour les appels ? getSquareState et getSquareColor
                                   mov  ent_squarecolori, ax
                                   mov  ent_squarecolorj, bx
                                   mov  ent_squarestatei, ax
                                   mov  ent_squarestatej, bx

    ; Appeler getSquareState et getSquareColor pour obtenir l'?tat et la couleur de la case
                                   call getSquareState
                                   call getSquareColor
                                   mov  ax, sort_getSquareColor
                                   cmp  ax, WHITE
                                   je   print_white

    ; V?rifier l'?tat de la case et imprimer le contenu correspondant
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
    ; Initialiser les variables pour l'appel ? printSquare
                                   mov  ent_printi, cx
                                   mov  ent_printj, dx

    ; Appeler printSquare pour afficher la case
                                   call printSquare

    ; Restaurer les valeurs de ent_printi et ent_printj
                                   mov  cx, ent_printi
                                   mov  dx, ent_printj

    ; Passer ? la colonne suivante
                                   inc  dx
                                   cmp  dx, 11
                                   jl   inner_loop

    ; V?rifier si toutes les colonnes ont ?t? affich?es
                                   cmp  dx, 11
                                   je   print_row

    ret_print_row:                 
    ; Imprimer deux nouvelles lignes pour s?parer les rang?es
                                   lea  dx, newline
                                   call puts
  
    ; Passer ? la rang?e suivante
                                   mov  cx, ent_printi
                                   inc  cx
                                   cmp  cx, 10
                                   jle  outer_loop

    ; Imprimer les num?ros de colonnes
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
    ; Imprimer le num?ro de rang?e
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
                                   mul  ten                               ; dx:ax = ax*10
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
                                   jc   out_of_range                      ; jump if the number is too big.

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
                                   push ax                                ; Sauvegarder la valeur initiale de AX
                                   push bx                                ; Sauvegarder la valeur de BX
                                   push cx                                ; Sauvegarder la valeur de CX
                                   push dx                                ; Sauvegarder la valeur de DX

                                   xor  cx, cx                            ; Initialiser CX ? 0 (utilis? comme compteur)
                                   mov  bx, 10                            ; Diviseur pour la conversion en d?cimal

    convertloop:                   
                                   xor  dx, dx                            ; Initialiser DX ? 0
                                   div  bx                                ; Diviser AX par 10 (quotient dans AX, reste dans DX)
                                   push dx                                ; Empiler le reste (chiffre)
                                   inc  cx                                ; Incr?menter le compteur
                                   cmp  ax, 0                             ; V?rifier si le quotient est nul
                                   jnz  convertloop                       ; Continuer la boucle si le quotient n'est pas nul

    print_digits:                  
                                   pop  dx                                ; D?piler un chiffre
                                   add  dl, '0'                           ; Convertir le chiffre en caract?re ASCII
                                   mov  ah, 2                             ; Fonction d'affichage d'un caract?re
                                   int  21h                               ; Afficher le caract?re
                                   loop print_digits                      ; R?p?ter jusqu'? ce que tous les chiffres soient affich?s

                                   pop  dx                                ; Restaurer la valeur de DX
                                   pop  cx                                ; Restaurer la valeur de CX
                                   pop  bx                                ; Restaurer la valeur de BX
                                   pop  ax                                ; Restaurer la valeur initiale de AX
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
                                   cmp  al, 0Dh                           ; Check for Enter key
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

                                   MOV  CX, 0                             ; Compteur de chiffres
                                   MOV  BX, 10

    PrintLoop:                     
                                   XOR  DX, DX
                                   DIV  BX                                ; AX = AX / 10, DX = reste
                                   ADD  DL, '0'                           ; Convertir chiffre en ASCII
                                   PUSH DX                                ; Stocker le chiffre
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
