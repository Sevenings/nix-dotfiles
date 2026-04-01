#!/usr/bin/env bash

killall waybar
pkill waybar
sleep 0.1

# config=$(globals.sh get waybarConfig)
# echo config: $config
#
# style=$(globals.sh get waybarStyle)
# echo style: $style

theme="gruvbox"
config="$HOME/.config/waybar/$theme/config.jsonc"
style="$HOME/.config/waybar/$theme/style.css"

waybar --config $config --style $style &

