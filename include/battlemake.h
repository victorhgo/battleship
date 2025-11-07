#ifndef BATTLEMAKE_H
/* This file will be called by gcc using the flag -I. 
-Iinclude to tell gcc to look at include folder
*/

/* Including the required libs */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <stdbool.h>

/* Some constants */
#define BATTLEMAKE_H

/* Draw the board with ROWS x COWS */
#define ROWS 8
#define COLS 10

/* Ship Length */
#define NUM_SHIPS 8
static const int SHIP_SIZES[NUM_SHIPS] = {4, 3, 3, 2, 2, 1};

/* Symbols used in the game */
#define SHIP   '<'
#define HIT    '*'
#define MISS   'o'
#define EMPTY  ' '

#define EASY 1
#define MEDIUM 2
#define HARD 3

/* Function Prototypes */

/* Draw the board */
void drawBoard(char (*matrix)[COLS], bool hideShips);

/* Randomize numbers based on seed */
void newSeed(char (*matrix)[COLS], int difficulty);

/* Convert column char to column int */
unsigned mapColumns(const char *col); 

/* Show current game score */
void showScore(unsigned *hit, unsigned *misses);

/* Play the game */
void playGame(char (*board)[COLS]); 

/* Difficult level selection */
int chooseDifficulty();

#endif