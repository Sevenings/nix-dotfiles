{ ... }:

{
  services = {

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

  };
}
