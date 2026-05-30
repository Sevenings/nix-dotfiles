{ pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
  ];
}
