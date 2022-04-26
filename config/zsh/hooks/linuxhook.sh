#!/bin/sh
if [[ "$(uname -a | awk '{print $2}')" == "arch" ]]; then
    source ~/.config/zsh/hooks/desktophook.sh
fi
