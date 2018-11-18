# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[208];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 3 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[448];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 4 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[864];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 5 "main.c" 2
# 1 "spriteSheet.h" 1
# 21 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetPal[256];
# 6 "main.c" 2
# 1 "titleScreen.h" 1
# 22 "titleScreen.h"
extern const unsigned short titleScreenTiles[2160];


extern const unsigned short titleScreenMap[1024];


extern const unsigned short titleScreenPal[256];
# 7 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[560];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 8 "main.c" 2



void initialize();
void goToStart();
void startState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToWin();
void winState();
void goToLose();
void loseState();


unsigned short buttons;
unsigned short oldButtons;


enum {START, GAME, PAUSE, WIN, LOSE};
int state;

OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {
            case START:
                startState();
                break;
            case GAME:
                gameState();
                break;
            case PAUSE:
                pauseState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
            default:
                break;
        }

    }

    return 0;
}

void initialize() {

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (3<<14) | (0<<7) | ((0)<<2) | ((28)<<8);

    state = 0;


    DMANow(3, titleScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, titleScreenTiles, &((charblock *)0x6000000)[0], 4320 / 2);
    DMANow(3, titleScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);


    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);


    hideSprites();
    buttons = (*(volatile unsigned short *)0x04000130);

    goToStart();

}


void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    state = START;

}

void startState() {

    waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
}

void goToGame() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 416 / 2);
    DMANow(3, backgroundMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    initGame();
    state = GAME;

}

void gameState() {

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }


    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToWin();
    }


    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        goToLose();
    }

}

void goToPause() {
    hideSprites();
    waitForVBlank();

    state = PAUSE;
}

void pauseState() {

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 1728 / 2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }

}

void goToWin() {
    hideSprites();
    waitForVBlank();

    state = WIN;

}

void winState() {

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, winScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winScreenTiles, &((charblock *)0x6000000)[0], 1120 / 2);
    DMANow(3, winScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

}

void goToLose() {
    hideSprites();
    waitForVBlank();

    state = LOSE;

}

void loseState() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    DMANow(3, loseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseScreenTiles, &((charblock *)0x6000000)[0], 896 / 2);
    DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

}
