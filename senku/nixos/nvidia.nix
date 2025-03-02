{ config, ... }:

{
  # NVIDIA CONFIG
  nixpkgs.config.allowUnfree = true;

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia drivers for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
