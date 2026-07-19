{ config, lib, ... }:

let
  cfg = config.systemSettings.nvidia;
in
{
  options.systemSettings.nvidia = {
    enable = lib.mkEnableOption "Enable nvidia";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    boot.kernelParams = [
      # "nvidia-drm.fbdev=0"
      "nvidia-drm.modeset=1"
    ];

    # Enable OpenGL
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    # Load nvidia drivers for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };
}
