#!/usr/bin/env bash

silent=false
if [[ "${1:-}" == "--silent" ]]; then
  silent=true
fi

# Obtém o SSID atual (LANG=C garante "yes" em vez de "sim")
ssid=$(
  LANG=C nmcli -t -f ACTIVE,SSID dev wifi \
  | awk -F: '$1=="yes"{print $2; exit}'
)

if [[ "${ssid:-}" == "TCEGO-PUBLIC" ]]; then
  $silent || printf 'Está no estágio\n'
  exit 0
else
  $silent || printf 'Não está no estágio\n'
  exit 1
fi

