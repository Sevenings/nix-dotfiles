{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.matrix;
in
{
  options.userSettings.matrix = {
    enable = lib.mkEnableOption "Enable Matrix";

    userId = lib.mkOption {
      type = lib.types.str;
      description = "Matrix user ID (ex: @usuario:matrix.org)";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      iamb
    ];

    home.file.".config/iamb/config.toml".text = ''
      [profiles.user]
      user_id = "${cfg.userId}"
    '';
  };
}
