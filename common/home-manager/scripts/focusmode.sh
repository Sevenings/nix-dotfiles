#!/bin/sh

# Coloca no focus mode

killall -SIGUSR1 waybar
hyprctl keyword general:gaps_in 0
hyprctl keyword general:gaps_out 0
hyprctl keyword general:border_size 1
hyprctl keyword decoration:rouding 0

