#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define EMPTY 0
#define WHITE_PAWN 1
#define BLACK_PAWN 2
#define WHITE_QUEEN 3
#define BLACK_QUEEN 4
#define WHITE 'w'
#define BLACK 'b'
int board[50];
int player = WHITE;
int capturepossible = 0;
int captureaftercapture[50];

int coor[50];
int scoreWhite=0;
int scoreBlack=0;

int jumpsqutole[2];
int jumpsqutori[2];
int jumpsqubole[2];
int jumpsqubori[2];

int movesSinceLastCapture = 0;


int getRow(int N);
int getColumn(int N);
int getSquareNumber(int i, int j);
char getSquareColor(int i, int j);
int displaySquareState(int i, int j);
int verif(int i , int j , int x , int y);
int mustcapture();
int deplacer(int i, int j, int x, int y);
void AfficherDamier();
void InitialiserDamier();


int getRow(int N) {
  if (N < 1 || N > 50) {
    return 0;
  }
  return ((N - 1) / 5) + 1;
}

int getColumn (int N){

  if (N < 1 || N > 50) {
    return 0;
  }

  if(getRow(N)  % 2 == 0){
    if ( N % 10 != 0){
      return ((N % 10) * 2 ) - 11 ;

    }else{
    return 9 ;
    }

  }else{
  return ( N % 10) * 2;
  }
}

int getSquareNumber(int i, int j) {
  if (i < 1 || i > 10 || j < 1 || j > 10) {
    return 0;
  }
  if ((i + j) % 2 == 0) {
    return 0;
  }
  return (i - 1) * 5 + (j + 1) / 2;
}

char getSquareColor(int i, int j) {
    int squareNumber = getSquareNumber(i, j);

    if (squareNumber == 0 && i >= 1 && i <= 10 && j >= 1 && j <= 10) {
        return WHITE;
    } else if (squareNumber != 0 && i >= 1 && i <= 10 && j >= 1 && j <= 10) {
        return BLACK;
    }
}

int displaySquareState(int i, int j) {

    int squareNumber = getSquareNumber(i, j);

    int pieceType = board[squareNumber - 1];
    switch (pieceType) {
        case EMPTY:
            return EMPTY;
        case WHITE_PAWN:
            return WHITE_PAWN;
        case BLACK_PAWN:
            return BLACK_PAWN;
        case WHITE_QUEEN:
            return WHITE_QUEEN;
        case BLACK_QUEEN:
            return BLACK_QUEEN;
        default:
            printf("Etat de la case invalide");
            break;
    }
}

void AfficherDamier() {
    printf("   ");
    for (int j = 1; j <= 10; j++) {
        printf("%2d ", j);
    }
    printf("\n");

    for (int i = 1; i <= 10; i++) {
        printf("%2d ", i);

        for (int j = 1; j <= 10; j++) {
            char squareColor = getSquareColor(i, j);
            int squareState = displaySquareState(i, j);

            switch (squareState) {
                case EMPTY:
                    printf((squareColor == WHITE) ? "   " : " . ");
                    break;
                case WHITE_PAWN:
                    printf(" W ");
                    break;
                case BLACK_PAWN:
                    printf(" B ");
                    break;
                case WHITE_QUEEN:
                    printf("WD ");
                    break;
                case BLACK_QUEEN:
                    printf("BD ");
                    break;
            }
        }

        printf("\n");
    }
}

void InitialiserDamier() {

    for (int i = 0; i < 50; i++) {
      if (i < 20) {
        board[i] = BLACK_PAWN;
      } else if (i > 29) {
        board[i] = WHITE_PAWN;
      } else {
        board[i] = EMPTY;
      }
    }
}

int mustcapture() {
    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    capturepossible = 0;
    coor[0]=0;
    coor[1]=0;
    coor[2]=0;
    coor[3]=0;
    coor[4]=0;
    coor[5]=0;
    coor[6]=0;
    coor[7]=0;
    int q=0;
    for (int s; s<2; s++){
        jumpsqutole[s]=0;
        jumpsqutori[s]=0;
        jumpsqubole[s]=0;
        jumpsqubori[s]=0;
    }

    for (int k = 0; k < 50; k++) {
        if (board[k] == currentPlayer) {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            if (currentPlayer == WHITE_PAWN) {
                if ((i-2)>0 && (j - 2)>0  ){
                    if (i > 1 && j > 1 && (board[getSquareNumber(i - 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j - 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i-2)>0 && (j + 2)<11){
                    if (i > 1 && j < 10 && (board[getSquareNumber(i - 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j + 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j + 2);
                        q++;
                        capturepossible++;
                    }
                }
            } else if(currentPlayer == BLACK_PAWN){
                if ((i+2)<11 && (j - 2)>0  ){
                     if (i < 10 && j > 1 && (board[getSquareNumber(i + 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j - 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i+2)<11 && (j + 2)<11){
                    if (i < 10 && j < 10 && (board[getSquareNumber(i + 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j + 1) - 1] == opponentQueen ) && board[getSquareNumber(i + 2, j + 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + 2, j + 2);
                        q++;
                        capturepossible++;
                    }
                }
            }
        }
        // Check for queens
        if (board[k] == currentQueen) {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            // Check for captures in the 4 diagonal directions based on current player's color

            // Check for captures in the top-left direction
            for (int m = 1; m < 10; m++) {
                if ((i - m) < 1 || (j - m) < 1) {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i - m - 1) < 1 || (j - m - 1) < 1) {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j - m - 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - m - 1, j - m - 1);
                        q++;
                        capturepossible++;
                        jumpsqutole[0] = i - m; // Assign a value to the first element of jumpsqutole
                        jumpsqutole[1]=j-m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the top-right direction
            for (int m = 1; m < 10; m++) {
                if ((i - m) < 1 || (j + m) > 10) {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i - m - 1) < 1 || (j + m + 1) > 10) {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j + m + 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - m - 1, j + m + 1);
                        q++;
                        capturepossible++;
                        jumpsqutori[0]=i-m;
                        jumpsqutori[1]=j+m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-left direction
            for (int m = 1; m < 10; m++) {
                if ((i + m) > 10 || (j - m) < 1) {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i + m + 1) > 10 || (j - m - 1) < 1) {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j - m - 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + m + 1, j - m - 1);
                        q++;
                        capturepossible++;
                        jumpsqubole[0]=i+m;
                        jumpsqubole[1]=j-m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-right direction
            for (int m = 1; m < 10; m++) {
                if ((i + m) > 10 || (j + m) > 10) {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i + m + 1) > 10 || (j + m + 1) > 10) {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j + m + 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + m + 1, j + m + 1);
                        q++;
                        capturepossible++;
                        jumpsqubori[0]=i+m;
                        jumpsqubori[1]=j+m;
                        break;
                    } else {
                        break;
                    }
                }
            }


        }
    }

    if (capturepossible > 0) {
        return 1;
    } else {
        return 0;
    }
}

int mustcaptureaftercapture(int i , int j){
    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    capturepossible = 0;
    coor[0]=0;
    coor[1]=0;
    coor[2]=0;
    coor[3]=0;
    coor[4]=0;
    coor[5]=0;
    coor[6]=0;
    coor[7]=0;
    int q=0;
    for (int s; s<2; s++){
        jumpsqutole[s]=0;
        jumpsqutori[s]=0;
        jumpsqubole[s]=0;
        jumpsqubori[s]=0;
    }
    int k = getSquareNumber(i, j)-1;
        if (board[k] == currentPlayer) {

            if (currentPlayer == WHITE_PAWN) {
                if ((i-2)>0 && (j - 2)>0  ){
                    if (i > 1 && j > 1 && (board[getSquareNumber(i - 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j - 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i-2)>0 && (j + 2)<11){
                    if (i > 1 && j < 10 && (board[getSquareNumber(i - 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j + 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j + 2);
                        q++;
                        capturepossible++;
                    }
                }
            } else if(currentPlayer == BLACK_PAWN){
                if ((i+2)<11 && (j - 2)>0  ){
                     if (i < 10 && j > 1 && (board[getSquareNumber(i + 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j - 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i+2)<11 && (j + 2)<11){
                    if (i < 10 && j < 10 && (board[getSquareNumber(i + 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j + 1) - 1] == opponentQueen ) && board[getSquareNumber(i + 2, j + 2) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + 2, j + 2);
                        q++;
                        capturepossible++;
                    }
                }
            }
        }
        // Check for queens
        if (board[k] == currentQueen) {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            // Check for captures in the 4 diagonal directions based on current player's color

            // Check for captures in the top-left direction
            for (int m = 1; m < 10; m++) {
                if ((i - m) < 1 || (j - m) < 1) {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i - m - 1) < 1 || (j - m - 1) < 1) {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j - m - 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - m - 1, j - m - 1);
                        q++;
                        capturepossible++;
                        jumpsqutole[0] = i - m; // Assign a value to the first element of jumpsqutole
                        jumpsqutole[1]=j-m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the top-right direction
            for (int m = 1; m < 10; m++) {
                if ((i - m) < 1 || (j + m) > 10) {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i - m - 1) < 1 || (j + m + 1) > 10) {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j + m + 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - m - 1, j + m + 1);
                        q++;
                        capturepossible++;
                        jumpsqutori[0]=i-m;
                        jumpsqutori[1]=j+m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-left direction
            for (int m = 1; m < 10; m++) {
                if ((i + m) > 10 || (j - m) < 1) {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i + m + 1) > 10 || (j - m - 1) < 1) {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j - m - 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + m + 1, j - m - 1);
                        q++;
                        capturepossible++;
                        jumpsqubole[0]=i+m;
                        jumpsqubole[1]=j-m;
                        break;
                    } else {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-right direction
            for (int m = 1; m < 10; m++) {
                if ((i + m) > 10 || (j + m) > 10) {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer) {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY) {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece) {
                    if ((i + m + 1) > 10 || (j + m + 1) > 10) {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j + m + 1) - 1] == EMPTY) {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + m + 1, j + m + 1);
                        q++;
                        capturepossible++;
                        jumpsqubori[0]=i+m;
                        jumpsqubori[1]=j+m;
                        break;
                    } else {
                        break;
                    }
                }
            }


        }

    if (capturepossible > 0) {
        return 1;
    } else {
        return 0;
    }
}

int verif(int i, int j, int x, int y) {

    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    int startSquareNumber = getSquareNumber(i, j);
    int endSquareNumber = getSquareNumber(x, y);

    if (captureaftercapture[0] != 0 && captureaftercapture[1] != 0){
        if ((i!= getRow(coor[0]) || j != getColumn(coor[0]) || x != getRow(coor[1]) || y != getColumn(coor[1])) && (i!= getRow(coor[2]) || j != getColumn(coor[2]) || x != getRow(coor[3]) || y != getColumn(coor[3])) && (i!= getRow(coor[4]) || j != getColumn(coor[4]) || x != getRow(coor[5]) || y != getColumn(coor[5])) && (i!= getRow(coor[6]) || j != getColumn(coor[6]) || x != getRow(coor[7]) || y != getColumn(coor[7])) ){
            int k = 0;
                    while (coor[k] != 0){
                        printf("Vous devez continuer a capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[k]), getColumn(coor[k]), getRow(coor[k+1]), getColumn(coor[k+1]));
                        k+=2;
                    }
                    return 0;
        }
    }else if (mustcapture() == 1) {
            if ((i!= getRow(coor[0]) || j != getColumn(coor[0]) || x != getRow(coor[1]) || y != getColumn(coor[1])) && (i!= getRow(coor[2]) || j != getColumn(coor[2]) || x != getRow(coor[3]) || y != getColumn(coor[3])) && (i!= getRow(coor[4]) || j != getColumn(coor[4]) || x != getRow(coor[5]) || y != getColumn(coor[5])) && (i!= getRow(coor[6]) || j != getColumn(coor[6]) || x != getRow(coor[7]) || y != getColumn(coor[7]))){
                    int k = 0;
                    while (coor[k] != 0){
                        printf("Vous devez capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[k]), getColumn(coor[k]), getRow(coor[k+1]), getColumn(coor[k+1]));
                        k+=2;
                    }
                    return 0;
            }
    }
    
    if (displaySquareState(i, j) == currentPlayer){
        if (mustcapture == 0){
            if (abs(i - x) > 1 || abs(j - y) > 1) {
                printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas valide car il est trop long.\n", i, j, x, y);
                return 0;
            }
        }

        if (startSquareNumber == 0 || endSquareNumber == 0) {
            printf("Erreur : i et j doivent etre entre 1 et 10.\n");
            return 0;
        }

        if (board[endSquareNumber - 1] != EMPTY) {
            printf("La case (%d, %d) est deja occupee.\n", x, y);
            return 0;
        }

        if (board[startSquareNumber - 1] != currentPlayer) {
            printf("La case (%d, %d) ne contient pas votre pion.\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] == EMPTY) {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] != WHITE_PAWN && board[startSquareNumber - 1] != BLACK_PAWN) {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        int isWhitePawn = (board[startSquareNumber - 1] == WHITE_PAWN);
        int moveDirection = endSquareNumber - startSquareNumber;
        if ((isWhitePawn && moveDirection >= 0) || (!isWhitePawn && moveDirection <= 0)) {
            printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas dans la bonne direction.\n", i, j, x, y);
            return 0;
        }
    }else if (displaySquareState(i, j) == currentQueen){

    if (startSquareNumber == 0 || endSquareNumber == 0) {
        printf("Erreur : i et j doivent etre entre 1 et 10.\n");
        return 0;
    }

    if (board[endSquareNumber - 1] != EMPTY) {
        printf("La case (%d, %d) est deja occupee.\n", x, y);
        return 0;
    }

    if (board[startSquareNumber - 1] != currentQueen) {
        printf("La case (%d, %d) ne contient pas votre dame.\n", i, j);
        return 0;
    }

    if (board[startSquareNumber - 1] == EMPTY) {
        printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
        return 0;
    }

    if (board[startSquareNumber - 1] != WHITE_QUEEN && board[startSquareNumber - 1] != BLACK_QUEEN) {
        printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
        return 0;
    }

    int rowDirection = (getRow(endSquareNumber) - getRow(startSquareNumber)) / abs(getRow(endSquareNumber) - getRow(startSquareNumber));
    int columnDirection = (getColumn(endSquareNumber) - getColumn(startSquareNumber)) / abs(getColumn(endSquareNumber) - getColumn(startSquareNumber));
    int row = getRow(startSquareNumber) + rowDirection;
    int column = getColumn(startSquareNumber) + columnDirection;
    if (mustcapture() != 1){
        while (row != getRow(endSquareNumber) && column != getColumn(endSquareNumber)) {
            if (board[getSquareNumber(row, column) - 1] != EMPTY) {
                printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas valide car il y a un pion sur le chemin.\n", i, j, x, y);
                return 0;
            }
            row += rowDirection;
            column += columnDirection;
        }
    }
    }else{
        printf("La case (%d, %d) ne contient pas votre pion ou votre dame.\n", i, j);
        return 0;
    }

    printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) est valide.\n", i, j, x, y);
    return 1;
}

int deplacer(int i, int j, int x, int y) {
    if (verif(i, j, x, y) == 1){
        if (displaySquareState(i, j) == WHITE_PAWN || displaySquareState(i, j) == BLACK_PAWN){
            int startSquareNumber = getSquareNumber(i, j);
            int endSquareNumber = getSquareNumber(x, y);
               //deplacement indircet
            if (mustcapture() == 1){
                int jumpedSquareNumber = getSquareNumber((i + x) / 2, (j + y) / 2);
                board[jumpedSquareNumber - 1] = EMPTY;
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                //le cas d un deplacement indirect vers la premiere ligne (W)-->(DW)
                if (player == WHITE && board[endSquareNumber - 1] == WHITE_PAWN && getRow(endSquareNumber) == 1) {
                    board[endSquareNumber - 1] = WHITE_QUEEN;
                }
                //le cas d un deplacement indirect vers la derniere ligne (B)-->(DB)
                if (player == BLACK && board[endSquareNumber - 1] == BLACK_PAWN && getRow(endSquareNumber) == 10) {
                    board[endSquareNumber - 1] = BLACK_QUEEN;
                }

                    //update Score
                 if(player == WHITE){
                    scoreWhite++;
                }else{
                    scoreBlack++;
                }

                movesSinceLastCapture = 0;

                captureaftercapture [0] = 0;
                captureaftercapture [1] = 0;
                if (mustcaptureaftercapture(x,y) == 1){
                    captureaftercapture [0] = x;
                    captureaftercapture [1] = y;
                    printf("Vous devez continuer a capturer le pion adverse.\n");
                    return 1;
                }else{
                    player = (player == WHITE) ? BLACK : WHITE;
                }
               //deplacement direct
            }else{
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                  //le cas d un deplacement direct vers la premiere ligne (W)-->(DW)
                if (player == WHITE && board[endSquareNumber - 1] == WHITE_PAWN && getRow(endSquareNumber) == 1) {
                    board[endSquareNumber - 1] = WHITE_QUEEN;
                }
                //le cas d un deplacement direct vers la derniere ligne (B)-->(DB)
                if (player == BLACK && board[endSquareNumber - 1] == BLACK_PAWN && getRow(endSquareNumber) == 10) {
                    board[endSquareNumber - 1] = BLACK_QUEEN;
                }
                player = (player == WHITE) ? BLACK : WHITE;

            }
            return 1;
        }else if (displaySquareState(i, j) == WHITE_QUEEN || displaySquareState(i, j) == BLACK_QUEEN){
            int startSquareNumber = getSquareNumber(i, j);
            int endSquareNumber = getSquareNumber(x, y);
               //deplacement indircet
            if (mustcapture() == 1){
                int jumpedSquareNumber;
                if (x+1 == jumpsqutole[0] && y+1 == jumpsqutole[1]){
                    jumpedSquareNumber = getSquareNumber(jumpsqutole[0], jumpsqutole[1]);
                } else if (x+1 == jumpsqutori[0] && y-1 == jumpsqutori[1]){
                    jumpedSquareNumber = getSquareNumber(jumpsqutori[0], jumpsqutori[1]);
                } else if (x-1 == jumpsqubole[0] && y+1 == jumpsqubole[1]){
                    jumpedSquareNumber = getSquareNumber(jumpsqubole[0], jumpsqubole[1]);
                } else if (x-1 == jumpsqubori[0] && y-1 == jumpsqubori[1]){
                    jumpedSquareNumber = getSquareNumber(jumpsqubori[0], jumpsqubori[1]);
                }
                board[jumpedSquareNumber - 1] = EMPTY;
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                    //update Score
                 if(player == WHITE){
                    scoreWhite++;
                }else{
                    scoreBlack++;
                }

                movesSinceLastCapture = 0;

                if (mustcaptureaftercapture(x,y) == 1){
                    printf("Vous devez continuer a capturer le pion adverse.\n");
                    return 1;
                }else{
                    player = (player == WHITE) ? BLACK : WHITE;
                }
               //deplacement direct
            }else{
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;
                player = (player == WHITE) ? BLACK : WHITE;

            }
            return 1;
        }
    }
    return 0;
}

int main() {
    InitialiserDamier();
    AfficherDamier();

    int choix, i, j, x, y;

    while (1) {
        printf("------------------------------------------\n");
        printf("Tour du joueur %c\n", player == WHITE ? 'W' : 'B');
        printf("------------------------------------------\n");
        printf("Menu :\n");
        printf("1. Deplacer un pion\n");
        printf("2. Afficher \n");
        printf("3. Afficher score\n");
        printf("0. Quitter\n");
        printf("Votre choix : ");
        scanf("%d", &choix);
        printf("-------------------------------------------\n");

        switch (choix) {
            case 1:
                printf("Entrez les coordonnees du pion a deplacer (i, j) : ");
                scanf("%d %d", &i, &j);
                printf("Entrez les coordonnees de la case d'arrivee (x, y) : ");
                scanf("%d %d", &x, &y);
                if (deplacer(i, j, x, y) == 1) {
                    printf("------------------------------------------\n");
                    AfficherDamier();
                }
                break;
            case 2:
                AfficherDamier();
                break;
            case 3:
                printf("Black Score : %d \t \t White Score : %d\n",scoreBlack,scoreWhite);
                break;
            case 0:
                printf("le joueur %c a quitter la game. Player %c wins!\n", (player == WHITE) ? 'B' : 'W', (player == WHITE) ? 'W' : 'B');
                break;
            default:
                printf("Choix invalide.\n");
        }


        // a verifier
        if (choix == 0) {
            break;
        }
        if (scoreWhite >= 20) {
            printf("le joueur W a atteint 20 victoires! Le joueur W gagne le jeu!\n");
            break;
        }
        if (scoreBlack >= 20) {
            printf("Player B has reached 20 wins! Player B wins the game!\n");
            break;
        }

        int whiteHasOnlyQueens = 1, blackHasOnlyQueens = 1;
        int numWhitePawns = 0, numBlackPawns = 0;
        for (int k = 0; k < 50; k++) {
            if (board[k] == WHITE_PAWN) {
                whiteHasOnlyQueens = 0;
                numWhitePawns++;
            }
            if (board[k] == BLACK_PAWN) {
                blackHasOnlyQueens = 0;
                numBlackPawns++;
            }
        }

        if (whiteHasOnlyQueens && blackHasOnlyQueens && capturepossible == 0) {
            movesSinceLastCapture++;
            if (movesSinceLastCapture >= 6) {
                printf("le jeu est bloque, il n'y a pas de gagnant.\n");
                break;
            }
        } else {
            movesSinceLastCapture = 0;
        }
    }

    return 0;
}


//khass
//dama deplacement makla hta leb3id