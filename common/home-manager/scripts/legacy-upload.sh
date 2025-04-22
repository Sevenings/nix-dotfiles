#!/usr/bin/env bash

file=$1

if [[ -n $file ]]; then
    case $file in
        rm) sudo rm /bin/$FILE;;
        *) FILE=$file; sudo cp $FILE /bin;;
    esac
fi
