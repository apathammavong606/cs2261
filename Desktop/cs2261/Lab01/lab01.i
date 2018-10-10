# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);


unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);


    drawTriangle(50, 36);
    drawTriangle(100, 104);
    drawTriangle(6, 72);

    while(1);

    return 0;
}



void setPixel(int row, int col, unsigned short color) {


    videoBuffer[((row)*(240)+(col))] = color;
}

void drawTriangle(int row, int col) {




    for (int i = 0; i < 21; i++) {
        setPixel(row + i, col, ((31) | (31)<<5 | (31)<<10));
    }


    for (int i = 0; i < 21; i++) {
        setPixel(row + i, col + i, ((31) | (31)<<5 | (31)<<10));
    }


    for (int i = 0; i < 21; i++) {
        setPixel(row + 20, col + i, ((31) | (31)<<5 | (31)<<10));
    }


}
