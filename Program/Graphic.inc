include "SuppProc.inc"
include "NeededProc.inc"

printSquare proc
                                       push   bp
                                       mov    bp, sp

                                       mov    ax, ent_printi
                                       mov    bx, ent_printj

                                       mov    ent_squarecolori, ax
                                       mov    ent_squarecolorj, bx
                                       mov    ent_squarestatei, ax
                                       mov    ent_squarestatej, bx

                                       call   getSquareState
                                       call   getSquareColor
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

                                       lea    dx, newline
                                       call   puts

                                       lea    dx, newline
                                       call   puts

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
