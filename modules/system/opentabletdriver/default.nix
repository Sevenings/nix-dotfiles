{ config, lib, ... }:

let
  cfg = config.systemSettings.opentabletdriver;
in
{
  options.systemSettings.opentabletdriver = {
    enable = lib.mkEnableOption "Habilita o OpenTabletDriver para mesa digitalizadora";
  };

  config = lib.mkIf cfg.enable {
    hardware.opentabletdriver.enable = true;

    # graphical-session.target não é ativado automaticamente no Hyprland sem DE
    systemd.user.services.opentabletdriver = lib.mkIf config.programs.hyprland.enable {
      wantedBy = lib.mkForce [ "default.target" ];
    };
  };
}
