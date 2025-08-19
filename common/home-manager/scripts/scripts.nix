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
      runtimeInputs = [ pkgs.rofi-wayland pkgs.bluez pkgs.gawk coreutils gnugrep ];
      text = builtins.readFile ./bluetoothManager.sh;
    })

    # openCalendar
    (stdenv.mkDerivation {
      pname = "openCalendar";
      version = "1.0";
      src = ./openCalendar.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "openCalendar";
    })

    # python_calculator
    (stdenv.mkDerivation {
      pname = "python_calculator";
      version = "1.0";
      src = ./pythonCalculator/python_calculator.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "python_calculator";
    })

    # Babel
    (stdenv.mkDerivation {
      pname = "babel";
      version = "1.0";
      src = ./babel-ui/babel.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "babel";
    })

    # Color Picker
    (stdenv.mkDerivation {
      pname = "colorpicker";
      version = "1.0";
      src = ./colorPicker.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "colorpicker";
    })

    # Switch layout
    (stdenv.mkDerivation {
      pname = "switchlayout";
      version = "1.0";
      src = ./hyprland/switchLayout.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "switchlayout";
    })

    # Focus Mode
    (stdenv.mkDerivation {
      pname = "focusmode";
      version = "1.0";
      src = ./focusmode.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "focusmode";
    })

    # ToggleCaps
    (stdenv.mkDerivation {
      pname = "toggleCaps";
      version = "1.0";
      src = ./hyprland/toggleCapsLock.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "togglecapslock";
    })

    # Hyprland Workspace
    (stdenv.mkDerivation {
      pname = "workspace";
      version = "1.0";
      src = ./hyprland/workspace.sh;
      phases = [ "installPhase" ];
      installPhase = installPhase "workspace";
    })
  ];
}
