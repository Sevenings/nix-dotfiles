#!/usr/bin/env bash
set -Eeuo pipefail

config_file="${HOME}/.config/rofi/itemSelectorConfig.rasi"
number_options=4

op_power_on="Bluetooth on"
op_power_off="Bluetooth off"
op_connect="Connect Device"
op_disconnect="Disconnect Device"

# Comando do rofi como array para evitar problemas de quoting
dmenu_cmd=(rofi -dmenu -l "${number_options}" -config "${config_file}")

blu() { bluetoothctl --timeout 5 "$@"; }  # timeout evita travas

disconnect() {
  blu disconnect
}

connect() {
  # Lista pareados e manda pro rofi; mostra "MAC  Nome do device"
  # Se cancelar, sai limpo.
  mapfile -t choices < <(blu devices Paired | awk '{mac=$2; $1=$2=""; sub(/^  */,""); print mac "  " $0}')
  [[ ${#choices[@]} -gt 0 ]] || { notify-send "Bluetooth" "Nenhum dispositivo pareado"; return; }

  sel="$(printf '%s\n' "${choices[@]}" | "${dmenu_cmd[@]}" -p "Devices" || true)"
  [[ -n "${sel}" ]] || return

  mac="${sel%% *}"
  [[ -n "${mac}" ]] && blu connect "${mac}"
}

powerOff() { blu power off; }
powerOn()  { blu power on;  }

# Menu principal
selection="$(
  printf '%s\n' \
    "${op_connect}" \
    "${op_disconnect}" \
    "${op_power_on}" \
    "${op_power_off}" \
  | "${dmenu_cmd[@]}" -p "Bluetooth" || true
)"

case "${selection}" in
  "${op_power_on}")  powerOn   ;;
  "${op_power_off}") powerOff  ;;
  "${op_connect}")   connect   ;;
  "${op_disconnect}") disconnect ;;
  *) exit 0 ;; # cancelado
esac
