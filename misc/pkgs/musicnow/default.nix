{ stdenv, pkgs ? import <nixpkgs> {} }:

(pkgs.writeShellApplication {
  name = "musicnow";
  runtimeInputs = with pkgs; [yt-dlp mpc];
  text = builtins.readFile ./musicnow.sh;
})

