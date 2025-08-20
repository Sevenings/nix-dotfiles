#!/usr/bin/env bash

terminal="kitty"
calculatorKittyConfig="$HOME/.dotfiles/misc/pkgs/pythonCalculator/calculatorConfig/kitty.conf"
calculator="$terminal \
    --class=floatingTerminal \
    --config=$calculatorKittyConfig \
    -e python3"

export PYTHONSTARTUP=$HOME/.dotfiles/misc/pkgs/pythonCalculator/startup.py
$calculator

