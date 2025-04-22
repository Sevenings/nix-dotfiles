#!/usr/bin/env bash

config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"

number_options=4

op_power_on="Bluetooth on"
op_power_off="Bluetooth off"
op_connect="Connect Device"
op_disconnect="Disconnect Device"
op_pair="Pair Devices"

options="$op_connect\n$op_disconnect\n$op_power_on\n$op_power_off"


dmenu="rofi -dmenu -l $number_options -p Bluetooth -config $config_file"


function disconnect() {
    echo "disconnect" | bluetoothctl
}

function connect() {
    device=$(echo "devices Paired" | bluetoothctl | grep "Device" | $dmenu -p "Devices" | awk '{print $2}')
    echo "connect $device" | bluetoothctl
}

function powerOff() {
    echo "power off" | bluetoothctl
}

function powerOn() {
    echo "power on" | bluetoothctl
}

selection=$(echo -e $options | $dmenu -p "Option")



case $selection in
    $op_power_on) powerOn;;
    $op_power_off) powerOff;;
    $op_connect) connect;;
    $op_disconnect) disconnect;;
    $op_pair) pair;;
esac



