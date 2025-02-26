#include "gba.h"
#include "print.h"
#include "game.h"
#include "font.h"
#include "mode4.h"
#include "StartScreen.h"

#define StartScreenBitmapLen 38400
extern const unsigned short StartScreenBitmap[19200];

#define StartScreenPalLen 512
extern const unsigned short StartScreenPal[256];

void goToStartState();
void goToGameState();
void goToPauseState();
void goToWinState();
void goToLoseState();

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
                goToStartState();
                break;
            case GAME:
                goToGameState();
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
    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStartState();

}

void start() {
    waitForVBlank();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameState();
    }
}


void goToStartState() {
    DMANow(3, StartScreenPal, BG_PALETTE, StartScreenPalLen / 2);

    drawFullscreenImage4(StartScreenBitmap);

    waitForVBlank();
    flipPage();

    state = START;
}

void goToGameState() {
    state = GAME;
}

void goToPauseState() {
    state = PAUSE;
}

void goToWinState() {
    state = WIN;
}

void goToLoseState() {
    state = LOSE;
}