/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

/* drawBoard */
void drawBoard(char (*matrix)[COLS], bool hideShips){
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
    /* Clear the board - Can be a new function*/
    for (int row = 0; row < ROWS; row++)
        for (int col = 0; col < COLS; col++)
            matrix[row][col] = EMPTY;   
}

/* Convert the column char to int for matrix index */
unsigned mapColumns(const char *col){
    return toupper(*col) - 'A';
}

/* Show's the score for each game */
void showScore(unsigned *hit, unsigned *misses){
	printf("Targets hit: %d | Missed Shots: %d\n", *hit, *misses);
}

/* Cross-platform "Press ENTER to continue" */
void pressEnterToContinue(void){
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