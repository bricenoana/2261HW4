#ifndef GAME_H
#define GAME_H

typedef enum { START, GAME, PAUSE, SCOREBOARD, WIN, LOSE } GameState;

extern GameState state;
extern int highScore;


void updateGame();
void drawGame();
void drawStartScreen();
void drawPauseScreen();
void drawWinScreen();
void drawLoseScreen();

#define NUM_CROSSES 5
#define PURPLE 1

typedef struct {
    int x, y;
    int oldX, oldY;
    int dx;
    int width, height;
    const unsigned short* imageData;
} Ghost;

typedef struct {
    int x, y;
    int oldX, oldY;
    int width, height;
    int dx;
    const unsigned short* imageData;
} GhostHunter;

typedef struct {
    int x, y;
    int width, height;
    int active;
} Cross;

typedef struct {
    int x, y;
    int width, height;
    unsigned short color;
} Wall;


#endif // GAME_H
