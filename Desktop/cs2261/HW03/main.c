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
void pauseState();
void goToPause();
void winState();
void goToWin();
void loseState();
void goToLose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random seed
int seed;

int main() {

    initialize();

    while(1) {

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
            case PAUSE:
                pauseState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
            default:
                break;
        }
    }
}

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
    fillScreen(CYAN);
    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    if (lives == 0 || BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}

void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}

void goToPause() {
    fillScreen(YELLOW);
    state = PAUSE;
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
    fillScreen(RED);
    state = LOSE;
}

