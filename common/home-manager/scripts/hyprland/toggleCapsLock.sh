#!/usr/bin/env bash

STATUS=$(hyprctl getoption input:kb_options | grep str: | awk -F' ' '{print $2}')
DELAY=2000
ID=1

if [[ $STATUS == "caps:escape" ]]; then
    hyprctl keyword input:kb_options ""
    notify-send -r $ID -t $DELAY "Caps Toggle" "CapsLock Ativada"
else
    hyprctl keyword input:kb_options caps:escape
    notify-send -r $ID -t $DELAY "Caps Toggle" "CapsLock Desativada"
fi

