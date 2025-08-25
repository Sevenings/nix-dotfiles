#!/usr/bin/env bash

terminal="kitty"
calculatorKittyConfig="$HOME/.dotfiles/misc/pkgs/python_calculator/calculatorConfig/kitty.conf"
calculator="$terminal \
    --class=floatingTerminal \
    --config=$calculatorKittyConfig \
    -e python3"

export PYTHONSTARTUP=$HOME/.dotfiles/misc/pkgs/python_calculator/startup.py
$calculator

