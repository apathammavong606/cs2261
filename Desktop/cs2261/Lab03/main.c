#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
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

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        // TODO 1.0: Make the state machine here
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

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    seed = 0;
    goToStart();

}

// TODO 1.1: Make your state and state transition functions
void startState() {
    seed++;
    initGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
    }
}

void goToStart() {
    fillScreen(CYAN);
    state = START;
}

void gameState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // else if (BUTTON_PRESSED(BUTTON_A)) {
    //     goToWin();
    // }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
    if (ballsRemaining == 0) {
        goToWin();
    }
    updateGame();
    waitForVBlank();
    drawGame();
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
    fillScreen(GRAY);
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