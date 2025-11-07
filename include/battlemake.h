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
#define NUM_SHIPS 3
static const int SHIP_SIZES[NUM_SHIPS] = {4, 3, 2};

/* Symbols used in the game */
#define SHIP   '<'
#define HIT    '*'
#define MISS   'o'
#define EMPTY  ' '

/* Function Prototypes */

/* Draw the board */
void drawBoard(char (*matrix)[COLS], bool hideShips);

/* Randomize numbers based on seed */
void newSeed(char (*matrix)[COLS]);

/* Convert column char to column int */
unsigned mapColumns(char *col); 

/* Show current game score */
void showScore(unsigned *hit, unsigned *misses);

/* Play the game */
void playGame(char (*board)[COLS]); 
/* char gameOver(char sort); - Future Function*/

#endif