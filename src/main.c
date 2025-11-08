/*  ---  C Implementation of Battleship --- version 0.1 (playable, but full of bugs) */
/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

int main(void) {
    /* Main function - Sets difficulty to EASY to start the main loop gameplay */
    short difficulty = EASY;

    welcomeMenu();
    loopPlay(difficulty);
    
    return 0;
}

void loopPlay(short difficulty) {
    /* Main game loop to be displayed after the welcome menu.
    This function helps on placing ships, playing the game, or change difficulty
    Runs repeatedly until exit */
    char board[ROWS][COLS];
    char option;

    do {
        system("clear");
        newSeed(board, difficulty);
        drawBoard(board, false); // false = show ships for debug
        printf("Press (S) to sort again\n");
        printf("Press (P) to play the game\n");
        printf("Press (D) to change difficulty\n");
        printf("Press (E) to exit\n>>> ");
        scanf(" %c", &option);

        if (tolower(option) == 'e') {
            printf("Exiting game...\n");
            exit(0);
        }

        if (tolower(option) == 'd') {
            difficulty = chooseDifficulty();
        }

        if (tolower(option) == 'p') {
            system("clear");
            playGame(board, difficulty);
        }

    } while (tolower(option) != 'e');
}