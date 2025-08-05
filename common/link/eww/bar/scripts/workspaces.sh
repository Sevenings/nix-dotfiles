#!/bin/sh

update() {
    hyprctl workspaces -j | jq -c "[.[] | select(.id > 0)] | sort_by(.id)"
}

handle() {
  case $1 in
    workspace*) update ;;
    focusedmonv2*) update ;;
    createworkspacev2*) update ;;
  esac
}

update

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
