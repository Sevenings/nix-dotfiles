{ config, lib, ... }:

let
  cfg = config.systemSettings.syncthing;
  username = config.systemSettings.username;
in
{
  options.systemSettings.syncthing = {
    enable = lib.mkEnableOption "Enable syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/Syncthing";
      configDir = "/home/${username}/.config/syncthing";

      # Abrir firewall
      openDefaultPorts = true;
    };
  };
}
