# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal NixOS + home-manager dotfiles, managed as a Nix flake, shared across two machines:

- `stonebox` → user `senku`
- `fatima` → user `okabe`

Host directories are named after the **user**, not the machine (`senku/`, `okabe/`), which is a common source of confusion when navigating `flake.nix`.

Commit messages and in-repo comments are written in Portuguese (pt-BR); match that convention when editing existing `.nix` files or `CONFIGURAR.md` stubs.

## Commands

- `make rebuild` — `nixos-rebuild switch --flake .# --use-remote-sudo`
- `make rebuild.boot` — same, but activates on next boot instead of immediately
- `make home` — `home-manager switch --flake .`
- `make update` — `git pull` + `home` + `rebuild`, in that order
- `make clear_garbage` — `nix-collect-garbage`
- `nix build .#<pkg>` — build one of the custom packages under `misc/pkgs/`
- `nix flake check` — validate the flake evaluates (useful after editing module wiring)

There is no test suite; correctness is checked by evaluating/building the flake.

## Mid-refactor architecture (read this before touching modules)

The repo is actively migrating from a flat per-host layout to a modular one (branch `refactor/modularizar`, see recent log). **Both layouts are live at once** — know which one you're editing:

### Legacy layout (being phased out)
- `common/nixos/`, `common/home-manager/` — shared config, imported by every host
- `senku/nixos/`, `senku/home-manager/` and `okabe/nixos/`, `okabe/home-manager/` — per-user overrides, each with a `legacy/` subfolder of older, mostly-frozen config
- Wired up by `misc/auxiliar/default.nix`'s `nixosConfigurations`/`homeConfigurations` functions, which splice in `../../common/...` and `../../${user}/...`

### New layout (target state)
- `modules/user/<name>/default.nix` — one file per feature, following the pattern in `modules/user/TEMPLATE/default.nix`:
  ```nix
  { config, lib, pkgs, ... }:
  let cfg = config.userSettings.<name>; in
  {
    options.userSettings.<name>.enable = lib.mkEnableOption "Enable <name>";
    config = lib.mkIf cfg.enable { ... };
  };
  ```
- `misc/auxiliar/importDir.nix` auto-imports every subdirectory/`.nix` file under a given path (skipping `default.nix` and `TEMPLATE`) — this is what pulls all of `modules/user/*` into scope without listing them by hand.
- `hosts/<host>/home.nix` imports the whole `modules/user` tree via `importDir`, then explicitly flips on the modules that host wants via `config.userSettings.<name>.enable = true;` (see `hosts/senku/home.nix`).
- `modules/system` is the intended NixOS-side counterpart of `modules/user` but is **currently empty** — system-level modularization hasn't started yet.
- `hosts/senku/configuration.nix` exists but is an empty stub; the flake does not wire it into `nixosConfigurations` yet — system builds for `stonebox` still go through the legacy `senku/nixos/` path.

### How they're stitched together today
For home-manager, `flake.nix` loads **both** layouts for `senku@stonebox` simultaneously:
```
./common/home-manager/home.nix   # legacy, marked "Retrocompatibilidade"
./senku/home-manager/home.nix    # legacy, marked "Retrocompatibilidade"
./hosts/senku/home.nix           # new modular entrypoint
```
`okabe@fatima` and NixOS builds for both hosts still use only the legacy `nixosConfigurations`/`homeConfigurations` functions from `misc/auxiliar`.

A `CONFIGURAR.md` file inside a `modules/user/<name>/` directory marks a module that was scaffolded from `TEMPLATE` but has **not** had its real config ported over yet from the legacy `senku/`/`okabe/` files — treat its `default.nix` as a placeholder, not a working implementation.

## Other structural notes

- `misc/pkgs/` — custom packages; any subdir with a `default.nix` is auto-collected by `misc/pkgs/default.nix` and exposed via `nix build .#<dirname>`.
- `misc/overlays/` — `additions` exposes everything from `misc/pkgs`; `modifications` auto-applies every other `.nix` file in the directory as an overlay; `unstable-packages` exposes `pkgs.unstable` sourced from `nixpkgs-unstable`.
- `misc/modules/{nixos,home-manager}` — modules exported from the flake (`nixosModules`/`homeManagerModules`) for potential upstreaming, distinct from the per-user `modules/user/`.
- `common/link/nvim` is a git submodule (`lvlassis/neovim-dotfiles`) — don't edit its contents in place expecting changes to be tracked by this repo; edit and push in the submodule's own repo.
- Notable flake inputs: `caelestia-shell` (custom Hyprland shell fork under the `Sevenings` GitHub account), `nix-claude-code` (packages Claude Code; unfree is allowlisted specifically for the `claude` package in `misc/auxiliar/default.nix`), `hyprland`/`hyprland-plugins` pinned to `v0.55.0`, `smart-filter-yazi` (custom yazi plugin, also under `Sevenings`).
