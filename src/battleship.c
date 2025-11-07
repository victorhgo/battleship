/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

/* drawBoard */
void drawBoard(char (*matrix)[COLS], bool hideShips){
    putchar('\n');

    /* Draw the Header row (A to J)*/
    printf("      ");

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

/* This function will generate random numbers - Old version, works great */

// void newSeed(char (*matrix)[COLS]){
//     long capture;
//     time(&capture);             /* Based on the OS clock (seconds), we will generate a random seed */
//     srand((unsigned)capture);    /* that will use the srand() function */

//     for (int i = 0; i < ROWS; i++){
//         for(int j = 0; j < COLS; j++){
//             unsigned num = rand()%100+1; /* To generate 10 random numbers using the rand() function */
            
//             if(num % 2){            /* if odd - write the ship */
//                 matrix[i][j] = '<';
//             } else {                /* if even - empty position (0x20 is empty space)*/
//                 matrix[i][j] = 0x20; 
//             }
//         }
//     }
// }

/* Difficulty Select */
int chooseDifficulty(){
    char choice;
    int level = 0;

    while (level == 0){
        system("clear");
        printf("--- Select Difficulty Level ---\n");
        printf("[E] Easy\n");
        printf("[M] Medium\n");
        printf("[H] Hard\n");
        printf(">>> ");
        scanf(" %c", &choice);

        switch (tolower(choice)) {
            case 'e': level = EASY; return level;
            case 'm': level = MEDIUM; return level;
            case 'h': level = HARD; return level;
        }
        printf("Invalid option! Please enter E, M, or H.\n");
    }
    /* Stop warnings on gcc */
    return level;
}

/* Refactoring Random seed to ensure no ship overlaps - Under tests...
- not working as good as previous one, but at least it prevents overlaps */
void newSeed(char (*matrix)[COLS], int difficulty){
    //srand(time(NULL));
    srand(0); // debug purposes only
    /* Clear the board */
    for (int row = 0; row < ROWS; row++)
        for (int col = 0; col < COLS; col++)
            matrix[row][col] = EMPTY;

    /* Set difficulty */
    
    /* To place each ship */
    for (int ship = 0; ship < NUM_SHIPS; ship++) {
        int size = SHIP_SIZES[ship];
        int placed = 0;

        while (!placed) {
            int row = rand() % ROWS;
            int col = rand() % COLS;
            int horizontal = rand() % 2; // 0 = vertical, 1 = horizontal

            int fits = 1;
            if (horizontal) {
                if (col + size > COLS) fits = 0;
                else {
                    for (int i = 0; i < size; i++)
                        if (matrix[row][col + i] != EMPTY) fits = 0;
                }
            } else {
                if (row + size > ROWS) fits = 0;
                else {
                    for (int i = 0; i < size; i++)
                        if (matrix[row + i][col] != EMPTY) fits = 0;
                }
            }

            if (fits) {
                for (int i = 0; i < size; i++) {
                    if (horizontal) matrix[row][col + i] = SHIP;
                    else matrix[row + i][col] = SHIP;
                }
                placed = 1;
            }
        }
    }
}

/* Convert the column char to int for matrix index */
unsigned mapColumns(const char *col){
    return toupper(*col) - 'A';
}

/* Show's the score for each game */
void showScore(unsigned *hit, unsigned *misses){
	printf("Targets hit: %d | Missed Shots: %d\n", *hit, *misses);
}

/* Function to play the game - implementation in progress */
void playGame(char (*board)[COLS]) {
    unsigned hit = 0, miss = 0;
    char col;
    unsigned row;

    while (1) {
        drawBoard(board, true);
        showScore(&hit, &miss);

        printf("Enter a position to shot >>> ");
        scanf(" %c%u", &col, &row);

        int c = mapColumns(&col);
        if (c < 0 || row < 1 || row > ROWS) {
            printf("Invalid position!\n");
            continue;
        }

        char *cell = &board[row - 1][c];
        if (*cell == SHIP) {
            *cell = HIT;
            hit++;
            putchar('\a');
        } else if (*cell == EMPTY) {
            *cell = MISS;
            miss++;
            putchar('\a');
        }

        // Win or lose condition
        if (hit == 9) {
            printf("You won!\n");
            break;
        }
        if (miss >= 10) {
            printf("Game over! You lost!\n");
            break;
        }
    }
}