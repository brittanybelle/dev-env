# django-dev-env
## Quick development-environment setup for lazy people.

This is a simple bash script that runs a list of installation commands, to simplify setup of a new development VM. It is intended to be used on a fresh Ubuntu installation.

### What gets installed?

Here's the full breakdown of what the `setup.sh` script runs:

1. Update/upgrade apt-get packages
2. Install python-setuptools (via apt-get)
3. Install pip (via easy-install)
4. Install virtualenv (via pip, system-wide)
5. Install pyenv
6. Install Python 2.7 and Python 3 (via pyenv)
7. Configure git name, email and  default editor
8. Install "cheat sheet" (included in this repo)

### Usage

From your development machine, first download the repo. Next, edit the setup script as you please, then run it from within the `django-dev-env` directory via `./setup.sh`. The full list of commands is:

```
git clone https://github.com/brittanywelsh/django-dev-env.git
cd django-dev-env
chmod u+x setup.sh
./setup.sh
```

NOTE: if you want to install the cheat sheet, make sure to run the script from within the `django-env-dev` directory. After the script finishes running, you won't need the repo any more so you can happily delete it.

You can also keep the `django-dev-env` folder around if you want to make your own modifications to the cheat sheet. To re-install a modified cheat sheet, simply run the `install-cheatsheet.sh` script from within the `django-dev-env` folder.