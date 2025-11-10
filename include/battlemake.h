#ifndef BATTLEMAKE_H

/* Including the required libs */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <stdbool.h>

/* Some constants definitions */
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

/* --- board.c - Functions to draw and manage the game board --- */

void drawBoard(char (*matrix)[COLS], bool hideShips);
void clearBoard(char (*matrix)[COLS]);
void pressEnterToContinue(void);
unsigned mapColumns(const char *col); 
void showScore(unsigned *hit, unsigned *misses);

/* --- ships.c - Helper functions to place ships ramdomly across the battlefield --- */

int getShipConfig(short difficulty, unsigned *shipSizes);
int canPlaceShip(char (*matrix)[COLS], int row, int col, int size, int horizontal);
void placeShip(char (*matrix)[COLS], int row, int col, int size, int horizontal);

/* --- game.c - Functions to play the game (select difficult, generate seed) --- */

short chooseDifficulty();
void newSeed(char (*matrix)[COLS], short difficulty);
void welcomeMenu(void);
void selectionMenu(void);
void exitMsg(void);
void playGame(char (*board)[COLS], short difficulty); 
void loopPlay(short difficulty);

#endif