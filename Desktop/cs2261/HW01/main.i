# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1
# 26 "myLib.h"
void setPixel(int x, int y, unsigned short color);
void delay(int time);
void waitForVBlank();
void fillScreen(unsigned short color);
# 2 "main.c" 2




void initialize();
void update();

void initialize() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    fillScreen(((31) | (31)<<5 | (31)<<10));

}


void update() {
    for (int i = 0; i < 130; i++) {
        for (int j = 0; j < 100; j++) {
            setPixel(20 + i, 70 + j, ((31) | (31)<<5 | (31)<<10));
        }
    }
}


int main() {

    initialize();


     while(1) {

        delay(300);
        waitForVBlank();
        update();
        drawCherries(50,90);

        delay(300);
        waitForVBlank();
        update();
        drawPineapple(50,90);

        delay(300);
        waitForVBlank();
        update();
        drawOrange(50,90);

     }

     return 0;
}
