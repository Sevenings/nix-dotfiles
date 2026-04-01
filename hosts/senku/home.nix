{ config, ... }:

{
  imports = [
    ../../modules/user/hyprland
    ../../modules/user/obsidian
    ../../modules/user/zathura
  ];

  config.userSettings = {
    hyprland.enable = true;
    zathura.enable = true;
  };

}
