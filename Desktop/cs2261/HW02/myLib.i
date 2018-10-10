# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1

typedef unsigned short u16;
# 22 "myLib.h"
extern unsigned short *videoBuffer;
# 36 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 62 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 73 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "myLib.c" 2
# 1 "game.h" 1

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int cdel;
 int height;
 int width;
 unsigned short color;
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
 unsigned short color;
 int active;
 int erased;
} APPLE;





extern PLAYER player;
extern APPLE balls[10];
extern int applesRemaining;
extern int applesCaught;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initApples();
void updateApple(APPLE *);
void drawApple(APPLE *);
# 3 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

 for(int r = 0; r < height; r++) {
        for (int c = 0; c < width; c++) {
            setPixel(row+r, col+c, color);
        }
 }
}

void fillScreen(unsigned short color) {

 for(int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
