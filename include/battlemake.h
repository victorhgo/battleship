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

/* --- board.c - Functions to draw and clear the game board --- */

/* Draw the board */
void drawBoard(char (*matrix)[COLS], bool hideShips);

/* First step - clearBoard as a separate function - Done */
void clearBoard(char (*matrix)[COLS]);

/* Press Enter to Continue implementation */
void pressEnterToContinue(void);

/* Convert column char to column int */
unsigned mapColumns(const char *col); 

/* Show current game score */
void showScore(unsigned *hit, unsigned *misses);

/* --- ships.c - Helper functions to put ships ramdomly across the battlefield --- */

/* Get which ships to be used*/
int getShipConfig(short difficulty, int *shipSizes);

/* Can place ship in a spot if free */
int canPlaceShip(char (*matrix)[COLS], int row, int col, int size, int horizontal);

/* Places a ship */
void placeShip(char (*matrix)[COLS], int row, int col, int size, int horizontal);

/* --- game.c - Functions to play the game (select difficult, generate seed) --- */

/* Difficult level selection */
short chooseDifficulty();

/* Randomize numbers based on seed - To be refactored */
void newSeed(char (*matrix)[COLS], short difficulty);

/* Welcome menu before the main game loop */
void welcomeMenu(void);

/* Play the game */
void playGame(char (*board)[COLS], short difficulty); 

/* --- main.c - main function --- */

/* Main game loop */
void loopPlay(short difficulty);

#endif