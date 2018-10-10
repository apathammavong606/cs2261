#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
void startState();
void goToStart();
void gameState();
void goToGame();
void winState();
void goToWin();
void loseState();
void goToLose();

// States
enum {START, GAME, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {
            case START:
                startState();
                break;
            case GAME:
                gameState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
            default:
                break;

        }

    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    seed = 0;
    goToStart();

}

void startState() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
        srand(seed);
    }
}

void goToStart() {
    fillScreen(WHITE);
    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (applesCaught == APPLECOUNT) {
        goToWin();
    } else if (applesRemaining == 0 && applesCaught != APPLECOUNT) {
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToLose();
    }
}

void goToGame() {
    fillScreen(YELLOW);
    state = GAME;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    state = WIN;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(GRAY);
    state = LOSE;
}
