/*  ---  C Implementation of Battleship --- version 0.1 (playable) */
/* Include battlemake.h which contains all functions prototypes */
#include "battlemake.h"

int main(void) {
    /* Main function - Sets difficulty to EASY to start the main loop gameplay */
    short difficulty = EASY;

    welcomeMenu();
    loopPlay(difficulty);
    
    return 0;
}