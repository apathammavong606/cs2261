#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "mama.h"


// Variables
PLAYER player;
DISH dishes[DISHCOUNT];
int dishesRemaining;
int dishStack;
int loseDish;

// Initialize the game
void initGame() {

	initPlayer();
    initDishes();

    // Initialize the score
	dishesRemaining = DISHCOUNT;
    dishStack = 0;
    loseDish = 0;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    DMANow(3, mamaPal, PALETTE, 256);


    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the dishes
	for (int i = 0; i < DISHCOUNT; i++)
		updateDish(&dishes[i]);
}

// Draws the game each frame
void drawGame() {

    fillScreen4(WHITEID);

	drawPlayer();

	// Draw all the dishes
	for (int i = 0; i < DISHCOUNT; i++)
		drawDish(&dishes[i]);
}


// Initialize the player
void initPlayer() {

	player.row = 120;
    player.rowChanged = player.row;
	player.col = 118;
	player.cdel = 2;
	player.rdel = 2;
	player.height = 30;
	player.width = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {

	if (BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel + 9) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < 235 - player.cdel) {

        player.col += player.cdel;

    }
}

// Draw the player
void drawPlayer() {

    drawImage4(player.row, player.col, player.height, player.width, mamaBitmap);
}

// Initialize the dishes
void initDishes() {

	for (int i = 0; i < DISHCOUNT; i++) {

		dishes[i].height = 3;
		dishes[i].width = 30;
		dishes[i].row = rand() % 110;
		dishes[i].col = rand() % 130 + 10;
        dishes[i].oldRow = dishes[i].row;
        dishes[i].oldCol = dishes[i].col;
		dishes[i].rdel = 1;
		dishes[i].cdel = 1;
        dishes[i].color = BLUEID;
        dishes[i].isDiff = i & 1; // Makes only i=1
		dishes[i].active = 1;
        dishes[i].erased = 0;
	}
}

// Handle every-frame actions of a dish
void updateDish(DISH* d) {

	if (d->active) {

        // moves the dish down the screen
		d->row += d->rdel;

        // if player collides with dish
        if (collision(player.rowChanged, player.col, player.height, player.width, d->row, d->col, d->height, d->width)) {
            // if dish is red then lose game
            if (d->isDiff) {
                loseDish++;
            }
            d->active = 0;
            d->erased = 0;
            if (dishStack != 0) {
                player.rowChanged = player.rowChanged - d->height;
            }
            dishesRemaining--;
            dishStack++;

        }

        if (d->row > 160) {
            d->row = 0;
            d->col = rand() % 180 + 10;
        }
	}
}

// Draw a dish
void drawDish(DISH* d) {

	if(d->active) {
		if (d->isDiff)
			drawRect4(d->row, d->col, d->height, d->width, REDID);
		else
			drawRect4(d->row, d->col, d->height, d->width, d->color);
	}
    // not active and stacked
    if (dishStack == 1) {
        drawRect4(player.row - 2, player.col - 7, d->height, d->width, GREENID);
    } else if (dishStack > 1) {
        drawRect4(player.row - 2, player.col - 7, d->height, d->width, GREENID);
        drawRect4(player.row - (d->height * dishStack), player.col - 7, d->height * dishStack, d->width, GREENID);
    }

    d->oldRow = d->row;
    d->oldCol = d->col;

}