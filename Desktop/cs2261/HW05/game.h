// Player Struct
typedef struct {
	int row;
	int col;
    int rowChanged;
	int cdel;
	int rdel;
	int height;
	int width;
} PLAYER;

// Ball Struct
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

// Constants
#define DISHCOUNT 15

// Variables
extern PLAYER player;
extern DISH dishes[DISHCOUNT];
extern int dishesRemaining;
extern int dishStack;
extern int loseDish;

// Custom Game Colors
#define NUMCOLORS 6
// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initDishes();
void updateDish(DISH *);
void drawDish(DISH *);