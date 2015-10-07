#!/bin/bash

# Variables - for setting up Git profile
GIT_NAME="Brittany Welsh"
GIT_EMAIL="hello+world@brittanywelsh.com"
GIT_EDITOR="vim"

# Variables - change these to customize your setup!
PYTHON2_VERSION="2.7.10"
PYTHON3_VERSION="3.5.0"
LOG_FILE_PATH="$HOME/.my_dev-env_setup.txt"
CHEAT_SHEET_PATH="/usr/local/bin/"
CHEAT_SHEET_NAME="cheat"

###
echo "Starting the DjangonDevEnv setup process... sit tight!"
###

{
  # Updating Ubuntu packages
  echo -e "\n===\nUpdating Ubuntu Packages\n==="
  sudo apt-get update
  sudo apt-get upgrade

  # Install preliminary python packages
  echo -e "\n===\nInstalling Python Packages\n==="
  sudo apt-get install python-setuptools
  sudo easy_install pip
  sudo pip install -U pip
  sudo pip install virtualenv

  # Install pyenv
  echo -e "\n===\nInstalling pyenv\n==="
  curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
  export PATH=$HOME/.pyenv/bin:$PATH

  # Use pyenv to install python
  echo -e "\n===\nUse pyenv to install Python 2 & 3\n==="
  pyenv update
  pyenv install $PYTHON2_VERSION
  pyenv install $PYTHON3_VERSION
  pyenv global $PYTHON3_VERSION

  # Configure git
  git config --global user.name $GIT_NAME
  git config --global user.email $GIT_EMAIL
  git config --global core.editor $GIT_EDITOR

  # Install the cheat sheet and add it to $PATH
  echo -e "\n=== Adding Cheat Sheet script... ==="
  sudo cp cheat $CHEAT_SHEET_PATH
  sudo chmod +x $CHEAT_SHEET_PATH/$CHEAT_SHEET_NAME
  sudo chmod +x install-cheatsheet.sh

  echo -e "\n=== End of installation script ==="

} 2>&1 | tee $LOG_FILE_PATH

echo -e "\nAll done!\nThe printout above has also been saved to this file: $LOG_FILE_PATH \n"