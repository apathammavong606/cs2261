// Player Struct
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


// APPLE Struct
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

// Constants
#define APPLECOUNT 10

// Variables
extern PLAYER player;
extern APPLE balls[APPLECOUNT];
extern int applesRemaining;
extern int applesCaught;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initApples();
void updateApple(APPLE *);
void drawApple(APPLE *);
