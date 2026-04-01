{ config, ... }:

{
  imports = [
    ../../modules/user/caelestia
    ../../modules/user/clipcat
    ../../modules/user/hyprland
    ../../modules/user/nvim
    ../../modules/user/obsidian
    ../../modules/user/zathura
  ];

  config.userSettings = {
    caelestia.enable = true;
    clipcat.enable = true;
    hyprland.enable = true;
    nvim.enable = true;
    obsidian.enable = true;
    zathura.enable = true;
  };

}
