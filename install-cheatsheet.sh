#!/bin/bash

# Variables
CHEAT_SHEET_PATH="/usr/local/bin"
CHEAT_SHEET_NAME="cheat"

sudo cp cheat $CHEAT_SHEET_PATH/
sudo chmod +x $CHEAT_SHEET_PATH/$CHEAT_SHEET_NAME

echo -e "\n I added your updated cheat sheet to $CHEAT_SHEET_PATH/$CHEAT_SHEET_NAME \n"