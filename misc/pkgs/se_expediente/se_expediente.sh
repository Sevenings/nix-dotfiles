#!/usr/bin/env bash

# Obtém o SSID atual
ssid=$(nmcli -t -f active,ssid dev wifi | grep "^sim" | cut -d: -f2)

if [[ "$ssid" == "TCEGO-PUBLIC" ]]; then
    echo "Está no estágio"
    exit 0
fi
echo "Não está no estágio"
exit 1
