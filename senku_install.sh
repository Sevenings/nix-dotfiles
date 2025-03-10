#!/bin/sh

# Copia o novo hardware-configuration
cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/senku/nixos/hardware-configuration.nix

# Install Home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install


