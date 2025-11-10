/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

short chooseDifficulty(){
    /* Select the difficulty level. */
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

void newSeed(char (*matrix)[COLS], short difficulty){
    /* Places a ship randomly on the board using the difficult level
    to determine the amount of ships on the board */
    srand(time(NULL));
    // srand(time(0)) // for debug purposes only

    clearBoard(matrix);

    unsigned shipSizes[10];
    int numShips = getShipConfig(difficulty, shipSizes);

    for (int ship = 0; ship < numShips; ship++) {
        int placed = 0;
        unsigned size = shipSizes[ship];

        while(!placed){
            int row = rand() % ROWS;
            int col = rand() % COLS;
            int horizontal = rand() % 2;

            if(canPlaceShip(matrix, row, col, size, horizontal)){
                placeShip(matrix, row, col, size, horizontal);
                placed = 1;
            }
        }

    }
}

void welcomeMenu() {
    /* Welcome menu includes information such as instructions and
    to choose to play it.*/
    char option;

    while (1) {
        system("clear");
        printf("Implementation of Battleship - v0.1\n");
        printf("-----------------------------------\n");
        printf("1. Play it\n");
        printf("2. Instructions\n");
        printf("3. Exit\n\n");
        printf("by Victor Correa\n");
        printf("-----------------------------------\n");
        printf("Enter option >>> ");

        scanf(" %c", &option);

        if (option == '3' || tolower(option) == 'e') {
            exitMsg();
        }

        if (option == '2' || tolower(option) == 'h') {
            system("clear");
            printf("--- Battleship by Victor Correa ---\n");
            printf("You are playing the classic Battleship game.\n");
            printf("You need to sink the enemy ships that are placed across the board.\n");
            printf("To make a shot, simply enter coordinates like A5 for instance.\n\n");
            printf("Used Symbols:\n");
            //printf("  '<' - Ship (debug mode only)\n");
            printf("  '*' - You hit a ship\n");
            printf("  'o' - You missed a shop\n");
            printf("  ' ' - Ocean\n\n");
            printf("Good luck! And enjoy it :)\n");
            pressEnterToContinue();
            continue;
        }

        if (option == '1' || tolower(option) == 's') {
            /* Simply proceeds to the main game loop */
            break; 
        }

        printf("Invalid option! Try again.\n");
        pressEnterToContinue();
    }
}

void selectionMenu(){
    /* Selection menu */
    printf("Press (S) to sort ships\n");
    printf("Press (P) to play the game\n");
    printf("Press (D) to change difficulty\n");
    printf("Press (E) to exit\n>>> ");
}

void exitMsg(){
    /* Exhibits a exit message and terminates the program */
    printf("Exiting game...\n");
    exit(0);
}

void playGame(char (*board)[COLS], short difficulty) {
    /* Helper function to main loop gameplay - In progress... */
    unsigned hit = 0, miss = 0,
             maxMiss = (difficulty == EASY? 27 : difficulty == MEDIUM? 16 : 12),
             shipsLeft = (difficulty == EASY? 16 : difficulty == MEDIUM? 12 : 9),
             row;

    char col;

    while (1) {
        // false - show ships for debug
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
            shipsLeft--;
            putchar('\a');
        } else if (*cell == EMPTY) {
            *cell = MISS;
            miss++;
            putchar('\a');
        }

        /* Win condition: no ship left. Lose condition depends on difficulty level */
        if (shipsLeft == 0){
            printf("Congratulations! You won :)\n");
            pressEnterToContinue();
            break;
        }
        if (miss >= maxMiss){
            printf("Game over! You lost :C\n");
            pressEnterToContinue();
            break;
        }
    }
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
        drawBoard(board, true); // false = show ships for debug
        selectionMenu();
        scanf(" %c", &option);

        if (tolower(option) == 'e') {
            exitMsg();
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