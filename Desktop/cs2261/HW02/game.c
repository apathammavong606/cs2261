#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables

PLAYER player;
APPLE apples[APPLECOUNT];
int applesRemaining;
int applesCaught;

// Initialize the game
void initGame() {

	initPlayer();
	initApples();
	applesRemaining = APPLECOUNT;
	applesCaught = 0;

}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the apples
	for (int i = 0; i < APPLECOUNT; i++) {
		updateApple(&apples[i]);
	}

}

// Draws the game each frame
void drawGame() {

	drawPlayer();
	waitForVBlank();
	// use waitforvblank because too much drawing and lower frame rate is needed

	// Draw all the apples
	for (int i = 0; i < APPLECOUNT; i++) {
		drawApple(&apples[i]);
	}

}


// // Initialize the player
void initPlayer() {

	player.row = 140;
	player.col = 118;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 1;
	player.height = 60;
	player.width = 40;
	player.color = BROWN;

}

// // Handle every-frame actions of the player
void updatePlayer() {

// 	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= player.cdel) {

		player.col -= player.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

		player.col += player.cdel;

	}

}

// Draw the player
void drawPlayer() {

	drawRect(player.oldRow, player.oldCol, player.height, player.width, YELLOW);
	drawRect(player.row, player.col, player.height, player.width, player.color);

	player.oldRow = player.row;
	player.oldCol = player.col;
}


// Initialize the apples
void initApples() {

	for (int i = 0; i < APPLECOUNT; i++) {

		apples[i].height = 10;
		apples[i].width = 10;
		apples[i].row = rand() % 110;
		apples[i].col = rand() % 130 + 10;
		apples[i].oldRow = apples[i].row;
		apples[i].oldCol = apples[i].col;
		apples[i].rdel = 1;
		apples[i].cdel = 1;
		apples[i].color = RED;
		apples[i].active = 1;
		apples[i].erased = 0;
	}
}

// Handle every-frame actions of a APPLE
void updateApple(APPLE* b) {
	if (b->active) {

		// Move the APPLE
		b->row += b->rdel;
		// if (b->row > 160) {
		// 	b->row = 0;
		// 	b->col = rand() % 240 + 10;
		// }

		// Handle APPLE-basket collisions
				if (collision(player.row, player.col, player.height,
						player.width, b->row, b->col, b->height, b->width)) {
					b->active = 0;
					applesRemaining--;
					applesCaught++;
					b->erased = 0;
				}
				// if row is above 160, set row to zero then call (rand() % 240)
				if (b->row > 160) {
					b->row = 0;
					b->col = rand() % 130 + 10;
				}

	}
}

// Draw a APPLE
void drawApple(APPLE* b) {

	if(b->active) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, YELLOW);
		drawRect(b->row, b->col, b->height, b->width, b->color);
	} else if (!b->erased) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, YELLOW);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}