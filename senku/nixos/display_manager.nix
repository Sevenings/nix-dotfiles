{ ... }:

{
  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "Hyprland";
  };
}
