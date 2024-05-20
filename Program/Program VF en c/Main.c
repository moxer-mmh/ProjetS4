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
int scoreWhite = 0;
int scoreBlack = 0;

int jumpsqutole = 0;
int jumpsqutori = 0;
int jumpsqubole = 0;
int jumpsqubori = 0;

int queencapturesqtole[50];
int queencapturesqtori[50];
int queencapturesqubole[50];
int queencapturesqubori[50];

int movesSinceLastCapture = 0;

int getRow(int N);
int getColumn(int N);
int getSquareNumber(int i, int j);
char getSquareColor(int i, int j);
int displaySquareState(int i, int j);
int verif(int i, int j, int x, int y);
int mustcapture();
int deplacer(int i, int j, int x, int y);
void AfficherDamier();
void InitialiserDamier();

int getRow(int N)
{
    if (N < 1 || N > 50)
    {
        return 0;
    }
    return ((N - 1) / 5) + 1;
}

int getColumn(int N)
{

    if (N < 1 || N > 50)
    {
        return 0;
    }

    if (getRow(N) % 2 == 0)
    {
        if (N % 10 != 0)
        {
            return ((N % 10) * 2) - 11;
        }
        else
        {
            return 9;
        }
    }
    else
    {
        return (N % 10) * 2;
    }
}

int getSquareNumber(int i, int j)
{
    if (i < 1 || i > 10 || j < 1 || j > 10)
    {
        return 0;
    }
    if ((i + j) % 2 == 0)
    {
        return 0;
    }
    return (i - 1) * 5 + (j + 1) / 2;
}

char getSquareColor(int i, int j)
{
    int squareNumber = getSquareNumber(i, j);

    if (squareNumber == 0 && i >= 1 && i <= 10 && j >= 1 && j <= 10)
    {
        return WHITE;
    }
    else if (squareNumber != 0 && i >= 1 && i <= 10 && j >= 1 && j <= 10)
    {
        return BLACK;
    }
}

int displaySquareState(int i, int j)
{

    int squareNumber = getSquareNumber(i, j);

    int pieceType = board[squareNumber - 1];
    switch (pieceType)
    {
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

void AfficherDamier()
{
    printf("   ");
    for (int j = 1; j <= 10; j++)
    {
        printf("%2d ", j);
    }
    printf("\n");

    for (int i = 1; i <= 10; i++)
    {
        printf("%2d ", i);

        for (int j = 1; j <= 10; j++)
        {
            char squareColor = getSquareColor(i, j);
            int squareState = displaySquareState(i, j);

            switch (squareState)
            {
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

void InitialiserDamier()
{

    for (int i = 0; i < 50; i++)
    {
        if (i < 20)
        {
            board[i] = BLACK_PAWN;
        }
        else if (i > 29)
        {
            board[i] = WHITE_PAWN;
        }
        else
        {
            board[i] = EMPTY;
        }
    }
}

int mustcapture()
{
    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    capturepossible = 0;
    int q = 0;
    int qatole = 0;
    int qatori = 0;
    int qabole = 0;
    int qabori = 0;
    jumpsqubole = 0;
    jumpsqubori = 0;
    jumpsqutole = 0;
    jumpsqutori = 0;

    for (int s = 0; s < 50; s++)
    {
        queencapturesqtole[s] = 0;
        queencapturesqtori[s] = 0;
        queencapturesqubole[s] = 0;
        queencapturesqubori[s] = 0;
        coor[s] = 0;
    }

    for (int k = 0; k < 50; k++)
    {
        if (board[k] == currentPlayer)
        {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            if (currentPlayer == WHITE_PAWN)
            {
                if ((i - 2) > 0 && (j - 2) > 0)
                {
                    if (i > 1 && j > 1 && (board[getSquareNumber(i - 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j - 2) - 1] == EMPTY)
                    {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i - 2) > 0 && (j + 2) < 11)
                {
                    if (i > 1 && j < 10 && (board[getSquareNumber(i - 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j + 2) - 1] == EMPTY)
                    {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i - 2, j + 2);
                        q++;
                        capturepossible++;
                    }
                }
            }
            else if (currentPlayer == BLACK_PAWN)
            {
                if ((i + 2) < 11 && (j - 2) > 0)
                {
                    if (i < 10 && j > 1 && (board[getSquareNumber(i + 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j - 2) - 1] == EMPTY)
                    {
                        coor[q] = getSquareNumber(i, j);
                        q++;
                        coor[q] = getSquareNumber(i + 2, j - 2);
                        q++;
                        capturepossible++;
                    }
                }
                if ((i + 2) < 11 && (j + 2) < 11)
                {
                    if (i < 10 && j < 10 && (board[getSquareNumber(i + 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j + 2) - 1] == EMPTY)
                    {
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
        if (board[k] == currentQueen)
        {
            int i = getRow(k + 1);
            int j = getColumn(k + 1);

            // Check for captures in the 4 diagonal directions based on current player's color

            // Check for captures in the top-left direction
            for (int m = 1; m < 10; m++)
            {
                if ((i - m) < 1 || (j - m) < 1)
                {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
                {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY)
                {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
                {
                    if ((i - m - 1) < 1 || (j - m - 1) < 1)
                    {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j - m - 1) - 1] == EMPTY)
                    {
                        queencapturesqtole[qatole] = getSquareNumber(i, j);
                        qatole++;
                        capturepossible++;
                        jumpsqutole++;
                        int c = 1;
                        while (board[getSquareNumber(i - m - c, j - m - c) - 1] == EMPTY && (i - m - c) > 0 && (j - m - c) > 0)
                        {
                            queencapturesqtole[qatole] = getSquareNumber(i - m - c, j - m - c);
                            qatole++;
                            c++;
                        }
                        queencapturesqtole[qatole] = -1;
                        qatole++;
                    }
                    else
                    {
                        break;
                    }
                }
            }

            // Check for captures in the top-right direction
            for (int m = 1; m < 10; m++)
            {
                if ((i - m) < 1 || (j + m) > 10)
                {
                    break;
                }

                int squareNumber = getSquareNumber(i - m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
                {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY)
                {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
                {
                    if ((i - m - 1) < 1 || (j + m + 1) > 10)
                    {
                        break;
                    }

                    if (board[getSquareNumber(i - m - 1, j + m + 1) - 1] == EMPTY)
                    {
                        queencapturesqtori[qatori] = getSquareNumber(i, j);
                        qatori++;
                        capturepossible++;
                        jumpsqutori++;
                        int c = 1;
                        while (board[getSquareNumber(i - m - c, j + m + c) - 1] == EMPTY && (i - m - c) > 0 && (j + m + c) < 11)
                        {
                            queencapturesqtori[qatori] = getSquareNumber(i - m - c, j + m + c);
                            qatori++;
                            c++;
                        }
                        queencapturesqtori[qatori] = -1;
                        qatori++;
                    }
                    else
                    {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-left direction
            for (int m = 1; m < 10; m++)
            {
                if ((i + m) > 10 || (j - m) < 1)
                {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j - m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
                {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY)
                {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
                {
                    if ((i + m + 1) > 10 || (j - m - 1) < 1)
                    {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j - m - 1) - 1] == EMPTY)
                    {
                        queencapturesqubole[qabole] = getSquareNumber(i, j);
                        qabole++;
                        capturepossible++;
                        jumpsqubole++;
                        int c = 1;
                        while (board[getSquareNumber(i + m + c, j - m - c) - 1] == EMPTY && (i + m + c) < 11 && (j - m - c) > 0)
                        {
                            queencapturesqubole[qabole] = getSquareNumber(i + m + c, j - m - c);
                            qabole++;
                            c++;
                        }
                        queencapturesqubole[qabole] = -1;
                        qabole++;
                    }
                    else
                    {
                        break;
                    }
                }
            }

            // Check for captures in the bottom-right direction
            for (int m = 1; m < 10; m++)
            {
                if ((i + m) > 10 || (j + m) > 10)
                {
                    break;
                }

                int squareNumber = getSquareNumber(i + m, j + m);
                if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
                {
                    break;
                }

                if (board[squareNumber - 1] == EMPTY)
                {
                    continue;
                }

                if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
                {
                    if ((i + m + 1) > 10 || (j + m + 1) > 10)
                    {
                        break;
                    }

                    if (board[getSquareNumber(i + m + 1, j + m + 1) - 1] == EMPTY)
                    {
                        queencapturesqubori[qabori] = getSquareNumber(i, j);
                        qabori++;
                        capturepossible++;
                        jumpsqubori++;
                        int c = 1;
                        while (board[getSquareNumber(i + m + c, j + m + c) - 1] == EMPTY && (i + m + c) < 11 && (j + m + c) < 11)
                        {
                            queencapturesqubori[qabori] = getSquareNumber(i + m + c, j + m + c);
                            qabori++;
                            c++;
                        }
                        queencapturesqubori[qabori] = -1;
                        qabori++;
                    }
                    else
                    {
                        break;
                    }
                }
            }
        }
    }

    if (capturepossible > 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

int mustcaptureaftercapture(int i, int j)
{
    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    capturepossible = 0;
    int q = 0;
    int qatole = 0;
    int qatori = 0;
    int qabole = 0;
    int qabori = 0;
    jumpsqubole = 0;
    jumpsqubori = 0;
    jumpsqutole = 0;
    jumpsqutori = 0;

    for (int s = 0; s < 50; s++)
    {
        queencapturesqtole[s] = 0;
        queencapturesqtori[s] = 0;
        queencapturesqubole[s] = 0;
        queencapturesqubori[s] = 0;
        coor[s] = 0;
    }
    int k = getSquareNumber(i, j) - 1;
    if (board[k] == currentPlayer)
    {

        if (currentPlayer == WHITE_PAWN)
        {
            if ((i - 2) > 0 && (j - 2) > 0)
            {
                if (i > 1 && j > 1 && (board[getSquareNumber(i - 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j - 2) - 1] == EMPTY)
                {
                    coor[q] = getSquareNumber(i, j);
                    q++;
                    coor[q] = getSquareNumber(i - 2, j - 2);
                    q++;
                    capturepossible++;
                }
            }
            if ((i - 2) > 0 && (j + 2) < 11)
            {
                if (i > 1 && j < 10 && (board[getSquareNumber(i - 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i - 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i - 2, j + 2) - 1] == EMPTY)
                {
                    coor[q] = getSquareNumber(i, j);
                    q++;
                    coor[q] = getSquareNumber(i - 2, j + 2);
                    q++;
                    capturepossible++;
                }
            }
        }
        else if (currentPlayer == BLACK_PAWN)
        {
            if ((i + 2) < 11 && (j - 2) > 0)
            {
                if (i < 10 && j > 1 && (board[getSquareNumber(i + 1, j - 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j - 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j - 2) - 1] == EMPTY)
                {
                    coor[q] = getSquareNumber(i, j);
                    q++;
                    coor[q] = getSquareNumber(i + 2, j - 2);
                    q++;
                    capturepossible++;
                }
            }
            if ((i + 2) < 11 && (j + 2) < 11)
            {
                if (i < 10 && j < 10 && (board[getSquareNumber(i + 1, j + 1) - 1] == opponentPiece || board[getSquareNumber(i + 1, j + 1) - 1] == opponentQueen) && board[getSquareNumber(i + 2, j + 2) - 1] == EMPTY)
                {
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
    if (board[k] == currentQueen)
    {
        int i = getRow(k + 1);
        int j = getColumn(k + 1);

        // Check for captures in the 4 diagonal directions based on current player's color

        // Check for captures in the top-left direction
        for (int m = 1; m < 10; m++)
        {
            if ((i - m) < 1 || (j - m) < 1)
            {
                break;
            }

            int squareNumber = getSquareNumber(i - m, j - m);
            if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
            {
                break;
            }

            if (board[squareNumber - 1] == EMPTY)
            {
                continue;
            }

            if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
            {
                if ((i - m - 1) < 1 || (j - m - 1) < 1)
                {
                    break;
                }

                if (board[getSquareNumber(i - m - 1, j - m - 1) - 1] == EMPTY)
                {
                    queencapturesqtole[qatole] = getSquareNumber(i, j);
                    qatole++;
                    capturepossible++;
                    jumpsqutole++;
                    int c = 1;
                    while (board[getSquareNumber(i - m - c, j - m - c) - 1] == EMPTY && (i - m - c) > 0 && (j - m - c) > 0)
                    {
                        queencapturesqtole[qatole] = getSquareNumber(i - m - c, j - m - c);
                        qatole++;
                        c++;
                    }
                    queencapturesqtole[qatole] = -1;
                    qatole++;
                }
                else
                {
                    break;
                }
            }
        }

        // Check for captures in the top-right direction
        for (int m = 1; m < 10; m++)
        {
            if ((i - m) < 1 || (j + m) > 10)
            {
                break;
            }

            int squareNumber = getSquareNumber(i - m, j + m);
            if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
            {
                break;
            }

            if (board[squareNumber - 1] == EMPTY)
            {
                continue;
            }

            if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
            {
                if ((i - m - 1) < 1 || (j + m + 1) > 10)
                {
                    break;
                }

                if (board[getSquareNumber(i - m - 1, j + m + 1) - 1] == EMPTY)
                {
                    queencapturesqtori[qatori] = getSquareNumber(i, j);
                    qatori++;
                    capturepossible++;
                    jumpsqutori++;
                    int c = 1;
                    while (board[getSquareNumber(i - m - c, j + m + c) - 1] == EMPTY && (i - m - c) > 0 && (j + m + c) < 11)
                    {
                        queencapturesqtori[qatori] = getSquareNumber(i - m - c, j + m + c);
                        qatori++;
                        c++;
                    }
                    queencapturesqtori[qatori] = -1;
                    qatori++;
                }
                else
                {
                    break;
                }
            }
        }

        // Check for captures in the bottom-left direction
        for (int m = 1; m < 10; m++)
        {
            if ((i + m) > 10 || (j - m) < 1)
            {
                break;
            }

            int squareNumber = getSquareNumber(i + m, j - m);
            if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
            {
                break;
            }

            if (board[squareNumber - 1] == EMPTY)
            {
                continue;
            }

            if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
            {
                if ((i + m + 1) > 10 || (j - m - 1) < 1)
                {
                    break;
                }

                if (board[getSquareNumber(i + m + 1, j - m - 1) - 1] == EMPTY)
                {
                    queencapturesqubole[qabole] = getSquareNumber(i, j);
                    qabole++;
                    capturepossible++;
                    jumpsqubole++;
                    int c = 1;
                    while (board[getSquareNumber(i + m + c, j - m - c) - 1] == EMPTY && (i + m + c) < 11 && (j - m - c) > 0)
                    {
                        queencapturesqubole[qabole] = getSquareNumber(i + m + c, j - m - c);
                        qabole++;
                        c++;
                    }
                    queencapturesqubole[qabole] = -1;
                    qabole++;
                }
                else
                {
                    break;
                }
            }
        }

        // Check for captures in the bottom-right direction
        for (int m = 1; m < 10; m++)
        {
            if ((i + m) > 10 || (j + m) > 10)
            {
                break;
            }

            int squareNumber = getSquareNumber(i + m, j + m);
            if (board[squareNumber - 1] == currentQueen || board[squareNumber - 1] == currentPlayer)
            {
                break;
            }

            if (board[squareNumber - 1] == EMPTY)
            {
                continue;
            }

            if (board[squareNumber - 1] == opponentQueen || board[squareNumber - 1] == opponentPiece)
            {
                if ((i + m + 1) > 10 || (j + m + 1) > 10)
                {
                    break;
                }

                if (board[getSquareNumber(i + m + 1, j + m + 1) - 1] == EMPTY)
                {
                    queencapturesqubori[qabori] = getSquareNumber(i, j);
                    qabori++;
                    capturepossible++;
                    jumpsqubori++;
                    int c = 1;
                    while (board[getSquareNumber(i + m + c, j + m + c) - 1] == EMPTY && (i + m + c) < 11 && (j + m + c) < 11)
                    {
                        queencapturesqubori[qabori] = getSquareNumber(i + m + c, j + m + c);
                        qabori++;
                        c++;
                    }
                    queencapturesqubori[qabori] = -1;
                    qabori++;
                }
                else
                {
                    break;
                }
            }
        }
    }

    if (capturepossible > 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

int verifqueens(int i, int j, int x, int y, int testtable[50])
{
    int found = 0;
    int k = 1;
    int p = 0;
    while (k < 50)
    {
        while (testtable[k] != -1)
        {
            if (testtable[p] == getSquareNumber(i, j) && testtable[k] == getSquareNumber(x, y))
            {
                found = 1;
                break;
            }
            k++;
        }
        k++;
        if (testtable[k] != 0)
        {
            p += k;
            k++;
        }
    }

    if (!found)
    {
        printf("Vous devez capturer un pion adverse avec votre dame.\n");
        return 1;
    }

    return 0;
}

int verif(int i, int j, int x, int y)
{

    int currentPlayer = player == WHITE ? WHITE_PAWN : BLACK_PAWN;
    int currentQueen = player == WHITE ? WHITE_QUEEN : BLACK_QUEEN;
    int opponentPiece = player == WHITE ? BLACK_PAWN : WHITE_PAWN;
    int opponentQueen = player == WHITE ? BLACK_QUEEN : WHITE_QUEEN;
    int startSquareNumber = getSquareNumber(i, j);
    int endSquareNumber = getSquareNumber(x, y);

    if (captureaftercapture[0] != 0 && captureaftercapture[1] != 0)
    {
        if (displaySquareState(captureaftercapture[0], captureaftercapture[1]) == currentPlayer)
        {
            if ((i != getRow(coor[0]) || j != getColumn(coor[0]) || x != getRow(coor[1]) || y != getColumn(coor[1])) && (i != getRow(coor[2]) || j != getColumn(coor[2]) || x != getRow(coor[3]) || y != getColumn(coor[3])) && (i != getRow(coor[4]) || j != getColumn(coor[4]) || x != getRow(coor[5]) || y != getColumn(coor[5])) && (i != getRow(coor[6]) || j != getColumn(coor[6]) || x != getRow(coor[7]) || y != getColumn(coor[7])))
            {
                int k = 0;
                while (coor[k] != 0)
                {
                    printf("Vous devez continuer a capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[k]), getColumn(coor[k]), getRow(coor[k + 1]), getColumn(coor[k + 1]));
                    k += 2;
                }
                return 0;
            }
        }
        else if (displaySquareState(captureaftercapture[0], captureaftercapture[1]) == currentQueen)
        {
            int ret = 0;
            if (verifqueens(i, j, x, y, queencapturesqtole) == 1)
            {
                ret++;
            }
            if (verifqueens(i, j, x, y, queencapturesqtori) == 1)
            {
                ret++;
            }
            if (verifqueens(i, j, x, y, queencapturesqubole) == 1)
            {
                ret++;
            }
            if (verifqueens(i, j, x, y, queencapturesqubori) == 1)
            {
                ret++;
            }
            if (ret != 0)
            {
                return 0;
            }
        }
    }
    else if (mustcapture() == 1)
    {
        int ret = 0;
        if (displaySquareState(i, j) == currentPlayer)
        {
            if ((i != getRow(coor[0]) || j != getColumn(coor[0]) || x != getRow(coor[1]) || y != getColumn(coor[1])) && (i != getRow(coor[2]) || j != getColumn(coor[2]) || x != getRow(coor[3]) || y != getColumn(coor[3])) && (i != getRow(coor[4]) || j != getColumn(coor[4]) || x != getRow(coor[5]) || y != getColumn(coor[5])) && (i != getRow(coor[6]) || j != getColumn(coor[6]) || x != getRow(coor[7]) || y != getColumn(coor[7])))
            {
                int k = 0;
                while (coor[k] != 0)
                {
                    printf("Vous devez capturer le pion adverse de la case (%d, %d) vers la case (%d, %d).\n", getRow(coor[k]), getColumn(coor[k]), getRow(coor[k + 1]), getColumn(coor[k + 1]));
                    k += 2;
                }
                ret++;
            }
        }
        else if (displaySquareState(i, j) == currentQueen)
        {
            if (jumpsqutole > 0)
            {
                if (verifqueens(i, j, x, y, queencapturesqtole) == 1)
                {
                    ret++;
                }
            }
            if (jumpsqutori > 0)
            {
                if (verifqueens(i, j, x, y, queencapturesqtori) == 1)
                {
                    ret++;
                }
            }
            if (jumpsqubole > 0)
            {
                if (verifqueens(i, j, x, y, queencapturesqubole) == 1)
                {
                    ret++;
                }
            }
            if (jumpsqubori > 0)
            {
                if (verifqueens(i, j, x, y, queencapturesqubori) == 1)
                {
                    ret++;
                }
            }
        }
        if (ret != 0)
        {
            return 0;
        }
    }

    if (displaySquareState(i, j) == currentPlayer)
    {
        if (mustcapture == 0)
        {
            if (abs(i - x) > 1 || abs(j - y) > 1)
            {
                printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas valide car il est trop long.\n", i, j, x, y);
                return 0;
            }
        }

        if (startSquareNumber == 0 || endSquareNumber == 0)
        {
            printf("Erreur : i et j doivent etre entre 1 et 10.\n");
            return 0;
        }

        if (board[endSquareNumber - 1] != EMPTY)
        {
            printf("La case (%d, %d) est deja occupee.\n", x, y);
            return 0;
        }

        if (board[startSquareNumber - 1] != currentPlayer)
        {
            printf("La case (%d, %d) ne contient pas votre pion.\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] == EMPTY)
        {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] != WHITE_PAWN && board[startSquareNumber - 1] != BLACK_PAWN)
        {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        int isWhitePawn = (board[startSquareNumber - 1] == WHITE_PAWN);
        int moveDirection = endSquareNumber - startSquareNumber;
        if ((isWhitePawn && moveDirection >= 0) || (!isWhitePawn && moveDirection <= 0))
        {
            printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas dans la bonne direction.\n", i, j, x, y);
            return 0;
        }
    }
    else if (displaySquareState(i, j) == currentQueen)
    {

        if (startSquareNumber == 0 || endSquareNumber == 0)
        {
            printf("Erreur : i et j doivent etre entre 1 et 10.\n");
            return 0;
        }

        if (board[endSquareNumber - 1] != EMPTY)
        {
            printf("La case (%d, %d) est deja occupee.\n", x, y);
            return 0;
        }

        if (board[startSquareNumber - 1] != currentQueen)
        {
            printf("La case (%d, %d) ne contient pas votre dame.\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] == EMPTY)
        {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        if (board[startSquareNumber - 1] != WHITE_QUEEN && board[startSquareNumber - 1] != BLACK_QUEEN)
        {
            printf("Aucun pion a deplacer sur la case (%d, %d).\n", i, j);
            return 0;
        }

        int rowDirection = (getRow(endSquareNumber) - getRow(startSquareNumber)) / abs(getRow(endSquareNumber) - getRow(startSquareNumber));
        int columnDirection = (getColumn(endSquareNumber) - getColumn(startSquareNumber)) / abs(getColumn(endSquareNumber) - getColumn(startSquareNumber));
        int row = getRow(startSquareNumber) + rowDirection;
        int column = getColumn(startSquareNumber) + columnDirection;
        if (mustcapture() == 0)
        {
            while (row != getRow(endSquareNumber) && column != getColumn(endSquareNumber))
            {
                if (board[getSquareNumber(row, column) - 1] != EMPTY)
                {
                    printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) n'est pas valide car il y a un pion sur le chemin.\n", i, j, x, y);
                    return 0;
                }
                row += rowDirection;
                column += columnDirection;
            }
        }
    }
    else
    {
        printf("La case (%d, %d) ne contient pas votre pion ou votre dame.\n", i, j);
        return 0;
    }

    printf("Le deplacement du pion sur la case (%d, %d) vers la case (%d, %d) est valide.\n", i, j, x, y);
    return 1;
}

int deplacer(int i, int j, int x, int y)
{
    if (verif(i, j, x, y) == 1)
    {
        if (displaySquareState(i, j) == WHITE_PAWN || displaySquareState(i, j) == BLACK_PAWN)
        {
            int startSquareNumber = getSquareNumber(i, j);
            int endSquareNumber = getSquareNumber(x, y);
            // deplacement indircet
            if (mustcapture() == 1)
            {
                int jumpedSquareNumber = getSquareNumber((i + x) / 2, (j + y) / 2);
                board[jumpedSquareNumber - 1] = EMPTY;
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                // le cas d un deplacement indirect vers la premiere ligne (W)-->(DW)
                if (player == WHITE && board[endSquareNumber - 1] == WHITE_PAWN && getRow(endSquareNumber) == 1)
                {
                    board[endSquareNumber - 1] = WHITE_QUEEN;
                }
                // le cas d un deplacement indirect vers la derniere ligne (B)-->(DB)
                if (player == BLACK && board[endSquareNumber - 1] == BLACK_PAWN && getRow(endSquareNumber) == 10)
                {
                    board[endSquareNumber - 1] = BLACK_QUEEN;
                }

                // update Score
                if (player == WHITE)
                {
                    scoreWhite++;
                }
                else
                {
                    scoreBlack++;
                }

                movesSinceLastCapture = 0;

                captureaftercapture[0] = 0;
                captureaftercapture[1] = 0;
                if (mustcaptureaftercapture(x, y) == 1)
                {
                    captureaftercapture[0] = x;
                    captureaftercapture[1] = y;
                    printf("Vous devez continuer a capturer le pion adverse.\n");
                    return 1;
                }
                else
                {
                    player = (player == WHITE) ? BLACK : WHITE;
                }
                // deplacement direct
            }
            else
            {
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                // le cas d un deplacement direct vers la premiere ligne (W)-->(DW)
                if (player == WHITE && board[endSquareNumber - 1] == WHITE_PAWN && getRow(endSquareNumber) == 1)
                {
                    board[endSquareNumber - 1] = WHITE_QUEEN;
                }
                // le cas d un deplacement direct vers la derniere ligne (B)-->(DB)
                if (player == BLACK && board[endSquareNumber - 1] == BLACK_PAWN && getRow(endSquareNumber) == 10)
                {
                    board[endSquareNumber - 1] = BLACK_QUEEN;
                }
                player = (player == WHITE) ? BLACK : WHITE;
            }
            return 1;
        }
        else if (displaySquareState(i, j) == WHITE_QUEEN || displaySquareState(i, j) == BLACK_QUEEN)
        {
            int startSquareNumber = getSquareNumber(i, j);
            int endSquareNumber = getSquareNumber(x, y);
            // deplacement indircet
            if (mustcapture() == 1)
            {
                int jumpedSquareNumber;
                int s, t;
                if (jumpsqutole > 0)
                {
                    s = x + 1;
                    t = y + 1;
                    while (displaySquareState(s, t) == EMPTY && s < 11 && t < 11)
                    {
                        s++;
                        t++;
                    }
                    if (s < 11 && t < 11 && (displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN))
                    {
                        jumpedSquareNumber = getSquareNumber(s, t);
                    }
                }
                if (jumpsqutori > 0)
                {
                    s = x + 1;
                    t = y - 1;
                    while (displaySquareState(s, t) == EMPTY && s < 11 && t > 0)
                    {
                        s++;
                        t--;
                    }
                    if (s < 11 && t > 0 && (displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN))
                    {
                        jumpedSquareNumber = getSquareNumber(s, t);
                    }
                }
                if (jumpsqubole > 0)
                {
                    s = x - 1;
                    t = y + 1;
                    while (displaySquareState(s, t) == EMPTY && s > 0 && t < 11)
                    {
                        s--;
                        t++;
                    }
                    if (s > 0 && t < 11 && (displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN))
                    {
                        jumpedSquareNumber = getSquareNumber(s, t);
                    }
                }
                if (jumpsqubori > 0)
                {
                    s = x - 1;
                    t = y - 1;
                    while (displaySquareState(s, t) == EMPTY && s > 0 && t > 0)
                    {
                        s--;
                        t--;
                    }
                    if (s > 0 && t > 0 && (displaySquareState(s, t) == BLACK_PAWN || displaySquareState(s, t) == BLACK_QUEEN))
                    {
                        jumpedSquareNumber = getSquareNumber(s, t);
                    }
                }

                board[jumpedSquareNumber - 1] = EMPTY;
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;

                // update Score
                if (player == WHITE)
                {
                    scoreWhite++;
                }
                else
                {
                    scoreBlack++;
                }

                movesSinceLastCapture = 0;

                captureaftercapture[0] = 0;
                captureaftercapture[1] = 0;
                if (mustcaptureaftercapture(x, y) == 1)
                {
                    captureaftercapture[0] = x;
                    captureaftercapture[1] = y;
                    printf("Vous devez continuer a capturer le pion adverse.\n");
                    return 1;
                }
                else
                {
                    player = (player == WHITE) ? BLACK : WHITE;
                }
                // deplacement direct
            }
            else
            {
                board[endSquareNumber - 1] = board[startSquareNumber - 1];
                board[startSquareNumber - 1] = EMPTY;
                player = (player == WHITE) ? BLACK : WHITE;
            }
            return 1;
        }
    }
    return 0;
}

void generateAIMove()
{

    if (mustcapture() == 1)
    {
        int i = getRow(coor[0]);
        int j = getColumn(coor[0]);
        int x = getRow(coor[1]);
        int y = getColumn(coor[1]);
        deplacer(i, j, x, y);
    }
    else
    {
        int i, j, x, y;
        int validMove = 0;
        while (validMove == 0)
        {
            for (int k = 0; k < 50; k++)
            {
                if (board[k] == BLACK_PAWN || board[k] == BLACK_QUEEN)
                {
                    if (board[k] == BLACK_QUEEN)
                    {
                        i = getRow(k + 1);
                        j = getColumn(k + 1);
                        for (int m = 1; m < 10; m++)
                        {
                            if (i + m > 10 || j + m > 10)
                            {
                                break;
                            }
                            if (board[getSquareNumber(i + m, j + m) - 1] == EMPTY)
                            {
                                x = i + m;
                                y = j + m;
                                if (verif(i, j, x, y) == 1)
                                {
                                    validMove = 1;
                                    break;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                        for (int m = 1; m < 10; m++)
                        {
                            if (i + m > 10 || j - m < 1)
                            {
                                break;
                            }
                            if (board[getSquareNumber(i + m, j - m) - 1] == EMPTY)
                            {
                                x = i + m;
                                y = j - m;
                                if (verif(i, j, x, y) == 1)
                                {
                                    validMove = 1;
                                    break;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                        for (int m = 1; m < 10; m++)
                        {
                            if (i - m < 1 || j + m > 10)
                            {
                                break;
                            }
                            if (board[getSquareNumber(i - m, j + m) - 1] == EMPTY)
                            {
                                x = i - m;
                                y = j + m;
                                if (verif(i, j, x, y) == 1)
                                {
                                    validMove = 1;
                                    break;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                        for (int m = 1; m < 10; m++)
                        {
                            if (i - m < 1 || j - m < 1)
                            {
                                break;
                            }
                            if (board[getSquareNumber(i - m, j - m) - 1] == EMPTY)
                            {
                                x = i - m;
                                y = j - m;
                                if (verif(i, j, x, y) == 1)
                                {
                                    validMove = 1;
                                    break;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    else if (board[k] == BLACK_PAWN)
                    {
                        i = getRow(k + 1);
                        j = getColumn(k + 1);
                        if (i < 10 && j > 1 && board[getSquareNumber(i + 1, j - 1) - 1] == EMPTY)
                        {
                            x = i + 1;
                            y = j - 1;
                            if (verif(i, j, x, y) == 1)
                            {
                                validMove = 1;
                                break;
                            }
                        }
                        if (i < 10 && j < 10 && board[getSquareNumber(i + 1, j + 1) - 1] == EMPTY)
                        {
                            x = i + 1;
                            y = j + 1;
                            if (verif(i, j, x, y) == 1)
                            {
                                validMove = 1;
                                break;
                            }
                        }
                    }
                }
            }
        }
        deplacer(i, j, x, y);
    }
}

int main()
{

    InitialiserDamier();
    AfficherDamier();

    int choix, i, j, x, y;

    while (1)
    {
        printf("------------------------------------------\n");
        printf("Tour du joueur %c\n", player == WHITE ? 'W' : 'B');
        printf("------------------------------------------\n");
        if (player == WHITE)
        {
            printf("Menu :\n");
            printf("1. Deplacer un pion\n");
            printf("2. Afficher \n");
            printf("3. Afficher score\n");
            printf("0. Quitter\n");
            printf("Votre choix : ");
            scanf("%d", &choix);
            printf("-------------------------------------------\n");

            switch (choix)
            {
            case 1:
                printf("Entrez les coordonnees du pion a deplacer (i, j) : ");
                scanf("%d %d", &i, &j);
                printf("Entrez les coordonnees de la case d'arrivee (x, y) : ");
                scanf("%d %d", &x, &y);
                if (deplacer(i, j, x, y) == 1)
                {
                    printf("------------------------------------------\n");
                    AfficherDamier();
                }
                break;
            case 2:
                AfficherDamier();
                break;
            case 3:
                printf("Black Score : %d \t \t White Score : %d\n", scoreBlack, scoreWhite);
                break;
            case 0:
                printf("le joueur %c a quitter la game. Player %c wins!\n", (player == WHITE) ? 'B' : 'W', (player == WHITE) ? 'W' : 'B');
                break;
            default:
                printf("Choix invalide.\n");
            }
        }
        else
        {
            generateAIMove();
            AfficherDamier();
        }

        // a verifier
        if (choix == 0)
        {
            break;
        }
        if (scoreWhite >= 20)
        {
            printf("le joueur W a atteint 20! Le joueur W gagne le jeu!\n");
            break;
        }
        if (scoreBlack >= 20)
        {
            printf("le joueur B a atteint 20! Le joueur B gagne le jeu!\n");
            break;
        }

        int whitepieces = 0, blackpieces = 0;
        for (int k = 0; k < 50; k++)
        {
            if (board[k] == WHITE_PAWN || board[k] == WHITE_QUEEN)
            {
                whitepieces++;
            }
            if (board[k] == BLACK_PAWN || board[k] == BLACK_QUEEN)
            {
                blackpieces++;
            }
        }

        if (whitepieces == 0)
        {
            printf("le joueur W n'a plus de pions ou de dame! Le joueur B gagne le jeu!\n");
            break;
        }

        if (blackpieces == 0)
        {
            printf("le joueur B n'a plus de pions ou de dame! Le joueur W gagne le jeu!\n");
            break;
        }

        int whiteHasOnlyQueens = 1, blackHasOnlyQueens = 1;
        int numWhitePawns = 0, numBlackPawns = 0;
        for (int k = 0; k < 50; k++)
        {
            if (board[k] == WHITE_PAWN)
            {
                whiteHasOnlyQueens = 0;
                numWhitePawns++;
            }
            if (board[k] == BLACK_PAWN)
            {
                blackHasOnlyQueens = 0;
                numBlackPawns++;
            }
        }

        if (whiteHasOnlyQueens && blackHasOnlyQueens && capturepossible == 0)
        {
            movesSinceLastCapture++;
            if (movesSinceLastCapture >= 6)
            {
                printf("le jeu est bloque, il n'y a pas de gagnant.\n");
                break;
            }
        }
        else
        {
            movesSinceLastCapture = 0;
        }
    }

    return 0;
}
