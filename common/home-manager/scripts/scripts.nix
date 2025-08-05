{ config, pkgs, ... }:

{
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

    # Color Picker
    (stdenv.mkDerivation {
      pname = "colorpicker";
      version = "1.0";
      src = ./colorPicker.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/colorpicker
        chmod +x $out/bin/colorpicker
      '';
    })

    # Switch layout
    (stdenv.mkDerivation {
      pname = "switchlayout";
      version = "1.0";
      src = ./hyprland/switchLayout.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/switchlayout
        chmod +x $out/bin/switchlayout
      '';
    })

    # Focus Mode
    (stdenv.mkDerivation {
      pname = "focusmode";
      version = "1.0";
      src = ./focusmode.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/focusmode
        chmod +x $out/bin/focusmode
      '';
    })

    # ToggleCaps
    (stdenv.mkDerivation {
      pname = "toggleCaps";
      version = "1.0";
      src = ./hyprland/toggleCapsLock.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/togglecapslock
        chmod +x $out/bin/togglecapslock
      '';
    })

    # Hyprland Workspace
    (stdenv.mkDerivation {
      pname = "workspace";
      version = "1.0";
      src = ./hyprland/workspace.sh;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/workspace
        chmod +x $out/bin/workspace
      '';
    })
  ];
}
