#!/usr/bin/env bash

config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"
title='Biblioteca de Babel'
path=~/Documentos/'biblioteca de babel'

function seleciona() {
    item="$(find "$1" -mindepth 1 -maxdepth 1 -printf '%f\n' | sort -f \
      | rofi -dmenu -sorting-method fzf -i -p "$title" -matching prefix -config "$config_file")"

    selected=$1/$item

    if [ "$selected" = "$1/" ]; then
        echo canceled
    elif [ -d "$selected" ]; then
        title='Babel - '$item
        seleciona "$selected"
    elif [ -e "$selected" ]; then
        zathura "$selected" &
    fi
}

seleciona "$path"
