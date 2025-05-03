{ pkgs, ... }:

{
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
      enable = true;
      nssmdns4 = true;
      openFirewall = false;
    };
  };
}
