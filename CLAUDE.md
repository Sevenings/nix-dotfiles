# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal NixOS + home-manager dotfiles, managed as a Nix flake, shared across two machines:

- `stonebox` → user `senku`
- `fatima` → user `okabe`

Commit messages and in-repo comments are written in Portuguese (pt-BR); match that convention when editing `.nix` files or `CONFIGURAR.md` stubs.

## Commands

- `make rebuild` — `nixos-rebuild switch --flake .# --use-remote-sudo`
- `make rebuild.boot` — same, but activates on next boot instead of immediately
- `make home` — `home-manager switch --flake .`
- `make update` — `git pull` + `home` + `rebuild`, in that order
- `make clear_garbage` — `nix-collect-garbage`
- `nix build .#<pkg>` — build one of the custom packages under `misc/pkgs/`
- `nix flake check` — validate the flake evaluates (useful after editing module wiring)

There is no test suite; correctness is checked by evaluating/building the flake.

## Architecture

### Module system

Both home-manager and NixOS use the same modular pattern:

**Home-manager** (`modules/user/`):
- Each feature lives in `modules/user/<name>/default.nix` and declares `options.userSettings.<name>.enable`
- `hosts/<host>/home.nix` calls `importDir ../../modules/user` to pull all modules into scope, then opts in via `userSettings.<name>.enable = true`
- `modules/user/configuration.nix` (auto-imported, not a feature module) sets up overlays and the home-manager base config

**NixOS** (`modules/system/`):
- Same pattern, but uses `systemSettings.<name>.enable` instead
- `hosts/<host>/configuration.nix` calls `importDir ../../modules/system`, then opts in via `systemSettings.<name>.enable = true`
- `modules/system/configuration.nix` (auto-imported) sets up common NixOS base settings (boot, locale, networking defaults)
- `modules/system/userInfo/` declares the `systemSettings.username` option

**Module template** (`modules/user/TEMPLATE/default.nix`):
```nix
{ config, lib, pkgs, ... }:
let cfg = config.userSettings.<name>; in
{
  options.userSettings.<name>.enable = lib.mkEnableOption "Enable <name>";
  config = lib.mkIf cfg.enable { ... };
}
```

**`misc/auxiliar/importDir.nix`** auto-imports every subdirectory and `.nix` file under a given path, skipping `default.nix` and `TEMPLATE`. This is what makes all modules available without manual listing.

A `CONFIGURAR.md` file inside `modules/user/<name>/` marks a module scaffolded from TEMPLATE that has **not** had real config ported yet — treat its `default.nix` as a placeholder.

### How flake.nix wires everything together

**Home-manager** (`homeConfigurations` in `flake.nix`): both hosts call `home-manager.lib.homeManagerConfiguration` directly, pointing at `hosts/<host>/home.nix`. The `homeConfigurations` helper in `misc/auxiliar/default.nix` is unused for this.

**NixOS** (`nixosConfigurations` in `flake.nix`): goes through `misc/auxiliar/default.nix`'s `nixosConfigurations` function, which loads `hosts/<host>/configuration.nix`.

### Other structural notes

- `misc/pkgs/` — custom packages; any subdir with a `default.nix` is auto-collected and exposed via `nix build .#<dirname>`
- `misc/overlays/` — `additions` exposes everything from `misc/pkgs`; `modifications` auto-applies every other `.nix` file as an overlay; `unstable-packages` exposes `pkgs.unstable`
- `misc/modules/{nixos,home-manager}` — modules exported from the flake (`nixosModules`/`homeManagerModules`) for potential upstreaming, distinct from the per-host `modules/`
- `common/link/nvim` is a git submodule (`lvlassis/neovim-dotfiles`) — edit and push in the submodule's own repo; changes here are not tracked by this repo
- Notable flake inputs: `caelestia-shell` (custom Hyprland shell fork, `Sevenings` GitHub account), `nix-claude-code` (packages Claude Code; unfree allowlisted for `claude` in `misc/auxiliar/default.nix`), `hyprland`/`hyprland-plugins` pinned to `v0.55.0`, `smart-filter-yazi` (custom yazi plugin, also under `Sevenings`)
