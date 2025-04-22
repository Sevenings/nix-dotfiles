#!/usr/bin/env bash

wallpaperDaemon=$(globals.sh wallpaperManager)

killall $wallpaperDaemon
pkill $wallpaperDaemon
sleep 0.1

$wallpaperDaemon &
