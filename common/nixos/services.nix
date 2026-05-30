{ pkgs, ... }:

{
  services = {
    
    tailscale = {
      enable = true;
    };

    tailscale = {
      enable = true;
    };

    qbittorrent = {
      enable = true;
      webuiPort = null;
    };

    clipcat.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    udisks2.enable = true;

    dbus.enable = true;

    udev = {
      packages = [ pkgs.libmtp ];
      extraRules = ''
        KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
      '';
    };

  };
}
