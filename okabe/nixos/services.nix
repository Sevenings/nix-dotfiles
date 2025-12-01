{ ... }:

{
  services = {

    services.syncthing = {
      enable = true;
      user = "okabe";
      dataDir = "/home/okabe/Syncthing";
      configDir = "/home/okabe/.config/syncthing";

      # Abrir firewall
      openDefaultPorts = true;
    };
  };
}
