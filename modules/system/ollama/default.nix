{ config, lib, ... }:

let
  cfg = config.systemSettings.ollama;
in
{
  options.systemSettings.ollama = {
    enable = lib.mkEnableOption "Enable ollama";
  };

  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      loadModels = [ ];
    };
  };
}
