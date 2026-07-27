{ config, lib, ... }:

let
  cfg = config.systemSettings.tailscale;
in
{
  options.systemSettings.tailscale = {
    enable = lib.mkEnableOption "Enable tailscale";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;
  };
}
