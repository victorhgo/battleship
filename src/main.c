/*  ---  C Implementation of Battleship --- version 0.1 (playable, but full of bugs) */
/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

int main(){
    char board[ROWS][COLS];
    char option;

    do {
        system("clear");
        newSeed(board);
        drawBoard(board, true); // false: show ships for debug
        printf("Press (S) to sort again\n");
        printf("Press (P) to play the game\n");
        printf("Press (E) to exit\n>>> ");
        scanf(" %c", &option);
    } while (tolower(option) == 's');

    if (tolower(option) == 'p') {
        system("clear");
        playGame(board);
    }

    printf("Exiting game...\n");
    return 0;
}