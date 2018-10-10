#include "myLib.h"



//Prototypes
void initialize();
void update();

void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    fillScreen(WHITE);

}


void update() {
    for (int i = 0; i < 130; i++) {
        for (int j = 0; j < 100; j++) {
            setPixel(20 + i, 70 + j, WHITE);
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