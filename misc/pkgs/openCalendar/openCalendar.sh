#!/usr/bin/env bash

MODE=$1

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
calcurseKittyConfig="$SCRIPT_DIR/kitty.conf"

# Create a temporary config with the correct image path
TEMP_CONFIG=$(mktemp)
sed "s|SCRIPT_DIR_PLACEHOLDER|$SCRIPT_DIR|g" "$calcurseKittyConfig" > "$TEMP_CONFIG"

if [ -n $MODE ]; then
    kitty --class=floatingTerminal -c "$TEMP_CONFIG" -e calcurse
    rm "$TEMP_CONFIG"
fi

