#include <stdlib.h>
#include "myLib.h"
#include "spriteSheet.h"
#include "game.h"

// Variables
ANISPRITE player;
ENEMY enemies[ENEMYCOUNT];
BULLET bullets[BULLETCOUNT];
LIFE lives[3];
int livesLeft;
int enemiesRemaining;


// Initialize game
void initGame() {

    initPlayer();
    initEnemies();
    initBullets();
    initLives();

    hideSprites();

    livesLeft = 3;
    enemiesRemaining = ENEMYCOUNT;
}

void updateGame() {
    updatePlayer();

    // for (int i = 0; i < BULLETCOUNT; i++) {
    //     updateBullet(&bullets[i]);
    // }

    // for (int i = 0; i < ENEMYCOUNT; i++) {
    //     updateEnemy(&enemies[i]);
    // }
}

void drawGame() {
    drawPlayer();

    // for(int i = 0; i < BULLETCOUNT; i++) {
    //     drawBullet(&bullets[i]);
    // }
}

void initPlayer() {

    player.row = 130;
    player.col = (rand() % 40) + 80;
    player.rdel = 0;
    player.cdel = 2;
    player.width = 16;
    player.height = 16;
    player.active = 1;
    player.aniCounter = 0;
    player.aniState = 20;
    player.prevAniState = 0;
    player.curFrame = 0;
    player.numFrames = 0;

}

void updatePlayer() {
    if(BUTTON_HELD(BUTTON_LEFT) && player.col >= 32) {
        player.col -= player.cdel;
    }

    if(BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width - 1 < 208) {
        player.col += player.cdel;
    }

    if(BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {
        fireBullet(2);
        player.bulletTimer = 0;
    }

    player.bulletTimer++;

    // bullet collisions
    for (int i= 0; i < BULLETCOUNT; i++){
        if (bullets[i].active && collision(player.row, player.col, player.height, player.width,
                bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

                bullets[i].active = 0;
                bullets[i].erased = 1;
                livesLeft--;
                break;
        }
    }

}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame, player.aniState);

}

void initEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++){
        if (i == 0){
            enemies[i].row = 5;
            enemies[i].col = 33;
        }
        else {
            enemies[i].col = enemies[i-1].col + 20;
            if (i % 5 == 0){
                enemies[i].row =  enemies[i-1].row + 16;
                enemies[i].col = 33;
            } else {
                enemies[i].row = enemies[i-1].row;
            }
        }

        if (enemies[i].row == 5){
            enemies[i].aniState = 0;
            enemies[i].otherState = 1;
        }

        if (enemies[i].row == 20){
            enemies[i].aniState = 2;
            enemies[i].otherState = 3;
        }

        if (enemies[i].row == 35){
            enemies[i].aniState = 4;
            enemies[i].otherState = 5;
        }

        if (enemies[i].row == 50) {
            enemies[i].aniState = 6;
            enemies[i].otherState = 7;
        }

        if (enemies[i].row == 65){
            enemies[i].aniState = 8;
            enemies[i].otherState = 9;
        }

        enemies[i].height = 16;
        enemies[i].width = 16;
        enemies[i].active = 1;
        enemies[i].enemyNumber = 20;
        enemies[i].aniCounter = 0;
        enemies[i].curFrame = 0;
        enemies[i].numFrames = 3;
        enemies[i].direction = 1;
        enemies[i].prevAniState = enemies[i].aniState;
    }
}

void updateEnemy() {

}

void updateEnemyEach(ENEMY *e) {

}



void drawEnemy() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if (enemies[i].active) {
            shadowOAM[0].attr0 = enemies[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[0].attr1 = enemies[i].col | ATTR1_SMALL;
            shadowOAM[0].attr2 = ATTR2_TILEID(2 * enemies[i].curFrame, 2 * enemies[i].aniState);
        } else {
            shadowOAM[i + 1].attr1 = ATTR1_SMALL | enemies[i].col;
        }

    }

}

void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++){
        bullets[i].height = 8;
        bullets[i].width = 8;
        bullets[i].row = enemies[i].row;
        bullets[i].col = 0;
        bullets[i].oldRow = bullets[i].row;
        bullets[i].oldCol = bullets[i].col;
        bullets[i].rdel = -2;
        bullets[i].direction = 1;
        bullets[i].active = 0;
        bullets[i].aniState = 24;
        bullets[i].aniCounter = 0;
    }

}

void fireBullet(int j) {


}

void updateBullet() {


}

void drawBullet() {


}

void initLives() {


}

void updateLives() {

}

void drawLives() {


}
