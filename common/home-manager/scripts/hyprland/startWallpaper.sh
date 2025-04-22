#!/usr/bin/env bash

DIURNO_MONITOR_LEFT="$HOME/Imagens/Wallpapers/archivezip4.jpg"
DIURNO_MONITOR_RIGHT="$HOME/Imagens/Wallpapers/archivezip4.jpg"

NOTURNO_MONITOR_LEFT="$HOME/Imagens/Wallpapers/horarios-pelo-dia/home/0.jpg"
NOTURNO_MONITOR_RIGHT="$HOME/Imagens/Wallpapers/horarios-pelo-dia/room/0.jpg"

MONITOR_LEFT="DP-1"
MONITOR_RIGHT="HDMI-A-1"


WALLPAPER_ATUAL=""


set_wallpaper() {
    MONITOR=$1
    WALLPAPER=$2
    swww img -o $MONITOR -t grow --transition-pos 1572,20 --invert-y $WALLPAPER
}


set_diurno() {
    set_wallpaper $MONITOR_LEFT $DIURNO_MONITOR_LEFT
    set_wallpaper $MONITOR_RIGHT $DIURNO_MONITOR_RIGHT
    WALLPAPER_ATUAL=$DIURNO_MONITOR_LEFT
}

set_noturno() {
    set_wallpaper $MONITOR_LEFT $NOTURNO_MONITOR_LEFT
    set_wallpaper $MONITOR_RIGHT $NOTURNO_MONITOR_RIGHT
    WALLPAPER_ATUAL=$NOTURNO_MONITOR_LEFT
}

set_time_based() {
    # Define o wallpaper com base no horário do dia
    HORAS=$(date +"%H")
    if [ $HORAS -ge 6 ] && [ $HORAS -le 17 ]; then 
        set_diurno
    elif [ $HORAS -ge 18 ] || [ $HORAS -le 5 ]; then
        set_noturno
    fi
}


toggle_dia_noite() {
    CURRENT_WALLPAPER=$(swww query | grep DP-1 | sed 's/.*image: //')
    if [[ $CURRENT_WALLPAPER == $DIURNO_MONITOR_LEFT ]]; then
        set_noturno
    else 
        set_diurno
    fi
}



aplicar_colorscheme_customizado() {
    # Captura a paleta de cores do wallpaper selecionado
    wal -s --saturate 1.0 -i $WALLPAPER_ATUAL
    COR_PRINCIPAL=$(jq '.colors.color1' ~/.cache/wal/colors.json | sed 's/[\"#]//g' )
    COR_BACKGROUND=$(jq '.special.background' ~/.cache/wal/colors.json | sed 's/[\"#]//g' )
    
    # Define a cor de borda com relação com a cor do wallpaper
    hyprctl keyword general:col.active_border "rgb($COR_PRINCIPAL)"

    # Define a cor do hyprtrail
    hyprctl keyword plugin:hyprtrails:color "rgba(${COR_PRINCIPAL}a0)"
}



# Main

# Alterar o wallpaper
if [[ $1 == "dia" ]]; then
    set_diurno
elif [[ $1 == "noite" ]]; then
    set_noturno
elif [[ $1 == "toggle" ]]; then
    toggle_dia_noite
else
    set_time_based
fi

aplicar_colorscheme_customizado
