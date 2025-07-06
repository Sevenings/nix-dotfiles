{ ... }:

{
  services = {

    xserver = {
      enable = true;
      xwayland.enable = true;
      displayManager.session = "wayland";
    };

    clipcat.enable = true;

    preload.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    udisks2.enable = true;

  };
}
