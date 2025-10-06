#!/bin/bash

config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"

# Menu de ações com rofi
options="Nix Collect Garbage"

# Mostra o menu rofi com o título "Actions"
selected=$(echo "$options" | rofi -dmenu -p "Actions" -config "$config_file")

case $selected in
    "Nix Collect Garbage")
        kitty --title "Nix Garbage Collect" -e nix-gc ;;

    *)
        exit 0 ;;
esac
