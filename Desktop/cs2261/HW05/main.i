# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 27 "myLib.h"
extern unsigned short *videoBuffer;
# 47 "myLib.h"
void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
# 76 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 87 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 127 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "text.h" 1

void drawChar4(int row, int col, char ch, unsigned char colorIndex);
void drawString4(int row, int col, char *str, unsigned char colorIndex);
# 3 "main.c" 2
# 1 "game.h" 1

typedef struct {
 int row;
 int col;
    int rowChanged;
 int cdel;
 int rdel;
 int height;
 int width;
} PLAYER;


typedef struct {
 int row;
 int col;
    int oldRow;
    int oldCol;
 int rdel;
 int cdel;
 int height;
 int width;
    unsigned char color;
 int isDiff;
 int active;
    int erased;
} DISH;





extern PLAYER player;
extern DISH dishes[15];
extern int dishesRemaining;
extern int dishStack;
extern int loseDish;




enum {BLACKID=(256-6), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[6];


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initDishes();
void updateDish(DISH *);
void drawDish(DISH *);
# 4 "main.c" 2
# 1 "titleScreen.h" 1
# 21 "titleScreen.h"
extern const unsigned short titleScreenBitmap[19200];


extern const unsigned short titleScreenPal[256];
# 5 "main.c" 2
# 1 "mamaAngry.h" 1
# 21 "mamaAngry.h"
extern const unsigned short mamaAngryBitmap[19200];


extern const unsigned short mamaAngryPal[256];
# 6 "main.c" 2
# 1 "mamaHappy.h" 1
# 21 "mamaHappy.h"
extern const unsigned short mamaHappyBitmap[19200];


extern const unsigned short mamaHappyPal[256];
# 7 "main.c" 2


void initialize();


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


enum {START, GAME, PAUSE, WIN, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;


int seed;


char buffer[41];

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {

    (*(unsigned short *)0x4000000) = 4 | (1<<10) | (1<<4);


    goToStart();
}


void goToStart() {


    DMANow(3, titleScreenPal, ((unsigned short *)0x5000000), 256);


    drawFullscreenImage4(titleScreenBitmap);


    waitForVBlank();
    flipPage();


    state = START;


    seed = 0;
}


void start() {

    seed++;


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        srand(seed);

        goToGame();
        initGame();
    }
}


void goToGame() {

    state = GAME;
}


void game() {

    updateGame();
    drawGame();


    sprintf(buffer, "Dishes Made: %d", dishStack);
    drawString4(150, 20, buffer, BLACKID);

    sprintf(buffer, "Bad Dishes: %d", loseDish);
    drawString4(150, 130, buffer, BLACKID);

    waitForVBlank();
    flipPage();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }



    else if (dishStack >= 8) {
        goToWin();
    }



    else if (loseDish >= 3) {
        goToLose();
    }
}


void goToPause() {

    fillScreen4(WHITEID);
    drawString4(77, 80, "Game is paused!", BLACKID);

    waitForVBlank();
    flipPage();



    state = PAUSE;
}


void pause() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}


void goToWin() {

    DMANow(3, mamaHappyPal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(mamaHappyBitmap);
    drawString4(100, 20, "You win!", BLACKID);

    waitForVBlank();
    flipPage();

    state = WIN;
}


void win() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}


void goToLose() {

    DMANow(3, mamaAngryPal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(mamaAngryBitmap);
    drawString4(145, 7, "You lose!", BLACKID);

    waitForVBlank();
    flipPage();

    state = LOSE;
}


void lose() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}
