#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

DMA *dma = (DMA *)0x40000B0;

void setPixel(int row, int col, unsigned short color) {

    videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

    // for(int r = 0; r < height; r++) {
    //     for (int c = 0; c < width; c++) {
    //         setPixel(row+r, col+c, color);
    //     }
    // }
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row + i, col, SCREENWIDTH)],
            width | DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT);
    }
}

void fillScreen(unsigned short color) {

    // for(int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
    //     videoBuffer[i] = color;
    // }
    volatile unsigned short c = color;
    DMANow(3, &c, videoBuffer, 38400 | DMA_SOURCE_FIXED
        | DMA_DESTINATION_INCREMENT);
}

void waitForVBlank() {

    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;

}