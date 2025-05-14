{ ... }:

{
  services = {

    xserver = {
      enable = true;
      xwayland.enable = true;
      displayManager.session = "wayland";
    };

  };
}
