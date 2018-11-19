typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
    int cdel;
    int aniState;
    int prevAniState;
    int aniCounter;
    int curFrame;
    int numFrames;
    int livesLeft;
    int isSwat;

} PLAYER;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
    int active;
    int erased;
    int collided;
    int aniState;
    int prevAniState;
    int aniCounter;
    int curFrame;
    int numFrames;
} FOOD;

typedef struct {
    int row;
    int col;
    int aniState;
} LIVES;

#define FOODCOUNT 10

extern PLAYER player;
extern FOOD food[FOODCOUNT];
extern LIVES lives[3];
extern OBJ_ATTR shadowOAM[128];


void initGame();
void updateGame();
void drawGame();

// Lives
void drawLives();
void initLives();

// Player
void initPlayer();
void drawPlayer();
void updatePlayer();
void swat();

// Food
void initFood();
void updateFood(FOOD *);
void drawFood();



