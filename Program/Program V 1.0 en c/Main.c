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
int coor[4];

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
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    capturepossible = 0;
    coor[0] = 0;
    coor[1] = 0;
    coor[2] = 0;
    coor[3] = 0;

    for (int k = 0; k < 50; k++) {
        if (board[k] == currentPlayer) {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            if (currentPlayer == WHITE_PAWN) {
                if ((i-2)>0 && (j - 2)>0  ){
                    if (i > 1 && j > 1 && board[getSquareNumber(i - 1, j - 1) - 1] == opponentPiece && board[getSquareNumber(i - 2, j - 2) - 1] == EMPTY) {
                        coor[0] = getSquareNumber(i, j);
                        coor[1] = getSquareNumber(i - 2, j - 2);
                        capturepossible++;
                    }
                }
                if ((i-2)>0 && (j + 2)<11){
                    if (i > 1 && j < 10 && board[getSquareNumber(i - 1, j + 1) - 1] == opponentPiece && board[getSquareNumber(i - 2, j + 2) - 1] == EMPTY) {
                        coor[2] = getSquareNumber(i, j);
                        coor[3] = getSquareNumber(i - 2, j + 2);
                        capturepossible++;
                    }
                }
            } else {
                if ((i+2)<11 && (j - 2)>0  ){
                    if (i < 10 && j > 1 && board[getSquareNumber(i + 1, j - 1) - 1] == opponentPiece && board[getSquareNumber(i + 2, j - 2) - 1] == EMPTY) {
                        coor[0] = getSquareNumber(i, j);
                        coor[1] = getSquareNumber(i + 2, j - 2);
                        capturepossible++;
                    }
                }
                if ((i+2)<11 && (j + 2)<11){
                    if (i < 10 && j < 10 && board[getSquareNumber(i + 1, j + 1) - 1] == opponentPiece && board[getSquareNumber(i + 2, j + 2) - 1] == EMPTY) {
                        coor[2] = getSquareNumber(i, j);
                        coor[3] = getSquareNumber(i + 2, j + 2);
                        capturepossible++;
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

int verif(int i, int j, int x, int y) {

    if (mustcapture() == 1) {
            if ((i!= getRow(coor[0]) || j != getColumn(coor[0]) || x != getRow(coor[1]) || y != getColumn(coor[1])) && (i!= getRow(coor[2]) || j != getColumn(coor[2]) || x != getRow(coor[3]) || y != getColumn(coor[3]))) {
                if (coor[0] != 0 && coor[1] ) {
                    printf("Vous devez capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[0]), getColumn(coor[0]), getRow(coor[1]), getColumn(coor[1]));
                }
                if (coor[2] != 0 && coor[3] ) {
                    printf("Vous devez capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[2]), getColumn(coor[2]), getRow(coor[3]), getColumn(coor[3]));
                }
                return 0;
            }
    }else{
        if (abs(i - x) > 1 || abs(j - y) > 1) {
            printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas valide car il est trop long.\n", i, j, x, y);
            return 0;
        }
    }


    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;

    int startSquareNumber = getSquareNumber(i, j);
    int endSquareNumber = getSquareNumber(x, y);

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

    printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) est valide.\n", i, j, x, y);
    return 1;
}

int deplacer(int i, int j, int x, int y) {
    if (verif(i, j, x, y) == 1){
        int startSquareNumber = getSquareNumber(i, j);
        int endSquareNumber = getSquareNumber(x, y);
        if (mustcapture() == 1){
            int jumpedSquareNumber = getSquareNumber((i + x) / 2, (j + y) / 2);
            board[jumpedSquareNumber - 1] = EMPTY;
            board[endSquareNumber - 1] = board[startSquareNumber - 1];
            board[startSquareNumber - 1] = EMPTY;
            if (mustcapture() == 1){
                printf("Vous devez continuer a capturer le pion adverse.\n");
                return 1;
            }else{
                player = (player == WHITE) ? BLACK : WHITE;
            }
        }else{
            board[endSquareNumber - 1] = board[startSquareNumber - 1];
            board[startSquareNumber - 1] = EMPTY;
            player = (player == WHITE) ? BLACK : WHITE;
        }
        return 1;
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
            case 0:
                return 0;
            default:
                printf("Choix invalide.\n");
        }
    }

    return 0;
}