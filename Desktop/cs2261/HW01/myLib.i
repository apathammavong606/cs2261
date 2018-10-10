# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 26 "myLib.h"
void setPixel(int x, int y, unsigned short color);
void delay(int time);
void waitForVBlank();
void fillScreen(unsigned short color);
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

    videoBuffer[((row)*(240)+(col))] = color;
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240*160; i++){
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

void delay(int amount) {
    volatile int trash = 0;
    for (int i = 0; i < amount*1000; i++) {
        trash++;
    }
}

void drawPineapple(int x, int y) {



    for (int i = 0; i < 91; i++) {
        for (int j = 0; j < 61; j++) {
            setPixel(x + i, y + j, ((255) | (215)<<5 | (0)<<10));
        }

    }

    for (int i = 0; i < 71; i++) {
        for (int j = 0; j < 81; j++) {
            setPixel(60 + i, 80 + j, ((255) | (215)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 11; i++) {
        setPixel(50 + i, 90 - i, ((255) | (215)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 50; j < 60; j++) {
            setPixel(j + i, 90 - i, ((255) | (215)<<5 | (0)<<10));
        }
    }



    for (int i = 0; i < 11; i++) {
        setPixel(50 + i, 150 + i, ((255) | (215)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 50; j < 60; j++) {
            setPixel(j + i, 150 + i, ((255) | (215)<<5 | (0)<<10));
        }
    }



    for (int i = 0; i < 11; i++) {
        setPixel(130 + i, 160 - i, ((255) | (215)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 120; j < 130; j++) {
            setPixel(j + i, 160 - i, ((255) | (215)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 11; i++) {
        setPixel(130 + i, 80 + i, ((255) | (215)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 120; j < 130; j++) {
            setPixel(j + i, 80 + i, ((255) | (215)<<5 | (0)<<10));
        }
    }






    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 61; j++)
        setPixel(39 + i, 90 + j, ((0) | (150)<<5 | (0)<<10));
    }

    for (int i = 0; i < 11; i++) {
        setPixel(39 + i, 80 + i, ((0) | (150)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 160 - i, ((0) | (150)<<5 | (0)<<10));
        }
    }

    for (int i = 0; i < 11; i++) {
        setPixel(39 + i, 160 - i, ((0) | (150)<<5 | (0)<<10));
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 80 + i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 99 - i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 100 + i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 119 - i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 120 + i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 30; j < 41; j++) {
            setPixel(j + i, 139 - i, ((0) | (150)<<5 | (0)<<10));
        }
    }
    for (int i = 9; i > -1; i--) {
        for (int j = 29; j < 40; j++) {
            setPixel(j + i, 140 + i, ((0) | (150)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(60 + i, 145 + j, ((31) | (31)<<5 | (31)<<10));
        }
    }

    for (int i = 0; i < 12; i++) {
        setPixel(68 + i, 146, ((31) | (31)<<5 | (31)<<10));
    }


}

void drawCherries(int x, int y) {


    for (int i = 0; i < 61; i++) {
        setPixel(x, y + i, ((140) | (70)<<5 | (70)<<10));
    }

    for (int i = 0; i < 31; i++) {
        setPixel(50 + i, 120 - i, ((140) | (70)<<5 | (70)<<10));
    }

    for (int i = 0; i < 31; i++) {
        setPixel(50 + i, 120 + i, ((140) | (70)<<5 | (70)<<10));
    }


    for (int i = 0; i < 21; i++) {
        for (int j = 0; j < 21; j++) {
            setPixel(80 + i, 80 + j, ((31) | (0)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(82 + i, 95 + j, ((31) | (31)<<5 | (31)<<10));
        }
    }

    for (int i = 0; i < 7; i++) {
        setPixel(87 + i, 97, ((31) | (31)<<5 | (31)<<10));
    }


    for (int i = 0; i < 21; i++) {
        for (int j = 0; j < 21; j++) {
            setPixel(80 + i, 140 + j, ((31) | (0)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(82 + i, 155 + j, ((31) | (31)<<5 | (31)<<10));
        }
    }

    for (int i = 0; i < 7; i++) {
        setPixel(87 + i, 157, ((31) | (31)<<5 | (31)<<10));
    }

}

void drawOrange(int x, int y) {
    for (int i = 0; i < 61; i++) {
        for (int j = 0; j < 61; j++) {
            setPixel(x + i, y + j, ((255) | (140)<<5 | (0)<<10));
        }
    }


    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            setPixel(60 + i, 140 + j, ((31) | (31)<<5 | (31)<<10));
        }
    }

    for (int i = 0; i < 12; i++) {
        setPixel(70 + i, 142, ((31) | (31)<<5 | (31)<<10));
    }
}
