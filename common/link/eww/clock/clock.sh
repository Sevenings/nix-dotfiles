#!/bin/sh

screen=0
anchor="bottom left"
pos_x=0
pos_y=0

if [ "$1" == "open" ]; then
  eww -c ~/.config/eww/clock open clock --anchor "$anchor" --screen "$screen"
elif [ "$1" == "close" ]; then
  eww -c ~/.config/eww/clock close clock
else
  echo "Usage: $0 {open|close}"
  exit 1
fi

