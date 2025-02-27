#include "game.h"
#include "gba.h"
#include "font.h"
#include "mode4.h"
#include "StartScreen.h"
#include "Normal.h"
#include "ghostHunter.h"
#include <stdio.h>
#include "analogSound.h"
#include "Yay.h"

extern void goToLoseState();

// structs on the screen
Ghost player;
GhostHunter hunter;
Cross cross;

Cross crosses[NUM_CROSSES];

//scores
int score;
int highScore = 0;



#define NUM_WALLS 5
Wall walls[NUM_WALLS] = {
    {42, 94, 21, 66},
    {172, 95, 21, 67},
    {155, 32, 85, 20},
    {41, 31, 74, 20},
    {96, 0, 19, 31}
};

void initGame() {
    score = 0;

    initPlayer();
    initHunter();
    initCross();

    DMANow(3, NormalPal, BG_PALETTE, NormalPalLen / 2);

}

void drawGame() {
    fillScreen4(0);
    drawBorders();
    drawPlayer();
    drawHunter();
    drawCross();

    char scoreStr[16];
    sprintf(scoreStr, "Score: %d", score);
    drawString4(160, 5, scoreStr, 1);
}

// initialize player
void initPlayer() {
    player.x = 12;
    player.y = 120;
    player.oldY = player.y;
    player.oldX = player.x;
    player.dx = 0;
    player.height = 16;
    player.width = 16;
    
}

// initialize hunter
void initHunter() {
    hunter.x = 150;
    hunter.y = 130;
    hunter.oldY = hunter.y;
    hunter.oldX = hunter.x;
    hunter.dx = 0;
    hunter.height = 16;
    hunter.width = 16;

    DMANow(3, &ghostHunterPal, BG_PALETTE, ghostHunterPalLen / 2);
}

// initialize cross
void initCross() {
    for (int i = 0; i < NUM_CROSSES; i++) {
        crosses[i].width = 16;
        crosses[i].height = 16;
    }
    spawnCross();
}



// update game
void updateGame() {
    updatePlayer();
    updateHunter();

    if (crosses[0].active && collision(player.x, player.y, player.width, player.height, 
                                         crosses[0].x, crosses[0].y, crosses[0].width, crosses[0].height)) {
        score++;
        playAnalogSound(7);
        crosses[0].active = 0;
        spawnCross();
    }

    if (collision(player.x, player.y, player.width, player.height, 
        hunter.x, hunter.y, hunter.width, hunter.height)) {
        if (score > highScore) {
            highScore = score;
        }
        playAnalogSound(6);
        state = LOSE;
    }


}

// update player
void updatePlayer() {
    player.oldX = player.x;
    player.oldY = player.y;
    
    int speed = 2;  // movement speed
    if (BUTTON_HELD(BUTTON_LEFT))  { player.x -= speed; }
    if (BUTTON_HELD(BUTTON_RIGHT)) { player.x += speed; }
    if (BUTTON_HELD(BUTTON_UP))    { player.y -= speed; }
    if (BUTTON_HELD(BUTTON_DOWN))  { player.y += speed; }
    
    if (player.x < 0) player.x = 0;
    if (player.x > SCREENWIDTH - player.width)
        player.x = SCREENWIDTH - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > SCREENHEIGHT - player.height)
        player.y = SCREENHEIGHT - player.height;
    
    for (int i = 0; i < NUM_WALLS; i++) {
        if (collision(player.x, player.y, player.width, player.height, 
                      walls[i].x, walls[i].y, walls[i].width, walls[i].height)) {
            player.x = player.oldX;
            player.y = player.oldY;
            break;
        }
    }
}

// update hunter
void updateHunter() {
    static int steps = 0;
    static int direction = 0;
    int speed = 2;

    int oldX = hunter.x;
    int oldY = hunter.y;

    if (steps <= 0) {
        direction = rand() % 4;
        steps = (rand() % 30) + 10;
    }
    
    switch(direction) {
        case 0: // up
            hunter.y -= speed;
            break;
        case 1: // right
            hunter.x += speed;
            break;
        case 2: // down
            hunter.y += speed;
            break;
        case 3: // left
            hunter.x -= speed;
            break;
    }
    steps--;

    for (int i = 0; i < NUM_WALLS; i++) {
        if (collision(hunter.x, hunter.y, hunter.width, hunter.height, 
                      walls[i].x, walls[i].y, walls[i].width, walls[i].height)) {
            hunter.x = oldX;
            hunter.y = oldY;
            steps = 0;
            break;
        }
    }

    if (hunter.x < 0) hunter.x = 0;
    if (hunter.x > SCREENWIDTH - hunter.width)
        hunter.x = SCREENWIDTH - hunter.width;
    if (hunter.y < 0) hunter.y = 0;
    if (hunter.y > SCREENHEIGHT - hunter.height)
        hunter.y = SCREENHEIGHT - hunter.height;
}



// drawing the player
void drawPlayer() {
    drawImage4(player.x, player.y, player.width, player.height, NormalBitmap);
}

// drawing the hunter
void drawHunter() {
    drawImage4(hunter.x, hunter.y, hunter.width, hunter.height, ghostHunterBitmap);
}

// drawing the cross
void drawCross() {
    for (int i = 0; i < NUM_CROSSES; i++) {
        if (crosses[i].active) {
            drawRect4(crosses[i].x, crosses[i].y, 2, 11, 1);
            drawRect4(crosses[i].x - 3, crosses[i].y + 3, 8, 2, 1);
        }
    }
}

void spawnCross() {
    int valid = 0;
    while (!valid) {
        int tempX = rand() % (SCREENWIDTH - 16);
        int tempY = rand() % (SCREENHEIGHT - 16);
        valid = 1;
        for (int i = 0; i < NUM_WALLS; i++) {
            if (collision(tempX, tempY, 16, 16, 
                          walls[i].x, walls[i].y, walls[i].width, walls[i].height)) {
                valid = 0;
                break;
            }
        }
        if (valid) {
            crosses[0].x = tempX;
            crosses[0].y = tempY;
            crosses[0].width = 16;
            crosses[0].height = 16;
            crosses[0].active = 1;
        }
    }
}

void drawBorders() {
    for (int i = 0; i < NUM_WALLS; i++) {
        int x = walls[i].x;
        int y = walls[i].y;
        int w = walls[i].width;
        int h = walls[i].height;

        if (x + w > SCREENWIDTH)
            w = SCREENWIDTH - x;
        if (y + h > SCREENHEIGHT)
            h = SCREENHEIGHT - y;
        drawRect4(x, y, w, h, PURPLE);
    }
}

void showYayAnimation() {
    int frameDelay = 60;
    for (int i = 0; i < frameDelay; i++) {
        fillScreen4(0);
        drawBorders();
        
        drawImage4(player.x, player.y, player.width, player.height, YayBitmap);
        
        drawImage4(hunter.x, hunter.y, hunter.width, hunter.height, ghostHunterBitmap);
        drawCross();
        
        char scoreStr[16];
        sprintf(scoreStr, "Score: %d", score);
        drawString4(160, 5, scoreStr, 1);
        
        waitForVBlank();
        flipPage();
    }
}
