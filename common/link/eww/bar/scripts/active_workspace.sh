
#!/bin/sh


handle() {
  case $1 in
    workspace*) hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id' ;;
    focusedmonv2*) hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id' ;;
  esac
}

hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
