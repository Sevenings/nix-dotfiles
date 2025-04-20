#!/usr/bin/env bash

config_file="$HOME/.config/rofi/itemSelectorConfig.rasi"

number_options=3

# Lista de Opções
hoje='Hoje'
agora='Agora'
email_despedida='Despedida Email'

# Concatenação das Opções
options="$hoje\n$agora\n$email_despedida"


# Configuração do dmenu
dmenu="rofi -config $config_file -dmenu -i -l $number_options -p Memory Copy"

# Item selecionado
selection=$(echo -e $options | $dmenu )


# Executa a seleção
case $selection in
    $hoje) wl-copy $(date "+%d/%m/%Y");;

    $agora) wl-copy $(date "+%H:%M");;

    $email_despedida) wl-copy "Atenciosamente,
Lucas Vinícius de Lima Assis.";;
esac



