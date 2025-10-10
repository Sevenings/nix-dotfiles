#!/bin/bash

config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"

# Menu de ações com rofi
options=(
    "Home Switch"
    "NixOS Rebuild"
    "Nix Collect Garbage" 
)

abrir() {
    titulo="$1"
    shift
    kitty --title "$titulo" --class="floatingTerminal" -e "$@"
}

# Mostra o menu rofi com o título "Actions"
selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Actions" -config "$config_file")

case $selected in
    "Home Switch")
        abrir "Home Switch" bash -c 'cd ~/.dotfiles && make home' ;;

    "NixOS Rebuild")
        abrir "NixOS Switch" bash -c 'cd ~/.dotfiles && make rebuild' ;;

    "Nix Collect Garbage")
        abrir "Nix Garbage Collect" nix-gc ;;

    *)
        exit 0 ;;
esac
