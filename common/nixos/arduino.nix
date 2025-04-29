{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino-cli
  ];

  services.udev.packages = with pkgs; [
    arduino-udev-rules
  ];
}
