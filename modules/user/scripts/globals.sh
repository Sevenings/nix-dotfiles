#!/usr/bin/env bash

source ~/.config/globals/global_variables.sh

#
# Comandos para Operar as variáveis
#


function get() {
    value=$1
    case $value in
        wallpaper) echo $wallpaper;;
        wallpaperManager) echo $wallpaperManager;;

        waybarConfig) echo $waybarConfig;;
        waybarStyle) echo $waybarStyle;;
        topbar) echo $topbar;;

        wlogoutTheme) echo $wlogoutTheme;;
        wlogoutLayout) echo $wlogoutLayout;;
        logoutMenu) echo $logoutMenu;;

        dmTheme) echo $dmTheme;;

        calcurseKittyConfig) echo $calcurseKittyConfig;;

        terminal) echo $terminal;;
        fileManager) echo $fileManager;;

        openTerminal) echo $openTerminal;;
        openMiniTerminal) echo $openMiniTerminal;;
        openFileManager) echo $openFileManager;;
        openMiniFileManager) echo $openMiniFileManager;;

        appLauncher) echo $appLauncher;;
        cmdLauncher) echo $cmdLauncher;;

        browser) echo $browser;;

        fileRiffle) echo $fileRiffle;;

        calendar) echo $calendar;;

        calculator) echo $calculator;;
        calculatorKittyConfig) echo $calculatorKittyConfig;;

        notificationHandler) echo $notificationHandler;;
    esac
}




cmd=$1

if [ -z $cmd ]; then 
    exit
fi

if [ $cmd == "get" ]; then
    value=$2
    get $value
else
    get $cmd
fi


