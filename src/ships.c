/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

int getShipConfig(short difficulty, int *shipSizes){
/* Assumes difficulty and shipSizes to be integers numbers
Returns the number of ships as an integer */
    static const int easy[]   = {4, 3, 3, 2, 2, 2};
    static const int medium[] = {4, 3, 2, 2, 1};
    static const int hard[]   = {3, 2, 2, 1, 1};

    int numShips = 0;
    const int *source = NULL;

    switch (difficulty){
        case EASY:
            source = easy;
            numShips = 6;
            break;
        case MEDIUM:
            source = medium;
            numShips = 5;
            break;
        case HARD:
            source = hard;
            numShips = 5;
            break;
    }

    for (int ship = 0; ship < numShips; ship++){
        shipSizes[ship] = source[ship];
    }

    return numShips;
}

int canPlaceShip(char (*matrix)[COLS], int row, int col, int size, int horizontal) {
/* Check whether the ship can be placed on horizontal or vertical 
Returns 1 if true, 0 otherwise*/
    if (horizontal){
        if (col + size > COLS){
            return 0;
        }
        for (int s = 0; s < size; s++){
            if (matrix[row][col + s] != EMPTY){
                return 0;
            }
        }
    } else {
        if (row + size > ROWS) {
            return 0;
        }
        for (int s = 0; s < size; s++) {
            if(matrix[row + s][col] != EMPTY){
                return 0;
            }
        }
    }
    return 1;
}

void placeShip(char (*matrix)[COLS], int row, int col, int size, int horizontal){
/* Places a ship in the spot */
    for (int place = 0; place < size; place++){
        if (horizontal) {
            matrix[row][col + place] = SHIP;
        } else {
            matrix[row + place][col] = SHIP;
        }
    }
}