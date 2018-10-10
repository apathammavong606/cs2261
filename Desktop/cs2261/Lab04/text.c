#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location
void drawChar(int row, int col, char ch, unsigned short color) {

    // TODO 1.0: Complete this function
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[(48 * ch) + (i * 6) + j] == 1) {
                setPixel((row + i), (col + j) , color);
            }
        }
    }

}

// Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {

    // TODO 2.0: Complete this function
    while(*str) {
        if (*str != '\0') {
                drawChar(row, col, *str, color);
                *str++;
                col = col + 6;
        }
    }


}