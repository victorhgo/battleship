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

/* Difficulty Select */
short chooseDifficulty(){
    char choice;
    int level = 0;

    while (level == 0){
        system("clear");
        printf("--- Select Difficulty Level ---\n");
        printf("[E] Easy - More ships and more shots\n");
        printf("[M] Medium - Fewer ships and shots\n");
        printf("[H] Hard - Ships are smaller and only 5 misses allowed.\n");
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

/* First step - clearBoard as a separate function */
void clearBoard(char (*matrix)[COLS]){
    /* Clear the board - Can be a new function*/
    for (int row = 0; row < ROWS; row++)
        for (int col = 0; col < COLS; col++)
            matrix[row][col] = EMPTY;   
}

/* Refactoring Random seed to ensure no ship overlaps - Under tests...
- not working as good as previous one, but at least it prevents overlaps */
void newSeed(char (*matrix)[COLS], short difficulty){
    srand(time(NULL));
    //srand(0); // debug purposes only

    clearBoard(matrix);

    /* Set difficulty - To be a different function and refactor it */
    int numShips,
        shipSizes[100];

    switch (difficulty){
        case EASY:
            int easySizes[] = {4, 3, 3, 2, 2, 2};
            numShips = 6;

            for (int ship = 0; ship < numShips; ship++){
                shipSizes[ship] = easySizes[ship];
            }
            break;

        case MEDIUM:
            int mediumSizes[] = {4, 3, 2, 2, 1};
            numShips = 5;

            for (int ship = 0; ship < numShips; ship++){
                shipSizes[ship] = mediumSizes[ship];
            }

            break;
        
        case HARD:
            int hardSizes[] = {3, 2, 2, 1, 1};
            numShips = 5;

            for (int ship = 0; ship < numShips; ship++){
                shipSizes[ship] = hardSizes[ship];
            }
            break;
    }
    
    /* To place each ship - Will also be a separate function */
    for (int ship = 0; ship < numShips; ship++) {
        int size = shipSizes[ship];
        int placed = 0;

        while (!placed) {
            int row = rand() % ROWS;
            int col = rand() % COLS;
            int horizontal = rand() % 2; // 0 = vertical, 1 = horizontal

            int fits = 1;
            if (horizontal) {
                if (col + size > COLS){
                    fits = 0;
                }

                else {
                    for (int i = 0; i < size; i++) {
                        if (matrix[row][col + i] != EMPTY) {
                            fits = 0;
                        }

                    }
                }
            } else {
                if (row + size > ROWS) {
                    fits = 0;
                }
                else {
                    for (int i = 0; i < size; i++) {
                        if (matrix[row + i][col] != EMPTY) {
                            fits = 0;
                        }
                    }
                }
            }

            if (fits) {
                for (int i = 0; i < size; i++) {
                    if (horizontal) {
                        matrix[row][col + i] = SHIP;
                    }
                    else {
                        matrix[row + i][col] = SHIP;
                    }
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
void playGame(char (*board)[COLS], short difficulty) {
    unsigned hit = 0, miss = 0,
             maxMiss = (difficulty == EASY? 10 : difficulty == MEDIUM? 6 : 5),
             shipsLeft = (difficulty == EASY? 16 : difficulty == MEDIUM? 12 : 9),
             row;

    char col;

    while (1) {
        drawBoard(board, false);
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
            shipsLeft--;
            putchar('\a');
        } else if (*cell == EMPTY) {
            *cell = MISS;
            miss++;
            putchar('\a');
        }

        /* Win condition: no ship left. Lose condition depends on difficulty*/
        if (shipsLeft == 0){
            printf("Congratulations! You won :)\n");
            break;
        }
        if (miss >= maxMiss){
            printf("Game over! You lost :C\n");
            break;
        }
    }
}