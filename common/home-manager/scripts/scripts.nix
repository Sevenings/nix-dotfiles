{ config, pkgs, ... }:

let
  HOME = config.home.homeDirectory;
in {
  home.packages = with pkgs; [
    (stdenv.mkDerivation {
      pname = "bluetoothManager";
      version = "1.0";
      src = ./bluetoothManager.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/bluetoothManager.sh
        chmod +x $out/bin/bluetoothManager.sh
      '';
    })
  ];
}
