#!/bin/sh
DOTFILES_REPO="git@github.com:michaelconnor468/Dotfiles.git"

push () {
    # use rsync to only update dirs that exist in both the repo and system
    echo push
}

pull () {
    # use rsync to simply get stuff from the repo
    echo pull
}

if ! [ $# -eq 1 ]; then
    echo "Usage: setup.sh <push|pull>"
    exit 1
fi
if [ $1 = "push" ]; then
    push
else
    pull
fi
