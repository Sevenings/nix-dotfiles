{ config, ... }:

let
  cfg = config.userSettings.<module>;
in
{
  options.userSettings.<module> = {
    enable = lib.mkEnableOption "Enable <Module>";
  };

  config = lib.mkIf cfg.enable {
    # Configurações específicas do módulo
  };
}
