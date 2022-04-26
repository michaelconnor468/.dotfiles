#!/bin/sh
DOTFILES_REPO="git@github.com:michaelconnor468/Dotfiles.git"

push () {
    if [ $# -eq 2 -a $2 = "all" ]; then
        pacman -Qq > pacman.txt
    fi
    # use rsync to only update dirs that exist in both the repo and system
    echo $*
}

pull () {
    # use rsync to simply get stuff from the repo
    # do for config and etc in the various locations
    echo pull
}

install () {
    # install yay if not present
    # install all packages from pacman.txt
    # pull
    echo install
}

ehco_usage () {
    echo "Usage: setup.sh <push|pull|install>"
}

if [ $# -lt 1 ]; then
    ehco_usage
    exit 1
fi

if [ $1 = "push" ]; then
    push $*
    exit 0
elif [ $1 = "pull" ]; then
    pull
    exit 0
elif [ $1 = "install" ]; then
    install
    exit 0
else
    ehco_usage
    exit 1
fi
