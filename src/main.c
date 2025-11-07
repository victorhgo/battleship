/*  ---  C Implementation of Battleship --- version 0.1 (playable, but full of bugs) */
/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

int main(){
    char board[ROWS][COLS];
    char option;
    short difficulty = chooseDifficulty();

    do {
        system("clear");
        newSeed(board, difficulty);
        drawBoard(board, false); // false: show ships for debug
        printf("Press (S) to sort again\n");
        printf("Press (P) to play the game\n");
        printf("Press (D) to change difficult\n");
        printf("Press (E) to exit\n>>> ");
        scanf(" %c", &option);

        if (tolower(option) == 'e'){
            printf("Exiting game...\n");
            return 0;
        }

        if (tolower(option) == 'd'){
            difficulty = chooseDifficulty();
        }

        if (tolower(option) == 'p') {
            system("clear");
            playGame(board, difficulty);
        }

    } while (tolower(option) != 'e');
}