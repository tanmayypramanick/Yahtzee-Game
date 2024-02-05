
# Yahtzee Game 🎲

A single-player Yahtzee game implemented in Flutter.

## Overview
This project is a digital version of the popular dice game Yahtzee, implemented using Flutter, a cross-platform UI toolkit. It allows players to roll dice, hold specific dice, and score points based on various categories such as ones, twos, threes, etc.

### Resources:
- [Wikipedia writeup on Yahtzee](https://en.wikipedia.org/wiki/Yahtzee)
- [Online version of Yahtzee](https://cardgames.io/yahtzee/)

## Getting Started
To run this project locally, follow these steps:

1. Make sure you have Flutter installed. If not, you can download it from [here](https://flutter.dev/docs/get-started/install).
2. Clone this repository to your local machine.
3. Open the project in your preferred IDE (e.g., Android Studio, VSCode).
4. Connect a device or start an emulator.
5. Run the application using `flutter run` command in the terminal.

## Usage
1. **Start Game:** Click on the "Start Game" button to begin playing Yahtzee.
2. **Roll Dice:** Click on the "Roll Dice" button to roll the dice. You can roll the dice up to three times in a turn.
3. **Hold Dice:** Tap on a die to toggle holding it. Held dice will not be rerolled in subsequent rolls in the turn.
4. **Pick Category:** After rolling the dice, select a scoring category from the scorecard. Once picked, you cannot change the category for the rest of the game.

## Project Structure
The code is structured to separate layout from data, involving the use of data model classes and avoiding hardcoding game logic/data into widget implementations.

### External Packages
This project uses the `provider` and `collection` packages for state management and helpful data structure operations, respectively.

### Model Classes
The provided `Dice`, `ScoreCategory`, and `Scorecard` classes represent dice, scoring categories, and the scorecard. You may use them as-is, modify them, or implement your own model classes.

## Screenshot

![Screenshot](https://github.com/tanmayypramanick/Yahtzee-Game/blob/main/Screenshot/Yahtzee_ss.png)

## Notes
- The app layout fits within a 720p (1280x720 pixels) resolution window without overflow or scrolling.
- The game does not include the "Yahtzee bonus" rule.

Feel free to explore, modify, and use this project as a reference for your Flutter development journey! 🚀

