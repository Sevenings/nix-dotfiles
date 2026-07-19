{ config, lib, pkgs, ... }:

let
  cfg = config.systemSettings.fonts;
in
{
  options.systemSettings.fonts = {
    enable = lib.mkEnableOption "Enable fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
      anonymousPro
      victor-mono
      corefonts # Inclui Times New Roman
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
