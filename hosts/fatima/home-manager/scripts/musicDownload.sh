OUTPUT_PATH="$HOME/Musicas/Downloads"

if [ ! -e "$OUTPUT_PATH" ]; then
    mkdir -p "$OUTPUT_PATH"
fi


url=$1

mkdir temp
cd temp
yt-dlp $url
cd ..

file_path=$(ls temp) 
file_name=$(echo $file_path | sed 's/\.[^.]*$//')

ffmpeg -i "temp/$file_path" "$OUTPUT_PATH/$file_name.mp3"

rm -r temp
