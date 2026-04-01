{ pkgs, ... }:

{
  home.packages = with pkgs; [ obsidian ];

  # Fix: Corrige o problema de clipboard do Web Clipper
  if (config.programs.hyprland.enable == true) then
    wayland.windowManager.hyprland.settings.windowrule = [ "match:class ^(obsidian)$, focus_on_activate on" ];
  end


}
