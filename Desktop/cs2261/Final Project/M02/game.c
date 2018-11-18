#include <stdlib.h>
#include "myLib.h"
#include "spriteSheet2.h"
// #include "spatula.h"
#include "game.h"

OBJ_ATTR shadowOAM[128];
PLAYER player;
FOOD food[FOODCOUNT];
LIVES lives[3];

void initGame() {
    initPlayer();

    initFood();
}

void updateGame() {
    updatePlayer();

    for (int i = 0; i < FOODCOUNT; i++) {
        updateFood(&food[i]);
    }


}

void drawGame() {
    drawPlayer();

    drawFood();

    waitForVBlank();
    DMANow(3, &shadowOAM, OAM, 128 * 4);
}

void initPlayer() {
    player.row = 20;
    player.col = 100;
    player.width = 16;
    player.height = 16;
    player.rdel = 2;
    player.cdel = 2;
    player.aniState = 0;
    player.prevAniState = 0;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.livesLeft = 3;
    player.isSwat = 0;
}

void drawPlayer() {
    shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player.col) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame, player.aniState);

}

void updatePlayer() {
    if(BUTTON_HELD(BUTTON_UP) && player.row >= player.rdel) {
        player.row -= player.rdel;
    }
    if(BUTTON_HELD(BUTTON_DOWN)
        && player.row + player.height - 1 < SCREENHEIGHT) {
        player.row += player.rdel;
    }
    if(BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel) {
        player.col -= player.cdel;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
        player.col += player.cdel;
    }

    if(BUTTON_PRESSED(BUTTON_A)) {
        swat();
    }

    player.aniCounter++;

}

void swat() {
    // player.aniCounter = 0;
    player.isSwat = 1;


    // if (player.aniState != 0) {
    //     player.prevAniState = player.aniState;
    // }
    // player.aniState = 0;


        // Change the animation frame every 20 frames of gameplay
    if (player.aniCounter < 30) {
        // TODO 4.2: Change the frame here
        //           Remember that there are only numFrames number of frames
        if (player.curFrame < player.numFrames - 1) {
            player.curFrame = player.aniCounter/10;
            player.aniCounter++;
        } else {
            player.isSwat = 0;
        }

    }

    // TODO 4.7: If the player aniState is idle (thus no key is held),
        //           we want the frame to be player standing (frame 0)
        //           in whatever direction player was facing (set aniState to prevAniState)
        //           Else, if player aniState is not idle, we want to increment aniCounter
    if (player.aniState == 0) {
        player.curFrame = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }

    if (player.aniState == 0) {
        player.curFrame = 0;
    }

}

void initFood() {
    int colNum = 12;
    for (int i = 0; i < FOODCOUNT; i++) {
        food[i].row = 140;
        food[i].col = colNum;
        food[i].width = 16;
        food[i].height = 16;
        food[i].rdel = 1;
        food[i].active = 1;
        food[i].erased = 0;
        food[i].collided = 0;
        food[i].aniState = 4;
        food[i].prevAniState = 0;
        food[i].aniCounter = 0;
        food[i].curFrame = 0;
        food[i].numFrames = 2;

        colNum = colNum + 20;
    }
}

void updateFood(FOOD* f) {
    if (f->active) {

        // food moves up
        f->row -= f->rdel;

        // checks for collision with food, if swatting, then food moves down
        if(collision(player.row, player.col, player.height, player.width,
            f->row, f->col, f->height, f->width) && !f->collided) {
            if (player.isSwat == 1) {
                f->collided = 1;
                f->rdel = -1;
            } else {
                f->active = 0;
                f->erased = 1;
                f->collided = 1;
                player.livesLeft--;
                f->rdel = -1;
            }

        }

    }

    if (f->row < -(f->height) || f->row > SCREENHEIGHT) {
        f->row = 140;
        f->collided = 0;
        f->rdel = 1;
    }

}

void drawFood() {
    for (int i = 0; i < FOODCOUNT; i++) {
        if (food[i].active == 1) {
            shadowOAM[i + 1].attr0 = (ROWMASK & food[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & food[i].col) | ATTR1_SMALL;
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(food[i].curFrame, food[i].aniState);
        }

    }

}

