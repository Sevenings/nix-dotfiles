{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.<module>;
in
{
  options.userSettings.<module> = {
    enable = lib.mkEnableOption "Enable <module>";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
  };
}
