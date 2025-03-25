{ config, pkgs, ... }:

let
  HOME = config.home.homeDirectory;
in {
  home.packages = with pkgs; [

    # BluetoothManager
    (stdenv.mkDerivation {
      pname = "bluetoothManager";
      version = "1.0";
      src = ./bluetoothManager.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/bluetoothManager
        chmod +x $out/bin/bluetoothManager
      '';
    })

    # openCalendar
    (stdenv.mkDerivation {
      pname = "openCalendar";
      version = "1.0";
      src = ./openCalendar.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/openCalendar
        chmod +x $out/bin/openCalendar
      '';
    })

    # python_calculator
    (stdenv.mkDerivation {
      pname = "python_calculator";
      version = "1.0";
      src = ./pythonCalculator/python_calculator.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/python_calculator
        chmod +x $out/bin/python_calculator
      '';
    })

    # Babel
    (stdenv.mkDerivation {
      pname = "babel";
      version = "1.0";
      src = ./babel-ui/babel.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/babel
        chmod +x $out/bin/babel
      '';
    })

  ];
}
