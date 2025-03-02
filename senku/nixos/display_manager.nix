{ ... }:

{
  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
    };
    defaultSession = "Hyprland";
  };
}
