#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
int ballsRemaining;
int bulletsRemaining;
int lives;

// Initialize the game
void initGame() {

    initPlayer();

    initBullets();

    initBalls();
    ballsRemaining = BALLCOUNT;
    bulletsRemaining = BULLETCOUNT;
    lives = 1;
}

// Updates the game each frame
void updateGame() {

    updatePlayer();

    // Update all the bullets
    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullets[i]);
    }


    for (int i = 0; i < BALLCOUNT; i++) {
        updateBall(&balls[i]);
    }


}

// Draws the game each frame
void drawGame() {

    drawPlayer();

    for (int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }


    for (int i = 0; i < BALLCOUNT; i++) {
        drawBall(&balls[i]);
    }

}

// // Initialize the player
void initPlayer() {

    player.row = 130;
    player.col = 120;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.cdel = 1;
    player.rdel = 1;
    player.height = 10;
    player.width = 10;
    player.color = RED;
    player.bulletTimer = 20;

}

// Handle every-frame actions of the player
void updatePlayer() {

// Move the player
    if (BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;

    } else if (BUTTON_HELD(BUTTON_UP) && player.row >= player.rdel) {

        player.row -= player.rdel;

    } else if (BUTTON_HELD(BUTTON_DOWN)
        && player.row + player.height - 1 < 145 - player.rdel) {

        player.row += player.rdel;
    }

    // Fire bullets
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {

        fireBullet();
        player.bulletTimer = 0;
    }

    player.bulletTimer++;

}

// Draw the player
void drawPlayer() {

    drawRect(player.oldRow, player.oldCol, player.height, player.width, BLACK);
    drawRect(player.row, player.col, player.height, player.width, player.color);

    player.oldRow = player.row;
    player.oldCol = player.col;
}

// Initialize the pool of bullets
void initBullets() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].height = 2;
        bullets[i].width = 1;
        bullets[i].row = bullets[i].height * -1;
        bullets[i].col = 0;
        bullets[i].oldRow = player.row;
        bullets[i].oldCol = player.col;
        bullets[i].rdel = -2;
        bullets[i].color = WHITE;
        bullets[i].active = 0;
    }

}

// Spawn a bullet
void fireBullet() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active == 0) {
            bullets[i].oldRow = bullets[i].row;
            bullets[i].row = player.row;
            bullets[i].oldCol = bullets[i].col;
            bullets[i].col = player.col + (player.width / 2)
                + (bullets[i].width / 2);
            bullets[i].active = 1;
            bullets[i].erased = 0;
            break;
        }
    }


}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

    if (b->active) {
        b->oldRow = b->row;
        b->row = b->row + b->rdel;
        b->oldCol = b->col;
        drawBullet(b);
        if (b->row > 240 || b->col > 160) {
            b->active = 1;
        }
    }

}

// Draw a bullet
void drawBullet(BULLET* b) {

    if(b->active) {
        drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
        drawRect(b->row, b->col, b->height, b->width, b->color);
    } else if (!b->erased) {
        drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
        b->erased = 1;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}

// Initialize the balls
void initBalls() {

    for (int i = 0; i < BALLCOUNT; i++) {

        balls[i].height = 10;
        balls[i].width = 10;
        balls[i].row = rand() % 110;
        balls[i].col = rand() % 130 + 10;
        balls[i].oldRow = balls[i].row;
        balls[i].oldCol = balls[i].col;
        balls[i].rdel = 1;
        balls[i].cdel = 1;
        balls[i].color = GRAY;
        balls[i].active = 1;
        balls[i].erased = 0;
    }
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

    if (b->active) {

        // Bounce the ball off the sides of the box
        if (b->row <= 0 || b->row + b->height-1 >= 145 - 1)
            b->rdel *= -1;
        if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH - 1)
            b->cdel *= -1;

        // Move the ball
        b->row += b->rdel;
        b->col += b->cdel;

        // Handle ball-bullet collisions
        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active == 1) {
                if (collision(bullets[i].row, bullets[i].col, bullets[i].height,
                        bullets[i].width, b->row, b->col, b->height, b->width)) {
                    bullets[i].active = 0;
                    b->active = 0;
                    ballsRemaining--;
                }
            }
        }

        if (collision(player.row, player.col, player.height, player.width,
                b->row, b->col, b->height, b->width)) {
            lives--;
        }

    }
}

// Draw a ball
void drawBall(BALL* b) {

    if(b->active) {
        drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
        drawRect(b->row, b->col, b->height, b->width, b->color);
    } else if (!b->erased) {
        drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
        b->erased = 1;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}