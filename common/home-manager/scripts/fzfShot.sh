#!/usr/bin/env bash
# Created by Lucas V
# v1.1

fileManager=$(globals.sh fileManager)

file=$(find ~ | fzf --reverse --preview="~/.config/ranger/scope.sh {} $COLUMNS $LINES ~/.cache/fzfShot False" --preview-window=down)

if [ $file ]; then
    hyprctl dispatch togglefloating
    sleep 0.1
    if [ -d $file ]; then
        $fileManager $file
    else
        rifle $file
    fi
fi
