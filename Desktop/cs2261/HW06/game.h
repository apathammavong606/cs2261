// Sprite Struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int bulletTimer;
} ANISPRITE;

typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rdel;
    int cdel;
    int height;
    int width;
    int aniCounter;
    int aniState;
    int active;
    int enemyNumber;
    int curFrame;
    int numFrames;
    int direction;
    int otherState;
    int prevAniState;
} ENEMY;

// Bullet Struct
typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rdel;
    int height;
    int width;
    int direction;
    int oldDirection;
    int active;
    int erased;
    int curFrame;
    int numFrames;
    int aniState;
    int aniCounter;
} BULLET;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int aniState;
} LIFE;


// Constants
#define BULLETCOUNT 5
#define ENEMYCOUNT 25

// Variables
extern ANISPRITE player;
extern ENEMY enemies[ENEMYCOUNT];
extern BULLET bullets[BULLETCOUNT];
extern LIFE lives[3];
extern int livesLeft;
extern int enemiesRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initEnemies();
void updateEnemy();
void updateEnemyEach(ENEMY*);
void drawEnemy();

void initBullets();
void fireBullet(int);
void updateBullet();
void drawBullet();

void initLives();
void updateLives();
void drawLives();