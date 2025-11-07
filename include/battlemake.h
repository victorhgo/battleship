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

#define ROWS 8
#define COLS 10

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

/* Randomize numbers based on seed - To be refactored */
void newSeed(char (*matrix)[COLS], short difficulty);

/* First step - clearBoard as a separate function - Done */
void clearBoard(char (*matrix)[COLS]);

/* Second step - getShipConfig as a separate function to:

This function needs to get the difficult level and also each ship placement:

This is the following we have:

medium[] = {4, 3, 2, 2, 1};
hard[]   = {3, 2, 2, 1, 1};
easy[]   = {4, 3, 3, 2, 2, 2};


Returns the number of ships for each setting
*/

/* Convert column char to column int */
unsigned mapColumns(const char *col); 

/* Show current game score */
void showScore(unsigned *hit, unsigned *misses);

/* Play the game */
void playGame(char (*board)[COLS], short difficulty); 

/* Difficult level selection */
short chooseDifficulty();

#endif