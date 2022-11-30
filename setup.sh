#!/bin/sh
DOTFILES_REPO="git@github.com:michaelconnor468/Dotfiles.git"

stage () {
    if [ $# -eq 2 ]; then
        if [ $2 = "all" ]; then
            pacman -Qq > packages
            for f in `find etc -maxdepth 1 -mindepth 1 -type d`;
            do
                from_dir=`echo $f | awk 'BEGIN {FS="/"} {print $3}'`
                rsync -a /etc/$from_dir etc
            done
        fi
    fi
    for f in `find config -maxdepth 1 -mindepth 1 -type d`;
    do
        from_dir=`echo $f | awk 'BEGIN {FS="/"} {print $2}'`
        rsync -a ~/.config/$from_dir config
    done
}

push () {
    stage $*
    git add config etc
    git commit -am "Update tracked config folders to latest local edition"
    git push origin master
}

sync () {
    rsync -a config/* ~/.config
    if [ $# -eq 2 ]; then
        if [ $2 = "all" ]; then
            rsync -a etc/* /etc
        fi
    fi
}

pull () {
    git pull origin master
    sync $*
}

install () {
    pull pull all
    sudo pacman -S base-devel
    sudo pamcan -S git
    pushd /opt
    sudo git clone https://aur.archlinux.org/yay.git
    sudo chown -R ./yay
    cd yay
    makepkg -si
    popd
    yay -Syyu
    for package in `cat packages`;
    do
        yay -S $package
    done
}

ehco_usage () {
    echo "Usage: setup.sh <stage|sync|push|pull|install>"
}

if [ $# -lt 1 ]; then
    ehco_usage
    exit 1
fi
if [ $1 = "stage" ]; then
    stage $*
    exit 0
elif [ $1 = "push" ]; then
    push $*
    exit 0
elif [ $1 = "sync" ]; then
    sync $*
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
