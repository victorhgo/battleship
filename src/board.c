/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

void drawBoard(char (*matrix)[COLS], bool hideShips){
    /* Draw the game board on the console 
    Assumes:
        matrix: the 2D array, battlefield
        hideShips - true - hide ships positions
                    false - show ships for debug*/
    putchar('\n');

    /* Draw the Header row (A to J)*/
    printf("     ");
  
    for (int col = 0; col < COLS; col++){
        printf(" %c  ", 'A' + col);
    }
    putchar('\n');

    /* Draw Top Board */
    printf("    ");
    for (int i = 0; i < COLS * 4 + 1; i++)
        putchar('_');
    putchar('\n');

    /* Draw each row */
    for (int row = 0; row < ROWS; row++) {
        printf("%3d |", row + 1);
        for (int col = 0; col < COLS; col++) {
            char ch = matrix[row][col];

            /* Hide the ships */
            if (hideShips && ch == SHIP) {
                ch = EMPTY;
            }
            printf(" %c |", ch);
        }

        putchar('\n');

        /* Print row separator */
        printf("    ");
        for (int i = 0; i < COLS * 4 + 1; i++)
            putchar('_');
        putchar('\n');
    }

    putchar('\n');
}

void clearBoard(char (*matrix)[COLS]){
    /* Clear the board - setting everything to EMPTY*/
    for (int row = 0; row < ROWS; row++)
        for (int col = 0; col < COLS; col++)
            matrix[row][col] = EMPTY;   
}

unsigned mapColumns(const char *col){
    /* Converts the column char to int for matrix index */
    return toupper(*col) - 'A';
}

void showScore(unsigned *hit, unsigned *misses){
    /* Displays the current hit and miss counters on screen */
	printf("Targets hit: %d | Missed Shots: %d\n", *hit, *misses);
}

void pressEnterToContinue(void){
    /* Cross-platform "Press ENTER to continue" */
    int c;

    /* Sanitizer to clear leftover characters */
    while ((c = getchar()) != '\n' && c != EOF) {
        /* Do nothing*/
    }

    printf("\nPress ENTER to continue...");
    fflush(stdout);

    while ((c = getchar()) != '\n' && c != EOF) {
        /* Do nothing - Waiting on user input */
    }
}