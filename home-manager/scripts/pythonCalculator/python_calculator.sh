terminal=$(globals.sh terminal)
calculatorKittyConfig=$(globals.sh calculatorKittyConfig)
calculator="$terminal \
    --class=floatingTerminal \
    --config=$calculatorKittyConfig \
    -e python3"

export PYTHONSTARTUP=~/.myScripts/pythonCalculator/startup.py
$calculator

