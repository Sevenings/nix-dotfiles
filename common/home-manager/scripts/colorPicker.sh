#!/bin/sh

COLOR=$(hyprpicker)
if [ $COLOR ]; then
    wl-copy $COLOR
    notify-send "Hyprpicker Color" "Cor $COLOR enviada para o CTRL-C"
fi

