#include "gba.h"
#include "print.h"
#include "game.h"
#include "font.h"
#include "mode4.h"
#include "start1.h"
#include "start2.h"
#include "start3.h"
#include "analogSound.h"


void goToStartState();
void goToGameState();
void goToPauseState();
void goToWinState();
void goToLoseState();

GameState state;

unsigned short buttons;
unsigned short oldButtons;

void initialize();

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case START:
                start();
                break;
            case GAME:
                updateGameLoop();
                break;
            case PAUSE:
                goToPauseState();
                break;
            case WIN:
                goToWinState();
                break;
            case LOSE:
                goToLoseState();
                break;
        }
    }
    return 0;
}


void initialize() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    BG_PALETTE[1] = RGB(31, 0, 31);
    buttons = REG_BUTTONS;
    oldButtons = 0;
    goToStartState();

    initSound();
}

void start() {
    waitForVBlank();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameState();
    }
}

void goToStartState() {
    oldButtons = REG_BUTTONS;
    buttons = REG_BUTTONS;

    const unsigned short* startPalettes[3] = { start1Pal, start2Pal, start3Pal };
    const unsigned short* startBitmaps[3]  = { start1Bitmap, start2Bitmap, start3Bitmap };
    int startPalLens[3] = { start1PalLen, start2PalLen, start3PalLen };

    int frame = 0;
    while (1) {
        DMANow(3, startPalettes[frame], BG_PALETTE, startPalLens[frame] / 2);
        drawFullscreenImage4(startBitmaps[frame]);
        waitForVBlank();
        flipPage();
        
        for (volatile int i = 0; i < 30000; i++);

        oldButtons = buttons;
        buttons = REG_BUTTONS;
        if (BUTTON_PRESSED(BUTTON_START))
            break;
        
        frame = (frame + 1) % 3;
    }

    goToGameState();
}



void goToGameState() {
    initGame();
    state = GAME;
}

void updateGameLoop() {
    updateGame();
    drawGame();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPauseState();
        return;
    }
    
    waitForVBlank();
    flipPage();
}



void goToPauseState() {
    fillScreen4(0);
    drawString4(136, 8, "got too stressed?", 1);
    drawString4(130, 18, "you're paused now!", 1);
    waitForVBlank();
    flipPage();
    
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        if (BUTTON_PRESSED(BUTTON_START)) {
            state = GAME;
            break;
        }
        waitForVBlank();
    }
}


void goToWinState() {
    state = WIN;
}

void goToLoseState() {
    fillScreen4(0);
    drawString4(50, 38, "The Hunter caught you!", 1);
    drawString4(45, 58, "Press START to try again.", 1);

    waitForVBlank();
    flipPage();

    state = LOSE;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();
    }
}

