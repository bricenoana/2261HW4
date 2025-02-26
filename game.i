# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



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
# 2 "game.c" 2
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 40 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 59 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 93 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 3 "game.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "game.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 5 "game.c" 2
# 1 "StartScreen.h" 1
# 21 "StartScreen.h"
extern const unsigned short StartScreenBitmap[19200];


extern const unsigned short StartScreenPal[256];
# 6 "game.c" 2

GameState state;

void drawStartScreen() {
    drawFullscreenImage4(StartScreenBitmap);
}

void drawPauseScreen() {
}

void drawWinScreen() {
}

void drawLoseScreen() {
}

void updateGame() {

}

void drawGame() {

}
