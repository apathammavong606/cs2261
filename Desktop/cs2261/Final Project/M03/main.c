#include "myLib.h"
#include "instructionsScreen.h"
#include "background.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "titleScreen.h"
#include "spriteSheet2.h"
#include "game.h"
// #include "spatula.h"
// #include "spriteSheet.h"
// #include "sprite.h"

// Prototypes
void initialize();
void goToInstructions();
void instructionsState();
void goToStart();
void startState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToWin();
void winState();
void goToLose();
void loseState();

// Buttons
unsigned short buttons;
unsigned short oldButtons;

// States
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

// OBJ_ATTR shadowOAM[128];

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
            case INSTRUCTIONS:
                instructionsState();
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

    return 0;
}

void initialize() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    state = 0;

    // load actual sprite palette
    // DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    // DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen / 2);


    // DMANow(3, spriteSheet2Pal, SPRITEPALETTE, 256);
    // DMANow(3, spriteSheet2Tiles, &CHARBLOCK[4], spriteSheet2TilesLen / 2);

    buttons = BUTTONS;

    goToStart();

}

void goToStart() {
    hideSprites();
    // DMANow(3, shadowOAM, OAM, 128*4);
    DMANow(3, titleScreenPal, PALETTE, 256);
    DMANow(3, titleScreenTiles, &CHARBLOCK[0], titleScreenTilesLen / 2);
    DMANow(3, titleScreenMap, &SCREENBLOCK[28], titleScreenMapLen / 2);
    waitForVBlank();


    state = START;
}

void startState() {

    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToInstructions() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
    DMANow(3, instructionsScreenPal, PALETTE, 256);
    DMANow(3, instructionsScreenTiles, &CHARBLOCK[0], instructionsScreenTilesLen / 2);
    DMANow(3, instructionsScreenMap, &SCREENBLOCK[28], instructionsScreenMapLen / 2);
    waitForVBlank();

    state = INSTRUCTIONS;
}

void instructionsState() {
    hideSprites();

    if(BUTTON_PRESSED(BUTTON_B)) {
        goToGame();
        initGame();
    }
}

void goToGame() {
    DMANow(3, backgroundPal, PALETTE, 256);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundMapLen / 2);

    DMANow(3, spriteSheet2Pal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheet2Tiles, &CHARBLOCK[4], spriteSheet2TilesLen / 2);

    hideSprites();


    state = GAME;

}

void gameState() {
    waitForVBlank();
    hideSprites();
    updateGame();
    drawGame();


    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
    }

    // livesLeft == 0
    if(player.livesLeft == 0) {
        goToLose();
    }

}

void goToPause() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen / 2);
    waitForVBlank();

    state = PAUSE;
}

void pauseState() {

    waitForVBlank();
    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}

void goToWin() {
    hideSprites();
    waitForVBlank();

    state = WIN;

}

void winState() {

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen / 2);
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}

void goToLose() {
    hideSprites();
    waitForVBlank();

    state = LOSE;

}

void loseState() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen / 2);
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}


