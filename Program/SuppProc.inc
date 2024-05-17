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