// GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))

#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0,150,0)
#define BLUE COLOR(0, 0, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)
#define GOLD COLOR(255,215,0)
#define BROWN COLOR(140,70,70)
#define ORANGE COLOR(255, 140,0)

// Function Prototypes
void setPixel(int x, int y, unsigned short color);
void delay(int time);
void waitForVBlank();
void fillScreen(unsigned short color);
