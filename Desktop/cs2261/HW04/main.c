#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "text.h"

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

// Text Buffer
char buffer[41];

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
    fillScreen(GRAY);
    drawString(40,60,"WELCOME TO ASTEROIDS!", WHITE);
    drawString(120,62,"Press Start to Begin", WHITE);
    state = START;
    seed = 0;
}

void gameState() {
    updateGame();
    sprintf(buffer,"%u", ballsRemaining);
    waitForVBlank();
    drawGame();
    drawRect(145,131,12,16,BLACK);
    drawString(145,130,buffer,WHITE);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if ((ballsRemaining == 0 && lives > 0) || BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }
    if (lives == 0 || BUTTON_PRESSED(BUTTON_B) || (ballsRemaining > 0 && lives == 1 && bulletsRemaining == 0)) {
        goToLose();
    }
}

void goToGame() {
    fillScreen(BLACK);
    drawString(145,5,"Asteroids Remaining:", WHITE);
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
    drawString(60,80,"GAME IS PAUSED", BLACK);
    state = PAUSE;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    drawString(70,90,"YOU WIN :)", BLACK);
    state = WIN;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    drawString(70,90,"YOU LOSE :(", BLACK);
    state = LOSE;
}

