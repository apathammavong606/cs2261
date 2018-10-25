# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar4(int row, int col, char ch, unsigned char colorIndex);
void drawString4(int row, int col, char *str, unsigned char colorIndex);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2
# 18 "text.c"
void drawChar4(int row, int col, char ch, unsigned char colorIndex) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + ((r)*(6)+(c))]) {
                setPixel4(row+r, col+c, colorIndex);
            }
        }
    }
}
# 44 "text.c"
void drawString4(int row, int col, char *str, unsigned char colorIndex) {


    while(*str != '\0') {

        drawChar4(row, col, *str, colorIndex);
        col += 6;


        str++;
    }
}
