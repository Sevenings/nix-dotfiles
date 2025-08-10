#!/usr/bin/env bash

OUTPUT_PATH="$HOME/Musicas"

if [ ! -e "$OUTPUT_PATH" ]; then
    mkdir -p "$OUTPUT_PATH"
fi


url=$1

yt-dlp -x --audio-format mp3 --audio-quality 0 \
  --embed-metadata --embed-thumbnail --convert-thumbnails jpg \
  --metadata-from-title "%(artist)s - %(title)s" \
  -o "%(artist, uploader)s - %(title)s.%(ext)s" \
  $url

mpc rescan
