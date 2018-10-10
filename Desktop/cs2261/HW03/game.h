typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int cdel;
    int rdel;
    int height;
    int width;
    unsigned short color;
    int bulletTimer;
} PLAYER;


// Bullet Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rdel;
    int height;
    int width;
    unsigned short color;
    int active;
    int erased;
} BULLET;


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
    unsigned short color;
    int active;
    int erased;
} BALL;

// Constants
#define BULLETCOUNT 10
#define BALLCOUNT 10

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BALL balls[BALLCOUNT];
extern int ballsRemaining;
extern int lives;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);