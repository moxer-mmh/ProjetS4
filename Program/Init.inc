include "NeededProc.inc"


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


