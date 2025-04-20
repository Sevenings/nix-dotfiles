#!/usr/bin/env bash

file=$1

# Função para fazer upload recursivo de arquivos .sh
upload_files() {
    local src_dir="$1"
    local dest_dir="/bin/"

    find "$src_dir" -type f -name '*.sh' | while read -r file; do
        local dest_file="$dest_dir/$(basename "$file")"
        echo "Enviando $file para $dest_file"
        sudo cp "$file" "$dest_file"
        sudo chmod +x "$dest_file"
    done
}

if [[ -n $file ]]; then
    if [[ $file == "rm" ]]; then
        echo "Erro: O comando 'rm' não é suportado para remoção de arquivos no diretório /bin."
        exit 1
    elif [[ -d $file ]]; then
        # Faz upload recursivo de arquivos .sh
        upload_files "$file"
    elif [[ -f $file ]]; then
        # Faz upload de um único arquivo .sh
        dest_file="/bin/$(basename "$file")"
        echo "Enviando $file para $dest_file"
        sudo cp "$file" "$dest_file"
        sudo chmod +x "$dest_file"
    else
        echo "Erro: O argumento fornecido não é um arquivo ou diretório válido."
        exit 1
    fi
else
    echo "Uso: $0 arquivo_ou_diretório"
    exit 1
fi
