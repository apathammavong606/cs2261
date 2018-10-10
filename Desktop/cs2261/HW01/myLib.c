#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

    videoBuffer[OFFSET(row, col, 240)] = color;
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240*160; i++){
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

void delay(int amount) {
    volatile int trash = 0;
    for (int i = 0; i < amount*1000; i++) {
        trash++;
    }
}

void drawPineapple(int x, int y) {

    //Fruit
    //
    for (int i = 0; i < 91; i++) {
        for (int j = 0; j < 61; j++) {
            setPixel(x + i, y + j, GOLD);
        }

    }

    for (int i = 0; i < 71; i++) {
        for (int j = 0; j < 81; j++) {
            setPixel(60 + i, 80 + j, GOLD);
        }
    }


    for (int i = 0; i < 11; i++) {
        setPixel(50 + i, 90 - i, GOLD);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 50; j < 60; j++) {
            setPixel(j + i, 90 - i, GOLD);
        }
    }



    for (int i = 0; i < 11; i++) {
        setPixel(50 + i, 150 + i, GOLD);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 50; j < 60; j++) {
            setPixel(j + i, 150 + i, GOLD);
        }
    }



    for (int i = 0; i < 11; i++) {
        setPixel(130 + i, 160 - i, GOLD);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 120; j < 130; j++) {
            setPixel(j + i, 160 - i, GOLD);
        }
    }


    for (int i = 0; i < 11; i++) {
        setPixel(130 + i, 80 + i, GOLD);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 120; j < 130; j++) {
            setPixel(j + i, 80 + i, GOLD);
        }
    }


    //Leaves
    // for (int i = 0; i < 81; i++) {
    //     setPixel(39, 80 + i, GREEN);
    // }
    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 61; j++)
        setPixel(39 + i, 90 + j, GREEN);
    }

    for (int i = 0; i < 11; i++) {
        setPixel(39 + i, 80 + i, GREEN);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 160 - i, GREEN);
        }
    }

    for (int i = 0; i < 11; i++) {
        setPixel(39 + i, 160 - i, GREEN);
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 80 + i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 99 - i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 100 + i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 119 - i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 120 + i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 139 - i, GREEN);
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 140 + i, GREEN);
        }
    }

    //shine
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(60 + i, 145 + j, WHITE);
        }
    }

    for (int i = 0; i < 12; i++) {
        setPixel(68 + i, 146, WHITE);
    }


}

void drawCherries(int x, int y) {

    //stem
    for (int i = 0; i < 61; i++) {
        setPixel(x, y + i, BROWN);
    }

    for (int i = 0; i < 31; i++) {
        setPixel(50 + i, 120 - i, BROWN);
    }

    for (int i = 0; i < 31; i++) {
        setPixel(50 + i, 120 + i, BROWN);
    }

    //cherry #1
    for (int i = 0; i < 21; i++) {
        for (int j = 0; j < 21; j++) {
            setPixel(80 + i, 80 + j, RED);
        }
    }

    //shine #1
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(82 + i, 95 + j, WHITE);
        }
    }

    for (int i = 0; i < 7; i++) {
        setPixel(87 + i, 97, WHITE);
    }

    //cherry #2
    for (int i = 0; i < 21; i++) {
        for (int j = 0; j < 21; j++) {
            setPixel(80 + i, 140 + j, RED);
        }
    }

    //shine #2
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(82 + i, 155 + j, WHITE);
        }
    }

    for (int i = 0; i < 7; i++) {
        setPixel(87 + i, 157, WHITE);
    }

}

void drawOrange(int x, int y) {
    for (int i = 0; i < 61; i++) {
        for (int j = 0; j < 61; j++) {
            setPixel(x + i, y + j, ORANGE);
        }
    }

    //shine
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(60 + i, 140 + j, WHITE);
        }
    }

    for (int i = 0; i < 12; i++) {
        setPixel(70 + i, 142, WHITE);
    }
}


