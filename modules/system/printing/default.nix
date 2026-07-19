{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.printing;
in
{
  options.systemSettings.printing = {
    enable = lib.mkEnableOption "Enable printing";
  };

  config = lib.mkIf cfg.enable {
    # Configurações de impressão
    services = {
      printing = {
        enable = true;
        listenAddresses = [ "*:631" ];
        drivers = [
          pkgs.hplip
          pkgs.hplipWithPlugin
        ];
      };

      # Descobrimento automático de impressoras
      avahi = {
        enable = false;
        nssmdns4 = true;
        openFirewall = false;
      };
    };
  };
}
