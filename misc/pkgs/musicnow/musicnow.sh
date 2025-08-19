#!/usr/bin/env bash
set -euo pipefail

OUTPUT_PATH="$HOME/Musicas"
mkdir -p "$OUTPUT_PATH"

url="$1"

yt-dlp -x --audio-format mp3 --audio-quality 0 \
  --embed-metadata --embed-thumbnail --convert-thumbnails jpg \
  --metadata-from-title "%(artist)s - %(title)s" \
  --parse-metadata "playlist_title:%(album)s" \
  --parse-metadata "playlist_index:%(track_number)s" \
  -o "$OUTPUT_PATH/%(album,playlist_title)s/%(playlist_index)02d - %(artist, uploader)s - %(title)s.%(ext)s" \
  "$url"

mpc rescan
