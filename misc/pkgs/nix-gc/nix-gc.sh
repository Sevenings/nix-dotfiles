#!/bin/bash

echo "Executando Collect Garbage como Sudo"
sudo nix-collect-garbage -d

echo "Executando Collect Garbage"
nix-collect-garbage -d

echo "Executando Optimize como sudo"
sudo nix-store --optimize

echo "Executando Optimize"
nix-store --optimize
