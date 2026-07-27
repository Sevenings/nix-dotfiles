{ config, pkgs, ... }:

let
installPhase = name: ''
        mkdir -p $out/bin
        cp $src $out/bin/${name}
        chmod +x $out/bin/${name}
      '';
in
{
  home.packages = with pkgs; [

    # BluetoothManager
    (pkgs.writeShellApplication {
      name = "bluetoothManager";
      runtimeInputs = [ pkgs.rofi pkgs.bluez pkgs.gawk coreutils gnugrep ];
      text = builtins.readFile ./bluetoothManager.sh;
    })

  ];
}
