#!/bin/bash

echo -e "\
===========================\n\
DjangoDev Shell Cheat Sheet\n\
===========================\n\
These lists are a gentle reminder of frequently used command syntax;\n\
please always refer to the original documentation in case of doubt.\n\n\
Select a topic:"

TOPIC_DJANGO="\n\
======\n\
django\n\
======\n\
\n\
./manage.py runserver               Start the Django server at 127.0.0.1:8000\n\
./manage.py runserver 0.0.0.0:3000  Start the Django server on Nitrous\n\
"

TOPIC_PIP="\n\
===\n\
pip\n\
===\n\
\n\
pip install PACKAGE                 Install a new PyPi PACKAGE.\n\
pip install -U PACKAGE              Update installed PACKAGE.\n\
                                    (Use this to update pip itself!)\n\
pip install -r requirements.txt     Load requirements from file.\n\
pip freeze > requirements.txt       Write current pip config into file.\n\
pip list                            List currently-installed packages.\n\
"

TOPIC_PYENV="\n\
=====\n\
pyenv\n\
=====\n\
\n\
pyenv commands           View complete list of commands.\n\
pyenv install #.#.#      Install a particular Python version.\n\
pyenv uninstall #.#.#    Uninstall a particular Python version.\n\
pyenv install -l         List all available Python versions.\n\
pyenv versions           View list of installed Python versions.\n\
pyenv local [#.#.#]      Set Python version in current directory.\n\
pyenv global [#.#.#]     Set Python version. Stored in file: ./pyenv/version\n\
"

TOPIC_VIRTUALENV="\n\
==========\n\
virtualenv\n\
==========\n\
\n\
virtualenv -p python3  NAME-OF-ENV      Create a new virtual environment.\n\
source ENV-NAME/bin/activate            Enter the ENV-NAME environment.\n\
\n\
If you have virtualenvwrapper:
workon NAME-OF-ENV                      Enter the ENV-NAME environment.\n\
lssitepackages                          View site packages.\n\
"

OPTIONS="django pip pyenv virtualenv quit"

select opt in $OPTIONS; do

  if [ "$opt" = "quit" ]; then
    echo "Bye!"
    exit

  elif [ "$opt" = "django" ]; then
    echo -e "$TOPIC_DJANGO"
    exit

  elif [ "$opt" = "pip" ]; then
    echo -e "$TOPIC_PIP"
    exit

  elif [ "$opt" = "virtualenv" ]; then
    echo -e "$TOPIC_VIRTUALENV"
    exit

  elif [ "$opt" = "pyenv" ]; then
    echo -e "$TOPIC_PYENV"
    exit

  else
    echo "Sorry, did not understand. Please enter a number."
  fi

done
