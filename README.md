# Minhas configurações do NixOS entre computadores.

## Instalação

Home-manager 24.11
```
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update
```

```
nix-shell '<home-manager>' -A install
```

