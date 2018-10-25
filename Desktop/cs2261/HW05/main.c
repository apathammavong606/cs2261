#include "myLib.h"
#include "text.h"
#include "game.h"
#include "titleScreen.h"
#include "mamaAngry.h"
#include "mamaHappy.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    // //TODO 3.6: Call DMANow to load in BillPal
    DMANow(3, titleScreenPal, PALETTE, 256);

    // // UNCOMMENT 3.0
    drawFullscreenImage4(titleScreenBitmap);

    //TODO 2.1: Wait for vertical blank and flip the page (you don't need to reload the palette)
    waitForVBlank();
    flipPage();


    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    // Update the score
    sprintf(buffer, "Dishes Made: %d", dishStack);
    drawString4(150, 20, buffer, BLACKID);

    sprintf(buffer, "Bad Dishes: %d", loseDish);
    drawString4(150, 130, buffer, BLACKID);

    waitForVBlank();
    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // else if (BUTTON_PRESSED(BUTTON_A)) {
    //     goToWin();
    // }
    else if (dishStack >= 8) {
        goToWin();
    }
    // else if (BUTTON_PRESSED(BUTTON_B)) {
    //     goToLose();
    // }
    else if (loseDish >= 3) {
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {

    fillScreen4(WHITEID);
    drawString4(77, 80, "Game is paused!", BLACKID);

    waitForVBlank();
    flipPage();



    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {

    DMANow(3, mamaHappyPal, PALETTE, 256);

    drawFullscreenImage4(mamaHappyBitmap);
    drawString4(100, 20, "You win!", BLACKID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

// Runs every frame of the win state
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {

    DMANow(3, mamaAngryPal, PALETTE, 256);

    drawFullscreenImage4(mamaAngryBitmap);
    drawString4(145, 7, "You lose!", BLACKID);

    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}