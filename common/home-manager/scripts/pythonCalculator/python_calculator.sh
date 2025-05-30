#!/usr/bin/env bash

terminal="kitty"
calculatorKittyConfig="$HOME/.dotfiles/common/home-manager/scripts/pythonCalculator/calculatorConfig/kitty.conf"
calculator="$terminal \
    --class=floatingTerminal \
    --config=$calculatorKittyConfig \
    -e python3"

export PYTHONSTARTUP=$HOME/.dotfiles/common/home-manager/scripts/pythonCalculator/startup.py
$calculator

