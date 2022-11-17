#!/bin/sh
if [[ "$(uname -a | awk '{print $2}')" == "arch" ]]; then
    source ~/.config/zsh/hooks/desktophook.sh
fi

function enstat {
    local prefix="/sys/class/net/enp4s0/statistics/"
    if [[ "$#" -eq 2 || $1 = "bytes" || $1 = "packets" || $1 = "errors" || $1 = "dropped" || $2 = "in" || $2 = "out" ]]; then
        if [[ $2 = "in" ]]; then
            prefix=$prefix"rx_"$1
        else
            prefix=$prefix"tx_"$1
        fi
    else
        echo "usage: enstat [bytes|packets|errors|dropped] [in|out]"
        return 1
    fi

    local start="$(cat $prefix)"
    printf "Measuring Delta... <Press Enter To Finish>\n"
    read -r trash
    local end="$(cat $prefix)"

    if [ "$1" = "bytes" ]; then
        printf "%4sB \n" $(numfmt --to=iec $(($end-$start)))
    else
        printf "%4s \n" $(($end-$start))
    fi
}
