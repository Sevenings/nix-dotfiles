#!/bin/sh


handle() {
  case $1 in
    workspace*) hyprctl workspaces -j | jq -c '[.[] | select(.id > 0)] | sort_by(.id)' ;;
    focusedmonv2*) hyprctl workspaces -j | jq -c '[.[] | select(.id > 0)] | sort_by(.id)' ;;
  esac
}

hyprctl workspaces -j | jq -c '[.[] | select(.id > 0)] | sort_by(.id)'

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
