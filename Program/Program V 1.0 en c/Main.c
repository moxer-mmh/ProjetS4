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
#define MAX_MOVES 2

typedef struct {
    int startRow;
    int startCol;
    int endRow;
    int endCol;
    int jumpCol;//coordonnées de la case du pion adverse sauté
    int jumpRow;
} IndirectMove;

int board[50];
int player = WHITE;

int getRow(int N);
int getColumn(int N);
int getSquareNumber(int i, int j);
char getSquareColor(int i, int j);
int displaySquareState(int i, int j);
int verif(int i , int j , int x , int y);
int IsThereIndirectMove(IndirectMove moves[]);
int deplacer(int i, int j, int x, int y);
void AfficherDamier();
void InitialiserDamier();


int getRow(int N) {
  if (N < 1 || N > 50) {
    printf("Erreur : N doit etre entre 1 et 50.\n");
    return 0;
  }
  return ((N - 1) / 5) + 1;
}

int getColumn (int N){

  if (N < 1 || N > 50) {
    printf("Erreur : N doit etre entre 1 et 50.\n");
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
    printf("Erreur : i et j doivent etre entre 1 et 10.\n");
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
    } else {
        printf("Erreur : i et j doivent etre entre 1 et 10.\n");
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
            printf("État de la case invalide");
            break;
    }
}

int IsThereIndirectMove(IndirectMove moves[]) {
    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int moveCount = 0; //On traite le cas de plusieurs IndirectMove

    for (int k = 1; k <= 10; k++) {
        for (int p = 1; p <= 10; p++) {
            int squareNumber = getSquareNumber(k, p);
            if (board[squareNumber - 1] == currentPlayer) {
                if (currentPlayer == BLACK_PAWN) {
                    if (k < 9 && p < 9 && board[getSquareNumber(k + 1, p + 1) - 1] == opponentPiece && board[getSquareNumber(k + 2, p + 2) - 1] == EMPTY) {
                        moves[moveCount].startRow = k;
                        moves[moveCount].startCol = p;
                        moves[moveCount].endRow = k + 2;
                        moves[moveCount].endCol = p + 2;
                        moves[moveCount].jumpRow = k + 1;
                        moves[moveCount].jumpCol = p + 1;
                        moveCount++;
                    }
                    if (k < 9 && p > 2 && board[getSquareNumber(k + 1, p - 1) - 1] == opponentPiece && board[getSquareNumber(k + 2, p - 2) - 1] == EMPTY) {
                        moves[moveCount].startRow = k;
                        moves[moveCount].startCol = p;
                        moves[moveCount].endRow = k + 2;
                        moves[moveCount].endCol = p - 2;
                        moves[moveCount].jumpRow = k + 1;
                        moves[moveCount].jumpCol = p - 1;
                        moveCount++;
                    }
                } else {
                    if (k > 2 && p < 9 && board[getSquareNumber(k - 1, p + 1) - 1] == opponentPiece && board[getSquareNumber(k - 2, p + 2) - 1] == EMPTY) {
                        moves[moveCount].startRow = k;
                        moves[moveCount].startCol = p;
                        moves[moveCount].endRow = k - 2;
                        moves[moveCount].endCol = p + 2;
                        moves[moveCount].jumpRow = k - 1;
                        moves[moveCount].jumpCol = p + 1;
                        moveCount++;
                    }
                    if (k > 2 && p > 2 && board[getSquareNumber(k - 1, p - 1) - 1] == opponentPiece && board[getSquareNumber(k - 2, p - 2) - 1] == EMPTY) {
                        moves[moveCount].startRow = k;
                        moves[moveCount].startCol = p;
                        moves[moveCount].endRow = k - 2;
                        moves[moveCount].endCol = p - 2;
                        moves[moveCount].jumpRow = k - 1;
                        moves[moveCount].jumpCol = p - 1;
                        moveCount++;
                    }
                }
            }
        }
    }

    return moveCount;
}

void AfficherDamier() {
    // Affichage de l'en-tête de colonne
    printf("   ");
    for (int j = 1; j <= 10; j++) {
        printf("%2d ", j);
    }
    printf("\n");

    // Parcours des lignes et colonnes de la matrice
    for (int i = 1; i <= 10; i++) {
        // Affichage du numéro de ligne
        printf("%2d ", i);

        for (int j = 1; j <= 10; j++) {
            char squareColor = getSquareColor(i, j);
            int squareState = displaySquareState(i, j);

            // Affichage des différents états de la case
            switch (squareState) {
                case EMPTY:
                    // Si la case est vide
                    printf((squareColor == WHITE) ? "   " : " . ");
                    break;
                case WHITE_PAWN:
                    // Si la case contient un pion blanc
                    printf(" W ");
                    break;
                case BLACK_PAWN:
                    // Si la case contient un pion noir
                    printf(" B ");
                    break;
                case WHITE_QUEEN:
                    // Si la case contient une dame blanche
                    printf("WD ");
                    break;
                case BLACK_QUEEN:
                    // Si la case contient une dame noire
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

int verif(int i, int j, int x, int y) {
    if (i < 1 || i > 10 || j < 1 || j > 10 || x < 1 || x > 10 || y < 1 || y > 10) {
        printf("Erreur : i et j doivent etre entre 1 et 10.\n");
        return 0;
    }

    IndirectMove moves[MAX_MOVES];
    int moveCount = IsThereIndirectMove(moves);

    if (moveCount > 0) {
        int found = 0;
        for (int k = 0; k < moveCount; k++) {
            if (moves[k].startRow == i && moves[k].startCol == j &&
                moves[k].endRow == x && moves[k].endCol == y) {
                found = 1;
                break;
            }
        }
        if (!found) {
            printf("Vous devez effectuer un mouvement indirect valide.\n");
            return 0;
        }
    }

    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;

    int startSquareNumber = getSquareNumber(i, j);
    int endSquareNumber = getSquareNumber(x, y);

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
        printf("Le déplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas dans la bonne direction.\n", i, j, x, y);
        return 0;
    }

    int isDirectMove = (abs(moveDirection) == 5 || abs(moveDirection) == 4 || abs(moveDirection) == 6);

    if (isDirectMove && board[endSquareNumber - 1] != EMPTY) {
        printf("Le deplacement direct du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas possible car la case d'arrivee est occupee.\n", i, j, x, y);
        return 0;
    }

    printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) est valide.\n", i, j, x, y);
    return 1;
}
int deplacer(int i, int j, int x, int y) {
    if (verif(i, j, x, y) == 1) {
        int startSquareNumber = getSquareNumber(i, j);
        int endSquareNumber = getSquareNumber(x, y);

        IndirectMove moves[MAX_MOVES];
        int moveCount = IsThereIndirectMove(moves);

        if (moveCount > 0) {
            int chosenMove = -1;
            for (int k = 0; k < moveCount; k++) {
                if (moves[k].startRow == i && moves[k].startCol == j &&
                    moves[k].endRow == x && moves[k].endCol == y) {
                    chosenMove = k;
                    break;
                }
            }

            if (chosenMove >= 0) {
                int jumpedSquareNumber = getSquareNumber(moves[chosenMove].jumpRow, moves[chosenMove].jumpCol);
                board[jumpedSquareNumber - 1] = EMPTY;
            }
        }

        board[endSquareNumber - 1] = board[startSquareNumber - 1];
        board[startSquareNumber - 1] = EMPTY;

        player = player == WHITE ? BLACK : WHITE;

        return 1;
    }

    return 0;
}

int main() {
    InitialiserDamier();
    AfficherDamier();

    int choix, i, j, x, y;

    while (1) {
        printf("Tour du joueur %c\n", player == WHITE ? 'W' : 'B');
        printf("Menu :\n");
        printf("1. Deplacer un pion\n");
        printf("2. Afficher \n");
        printf("3. Quitter\n");
        printf("Votre choix : ");
        scanf("%d", &choix);

        switch (choix) {
            case 1:
                printf("Entrez les coordonnees du pion a deplacer (i, j) et de la case d'arrivee (x, y) : ");
                scanf("%d %d %d %d", &i, &j, &x, &y);
                if (deplacer(i, j, x, y) == 1) {
                    system("cls");
                    AfficherDamier();
                }
                break;
            case 2:
                system("cls");
                AfficherDamier();
                break;
            case 3:
                return 0;
            default:
                printf("Choix invalide.\n");
        }
    }

    return 0;
}