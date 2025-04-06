#!/bin/sh

ID=1
DELAY=2000


currentLayout=$(hyprctl getoption general:layout | grep str | awk '{print $2}')


case $currentLayout in 
        dwindle) hyprctl keyword general:layout "master"; notify-send -r $ID -t $DELAY "Master Layout";;
        master) hyprctl keyword general:layout "dwindle"; notify-send -r $ID -t $DELAY "Dwindle Layout";;
esac
