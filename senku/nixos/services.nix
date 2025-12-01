{...}:

{
  services = {

    hardware.openrgb.enable = true;

    syncthing = {
      enable = true;
      user = "senku";
      dataDir = "/home/senku/Syncthing";
      configDir = "/home/senku/.config/syncthing";

      # Abrir firewall
      openDefaultPorts = true;
    };

  };
}
