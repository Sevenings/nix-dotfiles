{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino-cli
  ];

  services.udev.packages = with pkgs; [
    platformio   # já inclui regras de udev para placas suportadas
  ];

}
