#!/usr/bin/env bash

function setTheme {
    themes=$1
    sudo rm -r /usr/share/sddm/themes/selected-theme/*
    sudo cp -r /usr/share/sddm/themes/$themes/* /usr/share/sddm/themes/selected-theme
}


function list {
    ls /usr/share/sddm/themes/
}


function import {
    themepath=$1
    if [[ -z $themepath ]]; then
        exit
    fi
    sudo cp -r $themepath /usr/share/sddm/themes
}

cmd=$1
if [[ -z $cmd ]]; then
    echo 'Use: sddmTheme.sh <action>'
    echo 'Actions:'
    echo '    - list'
    echo '    - setTheme'
    echo '    - import'
    exit
fi

case $cmd in 
    list) list;;
    import) {
        themepath=$2
        import $themepath
    };;
    *) setTheme $cmd;;
esac
