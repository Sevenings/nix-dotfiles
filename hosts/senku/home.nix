{ config, ... }:

{
  imports = [
    ../../modules/user/caelestia
    ../../modules/user/clipcat
    ../../modules/user/cruise
    ../../modules/user/elixir
    ../../modules/user/hyprland
    ../../modules/user/kitty
    ../../modules/user/kubernetes-local-cluster
    ../../modules/user/nvim
    ../../modules/user/obsidian
    ../../modules/user/zathura
  ];

  config.userSettings = {
    caelestia.enable = true;
    clipcat.enable = true;
    cruise.enable = true;
    elixir.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    kubernetes-local-cluster.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    zathura.enable = true;
  };

}
