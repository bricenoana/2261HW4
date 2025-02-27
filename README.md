# 2261HW4
# Ghost Hunt Instructions

## Controls
- **Left Arrow (←)**: Move the player character to the left.
- **Right Arrow (→)**: Move the player character to the right.
- **Up Arrow (^)**: Move the player character up.
- **Down Arrow (⌄)**: Move the player character down.
- **START**: Pause and start the game.
-**SELECT** Bring up the scoreboard when paused.

## How to Play
1. **Player Movement**: Use the left, right, up, and down arrow keys to move the player (ghost) around the screen and avoid the ghost hunter.
2. **Crosses**: Collect the crosses that randomly spawn throughout the map. Each cross collected is +1 point.
3. **Ghost Hunter Movement**: The hunter will rapidly move throughout the map searching for the ghost with his flashlight. Avoid him.

## Objective
- **Player Objective**: The player’s goal is to collect as many crosses as possible before getting caught by the ghost hunter. Survive and stay out of his way!
- **Defeat**: The player loses immediately if the ghost hunter catches up with the ghost. Survive as long as you can!

## State machine
1. **Start**: During the title screen, press START to begin the game.
2. **Pause**: While in the game, press START to pause the game.
3. **ScoreBoard**: While in the pause screen, press SELECT to bring up the scoreboard, press START to resume the game.
4. **Lose**: In the Lose screen, press START to go back to the title screen and play again.

