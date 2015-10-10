#!/bin/bash

# Variables - for setting up Git profile
GIT_NAME="Brittany Welsh"
GIT_EMAIL="hello+world@brittanywelsh.com"
GIT_EDITOR="vim"

# Variables - change these to customize your setup!
PYTHON2_VERSION="2.7.10"
PYTHON3_VERSION="3.5.0"
CHEAT_SHEET_PATH="$HOME/.cheat"
CHEAT_SHEET_NAME="cheat"
LOG_FILE_PATH="$HOME/.my_dev-env_setup.txt"

###
echo "Starting the django-dev-env setup process... sit tight!"
###

display ()
{ # just aesthetic! :)
  echo -e "\n=========="
  echo -e $1
  echo -e "==========\n"
}

# Main script:
{
  display "Updating Ubuntu Packages"
  sudo apt-get update
  sudo apt-get dist-upgrade
  echo "... done!"

  display "Configuring Git"
  git config --global user.name $GIT_NAME
  git config --global user.email $GIT_EMAIL
  git config --global core.editor $GIT_EDITOR
  echo "... done!"

  display "Installing PostgreSQL"
  sudo apt-get install -yq postgresql
  echo "... done!"

  display "Installing pip"
  sudo apt-get install -yq python-setuptools
  sudo easy_install pip
  sudo pip install -U pip
  echo "... done!"

  display "Installing pyenv"
  curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | zsh
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  echo "... done!"

  display "Using pyenv to install Python"
  pyenv install $PYTHON2_VERSION
  pyenv install $PYTHON3_VERSION
  pyenv global $PYTHON3_VERSION
  echo "... done!"

  display "Installing virtualenv and virtualenvwrapper"
  pip install virtualenv
  pip install virtualenvwrapper
  echo "... done!"

  display "Installing Ruby"
  sudo apt-get install -yq ruby-full

  display "Installing Heroku toolbelt"
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | zsh

  display "Installing cheatsheet"
  mkdir -p $CHEAT_SHEET_PATH
  curl -L https://raw.githubusercontent.com/brittanywelsh/django-dev-env/master/cheat.sh > $CHEAT_SHEET_PATH/$CHEAT_SHEET_NAME
  sudo chmod u+x $CHEAT_SHEET_PATH/$CHEAT_SHEET_NAME
  echo "... done!"

  display "Adding sources to zsh shell startup"
  curl -L https://raw.githubusercontent.com/brittanywelsh/django-dev-env/master/sourcefile >> $HOME/.zshrc
  echo "... done!"

} 2>&1 | tee $LOG_FILE_PATH

echo -e "\nAll done!\nThe printout above has also been saved to this file: $LOG_FILE_PATH \n"
