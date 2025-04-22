#!/usr/bin/env bash

# Arquivo de configuração do Rofi com o Layout para seleção de itens
rofi_config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"

# Função para listar os dispositivos de saída de áudio e obter os índices e nomes.
get_audio_sinks() {
  pactl -f json list sinks | jq -r '.[] | "\(.index) \(.properties["alsa.name"])"'
}

# Captura os dispositivos de saída de áudio em um array.
audio_sinks=()

# Preenche o array com as linhas capturadas.
while IFS= read -r line; do
  audio_sinks+=("$line")
done < <(get_audio_sinks)

# Verifica se existem dispositivos de áudio disponíveis.
if [ ${#audio_sinks[@]} -eq 0 ]; then
  echo "Nenhum dispositivo de áudio encontrado."
  exit 1
fi

# Obtém o número de opções para saber quantas linhas devem ser disponibilizadas no rofi
number_options=${#audio_sinks[@]}

# Passa os dispositivos para o rofi, garantindo que cada linha seja uma opção única.
selection=$(printf "%s\n" "${audio_sinks[@]}" | rofi -dmenu -p "Saída de Áudio:" -l $number_options -config $rofi_config_file)

# Verifica se uma escolha foi feita.
if [ -z "$selection" ]; then
  echo "Nenhum dispositivo selecionado."
  exit 1
fi

# Extrai o índice do dispositivo selecionado (primeiro campo da seleção).
sink_index=$(echo "$selection" | awk '{print $1}')

# Define o dispositivo selecionado como o dispositivo de saída padrão.
pactl set-default-sink "$sink_index"

# Confirmação.
echo "Dispositivo de saída padrão definido para: $selection"
