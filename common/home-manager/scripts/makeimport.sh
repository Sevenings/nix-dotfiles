#!/usr/bin/env bash

function list_options() {
    echo Options:
    echo " - esp"
    echo " - arduino"
    echo " - c"
}


if [ -z $1 ]; then 
    list_options
    exit
fi

makefiles_path="$HOME/.templates/makefiles"

case $1 in
    esp) cp $makefiles_path/esp-idf-makefile makefile;;
    arduino) cp $makefiles_path/arduino-makefile makefile;;
esac

echo "imported $1 makefile"
