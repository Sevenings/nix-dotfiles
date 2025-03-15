{ config, pkgs, ... }:

{
  imports = [
    ./appearance.nix
    ./bindings.nix
    ./env_vars.nix
    ./monitors.nix
    ./plugins.nix
    ./workspaces.nix
  ];
}
