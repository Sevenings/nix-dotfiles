{ config, pkgs, ... }:

{
  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-sddm-corners";
    };
    defaultSession = "hyprland-uwsm";
  };


  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
  ];
}
