MODE=$1

calcurseKittyConfig=$(globals.sh get calcurseKittyConfig)

if [ -n $MODE ]; then
    kitty --class=floatingTerminal -c $calcurseKittyConfig -e calcurse
fi
