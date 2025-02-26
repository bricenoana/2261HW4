#ifndef GAME_H
#define GAME_H

typedef enum { START, GAME, PAUSE, WIN, LOSE } GameState;
extern GameState state;

void updateGame();
void drawGame();
void drawStartScreen();
void drawPauseScreen();
void drawWinScreen();
void drawLoseScreen();

typedef struct {
    int x, y;
    int oldx, oldy;
    int width, height;
    const unsigned short* imageData;
} Ghost;

typedef struct {
    int x, y;
    int oldx, oldy;
    int width, height;
    int dx;
    const unsigned short* imageData;
} GhostHunter;

typedef struct {
    int x, y;
    int width, height;
} Cross;

#endif // GAME_H
