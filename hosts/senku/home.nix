{ config, ... }:

{
  imports = [
    ../../modules/user/hyprland
    ../../modules/user/nvim
    ../../modules/user/obsidian
    ../../modules/user/zathura
  ];

  config.userSettings = {
    nvim.enable = true;
    hyprland.enable = true;
    zathura.enable = true;
  };

}
